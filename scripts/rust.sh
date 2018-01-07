# Install Rust
curl https://sh.rustup.rs -sSf | sh

source $HOME/.cargo/env

# Install tools
cargo install racer
cargo install rustsym
cargo install rustfmt
cargo install ripgrep

# Install the Rust Language Server
rustup self update
rustup update
rustup component add rls-preview
rustup component add rust-analysis
rustup component add rust-src

# Install Clippy
rustup toolchain install nightly
cargo +nightly install clippy # Run with 'rustup run nightly cargo clippy'
