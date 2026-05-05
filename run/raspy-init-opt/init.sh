#!/bin/bash

set -e

# copy specific binaries into /usr/local/bin
SCRIPT_PATH="$(realpath "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
sudo cp "$SCRIPT_DIR"/files/{countdown,download_stream}.sh /usr/local/bin/
sudo cp "$SCRIPT_DIR"/files/autorun.service /etc/systemd/system/
sudo sed -i -e "s/^.*User=.*/User=$USER/" -e "s/^.*Group=.*/Group=$USER/" /etc/systemd/system/autorun.service
sudo systemctl daemon-reload
sudo systemctl enable --now autorun.service
sudo mkdir -p /autorun /autorun-logs
sudo chown -R "$USER:$USER" /autorun /autorun-logs

# install deps required in previous scripts
sudo apt install ffmpeg python3-pip -y
sudo pip install -U yt-dlp --break-system-packages
curl https://rclone.org/install.sh | sudo bash || true
