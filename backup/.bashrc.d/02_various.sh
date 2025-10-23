#!/bin/bash

export EDITOR="nvim"
export PYTHONDONTWRITEBYTECODE="true"
export PYTHON_HISTORY="$HOME/.local/state/.python_history"
export NODE_REPL_HISTORY="$HOME/.local/state/.node_history"
export GOPATH="$HOME/.local/share/go"
export RUSTUP_HOME="$HOME/.local/share/rustup"
export CARGO_HOME="$HOME/.local/share/cargo"

alias la='ls -A'
alias ll='ls -l'
alias lla='ls -lA'

function updateshutdown() {
    sudo sh -i '
        fwupdmgr update -y
        dnf offline-upgrade download
        dnf offline-upgrade reboot --poweroff
        poweroff
    '
}

unset command_not_found_handle
if [[ $- == *i* ]]; then
    for i in - {0..9}; do bind -r "\e$i"; done
    bind -x '"\C-l": clear'
fi
