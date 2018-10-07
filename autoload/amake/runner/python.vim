function! amake#runner#python#new() abort
  return { 'build_args': { f -> ['python', f] } }
endfunction
