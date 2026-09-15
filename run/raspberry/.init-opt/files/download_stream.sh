#!/bin/bash

# script needs the following parameters:
# - the url of the video to download
# - the name of the rclone remote (only the name)
# - timeout in seconds before stopping the recording
#
# for youtube streams, just get the channelname + /live

set -e

DATE_STRING="$(date +"%Y%m%d_%H%M%S")"
BASE_UPLOAD_DIR="$HOME/.automatic_uploads"
LOCAL_UPLOAD_DIR="$BASE_UPLOAD_DIR/$DATE_STRING"
URL="$1"
REMOTE="$2:/automatic_uploads"
TIMEOUT="$3"

# no matter what run the cleanup function!
cleanup() {
    code="$?"
    if [[ -n "$1" ]]; then
        echo "ERROR: Early exit triggered by $1 signal..."
        exit 1
    elif [[ "$code" -ne 0 ]]; then
        echo "ERROR: Early exit with status code '$code'"
        exit 1
    else
        echo "Video downloaded and uploaded successfully!"
        rm -rf "$LOCAL_UPLOAD_DIR"
        rmdir "$BASE_UPLOAD_DIR" &>/dev/null || true
        exit 0
    fi
}
trap 'cleanup' EXIT
trap 'cleanup INT' INT
trap 'cleanup TERM' TERM
trap 'cleanup HUP' HUP

# input checks
echo "[ARGS]: url: '$1', remote: '$2', timeout: '$3'"
if [[ "$#" -ne 3 ]]; then
    echo 'invalid amount of args'
    exit 1
elif ! [[ "$TIMEOUT" -gt 0 ]]; then
    echo "invalid timeout: '$TIMEOUT'"
    exit 1
fi

# create download directory (auto fails if dir already exists)
mkdir -p "$BASE_UPLOAD_DIR"
mkdir -p "$LOCAL_UPLOAD_DIR"

# downlaod video
echo "Downloading video..."
cd "$LOCAL_UPLOAD_DIR"
yt-dlp --download-sections "*0-$TIMEOUT" -q "$URL"

# publish it on rclone remote
echo "Uploading video..."
rclone copy "$LOCAL_UPLOAD_DIR"/* "$REMOTE"
