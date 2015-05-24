
source $VIMRUNTIME/ftplugin/haskell.vim

set include=^import\\s*\\(qualified\\)\\?\\s*
set includeexpr=substitute(v:fname,'\\.','/','g').'.hs'

setlocal fdm=indent et
nnoremap <buffer> <CR> zO<CR>

