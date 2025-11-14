#!/bin/bash

# checks
[[ -z "$WAIT_UNTIL" ]] && echo 'WAIT_UNTIL was not specified!' && exit 1
! date -d "$WAIT_UNTIL" &>/dev/null && echo 'WAIT_UNTIL is invalid date!' && exit 1

# countdown timer
secs=1
while [[ "$secs" -gt 0 ]]; do 
    secs="$(expr $(date -d "$WAIT_UNTIL" +%s) - $(date +%s))"
    [[ "$secs" -gt 0 ]] && echo -en "\r\e[KStill $secs seconds missing to $WAIT_UNTIL. Please wait..."
    sleep 0.9;
done
echo -e "\r\e[KTime $WAIT_UNTIL reached!"

# assert correct exit value
exit 0
