" Rust

" Automatically run rustfmt on save
let g:autofmt_autosave = 1

let g:rustfmt_command = "rustfmt +nightly"
let g:rustfmt_options = "--emit files"
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

let $RUST_SRC_PATH = systemlist("rustc --print sysroot")[0] . "/lib/rustlib/src/rust/src"

" Cargo bindings
autocmd FileType Rust nnoremap <buffer> <leader>cb :CargoBuild
autocmd FileType Rust nnoremap <buffer> <leader>cc :CargoClean
autocmd FileType Rust nnoremap <buffer> <leader>cu :CargoUpdate
autocmd FileType Rust nnoremap <buffer> <leader>cd :CargoDoc
autocmd FileType Rust nnoremap <buffer> <leader>ct :CargoTest

" Todo: Add a command here to open rust documentation using 'cargo doc --open'

