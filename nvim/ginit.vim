" Ginit.vim

if exists('g:fvim_loaded')
    set guifont=Cascadia\ Mono\ PL:h16

    " Ctrl-ScrollWheel for zooming in/out
    nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
    nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>

    nnoremap <A-CR> :FVimToggleFullScreen<CR>

    " FVimCursorSmoothMove v:true
    FVimCursorSmoothBlink v:true
endif
