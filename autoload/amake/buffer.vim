function! amake#buffer#new(bufname, content) abort
  execute 'new' fnameescape(a:bufname)
  setlocal modifiable
  silent %delete _
  call setline(1, a:content)
  setlocal nomodified nomodifiable
  setlocal buftype=nofile bufhidden=wipe
endfunction
