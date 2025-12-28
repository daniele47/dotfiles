#!/bin/bash

set -euo pipefail

# remove bloat
sudo rpm-ostree override remove kde-connect-libs kde-connect kdeconnectd kdebugsettings kjournald firewall-config plasma-drkonqi khelpcenter plasma-welcome plasma-welcome-fedora krfb krdp krfb-libs kcharselect toolbox plasma-discover plasma-discover-rpm-ostree plasma-discover-notifier plasma-discover-kns plasma-discover-flatpak plasma-browser-integration fedora-chromium-config-kde flatpak fedora-flathub-remote

# install system tools
sudo rpm-ostree install neovim bat ksshaskpass okular gwenview -y
