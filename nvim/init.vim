" Matthew Berger's vimrc
" init.vim

" Automatically install vim-plug
if has('unix')
	if empty(glob('~/.config/nvim/autoload/plug.vim'))
		silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
endif

" Plugins ----------------------------------------------------------------- {{{
call plug#begin('~/.config/nvim/plugged')

	" Sensible defaults
	Plug 'tpope/vim-sensible'

	" Automatically set the current working directory to project root
	Plug 'airblade/vim-rooter'

	" Fuzzy-Finding
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'

	" Describe keybindings
	" TODO: Configure this
	Plug 'liuchengxu/vim-which-key'

	" Emoji
	Plug 'junegunn/vim-emoji'

	" Completions
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" Linting
	Plug 'dense-analysis/ale'

    " Status line
	Plug 'liuchengxu/eleline.vim'

	" Highlight yanked region
	Plug 'machakann/vim-highlightedyank'

	" Pulse the line the cursor is on after a search
	Plug 'inside/vim-search-pulse'

	" TOML support
	Plug 'cespare/vim-toml'

	" Colorschemes
	Plug 'junegunn/seoul256.vim'
	Plug 'dracula/vim'
	"Plug 'frankier/neovim-colors-solarized-truecolor-only'
	Plug 'tomasr/molokai'

	" Show git diff in margins
	Plug 'mhinz/vim-signify'

	" Show function signature and inline doc
	Plug 'Shougo/echodoc.vim'

	" Smooth scrolling
	Plug 'yonchu/accelerated-smooth-scroll'

	" Tim Pope plugins
	Plug 'tpope/vim-commentary' " Commenting plugin
	Plug 'tpope/vim-surround'   " Change surrounding characters
	Plug 'tpope/vim-fugitive'   " Git plugin
	Plug 'tpope/vim-repeat'     " Allow plugins to repeat commands
	Plug 'tpope/vim-unimpaired'
	Plug 'tpope/vim-endwise'

	" Markdown
	Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
	Plug 'tpope/vim-markdown', { 'for': 'markdown' }

	" Navigate files easily
	Plug 'lokaltog/vim-easymotion'

	" Rust support
	Plug 'rust-lang/rust.vim'

	" Sort lines
	Plug 'christoomey/vim-sort-motion'

	" Load wal colorscheme
	Plug 'dylanaraps/wal.vim'

	" FileTree navigator
	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

	" View and find LSP symbols
	Plug 'liuchengxu/vista.vim'

	" Junegunn plugins
	Plug 'junegunn/limelight.vim'
	Plug 'junegunn/goyo.vim'
	Plug 'junegunn/rainbow_parentheses.vim'
	Plug 'junegunn/vim-emoji'
	Plug 'junegunn/vim-easy-align'           " Align characters in text
	Plug 'junegunn/vim-peekaboo'
	Plug 'junegunn/vim-slash'

	" Highlight yanked region
	Plug 'kana/vim-operator-user'
	Plug 'haya14busa/vim-operator-flashy'

	" Autocomplete pairs
	Plug 'jiangmiao/auto-pairs'

	" Add indent guides
	Plug 'nathanaelkane/vim-indent-guides'

	" Load dev icons
	Plug 'ryanoasis/vim-devicons'

	" Add cargo commands for vim
	Plug 'timonv/vim-cargo'
call plug#end()
" }}}

" Plugin Settings
runtime plugins/ale.vim
runtime plugins/deoplete.vim
runtime plugins/fzf.vim
runtime plugins/git.vim
runtime plugins/nerdtree.vim
runtime plugins/rooter.vim
runtime plugins/sort_motion.vim

" Options ----------------------------------------------------------------- {{{
if has('unix')
	" Use fish
	set shell=/bin/fish
endif

" Show line numbers
set number

" Lower the cmdline
set cmdheight=1

" Limit width to 80
set textwidth=80

" Horizontal splits open below
set splitbelow

" Vertical splits open to the right
set splitright

" Number of visual spaces per TAB
set tabstop=4

" Number of spaces in tab when editing
set softtabstop=4

" Number of columns text is indented with when reindenting using << or >>
set shiftwidth=4

" Don't highlight current line
set nocursorline

" Highlight matching [{()}]
set showmatch

" Disable wrapping by default
set nowrap

" Open most folds by default
set foldlevelstart=10

" 10 nested fold max
set foldnestmax=10

" Fold based on indent level
set foldmethod=indent

" Required for operations modifying multiple buffers like rename.
set hidden

" Redraw only when we need to
set lazyredraw

" Disable swap files
set noswapfile

" Use file names as title of terminal while editing
set title

" Hide mouse when typing
set mousehide

" No alarms and no surprises
set noerrorbells visualbell t_vb=

" Yank and paste with the system clipboard
set clipboard=unnamed

" Apply substitutions globally by default
set gdefault

" Ignore certain file types and directories from fuzzy finding
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.pdf,*.psd
set wildignore+=node_modules/*

" Make searches case insensitive
set ignorecase

" Override ignorecase option if search contains uppercase characters
set smartcase

" Wrapping options
set formatoptions=tc " Wrap text and comments using textwidth
set formatoptions+=r " Continue comments when pressing ENTER in insert mode
set formatoptions+=q " Enable formatting of comments with qg
set formatoptions+=n " Detect lists for formatting
set formatoptions+=b " Auto-wrap in insert mode, and do not wrap old long lines
" }}}

" Settings ---------------------------------------------------------------- {{{

" Use fold markers when editing vim files
au filetype vim set foldmethod=marker

" Set cwd to buffer dir
" autocmd BufEnter * silent! lcd %:p:h

" Properly match comments in json files
autocmd FileType json syntax match Comment +\/\/.\+$+

" Enter insert mode after opening a terminal
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" Return to the same line of a file after closing and reopening
augroup line_return
	au!
	au BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\     execute 'normal! g`"zvzz' |
				\ endif
augroup END

" Toggle relativenumber in insert mode and regular line numbers in normal mode
autocmd InsertEnter * silent! :set norelativenumber
autocmd InsertLeave,BufNewFile,VimEnter * silent! :set relativenumber

" Removes trailing spaces
function! TrimWhiteSpace()
	%s/\s\+$//e
endfunction
autocmd FileWritePre   * :call TrimWhiteSpace()
autocmd FileAppendPre  * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre    * :call TrimWhiteSpace()

" Resize splits when the window is resized
au VimResized * :wincmd =

" Set grep program to ripgrep if available and set the format
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif
" }}}


" Keybindings ------------------------------------------------------------- {{{
" Set leader
let mapleader = "\<space>"

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

nnoremap gF :vertical wincmd f<cr>

nnoremap <leader>fed :split $MYVIMRC<cr> :only<cr>
nnoremap <leader>fer :source $MYVIMRC<cr>
nnoremap <leader>feR :source $MYVIMRC<cr> :PlugClean<cr> :PlugInstall<cr>
nnoremap <leader>fs :w<cr>
nnoremap <leader>fS :wa<cr>
nnoremap <leader>u :UndotreeToggle<cr>
nnoremap <leader>sl y:execute @@<cr>
vnoremap <leader>sl ^vg_y:execute @@<cr>
nnoremap <leader>qq :qa!<cr>
nnoremap <leader>ft :NERDTreeToggle<cr>
nnoremap <leader>fF :NERDTreeFind<cr>
nnoremap <leader>bd :bdelete<cr>
nnoremap <leader>bb :Buffers<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>wd :q<cr>
nnoremap <leader>w- :split<cr>
nnoremap <leader>w/ :vsp<cr>
nnoremap <leader>tr :set relativenumber!<cr>
nnoremap <leader>tn :set number!<cr>
nnoremap <leader>tw :set wrap!<cr>
nnoremap <leader>tl :Limelight!!<cr>
nnoremap <Leader>tg :Goyo<cr>
nnoremap <leader>ff :Files<cr>
nnoremap <leader>hdw :help <C-r><C-w><cr>
nnoremap <silent> <leader>sc :nohlsearch<cr>:call clearmatches()<cr>
" Open a quickfix window for the last search
nnoremap <silent> <leader>ss :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>
nnoremap <silent> <leader>en :lopen<cr> :lnext<cr>
nnoremap <silent> <leader>ep :lopen<cr> :lprevious<cr>
nnoremap <silent> <leader>ec :lclose<cr>
nnoremap <silent> <leader>ls :mksession!<cr>
nnoremap <silent> <leader>'  :split<cr> :terminal<cr> <esc><cr>

" vim-operator-flashy
map y <Plug>(operator-flashy)
nmap y <Plug>(operator-flashy)$

" Yank entire buffer to clipboard
nnoremap <leader>bY gg"*yGgg"+yG

nnoremap <leader>w= <C-W>=
nnoremap <leader>j= mzgg=G`z

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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

" Flash the yank motion
map y <Plug>(operator-flashy)

" Center search results
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

" Paste clipboard into buffer
nnoremap <leader>bp :read !xsel --clipboard --output<cr>

" Copy entire buffer into clibpoard
nnoremap <leader>by :w !xsel -ib<cr><cr>

" Leaders for rg search
noremap <leader>S :Rg<cr>

command! -bang -nargs=* Rg
	\ call fzf#vim#grep(
	\	'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
	\	<bang>0 ? fzf#vim#with_preview('up:60%')
	\			: fzf#vim#with_preview('right:50%:hidden', '?'),
	\	<bang>0)

" Open new file adjacent to current file
nnoremap <leader>E :e <C-R>=expand("%:p:h") . "/" <CR>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Toggle Tagbar
nmap <F8> :TagbarToggle<cr>

" Git
nmap <leader>gP <Plug>Gpush
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <leader>gl :Commits<cr>
" }}}


" Style ------------------------------------------------------------------- {{{
" set termguicolors
set background=dark
set t_Co=256

colorscheme dracula

if has('unix')
	colorscheme wal
endif

" Make comments italic
"autocmd VimEnter * highlight Comment cterm=italic
"highlight Comment cterm=italic gui=italic
" }}}

" Languages --------------------------------------------------------------- {{{
	" Markdown {{{
	let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

	" For TOC
	let g:vmt_auto_update_on_save = 1

	" markdown files
	autocmd BufNewFile,BufRead *.md,*.mkd,*.markdown setfiletype markdown
	autocmd BufNewFile,BufRead *.md,*.mkd,*.markdown set spell spelllang=en_us
	autocmd FileType markdown setlocal tw=100

	" Keybindings
	au FileType markdown nmap <Leader>mti :silent! GenTocGFM<cr>

	au FileType markdown nmap ,ti :silent! GenTocGFM<cr>
	"}}}


	" Rust {{{
	" Automatically run rustfmt on save
	let g:autofmt_autosave = 1

	let g:rustfmt_command = "rustfmt +nightly"
	let g:rustfmt_options = "--emit files"
	let g:rustfmt_autosave = 1
	let g:rustfmt_fail_silently = 0
	let g:rust_clip_command = 'xclip -selection clipboard'

	" Cargo bindings
	autocmd FileType Rust nnoremap <buffer> <leader>cb :CargoBuild
	autocmd FileType Rust nnoremap <buffer> <leader>cc :CargoClean
	autocmd FileType Rust nnoremap <buffer> <leader>cu :CargoUpdate
	autocmd FileType Rust nnoremap <buffer> <leader>cd :CargoDoc
	autocmd FileType Rust nnoremap <buffer> <leader>ct :CargoTest

	" Todo: Add a command here to open rust documentation using 'cargo doc --open'
	" }}}

	" Vimscript {{{
	" Use fold markers when editing vim files
	au filetype vim set foldmethod=marker
	" }}}
" }}}


" Plugin settings --------------------------------------------------------- {{{

" Rooter
let g:rooter_silent_chdir = 1
let g:rooter_resolve_links = 1

" Ale {{{
let g:ale_sign_column_always=1

" Only lint on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1
" }}}

" FZF {{{
" Multiple Cursors

function! s:find_root()
  for vcs in ['.git', '.svn', '.hg']
    let dir = finddir(vcs.'/..', ';')
    if !empty(dir)
      execute 'Files' dir
      return
    endif
  endfor
  Files
endfunction

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
command! FZFR call s:find_root()

let g:fzf_layout = { 'down': '~20%' }
" }}}

" Sort motion
" Make all sorts case insensitive
let g:sort_motion_flags = "ui"
" }}}
