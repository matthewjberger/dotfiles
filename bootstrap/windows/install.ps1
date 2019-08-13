# Symlink files (Relative path for dotfiles repo)
function CreateSymlink([string]$source, [string]$dest)
{ 
  New-Item -ItemType SymbolicLink -Path $dest -Target $source -Force | Out-Null 
}
CreateSymlink ..\..\gitconfig ~\.gitconfig
CreateSymlink ..\..\spacemacs $env:APPDATA\.spacemacs
CreateSymlink ..\..\alacritty.yml $env:USERPROFILE\alacritty.yml
CreateSymlink vsvimrc.vim $env:USERPROFILE\vsvimrc.vim
CreateSymlink profile.ps1 $env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1