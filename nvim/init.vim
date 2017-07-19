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

" Plugin list
runtime plugin_list.vim

" Plugin Settings
runtime plugins/airline.vim
runtime plugins/deoplete.vim
"runtime plugins/deoplete-rust.vim
runtime plugins/emoji.vim
runtime plugins/fzf.vim
runtime plugins/git.vim
runtime plugins/goyo.vim
runtime plugins/hardtime.vim
runtime plugins/indent-guides.vim
runtime plugins/language-client.vim
runtime plugins/multiple-cursors.vim
runtime plugins/neomake.vim
runtime plugins/nerdtree.vim
runtime plugins/rainbow.vim
runtime plugins/slash.vim
runtime plugins/sort_motion.vim

" Language Settings
runtime lang/markdown.vim
runtime lang/rust.vim
runtime lang/vimscript.vim

" Custom Settings
runtime options.vim
runtime settings.vim
runtime keybindings.vim
runtime style.vim
