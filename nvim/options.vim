" Options

" Use zsh
set shell=/bin/zsh

" Set the working directory to wherever the open file lives
set autochdir

" Show line numbers
set number

" Lower the cmdline
set cmdheight=1

" Limit width to 80
set textwidth=80

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
set lazyredraw

" Disable swap files
set noswapfile

" Use file names as title of terminal while editing
set title

" Hide mouse when typing
set mousehide

" No alarms and no surprises
set noerrorbells visualbell t_vb=

" Yank and paste with the system clipboard
set clipboard=unnamed

" Apply substitutions globally by default
set gdefault

" Show file options above the command line
set wildmenu

" Ignore certain file types and directories from fuzzy finding
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.pdf,*.psd
set wildignore+=node_modules/*

" Search as search term is typed out incrementally
set incsearch

" Make searches case insensitive
set ignorecase

" Override ignorecase option if search contains uppercase characters
set smartcase

" Wrapping options
set formatoptions=tc " Wrap text and comments using textwidth
set formatoptions+=r " Continue comments when pressing ENTER in insert mode
set formatoptions+=q " Enable formatting of comments with qg
set formatoptions+=n " Detect lists for formatting
set formatoptions+=b " Auto-wrap in insert mode, and do not wrap old long lines
