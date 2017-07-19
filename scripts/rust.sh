# Install Rust
curl https://sh.rustup.rs -sSf | sh

source $HOME/.cargo/bin

# Install tools
cargo install racer
cargo install rustsym
cargo install rustfmt
cargo install ripgrep

# Install the Rust documentation
rustup component add rust-doc

# Install the Rust Language Server
rustup self update
rustup update nightly
rustup component add rls --toolchain nightly
rustup component add rust-analysis --toolchain nightly
rustup component add rust-src --toolchain nightly
