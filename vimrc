" Local configuration

let $VIMHOME=expand('<sfile>:p:h')

if filereadable(glob("~/.vim.local/vimrc"))
   exe 'set rtp+=' . expand('~/.vim.local')
   source ~/.vim.local/vimrc
endif

if !has('nvim')
   set nocompatible
   filetype off
endif

" Plugin installation

call plug#begin($VIMHOME . '/plugged')

" Theme
Plug 'altercation/vim-colors-solarized'

" Plugins
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'dbakker/vim-lint'
Plug 'git://repo.or.cz/vcscommand.git'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'lpenz/vimcommander'
Plug 'mhinz/vim-grepper'
Plug 'milkypostman/vim-togglelist'
Plug 'scrooloose/nerdcommenter'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/Align'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/otf.vim'
Plug 'w0rp/ale'
Plug 'will133/vim-dirdiff'

" Filetype native syntax and indentation
Plug 'aklt/plantuml-syntax'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'jceb/vim-orgmode'
Plug 'mitsuhiko/vim-jinja'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'syml/rust-codefmt'

" Filetype AutoFormat modules
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'lpenz/vim-codefmt-haskell'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'

call plug#end()

filetype plugin indent on

call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
"""""

" Settings
set background=dark
colorscheme solarized
set expandtab tabstop=4 shiftwidth=4
set nowrap
set noswapfile
set autowriteall
set ignorecase

" Plugin config
let g:loaded_matchparen = 1

let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

let g:c_gnu = 1
let g:c_no_comment_fold=1
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,*.o,*.d,*.a,.git,.find.txt,.find.txt.gz,ID,tags,*.pyc,*.rpm,GPATH,GRTAGS,GTAGS"
let g:grepper = {}
let g:grepper.tools = ['rg', 'grep', 'git']
let g:NERDTreeIgnore = ['\.pyc$','\.o$','\.hi$','\.dyn_hi$','\.dyn_o$',"^GPATH$","^GRTAGS$","^GTAGS$"]
let g:netrw_liststyle = 3
let g:netrw_winsize = 20
let g:vim_json_syntax_conceal = 0

if v:version >= 700
	set completeopt=longest,menu
	set spelllang=pt,en
end

if v:version >= 730
    if !isdirectory("/tmp/vim-undo-dir")
        call mkdir("/tmp/vim-undo-dir", "", 0700)
    endif
    set undodir="/tmp/vim-undo-dir"
    set undofile
end


" Keys:
let g:mapleader=' '

" Disable help:
nmap <F1> :echo ""<CR>
imap <F1> <C-O>:echo ""<CR>

nnoremap <silent> <leader>fs :update!<CR>
nnoremap <silent> <F2> :update!<CR>
imap <silent> <F2> <C-O><F2>
imap <silent> <M-F2> <C-O><F2>
nnoremap <silent> <C-P> <C-I>
nnoremap <silent> <F4> :cn<CR>zv
nnoremap <silent> <F5> @q
nnoremap <silent> <F6> @w
nnoremap <silent> <F7> :Errors<CR>
nnoremap <silent> <F8> :Buffers<CR>
nnoremap <silent> <leader>bb :Buffers<CR>
nnoremap <silent> <leader>ff :Files<CR>
nmap <script> <silent> <F7> :call ToggleLocationList()<CR>
nmap <script> <silent> <F9> :call ToggleQuickfixList()<CR>

nnoremap <silent> <F10> :copen \| AsyncRun -program=make<CR>
nnoremap <silent> <F11> :call VimCommanderToggle()<CR>
imap <silent> <F10> <C-O><F10>
imap <silent> <M-F10> <C-O><F10>

nnoremap <silent> <F12> :Lex<CR>

nnoremap <silent> <C-C> :qa!<CR>
nnoremap <silent> <C-Q> :bd<CR>
nnoremap <silent> Q :bd<CR>

nnoremap <leader><tab> <C-^>

nnoremap <leader>syn :echo synIDattr(synID(line("."), col("."), 1), "name")<CR>

nnoremap <leader>v :grep <C-R><C-W> . <CR>

nnoremap <silent> <F3> :See<CR>

" Make ESC leave terminal mode
tnoremap <Esc> <C-\><C-n>

" Visual search
xnoremap * y/\V<C-R>=substitute(escape(@@,"/\\"),"\n","\\\\n","ge")<CR><CR>
xnoremap # y?\V<C-R>=substitute(escape(@@,"?\\"),"\n","\\\\n","ge")<CR><CR>

" Use ripgrep as grepprg if it exists
if executable('rg')
   set grepprg=rg\ -u\ --vimgrep\ -g\ '!/tags'
endif

"""

" Local overrides

if filereadable(glob("~/.vim.local/vimrc.after"))
    source ~/.vim.local/vimrc.after
endif

