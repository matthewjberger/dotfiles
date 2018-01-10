" Language Server Client

let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'go': ['go-langserver'] }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> <leader>lh :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <leader>lgd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>lr :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <leader>lds :call LanguageClient_textDocument_documentSymbol()<CR>

