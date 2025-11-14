#!/bin/bash

WAIT_UNTIL="9:44"
secs=1
while [[ "$secs" -gt 0 ]]; do 
    secs="$(expr $(date -d "$WAIT_UNTIL" +%s) - $(date +%s))"
    [[ "$secs" -gt 0 ]] && echo -en "\r\e[KStill $secs seconds missing to $WAIT_UNTIL. Please wait..."
    sleep 0.9;
done
echo -e "\r\e[KTime $WAIT_UNTIL reached!"

return 0
