#!/bin/bash

### BINDINGS

set -o emacs
bind '"\e[5~": history-search-backward'   # Page Up
bind '"\e[6~": history-search-forward'    # Page Down
bind -x '"\C-l": clear'                   # ctrl+l to clear entire buffer

### ALIASES, FUNCTIONS, ENVIRONMENT VARIABLES ###

alias grep='grep --color=auto'
alias la='ls -A'
alias ll='ls -l'
alias lla='ls -lA'
alias ls='ls -h --color=always --group-directories-first'
command -v 'tree' &>/dev/null && alias tree='tree -C --dirsfirst'
# alias to better not unix alternatives if available
command -v 'lsd' &>/dev/null && alias ls='lsd --group-dirs=first --icon=never'
command -v 'batcat' &>/dev/null && alias cat='batcat'
# alias vim to whatever vim version is available
command -v 'vi' &>/dev/null && alias vim='vi'
command -v 'nvim' &>/dev/null && alias vim='nvim'
# set EDITOR to whatever vim version is available
command -v 'vi' &>/dev/null && export EDITOR='vi'
command -v 'vim' &>/dev/null && export EDITOR='vim'
command -v 'nvim' &>/dev/null && export EDITOR='nvim'
export RCLONE_PROGRESS=1    # rclone always show progress

### VARIOUS FIXES ###

HISTFILE=~/.bash_history            # set bash history file
HISTSIZE=10000
HISTFILESIZE=10000
HISTCONTROL=ignoreboth:erasedups    # ignore duplicates and commands starting with space
shopt -s histappend                 # appent to history instead of overwriting
shopt -s cmdhist                    # save multiline commands as one line
stty -ixon                          # disable ctrl+s terminal suspension
PROMPT_DIRTRIM=3                    # truncate path prompt to last 3 dirs

### PROMPT ###

function __cleanup_prompt__() {
    local -r retval="$?"

    local -r red="\[\e[;31m\]"
    local -r lgreen="\[\e[32m\]"
    local -r yellow="\[\e[33m\]"
    local -r blue="\[\e[34m\]"
    local -r purple="\[\e[35m\]"
    local -r green="\[\e[36m\]"
    local -r wipe="\[\e[0m\]"
    ###############################################
    local -r workdir="[${yellow}\u@\h${wipe}:${green}\w${wipe}] "
    ###############################################
    local gitprompt=""
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        local -r branch="${blue}$(git rev-parse --abbrev-ref HEAD 2>/dev/null)${wipe}"
        local git_status_indicator=""
        if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
            git_status_indicator="${red}*${wipe}"
        fi
        gitprompt="(${branch}${git_status_indicator}) "
    fi
    ###############################################
    local symbol="$ "
    ###############################################
    PS1="${workdir}${gitprompt}${symbol}"

    # exit with correct status code
    return "${retval}"
}
PROMPT_COMMAND="__cleanup_prompt__;${PROMPT_COMMAND}"

# launch tmux in interactive shells
if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
    if tmux has-session 2>/dev/null; then
        exec tmux attach
    else
        exec tmux
    fi
fi
true

