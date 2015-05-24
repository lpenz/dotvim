" Vim filetype plugin file
" Language:   cvsps
" Maintainer: Leandro Penz <lpenz@terra.com.br

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin_home_crn")
  finish
endif
let b:did_ftplugin_home_crn = 1

fu! s:CrnGantView()
	let tmp = system('tempfile -s .gan')
	call system('/home/penz/bin/cronogramer.py -i ' . @% . ' -o ' . tmp)
	call system('(ganttproject ' . tmp . '; rm ' . tmp . ') &')
endf

command! -nargs=0 CrnGantView :call s:CrnGantView()
"nmap <buffer> <silent> <F3> :CrnGantView<CR>

fu! s:CrnTextView()
	let tmp = system('tempfile -s .t2t')
	call system('/home/penz/bin/cronogramer.py -t t2t -i ' . @% . ' -o ' . tmp)
	call system('(gvim -f ' . tmp . '; rm ' . tmp . ') &')
endf

fu! s:CrnPlannerView()
	let tmp = system('tempfile -s .planner')
	call system('/home/penz/bin/cronogramer.py -t planner -i ' . @% . ' -o ' . tmp)
	call system('(planner ' . tmp . '; rm ' . tmp . ') &')
endf

command! -nargs=0 CrnGantView :call s:CrnGantView()
command! -nargs=0 CrnTextView :call s:CrnTextView()
command! -nargs=0 CrnPlannerView :call s:CrnPlannerView()

"nmap <buffer> <silent> <F3> :CrnTextView<CR>

" folding
fu! CrnFoldExpr(lnum)
	let prevline = getline(prevnonblank(a:lnum - 1))
	let nextnb = nextnonblank(a:lnum)
	let line = getline(nextnb)

	if nextnb == 0 || line =~ '^Resource' || line =~ 'Milestone'
		return 0
	end

	if prevline =~ '^Resource' || prevline =~ 'Milestone'
		return 1
	end

	return '='
endf

setlocal spell
setlocal foldexpr=CrnFoldExpr(v:lnum)

setlocal foldmethod=expr

