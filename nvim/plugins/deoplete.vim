" Deoplete

" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

" Disable the candidates in Comment/String syntaxes
call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])

" No delay before completion
let g:deoplete#auto_complete_delay = 0

" Tab Completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" No new line after hitting enter
inoremap <silent><expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>"

" Use partial fuzzy matches like YouCompleteMe
au VimEnter * call deoplete#custom#source('_', 'matchers', ['matcher_fuzzy'])
au VimEnter * call deoplete#custom#source('_', 'converters', ['converter_remove_paren'])
au VimEnter * call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])

