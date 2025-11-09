#!/bin/bash

# cli tools used in bash init config
sudo dnf install -y zoxide bat lsd tmux neovim

# patch gui issues
sudo dnf install -y ksshaskpass kde-runtime plasma-workspace

# nice to have
sudo dnf install -y htop

# enable rpm-fusion and install multimedia codecs
sudo dnf -y install "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
sudo dnf -y install "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
sudo dnf -y install ffmpeg --allowerasing
sudo dnf -y install libheif-freeworld mesa-va-drivers-freeworld libavcodec-freeworld intel-media-driver

