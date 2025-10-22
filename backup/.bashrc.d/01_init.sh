#!/bin/bash

if command -v bat &>/dev/null; then
    alias cat='bat'
fi

if command -v lsd &>/dev/null; then
    function tree() {
        if command -v /usr/bin/tree &>/dev/null; then
            timeout 0.2 lsd --group-dirs first --tree "$@" &>/dev/null
            if [[ $? -ne "124" ]]; then
                lsd --group-dirs first --tree "$@"
            else
                /usr/bin/tree "$@"
            fi 2>/dev/null
        else
            lsd --group-dirs first --tree "$@" &>/dev/null
        fi
    }
    alias ls='lsd --group-dirs first'
fi

if command -v zoxide &>/dev/null; then
    eval "$(zoxide init bash)"
    function zz() {
        if (cd "$@" &>/dev/null); then 
            cd "$@" &>/dev/null
        else
            case "$(zoxide query -l "$@" | wc -l)" in
                0|1) __zoxide_z "$@" &>/dev/null || return 1 ;;
                *) __zoxide_zi "$@" &>/dev/null || return 1 ;;
            esac
        fi
    }
fi

if command -v xdg-open &>/dev/null; then
    function open() {
        local file=""
        case "$#" in
            0) ;;
            1) xdg-open "$1" ;;
            *) for file in "$@"; do xdg-open "$file"; done ;;
        esac
    }
    complete -f open
fi

if command -v tmux &>/dev/null; then
    function run() {
        local -r session_name=bg
        local first_word=""
        read -r first_word _ <<< "$*"
        if [[ "$#" -gt 0 ]]; then
            if ! tmux -L "$session_name" has-session -t "$session_name" 2>/dev/null; then
                tmux -L "$session_name" new-session -ds "$session_name" -n "$first_word" "$@"
            else
                tmux -L "$session_name" new-window -dt "$session_name" -n "$first_word" "$@"
            fi
        fi
    }
    function arun() {
        local -r session_name=bg
        run "$@"
        tmux -L "$session_name" attach-session -t "$session_name"
    }
    complete -F _command run
    complete -F _command arun
fi
