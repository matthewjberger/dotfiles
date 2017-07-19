" Deoplete-Rust

" Path to racer binary
let g:deoplete#sources#rust#racer_binary = '/home/vagrant/.cargo/bin/racer'

" Set rust source code path
let g:deoplete#sources#rust#rust_source_path = '/home/vagrant/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

" Set max height of documentation split
let g:deoplete#sources#rust#documentation_max_height = 20
