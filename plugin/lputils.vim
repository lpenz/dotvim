" Vim useful functions
" Maintainer: Leandro Penz <lpenz@terra.com.br

fun! MkTemp(suffix)
	let rv = system('tempfile -s '.a:suffix)
	return strpart(rv, 0, strlen(rv) - 1)
endf

fun! Trim(str)
  let rv = substitute(a:str, '^\s', '', '')
  return substitute(rv, '\s$', '', '')
endf

