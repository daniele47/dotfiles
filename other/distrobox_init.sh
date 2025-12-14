#!/bin/bash

# to create the distrobox container (inspiration. modify command as needed)
# distrobox create --unshare-all -H ~/.local/share/distrobox/fedora --no-entry --init --additional-packages systemd

# basic packages
sudo dnf --assumeyes install bat neovim tmux yt-dlp htop plasma-integration unison konsole

# netbird
curl -fsSL https://pkgs.netbird.io/install.sh | sh

# codecs
# sudo dnf --assumeyes install "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
# sudo dnf --assumeyes install "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
# sudo dnf --assumeyes install ffmpeg --allowerasing
# sudo dnf --assumeyes install libheif-freeworld mesa-va-drivers-freeworld libavcodec-freeworld intel-media-driver
