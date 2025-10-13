#!/bin/env bash

set -e

# remove bloat
sudo dnf --assumeyes remove kpat kmines kmahjongg dragon elisa-player neochat
sudo dnf --assumeyes remove mediawriter akregator khelpcenter kdebugsettings plasma-welcome kde-connect
sudo dnf --assumeyes remove kaddressbook kmail kfind kjournald skanpage plasma-drkonqi
sudo dnf --assumeyes remove abrt akonadi-server kmouth krdc krfb krdp
sudo dnf --assumeyes remove kolourpaint im-chooser kamoso kcharselect firewall-config qrca
sudo dnf --assumeyes remove setroubleshoot* hplip* toolbox plasma-discover

# install needed programs
sudo dnf --assumeyes install mpv neovim htop tmux podman flatpak git zoxide bat lsd

# enable rpm-fusion and install multimedia codecs
sudo dnf --assumeyes install "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
sudo dnf --assumeyes install "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
sudo dnf --assumeyes install ffmpeg --allowerasing
sudo dnf --assumeyes install mpv-mpris libheif-freeworld mesa-va-drivers-freeworld libavcodec-freeworld intel-media-driver

# update and cleanup
sudo dnf --assumeyes upgrade
sudo dnf --assumeyes autoremove
