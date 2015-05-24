
if exists("g:scrolling_loaded") | finish | endif
let g:scrolling_loaded = 1

function ScrollOn()
	set so=999
endfunc

function ScrollOff()
	set so=5
endfunc

function ScrollToggle()
	if &so==999
		setlocal so=5
	else
		setlocal so=999
	end
endfunc

nnoremap <leader>s :call ScrollToggle()<CR>
nnoremap <C-S> : call ScrollToggle()<CR>

function! s:ScrollSelect()
	if &readonly
		call ScrollOn()
	else
		call ScrollOff()
	endif
endfunction

au BufCreate * :call s:ScrollSelect()

