let s:Buffer = vital#amake#import('Vim.Buffer')

function! amake#buffer#new(bufname, content, ...) abort
  let options = a:0 ? a:1 : {}
  call s:Buffer.open(a:bufname, options)
  setlocal modifiable
  silent %delete _
  call setline(1, a:content)
  setlocal nomodified nomodifiable
  setlocal buftype=nofile bufhidden=wipe
endfunction
