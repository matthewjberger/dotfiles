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
	Plug 'haya14busa/vim-operator-flashy'
	Plug 'lokaltog/vim-easymotion'
	Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
	Plug 'nathanaelkane/vim-indent-guides'
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
	Plug 'takac/vim-hardtime'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'tomasr/molokai'
	Plug 'tommcdo/vim-lion'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-markdown', { 'for': 'markdown' }
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround'
	Plug 'yonchu/accelerated-smooth-scroll'
	Plug 'zchee/deoplete-zsh'
	Plug 'ryanoasis/vim-devicons'
	Plug 'ryanoasis/powerline-extra-symbols'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Plugins
source plugins/airline.vim
source plugins/deoplete.vim
source plugins/emoji.vim
source plugins/fzf.vim
source plugins/git.vim
source plugins/goyo.vim
source plugins/hardtime.vim
source plugins/language-client.vim
source plugins/multiple-cursors.vim
source plugins/neomake.vim
source plugins/nerdtree.vim
source plugins/slash.vim
source plugins/sort_motion.vim

" Custom options
source options.vim
source settings.vim
source keybindings.vim
source style.vim
