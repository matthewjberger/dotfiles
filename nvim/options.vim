" Horizontal splits open below
set splitbelow

" Vertical splits open to the right
set splitright

" Number of visual spaces per TAB
set tabstop=4

" Number of spaces in tab when editing
set softtabstop=4

" Number of columns text is indented with when reindenting using << or >>
set shiftwidth=4

" Highlight current line
set cursorline

" Highlight matching [{()}]
set showmatch

" Disable wrapping by default
set nowrap

" Open most folds by default
set foldlevelstart=10

" 10 nested fold max
set foldnestmax=10

" Fold based on indent level
set foldmethod=indent

" Check file change every 4 seconds ('CursorHold') and reload the buffer upon
" detecting change
set autoread
au CursorHold * checktime

" Required for operations modifying multiple buffers like rename.
set hidden

" Redraw only when we need to
"set lazyredraw

" Disable swap files
set noswapfile

" Use file names as title of terminal while editing
set title


