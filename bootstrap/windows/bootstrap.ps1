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
  busybox `
  cataclysm-dda `
  cmake `
  cmder `
  curl `
  discord `
  dwarffortress `
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
  sed `
  sudo `
[environment]::setenvironmentvariable('GIT_SSH', (resolve-path (scoop which ssh)), 'USER')
