
let s:colsmax = 0

fu! <SID>ColsMaxSet(cols)
	let s:colsmax = a:cols
	call <SID>ColsMaxApply()
endfu

fu! <SID>ColsMaxApply()
	if s:colsmax == 0
		return
	endif
	exec "3match errorMsg /.\\%>" . (s:colsmax + 1) . "v/"
endfu

command! -nargs=1 ColsMax :call <SID>ColsMaxSet(<f-args>)
command! -nargs=0 ColsMaxApply :call <SID>ColsMaxApply()

