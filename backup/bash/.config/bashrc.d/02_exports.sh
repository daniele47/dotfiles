#!/bin/bash

# xdg base specification
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_BIN_HOME="${XDG_BIN_HOME:-$HOME/.local/bin}"

mkdir -p "$XDG_CONFIG_HOME" "$XDG_DATA_HOME" "$XDG_STATE_HOME" "$XDG_CACHE_HOME" "$XDG_BIN_HOME"

# cleanup pollutions
# python
export PYTHONPYCACHEPREFIX=/tmp/pycache-QwkkUVj3ROhgnrG1
export PYTHONHISTFILE="${PYTHONHISTFILE:-$XDG_STATE_HOME/python/history}"
# rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
# go
export GOPATH="$XDG_DATA_HOME/go"
export GOCACHE="$XDG_CACHE_HOME/go-build"
# history files
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node_repl_history"
export SQLITE_HISTORY="$XDG_STATE_HOME/sqlite_history"
export HISTFILE="$XDG_STATE_HOME/bash_history"
export LESSHISTFILE="$XDG_STATE_HOME/less_history"
export WGETHISTFILE="$XDG_STATE_HOME/wget_history"

# set editor
if type -P nvim &>/dev/null; then
    export EDITOR=nvim
elif type -P vim &>/dev/null; then
    export EDITOR=vim
elif type -P vi &>/dev/null; then
    export EDITOR=vi
fi

# wrap systemctl output
export SYSTEMD_LESS=FRXMK
