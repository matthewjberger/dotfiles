" Set the leader key to the spacebar
let mapleader = "\<SPACE>"

" Save the file
nnoremap <leader>fs :w<CR>

" Save all open files
nnoremap <leader>fS :w<CR>

" Jump to far left or right of line
noremap H ^
noremap L $

" Move to last non-blank character of line
vnoremap L g_

" Pressing jk quickly will exit insert or visual mode
inoremap jk <ESC>
vnoremap jk <ESC>

" Select line and ignore indentation
nnoremap vv ^vg_

" Remap yank register to "
nnoremap "" "0"