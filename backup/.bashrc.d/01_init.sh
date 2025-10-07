#!/bin/bash

if command -v bat &>/dev/null; then
    alias cat='bat'
fi

if command -v lsd &>/dev/null; then
    function tree() {
        if command -v tree &>/dev/null; then
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
    eval "$(zoxide init bash --no-cmd)"
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
    alias z="__zoxide_z"
    alias zi="__zoxide_zi"
fi

if command -v kitten &>/dev/null; then
    function preview() {
        [[ "$FPREVIEW" == "true" ]] && local -r FULLSCREEN="--scale-up"
        [[ "$FPREVIEW" == "true" ]] || local -r FULLSCREEN=""
        local -r oldPwd="$PWD"
        local FILE="${1}"
        if [[ $# == 0 || -d "$FILE" ]]; then
            [[ -d "${FILE}" ]] && ! cd "${1}" &>/dev/null && return 1
            FILE="$(
                find . -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.gif' \
                    -o -iname '*.webp' -o -iname '*.bmp' -o -iname '*.tiff' \) 2>/dev/null |
                    cut -b 3- |
                    fzf --exit-0 --select-1 --height=40% --layout=reverse --border
            )"
        fi
        if [[ "$(xdg-mime query filetype "${FILE}" 2>/dev/null)" =~ "image/" ]]; then
            printf '\e[?1049h'
            kitten icat --align=center --place "$(tput cols)"x"$(tput lines)"@0x0 "${FULLSCREEN}" "${FILE}"
            printf '\e[?25l'
            read -rn 1
            clear
            printf '\e[?1049l\e[?25h'
        fi
        cd "${oldPwd}" &>/dev/null || return 1
    }
    function fpreview() {
        FPREVIEW="true" preview "${@}"
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
        if [[ "$#" -gt 0 ]]; then
            if ! tmux has-session -t "$session_name" 2>/dev/null; then
                tmux new-session -ds "$session_name" -n "$1" "$@"
            else
                tmux new-window -dt "$session_name" -n "$1" "$@"
            fi
        fi
    }
    function work(){
        tmux new-session -As work
    }
    complete -F _command run
fi
