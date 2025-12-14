#!/bin/bash

# to create the distrobox container (inspiration. modify command as needed)
# distrobox create --unshare-all -H ~/.local/share/distrobox/fedora --no-entry --init --additional-packages systemd

# basic packages
sudo dnf --assumeyes install bat neovim tmux yt-dlp htop unison

# netbird
curl -fsSL https://pkgs.netbird.io/install.sh | sh
