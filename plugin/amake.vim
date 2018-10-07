" plugin/amake.vim

if exists('g:loaded_amake')
  finish
endif
let g:loaded_amake = 1

command! Amake call amake#hello_world()
