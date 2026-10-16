#!/bin/bash

# script needs the following parameters:
# - a simple name for the file (no extension. only the name)
# - the url of the video to download
# - the name of the rclone remote (only the name)
# - timeout in seconds before stopping the recording
#
# for youtube streams, just get the channelname + /live

set -e

DATE_STRING="$(date +"%Y%m%d_%H%M%S")"
BASE_UPLOAD_DIR="$HOME/.automatic_uploads"
LOCAL_UPLOAD_DIR="$BASE_UPLOAD_DIR/$DATE_STRING"
FILENAME="$1"
URL="$2"
REMOTE="$3:/automatic_uploads"
TIMEOUT="$4"

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
echo "[ARGS]: filename: '$1', url: '$2', remote: '$3', timeout: '$4'"
if [[ "$#" -ne 4 ]]; then
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
dl() {
    timeout --signal=INT "$TIMEOUT" yt-dlp -q \
        -o "$LOCAL_UPLOAD_DIR/${FILENAME}_${DATE_STRING}" \
        "$@"
}
dl --live-from-start "$URL" && rc=0 || rc=$?
if [ "$rc" -ne 0 ] && [ "$rc" -ne 124 ]; then
    dl "$URL" || true
fi

# publish it on rclone remote
echo "Uploading video..."
rm -f "$LOCAL_UPLOAD_DIR"/*.part
rclone copy "$LOCAL_UPLOAD_DIR"/* "$REMOTE"
