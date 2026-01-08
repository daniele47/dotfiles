#!/bin/bash

set -euo pipefail

# add rpm-fusion repos
sudo rpm-ostree install "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
                        "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
sudo rpm-ostree apply-live --allow-replacement || true

# install ffmpeg for full multimedia codecs support
sudo rpm-ostree override remove \
             fdk-aac-free \
             libavcodec-free \
             libavdevice-free \
             libavfilter-free \
             libavformat-free \
             libavutil-free \
             libpostproc-free \
             libswresample-free \
             libswscale-free \
             ffmpeg-free \
        --install ffmpeg

# install hardware codecs for all platforms
sudo rpm-ostree override remove mesa-va-drivers --install mesa-va-drivers-freeworld
sudo rpm-ostree install intel-media-driver mesa-vdpau-drivers-freeworld libva-nvidia-driver

# remove bloat
sudo rpm-ostree override remove kde-connect-libs kde-connect kdeconnectd \
                                kdebugsettings kjournald firewall-config plasma-drkonqi khelpcenter \
                                plasma-welcome plasma-welcome-fedora krfb krdp krfb-libs kcharselect toolbox \
                                plasma-discover plasma-discover-rpm-ostree plasma-discover-notifier plasma-discover-kns plasma-discover-flatpak \
                                plasma-browser-integration fedora-chromium-config-kde flatpak fedora-flathub-remote

# install system tools
sudo rpm-ostree install neovim bat okular gwenview trash-cli distrobox haruna -y

# upgrade
sudo rpm-ostree upgrade
