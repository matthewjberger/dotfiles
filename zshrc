export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="agnoster"
plugins=(git zsh-completions)
source $ZSH/oh-my-zsh.sh

# Cargo bin
export PATH="$HOME/.cargo/bin:$PATH"

# Enable autocompletion
autoload -U compinit && compinit

alias emacs="emacs -nw"
