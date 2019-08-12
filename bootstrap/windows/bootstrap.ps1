# Prerequisites
# Powershell 5+

# Install scoop
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
set-executionpolicy RemoteSigned -scope CurrentUser

scoop install 7zip git innounp
scoop bucket add extras
scoop bucket add games
scoop bucket add nerd-fonts

scoop install `
  adom `
  alacritty `
  angband `
  bat `
  bitwarden `
  brave `
  brogue `
  busybox `
  cataclysm-dda `
  cataclysm-dda-tiles `
  ccat `
  ccleaner `
  cmake `
  cmder `
  curl `
  discord `
  dwarf-fortress-lnp `
  emacs `
  flux `
  fzf `
  gcc `
  gitkraken `
  grep `
  hack-font `
  hub `
  keypirinha `
  less `
  lf `
  nethack `
  nodejs `
  openssh `
  rapidee `
  ripgrep `
  rustup `
  s `
  sed `
  speccy `
  stone-soup `
  stone-soup-tiles `
  sudo `
  sumatrapdf `
  tome4 `
  umoria `
  vscode `

[environment]::setenvironmentvariable('GIT_SSH', (resolve-path (scoop which ssh)), 'USER')

# Setup spacemacs
git clone https://github.com/syl20bnr/spacemacs $env:APPDATA/.emacs.d -b develop

# Setup rust
rustup default stable
rustup update
rustup update nightly
rustup component add rls-preview rust-analysis rust-src clippy-preview rustfmt
rustup target install wasm32-unknown-unknown
cargo install cargo-web rustsym ripgrep cargo-audit cargo-asm cargo-count xargo

# Symlink files (Relative path for dotfiles repo)
function Create-Symlink([string]$source, [string]$dest)
{ 
  New-Item -ItemType SymbolicLink -Path $dest -Target $source -Force | Out-Null 
}
Create-Symlink ~/.gitconfig ..\..\gitconfig
Create-Symlink $env:APPDATA/.spacemacs ..\..\spacemacs
Create-Symlink $env:USERPROFILE/alacritty.yml ..\..\alacritty.yml