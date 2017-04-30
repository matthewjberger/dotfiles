set termguicolors
set background=dark
set t_Co=256

" Set the colorscheme to molokai
let g:molokai_original = 1
colorscheme molokai

" Flash the yank motion
map y <Plug>(operator-flashy)

" Make comments italic
"autocmd VimEnter * highlight Comment cterm=italic
"highlight Comment cterm=italic gui=italic

" Indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Use Rainbow Parentheses
autocmd BufRead * RainbowParentheses
