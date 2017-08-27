" Rust

" Cargo bindings
autocmd FileType Rust nnoremap <buffer> <leader>cb :CargoBuild
autocmd FileType Rust nnoremap <buffer> <leader>cc :CargoClean
autocmd FileType Rust nnoremap <buffer> <leader>cu :CargoUpdate
autocmd FileType Rust nnoremap <buffer> <leader>cd :CargoDoc
autocmd FileType Rust nnoremap <buffer> <leader>ct :CargoTest

" Todo: Add a command here to open rust documentation using 'cargo doc --open'

