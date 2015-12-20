export ZSH=/home/odin/.oh-my-zsh
export ZSH_THEME="agnoster"
DISABLE_AUTO_UPDATE="true"
plugins=(git gibo)
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
source $ZSH/oh-my-zsh.sh

DISABLE_AUTO_UPDATE=true

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# added by Anaconda3 2.4.0 installer
export PATH="$HOME/anaconda3/bin:$PATH"

# added by Anaconda2 2.4.0 installer
export PATH="$HOME/anaconda2/bin:$PATH"

# GoLang package manager
source gvp

# Gitignore Boilerplates
export PATH="$HOME/bin/gibo:$PATH"

# Enable autocompletion
autoload -U compinit
compinit

# Source gibo
source ~/bin/gibo/gibo-completion.zsh

alias zshconfig="emacs ~/.zshrc"
alias ohmyzsh="emacs ~/.oh-my-zsh"
