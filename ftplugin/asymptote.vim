" Vim filetype plugin file
" Language:   asymptote
" Maintainer: Leandro Penz <lpenz@terra.com.br

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin_home_asymptote")
  finish
endif
let b:did_ftplugin_home_asymptote = 1

fun! s:AsymptoteView()
	let tmppdf = MkTemp('.pdf')
	call system('asy -f pdf -o - ' . @% . ' >' . tmppdf)
	call system('(xpdf ' . tmppdf . '; rm ' . tmppdf . ') &')
endf

command! -nargs=0 AsymptoteView :call s:AsymptoteView()
nmap <buffer> <silent> <F3> :AsymptoteView<CR>

