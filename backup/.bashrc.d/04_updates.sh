#!/bin/bash

function upgrade(){
    sudo sh -c '
        rpm-ostree update
        flatpak update -y
    ' && distrobox upgrade --all &&
    date +%s > "${XDG_STATE_HOME:-$HOME/.local/state}/last_upgrade_run"
}

days=3
last=$(cat "${XDG_STATE_HOME:-$HOME/.local/state}/last_upgrade_run" 2>/dev/null)
now=$(date +%s)

if ! [[ "$now" -gt "$last" ]] 2>/dev/null; then
    echo -e "\e[1;33mWarning: invalid last upgrade run date! run 'upgrade' to update...\e[m" 
elif (( now - last > $days*24*60*60 )); then 
    echo -e "\e[1;33mWarning: last manual update run more then $days days ago. run 'upgrade' to update...\e[m" 
fi

unset days last now
