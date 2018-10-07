function! amake#process#call(args) abort
  let args = map(
        \ a:args[:],
        \ { _, v -> shellescape(v) },
        \)
  let output = system(join(args))
  return split(output, '\r\?\n')
endfunction
