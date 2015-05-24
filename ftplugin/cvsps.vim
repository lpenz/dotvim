" Vim filetype plugin file
" Language:   cvsps
" Maintainer: Leandro Penz <lpenz@terra.com.br

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin_home_cvs")
  finish
endif
let b:did_ftplugin_home_cvs = 1

fu! s:CvsPSGetInfo()
	let line = Trim(getline(line('.')))
	let nofile = substitute(line, '^[^:]\+:', '', '')
	let rv = {}
	let rv["file"] = substitute(line, ':[0-9.]\+->[0-9.]\+', '', '')
	let rv["r1"]   = substitute(nofile, '->[0-9.]\+$', '', '')
	let rv["r2"]   = substitute(nofile, '^[0-9.]\+->', '', '')
	return rv
endf

fu! s:CvsPSDiff()
	let info = s:CvsPSGetInfo()
	exec ":split " . info["file"]
	resize +999
	exec ":VCSVimDiff " . info["r2"] . " " . info["r1"]
	exec ":VCSVimDiff " . info["r2"]
	exec ":quit"
	exec ":quit"
	exec ":split " . info["file"]
	resize +999
	exec ":VCSVimDiff " . info["r2"] . " " . info["r1"]
	"exec ":VCSVimDiff " . info["r2"]
endf

fu! s:CvsPSDiffN(r)
	let info = s:CvsPSGetInfo()
	exec ":split " . info["file"]
	resize +999
	exec ":VCSVimDiff " . info[a:r]
endf

command! -nargs=0 CvsPSDiff :call s:CvsPSDiff()
nmap <buffer> <silent> <CR> :CvsPSDiff<CR>

command! -nargs=0 CvsPSDiff1 :call s:CvsPSDiffN("r1")
nmap <buffer> <silent> <leader>1 :CvsPSDiff1<CR>

command! -nargs=0 CvsPSDiff2 :call s:CvsPSDiffN("r2")
nmap <buffer> <silent> <leader>2 :CvsPSDiff2<CR>

fun! s:CvspsView()
	call system('(cvspsview ' . @% . ') &')
endf

command! -nargs=0 CvspsView :call s:CvspsView()
nmap <buffer> <silent> <F3> :CvspsView<CR>

