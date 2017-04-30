" Settings

" Set cwd to buffer dir
autocmd BufEnter * silent! lcd %:p:h

autocmd BufWritePost * mkview
autocmd FileReadPost * silent! loadview

au BufEnter * if &buftype == 'terminal' | :startinsert | endif

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

" Save when losing focus
" au FocusLost * :wa<cr>

" Resize splits when the window is resized
au VimResized * :wincmd =

