#!/bin/bash

# checks
WAIT_UNTIL="$*"
[[ "$#" -eq 0 ]] && echo 'no time specified!' && exit 1
! date -d "$WAIT_UNTIL" &>/dev/null && echo "WAIT_UNTIL ($WAIT_UNTIL) is not valid!" && exit 1
WAIT_UNTIL_SECS="$(date -d "$WAIT_UNTIL" +%s)"

# nicely format seconds
function sec2dhms() {
    local seconds=$1
    local days=$((seconds / 86400))
    local hours=$(( (seconds % 86400) / 3600 ))
    local minutes=$(( (seconds % 3600) / 60 ))
    local secs=$((seconds % 60))
    if [ $days -gt 0 ]; then
        printf '%dd %dh %dm %ds\n' $days $hours $minutes $secs
    elif [ $hours -gt 0 ]; then
        printf '%dh %dm %ds\n' $hours $minutes $secs
    elif [ $minutes -gt 0 ]; then
        printf '%dm %ds\n' $minutes $secs
    else
        printf '%ds\n' $secs
    fi
}

# countdown timer
secs=1
while [[ "$secs" -gt 0 ]]; do 
    secs="$(expr "$WAIT_UNTIL_SECS" - $(date +%s))"
    [[ "$secs" -gt 0 ]] && echo -en "\r\e[KStill $(sec2dhms $secs) (${secs}s) missing to $WAIT_UNTIL. Please wait..."
    sleep 0.1;
done
echo -e "\r\e[KTime $WAIT_UNTIL has been reached!"

# assert correct exit value
exit 0
