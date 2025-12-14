#!/bin/bash

# to create the distrobox container (some flags might need changing):
#   - distrobox create --unshare-all -H ~/.local/share/distrobox/fedora --no-entry --init --additional-packages systemd

# basic packages
sudo dnf --assumeyes install bat neovim tmux yt-dlp htop unison

# netbird
curl -fsSL https://pkgs.netbird.io/install.sh | sh

# to login into netbird network:
#   - sudo netbird up
