" Vimrepl: pipes selected text to a FIFO, part of clirc
"   Author: Leandro Penz
"   Homepage: http://code.google.com/p/clirc

if exists("g:vimrepl_loaded") | finish | endif
let g:vimrepl_loaded = 1

let s:fifo=""

fu! s:Repl()
	exe "'<,'>!tee " . s:fifo
endf

fu! s:ReplSetFifo(fifo)
	let s:fifo = a:fifo
endf

command! -range -nargs=0 Repl :silent call s:Repl()
vnoremap <leader>f :Repl<CR>

command! -range -nargs=1 ReplSetFifo :silent call s:ReplSetFifo(<f-args>)

