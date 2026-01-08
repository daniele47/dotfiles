#!/bin/bash

set -euo pipefail

echo "*** ADD RPM-FUSION PACKAGES ***"
sudo rpm-ostree install \
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

echo "*** APPLY LIVE RPM-FUSION ***"
sudo rpm-ostree apply-live --allow-replacement || true

echo "*** UPDATE AND UNVERSION RPM-FUSION ***"
sudo rpm-ostree update \
    --uninstall rpmfusion-free-release --uninstall rpmfusion-nonfree-release \
    --install rpmfusion-free-release --install rpmfusion-nonfree-release

echo "*** FIX CODECS AND HARDWARE ACCELERATION ***"
sudo rpm-ostree override remove \
    fdk-aac-free libavcodec-free libavdevice-free libavfilter-free libavformat-free \
    libavutil-free libpostproc-free libswresample-free libswscale-free ffmpeg-free mesa-va-drivers \
    --install ffmpeg --install mesa-va-drivers-freeworld --install intel-media-driver \
    --install mesa-vdpau-drivers-freeworld --install libva-nvidia-driver

echo "*** REMOVE BLOAT AND ADD USEFUL COMMANDS ***"
sudo rpm-ostree override remove \
    kde-connect-libs kde-connect kdeconnectd kdebugsettings kjournald firewall-config plasma-drkonqi \
    khelpcenter plasma-welcome plasma-welcome-fedora krfb krdp krfb-libs kcharselect toolbox \
    plasma-discover plasma-discover-rpm-ostree plasma-discover-notifier plasma-discover-kns plasma-discover-flatpak \
    plasma-browser-integration fedora-chromium-config-kde flatpak fedora-flathub-remote \
    --install neovim --install bat --install distrobox --install okular --install gwenview --install haruna
