" Plugin List

" Use plugins
call plug#begin('~/.config/nvim/plugged')

	" Automatically set the current working directory to project root
	Plug 'airblade/vim-rooter'

	" Fuzzy-Finding
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'

	" Async completions
	Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }

	" Linting
	Plug 'w0rp/ale'

	" Status line
	Plug 'itchyny/lightline.vim'

	" Highlight yanked region
	Plug 'machakann/vim-highlightedyank'

	" Pulse the line the cursor is on after a search
	Plug 'inside/vim-search-pulse'

	" Enable using language servers
	Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

	" TOML support
	Plug 'cespare/vim-toml'

	" Colorschemes
	Plug 'junegunn/seoul256.vim'
	"Plug 'frankier/neovim-colors-solarized-truecolor-only'
	Plug 'tomasr/molokai'

	" Show git diff in margins
	Plug 'airblade/vim-gitgutter'

	" Show function signature and inline doc
	Plug 'Shougo/echodoc.vim'

	" Smooth scrolling
	Plug 'yonchu/accelerated-smooth-scroll'

	" Tim Pope plugins
	Plug 'tpope/vim-commentary' " Commenting plugin
	Plug 'tpope/vim-surround'   " Change surrounding characters

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

	" Navigate between vim and tmux panes easily
	Plug 'christoomey/vim-tmux-navigator'

	" Load dev icons
	Plug 'ryanoasis/vim-devicons'

	"Plug 'dahu/vim-fanfingtastic'
	"Plug 'equalsraf/neovim-gui-shim'
	"Plug 'janko-m/vim-test'
	"Plug 'jceb/vim-orgmode'
	"Plug 'jiangmiao/auto-pairs'
	"Plug 'junegunn/limelight.vim'
	"Plug 'junegunn/goyo.vim'
	"Plug 'junegunn/rainbow_parentheses.vim'
	"Plug 'junegunn/vim-emoji'
	"Plug 'junegunn/vim-easy-align'
	"Plug 'junegunn/vim-peekaboo'
	"Plug 'junegunn/vim-slash'
	"Plug 'kassio/neoterm'
	"Plug 'majutsushi/tagbar'
	"Plug 'mbbill/undotree'
	"Plug 'michaeljsmith/vim-indent-object'
	"Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
	"Plug 'nathanaelkane/vim-indent-guides'
	"Plug 'roxma/nvim-completion-manager'
	"Plug 'roxma/python-support.nvim'
	"Plug 'sheerun/vim-polyglot'
	""Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
		""Plug 'sebastianmarkow/deoplete-rust'
		""Plug 'tweekmonster/deoplete-clang2'
		""Plug 'zchee/deoplete-zsh'
		""Plug 'Shougo/neco-vim', { 'for': 'vim' }
		""Plug 'Shougo/neco-syntax', { 'for': 'vim' }
	"Plug 'Shougo/echodoc.vim'
	""Plug 'Shougo/neosnippet'
	""Plug 'Shougo/neosnippet-snippets'
	"Plug 'takac/vim-hardtime'
	"Plug 'terryma/vim-multiple-cursors'
	"Plug 'timonv/vim-cargo'
	"Plug 'tommcdo/vim-lion'
	"Plug 'tpope/vim-endwise'
	"Plug 'tpope/vim-fugitive'
	"Plug 'tpope/vim-markdown', { 'for': 'markdown' }
	"Plug 'tpope/vim-repeat'
	"Plug 'tpope/vim-unimpaired'
	"" Load the devicons plugin last
call plug#end()

