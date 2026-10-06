#!/bin/bash

# shut up when i type missing cmd
unset -f command_not_found_handle
if type -f distrobox &>/dev/null; then
    function command_not_found_handle() {
        distrobox enter -- "$@"
    }
fi

# history expand before running
shopt -s histverify

# cd can be skipped to change directory
shopt -s autocd

# case insensitive completion
bind 'set completion-ignore-case on'

# keybinds
bind '"\e[5~": history-search-backward'
bind '"\e[6~": history-search-forward'

# open command if xdg-open is available
if command -v xdg-open &>/dev/null; then
    function open() {
        (for arg in "$@"; do nohup xdg-open "$arg" &>/dev/null & done && :)
    }
fi
