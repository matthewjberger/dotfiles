export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="agnoster"
plugins=(git zsh-completions)
source $ZSH/oh-my-zsh.sh

# Rust environment variables
export CARGO_HOME="$HOME/.cargo"
export CARGO_BIN="$CARGO_HOME/bin"
export PATH="$CARGO_BIN:$PATH"
export RUST_SRC_PATH="$HOME/rust/src"

# Enable autocompletion
autoload -U compinit && compinit

alias emacs='emacsclient -t -a ""'
