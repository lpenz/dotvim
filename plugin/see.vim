" see.vim: vim plugin that calls mailcap's see on current file
" Maintainer: Leandro Lisboa Penz <http://www.lpenz.org/>

if exists('g:loaded_see')
    finish
endif
let g:loaded_see = 1

" Section: Utility

fu! s:See()
	call system('(see ' . @% . ') &')
endf

" Section: Exports

command! -nargs=0 See :call s:See()

