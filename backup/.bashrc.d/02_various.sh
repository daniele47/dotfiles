#!/bin/bash

if command -v nvim &>/dev/null; then
    export EDITOR="nvim"
elif command -v vi &>/dev/null; then
    export EDITOR="vi"
fi
export EXINIT="set noswapfile"
export PYTHONDONTWRITEBYTECODE="true"
export PYTHON_HISTORY="$HOME/.local/state/.python_history"
export NODE_REPL_HISTORY="$HOME/.local/state/.node_history"
export GOPATH="$HOME/.local/share/go"
export RUSTUP_HOME="$HOME/.local/share/rustup"
export CARGO_HOME="$HOME/.local/share/cargo"

alias la='ls -A'
alias ll='ls -l'
alias lla='ls -lA'

unset command_not_found_handle
if [[ $- == *i* ]]; then
    for i in - {0..9}; do bind -r "\e$i"; done
    bind -x '"\C-l": clear'
    bind -x '"\C-r":'
fi
