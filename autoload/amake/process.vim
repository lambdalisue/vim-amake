let s:Job = vital#amake#import('System.Job')
let s:Promise = vital#amake#import('Async.Promise')

function! amake#process#open(args) abort
  return s:Promise.new(funcref('s:executor', [a:args]))
endfunction

function! s:executor(args, resolve, reject) abort
  let ns = {
        \ 'resolve': a:resolve, 'reject': a:reject,
        \ 'stdout': [''], 'stderr': [''],
        \}
  call s:Job.start(a:args, {
        \ 'on_stdout': funcref('s:on_receive', [ns.stdout]),
        \ 'on_stderr': funcref('s:on_receive', [ns.stderr]),
        \ 'on_exit': funcref('s:on_exit', [ns]),
        \})
endfunction

function! s:on_receive(bs, data) abort
  let a:bs[-1] .= a:data[0]
  call extend(a:bs, a:data[1:])
endfunction

function! s:on_exit(ns, exitval) abort
  let data = {
        \ 'stdout': a:ns.stdout,
        \ 'stderr': a:ns.stderr,
        \ 'exitval': a:exitval,
        \}
  if a:exitval is# 0
    call a:ns.resolve(data)
  else
    call a:ns.reject(data)
  endif
endfunction
