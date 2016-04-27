
"""""
" Vundle:
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'FredKSchott/CoVim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'lpenz/vimcommander'
Plugin 'dbakker/vim-lint'
Plugin 'elzr/vim-json'
Plugin 'aklt/plantuml-syntax'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'vim-scripts/DirDiff.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/Align'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mitsuhiko/vim-jinja'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'

call vundle#end()
filetype plugin indent on

call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
"""""

" Syntastic:
"let g:syntastic_check_on_open = 1
let g:syntastic_c_no_include_search = 1
let loaded_gcc_syntax_checker = 1
"let loaded_ycm_c_syntax_checker = 1
let g:syntastic_c_checkers = ["dmcheck"]
let g:syntastic_cpp_checkers = ["dmcheck"]
let g:syntastic_scons_checkers = ["flake8"]
let g:syntastic_python_checkers = ["flake8","python","py3kwarn"]
let g:syntastic_ruby_checkers = ["jruby"]
let g:syntastic_javascript_checkers = ["dmjslint"]
let g:syntastic_json_checkers = ["dmjsonlint"]
let g:syntastic_sh_checkers = ["shellcheck"]
let g:syntastic_zsh_checkers = ["shellcheck"]
"let g:syntastic_auto_loc_list=1

let g:vim_json_syntax_conceal = 0

"""""
" Options:
" set nobackup
" set nowritebackup
" set bkc=auto,breakhardlink
" set smartcase
" let perl_fold = 1
" set autoindent
" set autoread
" set bs+=indent
" set bs+=start
" set dictionary=$HOME/.vim/word.list
" set foldenable foldnestmax=1 foldopen=block,hor,mark,percent,quickfix,search,tag,undo,jump
" set isk-=(,)
" set laststatus=2
" set mousemodel=popup_setpos
" set ruler
" set scrolloff=5
" set showmatch
" set smarttab
" set statusline=%<%f%m%w%y%r[fdm:%{&fdm}]
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" set statusline+=%=%l,%c%V\ \ \ %P
" set vb t_vb=
" set ve=block
" set wildignore=*.o,*.d,*.hi,*.pyc
" set cscopetag
" set nofsync
" let g:is_bash = 1
" set wildmode=longest,full
" set complete=.,w,b,u,t

set noswapfile
syntax enable
set notitle
set mouse=a
set hlsearch
set showcmd
set wildmenu
set grepprg=grep\ -nrI\ --exclude=ChangeLog\ --exclude=ID\ --exclude=tags\ --exclude='*.d'\ --exclude='*.pyc'\ --exclude-dir=CVS\ --exclude-dir=_darcs\ --exclude-dir=.hg\ --exclude-dir=.bzr\ --exclude='.glimpse_*'\ --exclude-dir=dev\ --exclude=cvsps.txt\ --exclude=cvscs.txt\ --exclude-dir=.git\ --exclude-dir=.svn\ $*\ 
let mapleader=','
set expandtab tabstop=4 shiftwidth=4
set makeprg=mymake
set nowrap
set autowriteall
set ignorecase

set background=dark
colorscheme solarized

" Configure standard plugins:
let loaded_matchparen = 1
let c_no_comment_fold=1
let c_gnu = 1

" DirDiff
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,*.o,*.d,*.a,.git,.find.txt,.find.txt.gz,ID,tags"

" Disable help:
nmap <F1> :echo ""<CR>
imap <F1> <C-O>:echo ""<CR>

set makeprg=mymake

if v:version >= 700
	set completeopt=longest,menu
	set spelllang=pt,en
end

if v:version >= 730
	set undofile
	set undodir="/tmp/vim"
end

" Path:
set path=.
set path+=**

" Tags:
set tags=tags

" Keys:
nnoremap <silent> <F2> :update!<CR>
imap <silent> <F2> <C-O><F2>
nnoremap <silent> <F4> :cn<CR>zv
nnoremap <silent> <F5> @q
nnoremap <silent> <F6> @w
nnoremap <silent> <F7> :Errors<CR>
nnoremap <silent> <F10> :make<CR>
nnoremap <silent> <F11> :call VimCommanderToggle()<CR>
imap <silent> <F10> <C-O><F10>

nnoremap <silent> <F12> :NERDTreeToggle<CR>

nnoremap <silent> <C-C> :qa!<CR>
nnoremap <silent> <C-Q> :bd<CR>
nnoremap <silent> Q :bd<CR>

nnoremap <leader>i <C-^>

nnoremap <leader>syn :echo synIDattr(synID(line("."), col("."), 1), "name")<CR>

nnoremap <leader>v :grep <C-R><C-W> . <CR>

"#############################################################################
"#############################################################################
"# Legacy stuff, should be better analysed: ##################################
"#############################################################################
"#############################################################################

nnoremap <leader>b :Bugzilla '<C-R><C-W>'<CR>

" Runline """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fu! s:RunLine()
	let pbk=&paste
	set paste
	let s=getline(line('.'))
	let r=system(s)
	exe "norm o".r
	let &paste=pbk
endf
command! -nargs=0 RunLine :call s:RunLine()
nnoremap <leader><C-R> :RunLine<CR>
nnoremap <leader>r :RunLine<CR>

" Run in the current file's directory """"""""""""""""""""""""""""""""""""""""
fu! s:RunInFileDir(cmd0)
	let cmd = 'cd '.expand('%:p:h').'; '.a:cmd0
	exec ':!' . cmd
endf
command! -nargs=+ Rcd :call s:RunInFileDir("<args>")

" Expect folding """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fu! ExpectFoldExpr(lnum)
	let line = getline(a:lnum)
	let prevline = getline(a:lnum - 1)
	if prevline =~ '^proc.*{'
		return 1
	end
	if prevline =~ '^}'
		return 0
	end

	return '='
endf

" Init file db """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fu! s:TagsDBInit()
	!$HOME/bin/CS
	"cs add cscope.out
	"cs reset
endf
command! -nargs=0 CS :silent call s:TagsDBInit()

" QF """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fu! QFwinnr()
	let i=1
	while i <= winnr('$')
		if getbufvar(winbufnr(i), '&buftype') == 'quickfix'
			return i
		endif
		let i += 1
	endwhile
	return 0
endf

fu! QFtoggle()
	if QFwinnr() == 0
		cw
	else
		ccl
	end
endf

nnoremap <silent> <F9> :call QFtoggle()<CR>

" Scratch """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-n> :Scratch<CR><C-W><C-O>

" minibuffexplorer """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fu! MBTOn()
	nnoremap <silent> <F8> :call MBTOff()<CR>
	let g:miniBufExplorerMoreThanOne=0
	TMiniBufExplorer
	norm 
	nnoremap <buffer> <CR> :call LPenzMBESelectBuffer()<CR>:call MBTOff()<CR>:<BS>
endf
fu! MBTOff()
	nnoremap <silent> <F8> :call MBTOn()<CR>
	let g:miniBufExplorerMoreThanOne=99
	TMiniBufExplorer
endf
let g:miniBufExplVSplit = 40   " column width in chars
let g:miniBufExplorerMoreThanOne=99
let g:bufExplorerSplitType='v'
let g:explHideFiles='^\.'
let TE_Exclude_Dir_Pattern = '\.deps\|dox'

nnoremap <silent> <F8> :call MBTOn()<CR>

" Abrevs """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ab #i #include
ab #d #define
ab /**/ /****************************************************************************/
let @r=" * \\return 0 if ok, -1 if error.\n"

" Align """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fu! s:AlinhaTabela()
	let bk=@/
	'<,'>s/} *, *$/},/e
	'<,'>Align \/\/{ --{ { }, } , \/\/!< \/\/ =
	'<,'>s/\s\+$//e
	let @/=bk
endf
command! -range -nargs=0 AlinhaTabela :silent call s:AlinhaTabela()
xnoremap <SPACE> :AlinhaTabela<CR>gv=

xnoremap <leader>t :Align \|\| \|<CR>:'<,'>s/^ \+//e<CR>:'<,'>s/ \+$//e<CR>:'<,'>s/^\|  \([^\|]*\) \|/\| \1  \|/e<CR>

xnoremap <leader>h :Align <td[^>]*>, <\/td>, <tr[^>]*>, <\/tr><CR>:'<,'>s/^ //e<CR>

" cvs up utils """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
xnoremap <leader>k :s/^..//<CR>gvJ
nnoremap <silent> <leader>k J2x^

fu! s:CU()
	try
		exec "norm "
	catch /.*/
	endtry
	exec "norm ggOcvs up"
	" exec "norm ggOcvs -f -q -w up -P"
	call s:RunLine()
endf

fu! s:CU2()
	try
		exec "norm "
	catch /.*/
	endtry
	if 0
	elseif filereadable('.hg/00changelog.i')
		let cmd='hg status'
	elseif filereadable('dmptinfo/platform.json')
		let cmd='dmpt status'
	elseif filereadable('.git/config') || filereadable('../.git/config')
		let cmd='git status; git diff --name-status'
		"Gstatus
		"return
	elseif filereadable('.svn/entries')
		let cmd='svn status'
	elseif filereadable('_darcs/inventory')
		let cmd='darcs whatsnew'
	elseif filereadable('CVS/Root')
		let cmd='cvs up'
	end
	exec 'norm ggdGO'.cmd
	call s:RunLine()
endf
command! -nargs=0 CU :silent call s:CU()
command! -nargs=0 CU2 :silent call s:CU2()

nmap <leader>u :CU2<CR>
nmap <leader>U :CU<CR>

let showmarks_enable=0
let g:explHideFiles='^\.'

""""
" Genheader:
fu! GenHeader()
	if expand("%:e") != "h"
		return
	endif
	let name=expand("%:r")
	let sourcename = name . ".c"
	cal append(0, "\/****************************************************************************\/")
	cal append(1, "\/**")
	cal append(2, " * \\file")
	cal append(3, " * \\brief ")
	cal append(4, " *\/")
	cal append(5, "\/****************************************************************************\/")

	let cmd= "cproto -q -O/dev/null " . sourcename
	7put = system(cmd)
	exe "norm G"
	cal append(line('.'),"")
	exe "norm gg7j"
	norm dd4k$
	startinsert!
endf
nnoremap <silent> <leader>g :call GenHeader()<CR>

fu! GenHeaderDoc()
	cal append(0, "\/****************************************************************************\/")
	cal append(1, "\/**")
	cal append(2, " * \\file")
	cal append(3, " * \\brief ")
	cal append(4, " *\/")
	cal append(5, "\/****************************************************************************\/")

	exe "norm gg3j"
	startinsert!
endf
nnoremap <silent> <leader>gf gg:call GenHeaderDoc()<CR>

nnoremap <silent> <leader>sh :so /home/penz/.vim/vimsh/vimsh.vim<CR>

nnoremap <silent> <leader>gw :grep <C-R><C-W> * -r<CR>

""""
let s:file_match_pattern="`ls config.mk Makefile *.c *.h`"

" man """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
so $VIMRUNTIME/ftplugin/man.vim
nnoremap K :Man <C-R><C-W><CR>

" otl """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let otl_bold_headers=0

nnoremap <silent> <leader>o #*
nnoremap <silent> <leader>o0 #*
nnoremap <silent> <leader>o1 :1OTF \<<C-R><C-W>\><CR>
nnoremap <silent> <leader>o2 :2OTF \<<C-R><C-W>\><CR>
nnoremap <silent> <leader>o3 :3OTF \<<C-R><C-W>\><CR>
nnoremap <silent> <leader>o4 :4OTF \<<C-R><C-W>\><CR>
nnoremap <silent> <leader>o5 :5OTF \<<C-R><C-W>\><CR>

xnoremap <silent> <leader>o1 :<BS><BS><BS><BS><BS>1OTF \V<C-R>*<CR>
xnoremap <silent> <leader>o2 :<BS><BS><BS><BS><BS>2OTF \V<C-R>*<CR>
xnoremap <silent> <leader>o3 :<BS><BS><BS><BS><BS>3OTF \V<C-R>*<CR>
xnoremap <silent> <leader>o4 :<BS><BS><BS><BS><BS>4OTF \V<C-R>*<CR>
xnoremap <silent> <leader>o5 :<BS><BS><BS><BS><BS>5OTF \V<C-R>*<CR>

nnoremap <silent> <KPlus> #*

" Mouse """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <M-Esc>[62~ <MouseDown>
map! <M-Esc>[62~ <MouseDown>
map <M-Esc>[63~ <MouseUp>
map! <M-Esc>[63~ <MouseUp>
map <M-Esc>[64~ <S-MouseDown>
map! <M-Esc>[64~ <S-MouseDown>
map <M-Esc>[65~ <S-MouseUp>
map! <M-Esc>[65~ <S-MouseUp>

" WrapToggle """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fu! WrapToggle()
	if &wrap==1
		let &wrap=0
	else
		let &wrap=1
	end
endf
nnoremap <leader>w :silent call WrapToggle()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <C-W>m 99<C-W>+5<C-W>-
nnoremap <C-W><C-J> <C-W>j99<C-W>+
nnoremap <C-W><C-K> <C-W>k99<C-W>+

" automatically give executable permissions if file begins with #!/bin/sh """"
fu! CHMD()
	if getline(1) =~ "^#!\/\\(usr\/\\)\\?bin\/.*"
		call system("test -x ".@%)
		if v:shell_error
			let x=col(".")
			let ft=&ft
			exec "silent !chmod a+x ".@%
			edit!
			exec "norm ".x."|"
			exec "set ft=".ft
		end
	end
endf
autocmd BufWritePost * call CHMD()

fu! Grep(arg)
	let tmp=&grepprg
	set grepprg=grep\ -nrI\ $*\ \\\|grep\ -v\ -f\ $HOME/.grepignore\ 
	exe "grep ".a:arg." *"
	let &grepprg=tmp
endf
command! -nargs=1 Grep :call Grep(<f-args>)

nnoremap <C-W>F <C-W>f99<C-W>+

" Traducao de binarios (word, pdf, etc) " """"""""""""""""""""""""""""""""""""

autocmd BufReadPre *.doc set ro
autocmd BufReadPost *.doc silent %!antiword "%"

autocmd BufReadPre *.pdf set ro
autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" -

"let tlist_txt2tags_settings='txt2tags;d:Titles;m:Includes'
let tlist_txt2tags_settings='txt2tags;d:Titles'

let tst="|"
xnoremap <leader>m <ESC>'<mz'>mx:'z,'x s/^+--*/+-/g<CR>:'z,'x s/  */ /g<CR>:AlignCtrl =<lp1P1wm<CR>:'z,'x call Align("+-",tst,"+")<CR>:'z,'x s/^ //<CR>:'z,'x s/ *$//g<CR>:'z,'x g/^+/s/ /-/g<CR>

" #ifdef INCLUDED """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fu! PROTECTHEADER()
	exe "let tmp = 'basename ".@%."'"
	let tmp = system(tmp)
	let tmp = strpart(tmp, 0, strlen(tmp)-1)
	let tmp = substitute(tmp, "\\.c", "", "")
	let tmp = substitute(tmp, "\\.", "_", "g")
	let tmp = toupper(tmp)
	exe "norm o#ifndef " . tmp . "_INCLUDED"
	exe "norm o#define " . tmp . "_INCLUDED"
	exe "norm Go#endif /* " . tmp . "_INCLUDED */"
	exe "norm "
endf
nmap <leader>pi :call PROTECTHEADER()<CR>

" C headers """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>[i :call CHeaderUtils_PrototypeFromFuncUnderCursor()<CR>
nnoremap <leader>tf :call CHeaderUtils_HeadersFromFuncUnderCursor()<CR>
nnoremap <leader>tg :call CHeaderUtils_GotoHeaderFromFuncUnderCursor()<CR>
nnoremap <leader>tw <C-W>s:call CHeaderUtils_GotoHeaderFromFuncUnderCursor()<CR>

" Diff with saved """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fu! s:DiffWithSaved()
	let filetype=&ft
	diffthis
	vnew | r # | normal 1Gdd
	diffthis
	exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endf
command! Diff call s:DiffWithSaved()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual search:
xnoremap * y/\V<C-R>=substitute(escape(@@,"/\\"),"\n","\\\\n","ge")<CR><CR>
xnoremap # y?\V<C-R>=substitute(escape(@@,"?\\"),"\n","\\\\n","ge")<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fu! CompleteTill78(char)
	norm $
	let pos=col('.')
	exe "norm ".(78-pos)."A".a:char
endf
nnoremap <leader>c* :call CompleteTill78('*')<CR>
nnoremap <leader>c# :call CompleteTill78('#')<CR>
nnoremap <leader>c" :call CompleteTill78('"')<CR>
nnoremap <leader>c- :call CompleteTill78('-')<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>a :A<CR>

nnoremap <leader>l :Lid <C-R><C-W><CR>

autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

nnoremap <silent> . .`[
xnoremap <silent> . :normal .<CR>

" QF: """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! QFfindgrep(args, bang)
	if ! exists("loaded_qf_findgrep")
		call QF_addProgramAndFormat('myfindgrep', 'findgrep $*', "%f")
		let loaded_qf_findgrep = 1
	endif
	call QF_doExecute('myfindgrep', a:args, a:bang)
endfu
command -nargs=* -bang FGrep call QFfindgrep("<args>", "<bang>")

let g:QF_SlocateDB="-d .slocatedb"
command -nargs=* -bang Find call QF_doExecute('findn', "<args>", "<bang>")
command -nargs=* -bang Glimpse call QF_doExecute('glimpse', "<args>", "<bang>")
command -nargs=* -bang Lid call QF_doExecute('lid', "<args>", "<bang>")
command -nargs=* -bang Locate call QF_doExecute('slocate', "<args>", "<bang>")
command -nargs=* -bang FRE call QF_doExecute('findregex', "<args>", "<bang>")

" See: """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fu! s:See()
	call system('(see ' . @% . ') &')
endf
command! -nargs=0 See :call s:See()
nmap <silent> <F3> :See<CR>

