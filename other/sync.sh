#!/bin/bash

# variables
SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
REMOTE_NAME="$1"
SYNC_DIR="$2"

# checks
[[ "$#" -gt 2 ]] && echo 'this scripts allows only 2 parameters' && exit 1 || true

# get missing parameters from user
until [[ -n "$REMOTE_NAME" ]]; do read -rp "What is the rclone remote name? " REMOTE_NAME; done
until [[ -n "$SYNC_DIR" ]]; do read -rp "What is sync direction? " SYNC_DIR; done

# sync with rclone remote
case "$SYNC_DIR" in
    get|pull) echo "local <--- remote" && rclone sync "$REMOTE_NAME:/sync" "$SCRIPT_DIR" -i ;;
    put|push) echo "local ---> remote" && rclone sync "$SCRIPT_DIR" "$REMOTE_NAME:/sync" -i ;;
    tree|show) rclone tree "$REMOTE_NAME:/sync" ;;
    *) echo 'invalid sync direction'; exit 1;;
esac
