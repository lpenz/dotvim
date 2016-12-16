
setlocal fdm=syntax
let b:codefmt_formatter = 'clang-format'
AutoFormatBuffer

nnoremap <buffer> <CR> zO<CR>

setlocal foldlevel=99

