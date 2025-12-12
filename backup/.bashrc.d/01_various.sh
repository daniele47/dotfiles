#!/bin/bash

if command -v nvim &>/dev/null; then
    export EDITOR="nvim"
elif command -v vi &>/dev/null; then
    export EDITOR="vi"
fi

export EXINIT="set noswapfile tabstop=4 shiftwidth=4 expandtab"
export PYTHONDONTWRITEBYTECODE="true"
export PYTHON_HISTORY="${XDG_STATE_HOME:-$HOME/.local/state}/python_history"
export NODE_REPL_HISTORY="${XDG_STATE_HOME:-$HOME/.local/state}/node_history"
export HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/bash_history"
export LESSHISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/lesshst_history"
export SQLITE_HISTORY="${XDG_STATE_HOME:-$HOME/.local/state}/sqlite_history"
export PSQL_HISTORY="${XDG_STATE_HOME:-$HOME/.local/state}/psql_history"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rustup"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"

alias la='ls -A'
alias ll='ls -l'
alias lla='ls -lA'
alias ls='ls -h --color=always --group-directories-first --sort=extension'
alias tree='tree -C --dirsfirst'

command -v bat &>/dev/null && alias cat='bat'

function run() {
    ( nohup "$@" &>/dev/null & : )
}
function open() {
    ( for arg in "$@"; do nohup xdg-open "$arg" &>/dev/null & done && : )
}
complete -c run

unset command_not_found_handle
if [[ $- == *i* ]]; then
    for i in - {0..9}; do bind -r "\e$i"; done
    bind -x '"\C-l": clear'
    bind -x '"\C-r":'
fi
