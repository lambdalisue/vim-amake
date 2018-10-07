function! amake#runner#new(filetype) abort
  let namespace = substitute(a:filetype, '\W', '_', 'g')
  let funcname = printf(
        \ 'amake#runner#%s#new',
        \ namespace,
        \)
  try
    return call(funcname, [])
  catch /:E117: [^:]\+: amake#runner#[^#]\+#new/
    throw printf(
          \ 'amake: Runner is not found: %s',
          \ a:filetype,
          \)
  endtry
endfunction

function! amake#runner#run(runner, filename) abort
  let args = a:runner.build_args(a:filename)
  let output = amake#process#call(args)
  return {
        \ 'args': args,
        \ 'output': output,
        \}
endfunction
