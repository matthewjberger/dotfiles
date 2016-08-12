# Setup oh-my-zsh

export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="agnoster"
HIST_STAMPS="dd/mm/yyyy"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins
plugins=(git zsh-completions)

# Source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Added by travis gem
[ -f /home/odin/.travis/travis.sh ] && source /home/odin/.travis/travis.sh

eval "$(fasd --init auto)"

source $ZSH/oh-my-zsh.sh
