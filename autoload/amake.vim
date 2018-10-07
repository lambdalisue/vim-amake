" autoload/amake.vim

function! amake#hello_world() abort
  echo "Hello World"
endfunction

function! amake#run(opener) abort
  let runner = amake#runner#new(&filetype)
  let result = amake#runner#run(runner, expand('%:p'))
  let bufname = printf('amake://%s', join(result.args, ' '))
  let options = {
        \ 'opener': empty(a:opener) ? 'new' : a:opener,
        \}
  let Open = { c -> amake#buffer#new(bufname, c, options) }
  call result
        \.then({ v -> Open(v.stdout) })
        \.catch({ v -> Open(v.stdout + [''] + v.stderr) })
endfunction
