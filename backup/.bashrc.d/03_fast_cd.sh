#!/bin/bash

function __fast_cd_utils__(){
    local -r DB_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/fast_cd"
    local -r DB_PATH="$DB_DIR/dirs.db"
    local -r mode="$1"
    local -r args=("${@:2}")

    # create database file
    if [[ ! -e "$DB_PATH" ]]; then
        mkdir -p "$DB_DIR" 
        touch "$DB_PATH"
    fi

    # all actions
    case "$mode" in
        get)
            cd "${args[@]}" &>/dev/null && return 0
            local line=""
            local bname=""
            while IFS= read -r line; do
                if [[ "$line" == /* && -d "$line" ]]; then
                    bname="${line%%+(/)}"
                    bname="${bname##*/}"
                    [[ "$line" == / ]] && bname="/"
                    if [[ "$bname" == *"${args[*]}"* ]]; then
                        cd "$line"
                        return 0
                    fi
                fi
            done < "$DB_PATH" 
            return 1
            ;;
        add) 
            for path in "${args[@]}"; do
                if [[ -d "$path" ]]; then
                    local abs_path="$PWD/$path"
                    [[ "$path" == /* ]] && abs_path="$path"
                    local resolved_path="$(realpath -s -m "$abs_path")"
                    local exists=false
                    while IFS= read -r line; do
                        local normalized_line="$(realpath -s -m "$line" 2>/dev/null)"
                        if [[ "$resolved_path" == "$normalized_line" ]]; then
                            exists=true
                            break
                        fi
                    done < "$DB_PATH"
                    if [[ "$exists" == false ]]; then
                        echo "$resolved_path" >> "$DB_PATH"
                        echo "added: $resolved_path"
                    else
                        echo "already exists: $resolved_path"
                    fi
                else
                    echo "not a directory: $path"
                fi
            done
            ;;
        check)
            # check for invalid lines
            local counter=0
            local line=""
            while IFS= read -r line; do
                ((counter++))
                if ! [[ "$line" == /* && -d "$line" ]]; then
                    echo "invalid line ${counter}: $line"
                fi
            done < "$DB_PATH" 
            # check for duplicated lines (idk what is going on. awk magic)
            awk '{
                cmd = "realpath -s -m \"" $0 "\" 2>/dev/null"
                if ((cmd | getline normalized) > 0) {
                    close(cmd)
                    if (seen[normalized]) {
                        print "duplicated line " NR ": " $0
                    }
                    seen[normalized]++
                }
            }' "$DB_PATH"
            ;;
        edit) "$EDITOR" "$DB_PATH" ;;
        *) ;;
    esac
    return 0
}

alias z='__fast_cd_utils__ get'
alias za='__fast_cd_utils__ add'
alias zc='__fast_cd_utils__ check'
alias ze='__fast_cd_utils__ edit'
