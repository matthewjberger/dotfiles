" Git

highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow
highlight clear SignColumn

let g:gitgutter_map_keys = 1

nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk

nmap <leader>gha <Plug>GitGutterStageHunk
nmap <leader>ghu <Plug>GitGutterUndoHunk
nmap <leader>ghp <Plug>GitGutterPreviewHunk

nmap <leader>gn <Plug>GitGutterNextHunk
nmap <leader>gp <Plug>GitGutterPrevHunk

nmap <leader>gP <Plug>Gpush

" git
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <leader>gl :Commits<cr>

