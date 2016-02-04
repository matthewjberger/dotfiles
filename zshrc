export ZSH=/home/odin/.oh-my-zsh
export ZSH_THEME="agnoster"
DISABLE_AUTO_UPDATE="true"
plugins=(git)
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
source $ZSH/oh-my-zsh.sh

DISABLE_AUTO_UPDATE=true

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# Added by Anaconda3 2.4.0 installer
export PATH="$HOME/anaconda3/bin:$PATH"

# Added by Anaconda2 2.4.0 installer
export PATH="$HOME/anaconda2/bin:$PATH"

# GoLang package manager
source gvp

# Gitignore Boilerplates
export PATH="$HOME/bin/gibo:$PATH"

# Enable autocompletion
autoload -U compinit
compinit

# Source gibo
source $HOME/bin/gibo/gibo-completion.zsh

# Automatically start tmux
#tmux attach &> /dev/null

#if [[ ! $TERM =~ screen ]]; then
    #exec tmux
#fi

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias racket="racket -i -p neil/sicp -l xrepl"
