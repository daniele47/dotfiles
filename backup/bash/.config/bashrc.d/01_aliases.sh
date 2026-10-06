#!/bin/bash

if command -v bat &>/dev/null; then
    alias cat="bat"
fi

if command -v lsd &>/dev/null; then
    alias ls="lsd --icon=never --group-dirs=last"
    alias tree='lsd --icon=never --group-directories-first --tree'
else
    alias ls="ls --color=auto"
fi
alias la="ls -A"
alias ll="ls -l"
alias lla="ls -lA"

alias grep="grep --color=auto"

alias vim='$EDITOR'

if command -v distrobox &>/dev/null; then
    alias de='distrobox enter'
    alias dr='distrobox enter --'
    alias dl='distrobox list'
    complete -fd dr
fi
