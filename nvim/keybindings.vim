" Set leader
let mapleader = "\<space>"

" Easier movement between windows
noremap <leader>wh <C-w>h
noremap <leader>wj <C-w>j
noremap <leader>wk <C-w>k
noremap <leader>wl <C-w>l

" Don't move on *
nnoremap * *<C-O>:call search_pulse#Pulse()<cr>

" Keep search matches in the middle of the window and pulse the window
nnoremap n nzzzv:call search_pulse#Pulse()<cr>
nnoremap N Nzzzv:call search_pulse#Pulse()<cr>

nnoremap g; g;zz:call search_pulse#Pulse()<cr>
nnoremap g, g,zz:call search_pulse#Pulse()<cr>
nnoremap <c-o> <c-o>zz:call search_pulse#Pulse()<cr>

nnoremap <leader>fed :split $MYVIMRC<cr> :only<cr>
nnoremap <leader>feR :source $MYVIMRC<cr> :PlugInstall<cr>
nnoremap <leader>fs :w<cr>
nnoremap <leader>fS :wa<cr>
nnoremap <leader>sl y:execute @@<cr>
vnoremap <leader>sl ^vg_y:execute @@<cr>
nnoremap <leader>qq :qa!<cr>
nnoremap <leader>ft :NERDTreeToggle<cr>
nnoremap <leader>ff :NERDTreeFIND<cr>
nnoremap <leader>bd :bdelete<cr>
nnoremap <leader>bb :Denite buffer<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>wd :q<cr>
nnoremap <leader>w- :split<cr>
nnoremap <leader>w/ :vsp<cr>
nnoremap <leader>tr :set relativenumber!<cr>
nnoremap <leader>tn :set number!<cr>
nnoremap <leader>tw :set wrap!<cr>
nnoremap <leader>tl :Limelight!!<cr>
nnoremap <Leader>tg :Goyo<cr>
nnoremap <leader>pf :Denite file_rec<cr>
nnoremap <leader>hdw :help <C-r><C-w><cr>
nnoremap <silent> <leader>sc :nohlsearch<cr>:call clearmatches()<cr>
" Open a quickfix window for the last search
nnoremap <silent> <leader>en :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>
nnoremap <silent> <leader>ls :mksession!<cr>
nnoremap <silent> <leader>'  :split<cr> :terminal<cr> <esc><cr>
nnoremap <leader>th :HardTimeToggle<cr>:echo 'Toggled hardtime'<cr>

" Yank entire buffer to clipboard
nnoremap <leader>bY gg"*yGgg"+yG

nnoremap <leader>w= <C-W>=
nnoremap <leader>j= mzgg=G`z

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nma:p ga <Plug>(EasyAlign)

" Fold navigation {{{
nnoremap <silent> <leader>fj :call NextClosedFold('j')<cr>
nnoremap <silent> <leader>fk :call NextClosedFold('k')<cr>
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

" Align text
nnoremap <leader>Al :left<cr>
nnoremap <leader>Ac :center<cr>
nnoremap <leader>Ar :right<cr>
vnoremap <leader>Al :left<cr>
vnoremap <leader>Ac :center<cr>
vnoremap <leader>Ar :right<cr>

" Select line and ignore indentation
nnoremap vv ^vg_

" Remap yank register to "
nnoremap "" "0"

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO

nnoremap j gj
nnoremap k gk

inoremap jk <ESC>
vnoremap jk <ESC>

nnoremap $ <nop>
nnoremap ^ <nop>

" Jump to far left or right of line in insert mode
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A"`

" Jump to far left or right of line
noremap H ^
noremap L $

" Move to last non-blank character of line
vnoremap L g_

" Jump to last change
nnoremap gI `.

" Highlight last inserted text
nnoremap gV `[v`]

" Cycle through completion entries
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

