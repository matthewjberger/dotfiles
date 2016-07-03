export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="agnoster"
plugins=(git zsh-completions)
source $ZSH/oh-my-zsh.sh

# Enable autocompletion
autoload -U compinit && compinit

alias emacs='emacsclient -c -a ""'
