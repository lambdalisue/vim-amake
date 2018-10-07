function! amake#runner#vim#new() abort
  return { 'build_args': funcref('s:build_args') }
endfunction

function! s:build_args(filename) abort
  let cmd = printf(
        \ 'source %s',
        \ fnameescape(a:filename),
        \)
  return [
        \ 'nvim', '-n', '--headless',
        \ '--cmd', cmd, '--cmd', 'quit',
        \]
endfunction
