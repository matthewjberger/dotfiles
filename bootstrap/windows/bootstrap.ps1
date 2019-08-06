# Prerequisites
# Powershell 5+

# Install scoop
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
set-executionpolicy unrestricted -s cu

scoop install 7zip git innounp
scoop bucket add extras
scoop bucket add games

scoop install `
  bat `
  bitwarden `
  brave `
  busybox `
  cataclysm-dda `
  cataclysm-dda-tiles `
  ccleaner `
  cmake `
  cmder `
  curl `
  discord `
  dwarf-fortress-lnp `
  emacs `
  fzf `
  gcc `
  grep `
  hack-font `
  keypirinha `
  less `
  lf `
  nodejs `
  openssh `
  ripgrep `
  rustup `
  s `
  sed `
  speccy `
  stone-soup `
  stone-soup-tiles `
  sudo `
  sumatrapdf `
  wiztree `

[environment]::setenvironmentvariable('GIT_SSH', (resolve-path (scoop which ssh)), 'USER')

# Setup rust
rustup default stable
rustup update
rustup update nightly
rustup component add rls-preview rust-analysis rust-src clippy-preview rustfmt

rustup target install wasm32-unknown-unknown
cargo install cargo-web rustsym ripgrep cargo-audit cargo-asm cargo-count xargo