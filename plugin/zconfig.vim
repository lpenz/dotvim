
" a.vim crappy bindings: """""""""""""""""""""""""""""""""""""""""""""""""""""
iunmap <leader>ih
iunmap <leader>is
iunmap <leader>ihn

" vcscommand fixes: """"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Annotate fix:
fu! MyVCSAnnotate()
	let l = line('.')
	VCSAnnotate
	exec "norm! ".l."G"
endf
nnoremap <leader>ca :call MyVCSAnnotate()<CR>


" other crappy bindings """"""""""""""""""""""""""""""""""""""""""""""""""""""

nunmap <leader>rwp

" vimdiff fix:
