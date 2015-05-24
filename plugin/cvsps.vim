" Cvsps: View log of CVS based on patchset using cvsps.
" Author: Leandro Penz

fu! s:Relpath(p)
	return substitute(a:p, getcwd().'/', '', '')
endf

fu! s:CvsPSThis()
	let f=s:Relpath(@%)
	new
	only
	setlocal buftype=nofile
	setlocal bufhidden=hide
	setlocal noswapfile
	setlocal noro
	exec ':r! cvsps -f '.f
	setlocal ro
	setlocal ft=cvsps
	exec 'syn match cvspsMyFile !^	'.f.':!hs=s+1,me=e-1 contained'
endf

command! -nargs=0 CvsPSThis :call s:CvsPSThis()
nmap <leader>cm :CvsPSThis<CR>

