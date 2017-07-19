" Settings

" Set cwd to buffer dir
autocmd BufEnter * silent! lcd %:p:h

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

" Disabled for now because it conflicts with Goyo.vim
" Toggle relativenumber in insert mode and regular line numbers in normal mode
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

" Resize splits when the window is resized
au VimResized * :wincmd =
