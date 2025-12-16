#!/bin/bash

function upgrade(){
    local -r last_update_dir="${XDG_STATE_HOME:-$HOME/.local/state}"
    local -r last_update_path="${last_update_dir}/last_update_time"
    local -r current_time="$(date +%s)"

    # create last upgrade file
    mkdir -p "$last_update_dir"
    touch "$last_update_path"
    
    # clean file, if the content is invalid
    local last_update=$(<"$last_update_path")
    if [[ ! -s "$last_update_path" ]]; then
        if [[ ! "$last_update" =~ ^[0-9]+$ ]] || (( last_update <= 0 )) || (( last_update > current_time )); then
            echo > "$last_update_path"
            last_update=""
        fi
    fi

    # actual execution
    [[ "$#" -ge 2 ]] && echo -e '\e[1;31monly a single parameter is allowed\e[m' && return 1
    case "$1" in 
        "")
            sudo sh -c 'rpm-ostree update && flatpak update -y' && 
                date +%s > "$last_update_path"
            ;;
        check) 
            if [[ -z "$last_update" ]]; then
                echo "last update time is unknown"
            else
                local -r diff="$(( current_time - last_update ))"
                local -r secs="$(( diff % 60 ))"
                local -r minutes="$(( (diff / 60) % 60 ))"
                local -r hours="$(( (diff / 3600) % 24 ))"
                local -r days="$(( diff / 86400 ))"
                [[ $days -gt 0 ]] && echo "${days}d "
                [[ $hours -gt 0 ]] && printf "${hours}h "
                [[ $minutes -gt 0 ]] && printf "${minutes}m "
                echo "${secs}s have passed since the latest time the upgrade\n"
            fi
            ;;
        warn)
            if [[ -z "$last_update" ]]; then
                echo -e "\e[1;33mLatest upgrade unknown. Run upgrade...\e[m"
            else
                local -r diff="$(( current_time - last_update ))"
                local -r days=3
                if (( diff > days*24*60*60 )); then
                    echo -e "\e[1;33mMore then $days have passed since latest upgrade. run upgrade...\e[m"
                fi
            fi
            ;;
        *) echo -e "\e[1;31minvalid parameter '$1'\e[m" && return 1 ;;
    esac
}

upgrade warn
