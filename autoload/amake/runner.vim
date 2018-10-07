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
