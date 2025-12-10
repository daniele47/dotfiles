#!/bin/bash

set -euo pipefail

# remove bloat
sudo rpm-ostree override remove kde-connect-libs kde-connect kdeconnectd firefox firefox-langpacks kdebugsettings kjournald firewall-config plasma-drkonqi khelpcenter plasma-welcome plasma-welcome-fedora krfb krdp krfb-libs kcharselect toolbox

# install system tools
sudo rpm-ostree install neovim bat tmux htop trash-cli distrobox -y
