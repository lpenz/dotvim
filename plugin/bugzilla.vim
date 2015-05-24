
fu! s:BugzillaGoto(bug)
	exec 'silent !w3m "http://bugzilla.datacom/bugzilla/show_bug.cgi?id='.a:bug.'"'
	redraw!
endf

fu! s:BugzillaGotoWord(word)
	let bug = substitute(a:word, '[^0-9]*', '', 'g')
	call s:BugzillaGoto(bug)
endf

command! -nargs=1 Bugzilla :call s:BugzillaGotoWord(<args>)

