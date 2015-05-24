
source $VIMRUNTIME/ftplugin/lua.vim

" Lua folding """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fu! LuaFoldExpr(lnum)
	let line = getline(a:lnum)
	let prevline = getline(a:lnum - 1)
	if prevline =~ '^[^	].*=\s*function\s*('
		return 1
	end
	if line =~ '^{' && line !~ '}'
		return 1
	end
	if prevline =~ '^[^	]' && prevline =~ '{[ 	]*$' && prevline !~ '}'
		return 1
	end
	if prevline =~ '^end' || (prevline =~ '^}')
		return 0
	end

	return '='
endf

"setlocal spell
setlocal foldexpr=LuaFoldExpr(v:lnum)
setlocal foldtext="foldtext()"

setlocal foldmethod=expr " Muito lento.
"setlocal fdm=indent

nnoremap <buffer> <CR> zO<CR>

