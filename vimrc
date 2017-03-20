" Matthew Berger's vimrc

" Automatically Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Plugin List {{{
set nocompatible
filetype off

call plug#begin('~/.vim/bundle/')

Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-sort-motion'
Plug 'dahu/vim-fanfingtastic'
Plug 'derekwyatt/vim-fswitch'
Plug 'derekwyatt/vim-protodef'
Plug 'ervandew/supertab'
Plug 'inside/vim-search-pulse'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'kien/rainbow_parentheses.vim'
Plug 'lokaltog/vim-easymotion'
Plug 'mattn/webapi-vim' | Plug 'rust-lang/rust.vim'
Plug 'majutsushi/tagbar'
Plug 'raimondi/delimitmate'
Plug 'rdnetto/ycm-generator', { 'branch': 'stable' }
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'shougo/vimproc.vim' | Plug 'shougo/neoyank.vim' | Plug 'shougo/neomru.vim' | Plug 'shougo/unite.vim'
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
Plug 'sjl/gundo.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
" Plug 'valloric/youcompleteme', {'do': './install.py --clang-completer --gocode-completer --racer-completer'}
Plug 'xolox/vim-misc' | Plug 'xolox/vim-easytags'
Plug 'yonchu/accelerated-smooth-scroll'

call plug#end()

" Use Syntax highlighting
syntax on

" Use filetype detection
filetype on

" Customize indentation method using filetype plugins
filetype plugin indent on
"}}}

let mapleader = ","
nnoremap <leader>ev :split $MYVIMRC <CR>
nnoremap <leader>Ev :split $MYVIMRC <CR> :only<cr>
nnoremap <leader>sv :source $MYVIMRC <CR>
nnoremap <leader>ez :split ~/.zshrc<CR>

" Use old regexp engine, vim 7.4+'s new regexp engine makes easytags laggy
set regexpengine=0

let NERDTreeIgnore=['\.o$', '\~$']

" Make all sorts case insensitive
let g:sort_motion_flags = "ui"

nnoremap <leader><ESC> :qa!<CR>;
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader><SPACE> :w<CR>

" Save and quit files more easily
nnoremap <leader>q ZQ " Quit file without saving
nnoremap <leader>Z ZZ " Save and quit file

set colorcolumn=80
highlight ColorColumn ctermbg=darkgray
match ErrorMsg '\%>80v.\+'
colorscheme seoul256
set background=dark

" Don't move on *
nnoremap * *<C-O>:call search_pulse#Pulse()<CR>

" Keep search matches in the middle of the window and pulse the window
nnoremap n nzzzv:call search_pulse#Pulse()<CR>
nnoremap N Nzzzv:call search_pulse#Pulse()<CR>

nnoremap g; g;zz:call search_pulse#Pulse()<CR>
nnoremap g, g,zz:call search_pulse#Pulse()<CR>
nnoremap <c-o> <c-o>zz:call search_pulse#Pulse()<CR>

" Return to the same line when reopening files
augroup line_return
	au!
	au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\     execute 'normal! g`"zvzz' |
			\ endif
augroup END

set splitbelow
set splitright

" easier movement between windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Airline {{{
let g:airline_powerline_fonts=1

" Show airline tabs
"let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"

" }}}

autocmd InsertEnter * silent! :set norelativenumber
autocmd InsertLeave,BufNewFile,VimEnter * silent! :set relativenumber

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

"nnoremap <silent> <leader>rtw :call TrimWhiteSpace()<CR>

autocmd FileWritePre   * :call TrimWhiteSpace()
autocmd FileAppendPre  * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre    * :call TrimWhiteSpace()

" zM to open all folds
" zR to close all folds
autocmd Syntax c,cpp,h setlocal foldmethod=indent
autocmd Syntax c,cpp,h normal zR

au VimEnter * RainbowParenthesesToggle
au Syntax   * RainbowParenthesesLoadRound
au Syntax   * RainbowParenthesesLoadSquare
au Syntax   * RainbowParenthesesLoadBraces

" Open a quickfix window for the last search
nnoremap <silent> <leader>ls :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Align text
nnoremap <leader>Al :left<cr>
nnoremap <leader>Ac :center<cr>
nnoremap <leader>Ar :right<cr>
vnoremap <leader>Al :left<cr>
vnoremap <leader>Ac :center<cr>
vnoremap <leader>Ar :right<cr>

" Select line and ignore indentation
nnoremap vv ^vg_

" Source
vnoremap <leader>S y:execute @@<CR>
nnoremap <leader>S ^vg_y:execute @@<CR>

" Remap yank register to "
nnoremap "" "0"

" You Complete Me syntax config default
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" Rust source path
let g:ycm_rust_src_path="/home//Code/rust/src/"

" Gundo
nnoremap <leader>u :GundoToggle<CR>

" Lower cmdline
set cmdheight=1

" Save when losing focus
au FocusLost * :wa<CR>

" Resize splits when the window is resized
au VimResized * :wincmd =

" Use sane regexes
nnoremap / /\v
vnoremap / /\v

" Jump to far left or right of line
noremap H ^
noremap L $

" Move to last non-blank character of line
vnoremap L g_

" Jump to last change
nnoremap gI `.

" Highlight last inserted text
nnoremap gV `[v`]

" Jump to far left or right of line in insert mode
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A"`

" Set F2 to be the paste toggle
nnoremap <F2> :set invpaste paste? <CR>
set pastetoggle=<F2>

" Make zO recursively open whatever fold we're in, even if it's partially
" open.
nnoremap zO zczO

" Set working directory to current file
set autochdir

" Automatically indent
set autoindent

" Define what kind of backspacing is preferred
"indent	allow backspacing over autoindent
"eol	allow backspacing over line breaks (join lines)
"start	allow backspacing over the start of insert; CTRL-W and CTRL-U
set backspace=indent,eol,start

" Always try to confirm
set confirm

" Copy the structure of the existing lines indent when autoindenting a new line.
set copyindent

" Remember up to 200 lines of history
set history=200

" Don't ring on error
set noerrorbells

" Case insensitive searches
set ignorecase

" Number of visual spaces per TAB
set tabstop=4

" Number of spaces in tab when editing
set softtabstop=4

" Number of columns text is indented with when reindenting using << or >>
set shiftwidth=4

" Tabs are spaces
set expandtab

" Show line numbers
set number

" Highlight current line
set cursorline

" Load filetype-specific indent files
filetype indent on

" Visual autocomplete for the command menu
set wildmenu

" Redraw only when we need to
set lazyredraw

" Highlight matching [{()}]
set showmatch

" Search as characters are entered
set incsearch

" Highlight matches
set hlsearch

" Disable swap files
set noswapfile

" Show the line and column number of the cursor position, separated by a comma.
set ruler

" No visual error bells
set t_vb=

" Use file names as title of terminal while editing
set title

" Turn off search highlight
noremap  <silent> <leader>/ :nohlsearch<cr>:call clearmatches()<cr>

" Enable folding
set foldenable

" Open most folds by default
set foldlevelstart=10

" 10 nested fold max
set foldnestmax=10

" The spacebar opens and closes folds
nnoremap <space> za
vnoremap <space> za

" Fold based on indent level
set foldmethod=indent

" Use fold markers when editing vim files
au filetype vim set foldmethod=marker

" Enable modelines
set modeline

" Check final line for vim settings specific to file
set modelines=1

" Move vertically by visual line
" Won't skip over 'fake' part of visibly wrapped lines
nnoremap j gj
nnoremap k gk

" Pressing jk quickly will exit insert or visual mode
inoremap jk <ESC>
vnoremap jk <ESC>

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Save session (assortment of windows)
" Reopen vim with vim -S
nnoremap <leader>ss :mksession!<CR>

" Open ag.vim
nnoremap <leader>a :Ag<space>

" Use backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Check file change every 4 seconds ('CursorHold') and reload the buffer upon
" detecting change
set autoread
au CursorHold * checktime

" Fold navigation {{{
nnoremap <silent> <leader>zj :call NextClosedFold('j')<cr>
nnoremap <silent> <leader>zk :call NextClosedFold('k')<cr>
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
" Ultisnips and YCM {{{
set completeopt=menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_confirm_extra_conf = 0

" Prevent ultisnips from hijacking the enter key
let g:UltiSnipsExpandTrigger = "<nop>"

" In insert mode, if popup menu is visible, try to expand a snippet when enter
" is pressed,, otherwise send a normal enter keypress
inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"
"}}}
" Unite.vim mappings {{{

"   Enable Yank history
let g:unite_source_history_yank_enable=1
let g:unite_enable_start_insert=1

"   File finding mappings
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec/async','sorters','sorter_rank', )
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_prompt='» '
let g:unite_split_rule = 'botright'
if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
    let g:unite_source_grep_recursive_opt=''
endif
nnoremap <leader>L :<C-u>Unite -no-split -buffer-name=files file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru file_mru<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer buffer<cr>

nnoremap <leader>Ft :Unite file_rec/async -default-action=tabopen<CR>
nnoremap <leader>Fs :Unite file_rec/async -default-action=split<CR>
nnoremap <leader>Fv :Unite file_rec/async -default-action=vsplit<CR>

"   Buffer switching
nnoremap <leader>ss :Unite -quick-match -auto-preview buffer<cr>

" Switch to the file and load it into the current window
nmap <silent> <Leader>of :FSHere<cr>
" Switch to the file and load it into the window on the right
nmap <silent> <Leader>ol :FSRight<cr>
" Switch to the file and load it into a new window split on the right
nmap <silent> <Leader>oL :FSSplitRight<cr>
" Switch to the file and load it into the window on the left
nmap <silent> <Leader>oh :FSLeft<cr>
" Switch to the file and load it into a new window split on the left
nmap <silent> <Leader>oH :FSSplitLeft<cr>
" Switch to the file and load it into the window above
nmap <silent> <Leader>ok :FSAbove<cr>
" Switch to the file and load it into a new window split above
nmap <silent> <Leader>oK :FSSplitAbove<cr>
" Switch to the file and load it into the window below
nmap <silent> <Leader>oj :FSBelow<cr>
" Switch to the file and load it into a new window split below
nmap <silent> <Leader>oJ :FSSplitBelow<cr>

" }}}

