" Vim filetype plugin file
" Language:   scons
" Maintainer: Leandro Penz <lpenz@terra.com.br

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin_home_scons")
  finish
endif
let b:did_ftplugin_home_scons = 1

setlocal expandtab

fun! s:SConsView()
	call system('sconsview')
endf

command! -nargs=0 SConsView :call s:SConsView()
nmap <buffer> <silent> <F3> :SConsView<CR>

