# Start a rust repl
alias rrepl="rustup run nightly-2016-08-01 ~/.cargo/bin/rusti"

# Show aliases
alias aliases='cat ~/.dotfiles/zsh/aliases.zsh'

# Emacs
alias e='emacsclient -c'
alias et='emacsclient -t'

# Stop the emacs server
alias killemacs='emacsclient -e "(kill-emacs)"'

# Set xclip's default selection to be the clipboard
alias xclip='xclip -selection C'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# List all entries, with long listing format details, and append a classification indicator
alias ll='ls -alF'

# List almost all entries, excluding implied . and ..
alias la='ls -A'

# List entries by columns with a classification indicator
alias l='ls -CF'

# Use github's 'hub' tool instead of the git cli
eval "$(hub alias -s)"

# Generate a clang complete file
alias generate_clang_complete='CXX="cc_args.py g++" cmake .. && make'

