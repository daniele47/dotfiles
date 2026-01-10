#!/bin/bash

set -euo pipefail

echo "*** (1/2) UPDATE AND UNVERSION RPM-FUSION ***"
sudo rpm-ostree update

echo "*** (2/2) REMOVE BLOAT AND ADD USEFUL COMMANDS ***"
sudo rpm-ostree override remove \
    kde-connect-libs kde-connect kdeconnectd kdebugsettings kjournald firewall-config plasma-drkonqi \
    khelpcenter plasma-welcome plasma-welcome-fedora krfb krdp krfb-libs kcharselect toolbox \
    firefox firefox-langpacks plasma-browser-integration fedora-chromium-config-kde \
    --install neovim --install bat --install trash-cli
