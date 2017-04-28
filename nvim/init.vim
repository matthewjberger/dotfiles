" Matthew Berger's vimrc

" Automatically install vim-plug
if has('unix')
	if empty(glob('~/.config/nvim/autoload/plug.vim'))
		silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
endif

" Use plugins
call plug#begin('~/.config/nvim/plugged')
	Plug 'airblade/vim-gitgutter'
	Plug 'airblade/vim-rooter'
	Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
	Plug 'christoomey/vim-sort-motion'
	Plug 'dahu/vim-fanfingtastic'
	Plug 'equalsraf/neovim-gui-shim'
	Plug 'frankier/neovim-colors-solarized-truecolor-only'
	Plug 'inside/vim-search-pulse'
	Plug 'jalcine/cmake.vim'
	Plug 'jiangmiao/auto-pairs'
	Plug 'junegunn/limelight.vim'
	Plug 'junegunn/goyo.vim'
	Plug 'junegunn/seoul256.vim'
	Plug 'junegunn/vim-easy-align'
	Plug 'junegunn/vim-peekaboo'
	Plug 'lokaltog/vim-easymotion'
	Plug 'luochen1990/rainbow'
	Plug 'neomake/neomake'
	Plug 'rust-lang/rust.vim'
	Plug 'scrooloose/nerdcommenter'
	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
	Plug 'sheerun/vim-polyglot'
	Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'Shougo/echodoc.vim'
	Plug 'Shougo/neco-vim', { 'for': 'vim' }
	Plug 'Shougo/neco-syntax', { 'for': 'vim' }
	Plug 'Shougo/neosnippet'
	Plug 'Shougo/neosnippet-snippets'
	Plug 'tomasr/molokai'
	Plug 'tommcdo/vim-lion'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-sensible'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'yonchu/accelerated-smooth-scroll'
	Plug 'zchee/deoplete-zsh'

call plug#end()

" Set leader
let mapleader = "\<space>"

" Set cwd to buffer dir
autocmd BufEnter * silent! lcd %:p:h

autocmd BufWritePost * mkview
autocmd FileReadPost * silent! loadview

autocmd! BufWritePost * Neomake

" Redraw only when we need to
set lazyredraw

" Disable swap files
set noswapfile

" Use file names as title of terminal while editing
set title

let g:rainbow_active = 1

let g:rainbow_conf = {
			\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
			\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
			\	'operators': '_,_',
			\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
			\	'separately': {
			\		'*': {},
			\		'tex': {
			\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
			\		},
			\		'lisp': {
			\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
			\		},
			\		'vim': {
			\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
			\		},
			\		'html': {
			\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
			\		},
			\		'css': 0,
			\	}
			\}

" Number of visual spaces per TAB
set tabstop=4

" Number of spaces in tab when editing
set softtabstop=4

" Number of columns text is indented with when reindenting using << or >>
set shiftwidth=4

" Show line numbers
set number

" Highlight current line
set cursorline

" Highlight matching [{()}]
set showmatch

" Show the line and column number of the cursor position, separated by a comma.
"set ruler

" Open most folds by default
set foldlevelstart=10

" 10 nested fold max
set foldnestmax=10

" Fold based on indent level
set foldmethod=indent

" Check file change every 4 seconds ('CursorHold') and reload the buffer upon
" detecting change
set autoread
au CursorHold * checktime

" Use fold markers when editing vim files
au filetype vim set foldmethod=marker

let g:deoplete#enable_at_startup = 1

" Cycle through completion entries
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Language Server Client
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

let NERDTreeIgnore=['\.o$', '\~$']

" Make all sorts case insensitive
let g:sort_motion_flags = "ui"

" Easier movement between windows
noremap <leader>wh <C-w>h
noremap <leader>wj <C-w>j
noremap <leader>wk <C-w>k
noremap <leader>wl <C-w>l

" Don't move on *
nnoremap * *<C-O>:call search_pulse#Pulse()<cr>

" Keep search matches in the middle of the window and pulse the window
nnoremap n nzzzv:call search_pulse#Pulse()<cr>
nnoremap N Nzzzv:call search_pulse#Pulse()<cr>

nnoremap g; g;zz:call search_pulse#Pulse()<cr>
nnoremap g, g,zz:call search_pulse#Pulse()<cr>
nnoremap <c-o> <c-o>zz:call search_pulse#Pulse()<cr>

nnoremap <leader>fed :split $MYVIMRC<cr> :only<cr>
nnoremap <leader>feR :source $MYVIMRC<cr> :PlugInstall<cr>
nnoremap <leader>fs :w<cr>
nnoremap <leader>fS :wa<cr>
nnoremap <leader>sl y:execute @@<cr>
vnoremap <leader>sl ^vg_y:execute @@<cr>
nnoremap <leader>qq :qa!<cr>
nnoremap <leader>ft :NERDTreeToggle<cr>
nnoremap <leader>bd :bdelete<cr>
nnoremap <leader>bb :Denite buffer<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>wd :q<cr>
nnoremap <leader>tr :set relativenumber!<cr>
nnoremap <leader>tn :set number!<cr>
nnoremap <leader>tw :set wrap!<cr>
nnoremap <leader>tl :Limelight!!<cr>
nnoremap <leader>tt :Goyo<cr>
nnoremap <leader>pf :Denite file_rec<cr>
nnoremap <leader>hdw :help <C-r><C-w><cr>
nnoremap <silent> <leader>sc :nohlsearch<cr>:call clearmatches()<cr>
" Open a quickfix window for the last search
nnoremap <silent> <leader>en :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
nnoremap <silent> <leader>ls :mksession!<cr>

" Yank entire buffer to clipboard
nnoremap <leader>bY gg"*yGgg"+yG

nnoremap <leader>w= <C-W>=
nnoremap <leader>j= mzgg=G`z

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

augroup line_return
	au!
	au BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\     execute 'normal! g`"zvzz' |
		\ endif
augroup END

"autocmd InsertEnter * silent! :set norelativenumber
"autocmd InsertLeave,BufNewFile,VimEnter * silent! :set relativenumber

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

autocmd FileWritePre   * :call TrimWhiteSpace()
autocmd FileAppendPre  * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre    * :call TrimWhiteSpace()

" Align text
nnoremap <leader>Al :left<cr>
nnoremap <leader>Ac :center<cr>
nnoremap <leader>Ar :right<cr>
vnoremap <leader>Al :left<cr>
vnoremap <leader>Ac :center<cr>
vnoremap <leader>Ar :right<cr>

" Select line and ignore indentation
nnoremap vv ^vg_

" Remap yank register to "
nnoremap "" "0"

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO

nnoremap j gj
nnoremap k gk

inoremap jk <ESC>
vnoremap jk <ESC>

nnoremap $ <nop>
nnoremap ^ <nop>

" Jump to far left or right of line in insert mode
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A"`

" Jump to far left or right of line
noremap H ^
noremap L $

" Move to last non-blank character of line
vnoremap L g_

" Jump to last change
nnoremap gI `.

" Highlight last inserted text
nnoremap gV `[v`]

" Lower cmdline
set cmdheight=1

" Save when losing focus
" au FocusLost * :wa<cr>

" Resize splits when the window is resized
au VimResized * :wincmd =

" Set the colorscheme
set termguicolors
set background=dark

" Set solarized
" colorscheme solarized

" Set molokai
let g:molokai_original = 1
colorscheme molokai
let g:airline_theme = 'molokai'

" Set seoul256
"colorscheme seoul256
"let g:airline_theme = 'zenburn'

" Airline
let g:airline_powerline_fonts = 1

" Fold navigation {{{
nnoremap <silent> <leader>fj :call NextClosedFold('j')<cr>
nnoremap <silent> <leader>fk :call NextClosedFold('k')<cr>
function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction
"}}}
