" plugin/amake.vim

if exists('g:loaded_amake')
  finish
endif
let g:loaded_amake = 1

command! -nargs=? Amake call amake#run(<q-args>)
