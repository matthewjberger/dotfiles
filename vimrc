" Matthew Berger's vimrc
" Plugin List {{{
set nocompatible
filetype off

call plug#begin('~/.vim/bundle/')

"Plug 'ap/vim-css-color'
"Plug 'davidhalter/jedi-vim'
"Plug 'jplaut/vim-arduino-ino'
"Plug 'rstacruz/sparkup'
"Plug 'Shutnik/jshint2.vim'
"Plug 'sophacles/vim-processing'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'thoughtbot/vim-rspec'
"Plug 'tpope/vim-abolish'
"Plug 'tpope/vim-afterimage'
"Plug 'tpope/vim-characterize'
"Plug 'tpope/vim-endwise'
"Plug 'tpope/vim-eunuch'
"Plug 'tpope/vim-heroku'
"Plug 'tpope/vim-obsession'
"Plug 'tpope/vim-projectionist'
"Plug 'tpope/vim-rails'
"Plug 'tpope/vim-rake'
"Plug 'tpope/vim-scriptease'
"Plug 'tpope/vim-sensible'
"Plug 'tpope/vim-speeddating'
"Plug 'tpope/vim-unimpaired'
"Plug 'tpope/vim-vinegar'
"Plug 'vim-ruby/vim-ruby'
"Plug 'xolox/vim-notes'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dahu/vim-fanfingtastic'
Plug 'derekwyatt/vim-fswitch'
Plug 'derekwyatt/vim-protodef'
Plug 'fatih/vim-go'
Plug 'inside/vim-search-pulse'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'kien/rainbow_parentheses.vim'
Plug 'klen/python-mode'
Plug 'Lokaltog/vim-easymotion'
Plug 'losingkeys/vim-niji'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'nvie/vim-togglemouse'
Plug 'Raimondi/delimitMate'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'Shougo/vimproc.vim', {'do': 'make'} | Plug 'Shougo/neomru.vim' | Plug 'Shougo/unite.vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'sjl/gundo.vim'
Plug 'sjl/tslime.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe', {'do': './install.sh --clang-completer --gocode-completer'}
Plug 'vim-scripts/paredit.vim'
Plug 'vim-scripts/Conque-Shell'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'yonchu/accelerated-smooth-scroll'

call plug#end()

syntax on
filetype plugin indent on
"}}}
" Ultisnips and YCM {{{
set completeopt=menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_confirm_extra_conf = 0

let g:UltiSnipsExpandTrigger = '<CR>'
let g:UltiSnipsExpandTrigger       ="<c-tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Enable tabbing through list of results
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

" Expand snippet or return
let g:ulti_expand_res = 0
function! Ulti_ExpandOrEnter()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res
        return ''
    else
        return "\<return>"
endfunction

" Set <space> as primary trigger
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>

function! UltiSnipsCallUnite()
  Unite -start-insert -winheight=100 -immediately -no-empty ultisnips
  return ''
endfunction

inoremap <silent> <F3> <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
"}}}
" Variable setting {{{
au filetype vim set foldmethod=marker
autocmd filetype python set expandtab
filetype on
set autochdir
set autoindent
set backspace=indent,eol,start
set cmdheight=2
set confirm
set copyindent
set encoding=utf-8
set expandtab
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set nobackup
set noerrorbells
set nostartofline
set noswapfile
set notimeout ttimeout ttimeoutlen=200
set nowrap
set ruler
set shiftround
set shiftwidth=4
set showcmd
set showmatch
set si
set smartcase
set smarttab
set softtabstop=4
set t_vb=
set tabstop=4
set title
set undolevels=1000
set visualbell
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu
" }}}
" Ack motions {{{

" motions to ack for things.  works with pretty much everything, including:
"
"   w, w, e, e, b, b, t*, f*, i*, a*, and custom text objects
"
" awesome.
"
" note: if the text covered by a motion contains a newline it won't work.  ack
" searches line-by-line.

nnoremap <silent> <leader>a :set opfunc=<sid>ackmotion<cr>g@
xnoremap <silent> <leader>a :<c-u>call <sid>ackmotion(visualmode())<cr>

nnoremap <bs> :ack! '\b<c-r><c-w>\b'<cr>
xnoremap <silent> <bs> :<c-u>call <sid>ackmotion(visualmode())<cr>

function! s:copymotionfortype(type)
    if a:type ==# 'v'
        silent execute "normal! `<" . a:type . "`>y"
    elseif a:type ==# 'char'
        silent execute "normal! `[v`]y"
    endif
endfunction

function! s:ackmotion(type) abort
    let reg_save = @@

    call s:copymotionfortype(a:type)

    execute "normal! :ack! --literal " . shellescape(@@) . "\<cr>"

    let @@ = reg_save
endfunction

" }}}
" Ack {{{
nnoremap <leader>a :Ack!<space>
let g:ackprg = 'ag --smart-case --nogroup --nocolor --column'

" Ack for the last search
nnoremap <silent> <leader>? :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>
" }}}
" Fold navigation {{{
nnoremap <silent> <leader>zj :call NextClosedFold('j')<cr>
nnoremap <silent> <leader>zk :call NextClosedFold('k')<cr>
function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction
"}}}
" Run shell commands {{{
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
    let expanded_cmdline = a:cmdline
    for part in split(a:cmdline, ' ')
        if part[0] =~ '\v[%#<]'
            let expanded_part = fnameescape(expand(part))
            let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
        endif
    endfor
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    "call setline(1, 'You entered:    ' . a:cmdline)
    "call setline(2, 'Expanded Form:  ' .expanded_cmdline)
    "call setline(3,substitute(getline(1),'.','=','g'))
    execute '$read !'. expanded_cmdline
    execute 'normal! ggdd'
    setlocal nomodifiable
    1
endfunction
" }}}
" Unite.vim mappings {{{

"   Enable Yank history
let g:unite_source_history_yank_enable=1
let g:unite_enable_start_insert=1
nnoremap <leader>y :Unite history/yank<CR>

"   File finding mappings
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec/async','sorters','sorter_rank', )
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_prompt='» '
let g:unite_split_rule = 'botright'
if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
    let g:unite_source_grep_recursive_opt=''
endif
nnoremap <leader>L :<C-u>Unite -no-split -buffer-name=files file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru file_mru<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer buffer<cr>

nnoremap <leader>Ft :Unite file_rec/async -default-action=tabopen<CR>
nnoremap <leader>Fs :Unite file_rec/async -default-action=split<CR>
nnoremap <leader>Fv :Unite file_rec/async -default-action=vsplit<CR>

"   Buffer switching
nnoremap <leader>ss :Unite -quick-match -auto-preview buffer<cr>

" }}}
" Airline {{{
let g:airline_powerline_fonts=1

" Show airline tabs
"let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"

" }}}
" Go settings {{{
let g:go_play_open_browser = 0
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 0
let g:go_bin_path = expand("~/.gotools")
let g:go_bin_path = "/home/fatih/.mypath"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1"

let g:go_bin_path = "/home/odin/.godeps/bin"

"}}}
" Misc {{{
" Make all sorts case insensitive
let g:sort_motion_flags = "ui"

let NERDTreeIgnore=['\.o$', '\~$']

" Prevent easytags lag
" vim 7.4 has a 'faster' regex engine which makes easytags lag, a lot.
set regexpengine=0

inoremap jk <ESC>;
nnoremap<F8> :TagbarToggle<CR>
set number
let mapleader = ","
nnoremap <leader>ev :split $MYVIMRC <CR>;
nnoremap <leader>Ev :split $MYVIMRC <CR> :only<cr>;
nnoremap <leader>eo :e ~/Dropbox/Programming/GitHub<CR>4j
nnoremap <leader>sv :source $MYVIMRC <CR>;
nnoremap <leader>b  :bw<CR>

" Run
noremap <F7> :wa<CR> :!echo "--------------- Running ---------------"; echo; "./vimTest"<CR>;

" Rebuild and Run
noremap <F5> :wa<CR> :silent !clear; make OBJ_NAME="vimTest"<CR> :!echo "--------------- Running ---------------"; echo; "./vimTest"<CR>;

" Rebuild
noremap <F4> :wa<CR> :make <bar> copen<CR>;

" Save when losing focus
au FocusLost * :wa<CR>

" Resize splits when the window is resized
au VimResized * :wincmd =

" Use sane regexes
nnoremap / /\v
vnoremap / /\v

noremap H ^
noremap L $

" Move to last non-blank character of line
vnoremap L g_

" Jump to last change
nnoremap gI `.

" Highlight last inserted text
nnoremap gV `[v`]

inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

nnoremap <leader><ESC> :qa!<CR>;
nnoremap <leader>w  :wa<CR>;

nnoremap <F6> :set invpaste paste? <CR>
set pastetoggle=<F6>
set showmode
map Y y$
noremap  <silent> <leader>/ :noh<cr>:call clearmatches()<cr>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader><SPACE> :w<CR>

nnoremap <space> za
vnoremap <space> za

" Save and quit files more easily
nnoremap <leader>q ZQ " Quit file without saving
nnoremap <leader>Z ZZ " Save and quit file

" Jumping to tags.
"
" Basically, <c-]> jumps to tags (like normal) and <c-\> opens the tag in a new
" split instead.
"
" Both of them will align the destination line to the upper middle part of the
" screen.  Both will pulse the cursor line so you can see where the hell you
" are.  <c-\> will also fold everything in the buffer and then unfold just
" enough for you to see the destination line.
function! JumpToTag()
    execute "normal! \<c-]>mzzvzz15\<c-e>"
    execute "keepjumps normal! `z"
    Pulse
endfunction
function! JumpToTagInSplit()
    execute "normal! \<c-w>v\<c-]>mzzMzvzz15\<c-e>"
    execute "keepjumps normal! `z"
    Pulse
endfunction

nnoremap <c-]> :silent! call JumpToTag()<cr>:call search_pulse#Pulse()<CR>
nnoremap <c-\> :silent! call JumpToTagInSplit()<cr> search_pulse#Pulse()<CR>

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO

" Don't move on *
nnoremap * *<C-O>

" Keep search matches in the middle of the window and pulse the window
nnoremap n nzzzv:call search_pulse#Pulse()<CR>
nnoremap N Nzzzv:call search_pulse#Pulse()<CR>

nnoremap g; g;zz:call search_pulse#Pulse()<CR>
nnoremap g, g,zz:call search_pulse#Pulse()<CR>
nnoremap <c-o> <c-o>zz:call search_pulse#Pulse()<CR>

" Return to the same line when reopening files
augroup line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \     execute 'normal! g`"zvzz' |
                \ endif
augroup END

set exrc
set secure
set colorcolumn=120
highlight ColorColumn ctermbg=darkgray
syntax on
set splitbelow
set splitright

" easier movement between windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

noremap <leader>v <C-w>v

" FSwitch mappings

" Switch to the file and load it into the current window
nnoremap <silent> <Leader>of :FSHere<cr>

" Switch to the file and load it into the window on the right
nnoremap <silent> <Leader>ol :FSRight<cr>

" Switch to the file and load it into a new window split on the right
nnoremap <silent> <Leader>oL :FSSplitRight<cr>

" Switch to the file and load it into the window on the left
nnoremap <silent> <Leader>oh :FSLeft<cr>

" Switch to the file and load it into a new window split on the left
nnoremap <silent> <Leader>oH :FSSplitLeft<cr>

" Switch to the file and load it into the window above
nnoremap <silent> <Leader>ok :FSAbove<cr>

" Switch to the file and load it into a new window split above
nnoremap <silent> <Leader>oK :FSSplitAbove<cr>

" Switch to the file and load it into the window below
nnoremap <silent> <Leader>oj :FSBelow<cr>

" Switch to the file and load it into a new window split below
nnoremap <silent> <Leader>oJ :FSSplitBelow<cr>

"" jshint validation
"nnoremap <silent><F1> :JSHint<CR>
"inoremap <silent><F1> <C-O>:JSHint<CR>
"vnoremap <silent><F1> :JSHint<CR>

"" show next jshint error
"nnoremap <silent><F2> :lnext<CR>
"inoremap <silent><F2> <C-O>:lnext<CR>
"vnoremap <silent><F2> :lnext<CR>

"" show previous jshint error
"nnoremap <silent><F3> :lprevious<CR>
"inoremap <silent><F3> <C-O>:lprevious<CR>
"vnoremap <silent><F3> :lprevious<CR>

set t_Co=256
colorscheme seoul256
set background=dark

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-g>u\<Tab>"

" Sets arduino filetypes
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

autocmd InsertEnter * silent! :set norelativenumber
autocmd InsertLeave,BufNewFile,VimEnter * silent! :set relativenumber

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

"nnoremap <silent> <leader>rtw :call TrimWhiteSpace()<CR>

autocmd FileWritePre   * :call TrimWhiteSpace()
autocmd FileAppendPre  * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre    * :call TrimWhiteSpace()

" Toggle solarized light/dark
call togglebg#map("<F10>")

" zM to open all folds
" zR to close all folds
autocmd Syntax c,cpp,h setlocal foldmethod=indent
autocmd Syntax c,cpp,h normal zR

" Lisp support
autocmd filetype lisp,scheme,art setlocal equalprg=scmindent.rkt

"You Complete Me syntax config
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" Enable search pulse
set cursorline

au VimEnter * RainbowParenthesesToggle
au Syntax   * RainbowParenthesesLoadRound
au Syntax   * RainbowParenthesesLoadSquare
au Syntax   * RainbowParenthesesLoadBraces

" Open a quickfix window for the last search
nnoremap <silent> <leader>ls :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Align text
nnoremap <leader>Al :left<cr>
nnoremap <leader>Ac :center<cr>
nnoremap <leader>Ar :right<cr>
vnoremap <leader>Al :left<cr>
vnoremap <leader>Ac :center<cr>
vnoremap <leader>Ar :right<cr>

" Easier linewise reselection
nnoremap <leader>V V']

" Select line and ignore indentation
nnoremap vv ^vg_

" Calculator
inoremap <C-B> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

" Sudo to write
" cmap w!! w !sudo tee % >/dev/null

" Source
vnoremap <leader>S y:execute @@<CR>
nnoremap <leader>S ^vg_y:execute @@<CR>

" Substitute
noremap <leader>s :%s//<left>

"Gundo
nnoremap <leader>u :GundoToggle<CR>

" Lower cmdline
set cmdheight=1

" Buffer switching
nnoremap <leader>gn :bn<CR>
nnoremap <leader>gp :bp<CR>
nnoremap <leader>gd :bd<CR>

" Remap yank register to "
nnoremap "" "0

" Enable backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

"}}}
" TSlime {{{
let g:tslime_ensure_trailing_newlines = 1
let g:tslime_normal_mapping = '<leader>t'
let g:tslime_visual_mapping = '<leader>t'
let g:tslime_vars_mapping   = '<leader>T'
" }}}
" Tmux {{{
"" Start a process in a new, focused split pane.
"function! s:StartSplit()
  "let directory = expand('%:p:h')
  "let command = exists('b:start') ? b:start : &shell
  "exec printf('Tmux splitw -c %s %s', directory, command)
"endfunction
"command! -nargs=0 StartSplit call s:StartSplit()

"" Dispatch
"nnoremap <leader>r :StartSplit<CR>"

"autocmd VimEnter,VimLeave * silent !tmux set status
" }}}
