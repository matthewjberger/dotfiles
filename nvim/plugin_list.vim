" Plugin List

" Use plugins
call plug#begin('~/.config/nvim/plugged')
	Plug 'AndrewRadev/splitjoin.vim'
	Plug 'AndrewRadev/sideways.vim'
	Plug 'airblade/vim-gitgutter'
	Plug 'airblade/vim-rooter'
	Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
	Plug 'christoomey/vim-sort-motion'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'dahu/vim-fanfingtastic'
	Plug 'equalsraf/neovim-gui-shim'
	Plug 'frankier/neovim-colors-solarized-truecolor-only'
	Plug 'inside/vim-search-pulse'
	" Plug 'jalcine/cmake.vim'
	Plug 'janko-m/vim-test'
	Plug 'jceb/vim-orgmode'
	Plug 'jiangmiao/auto-pairs'
	Plug 'junegunn/limelight.vim'
	Plug 'junegunn/goyo.vim'
	Plug 'junegunn/rainbow_parentheses.vim'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
		Plug 'junegunn/fzf.vim'
	Plug 'junegunn/seoul256.vim'
	Plug 'junegunn/vim-emoji'
	Plug 'junegunn/vim-easy-align'
	Plug 'junegunn/vim-peekaboo'
	Plug 'junegunn/vim-slash'
	Plug 'kana/vim-operator-user'
	Plug 'kassio/neoterm'
	Plug 'haya14busa/vim-operator-flashy'
	Plug 'lokaltog/vim-easymotion'
	Plug 'majutsushi/tagbar'
	Plug 'mbbill/undotree'
	Plug 'michaeljsmith/vim-indent-object'
	Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
	Plug 'nathanaelkane/vim-indent-guides'
	Plug 'neomake/neomake'
	Plug 'roxma/nvim-completion-manager'
	Plug 'roxma/python-support.nvim'
	Plug 'rust-lang/rust.vim'
	Plug 'scrooloose/nerdcommenter'
	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
		Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'sheerun/vim-polyglot'
	"Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
	"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
		"Plug 'sebastianmarkow/deoplete-rust'
		"Plug 'tweekmonster/deoplete-clang2'
		"Plug 'zchee/deoplete-zsh'
		"Plug 'Shougo/neco-vim', { 'for': 'vim' }
		"Plug 'Shougo/neco-syntax', { 'for': 'vim' }
	Plug 'Shougo/echodoc.vim'
	"Plug 'Shougo/neosnippet'
	"Plug 'Shougo/neosnippet-snippets'
	Plug 'takac/vim-hardtime'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'timonv/vim-cargo'
	Plug 'tomasr/molokai'
	Plug 'tommcdo/vim-lion'
	Plug 'tpope/vim-endwise'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-markdown', { 'for': 'markdown' }
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-unimpaired'
	Plug 'yonchu/accelerated-smooth-scroll'
	Plug 'vim-airline/vim-airline'
		Plug 'vim-airline/vim-airline-themes'
	" Load the devicons plugin last
	Plug 'ryanoasis/vim-devicons'
		Plug 'ryanoasis/powerline-extra-symbols'
call plug#end()

