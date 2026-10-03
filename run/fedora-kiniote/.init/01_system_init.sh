#!/bin/bash

set -euo pipefail

function root_init() {
    # remove everything from flatpak and replace fedora flatpak with flathub
    if flatpak remotes | grep -q fedora; then
        flatpak uninstall --all --delete-data -y
        flatpak remote-delete fedora
        flatpak remote-delete fedora-testing
        flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    fi

    # packages i care about
    rpm-ostree override remove \
        kde-connect-libs kde-connect kdeconnectd kdebugsettings kjournald firewall-config plasma-drkonqi \
        khelpcenter plasma-welcome plasma-welcome-fedora krfb krdp krfb-libs kcharselect toolbox \
        firefox firefox-langpacks plasma-browser-integration fedora-chromium-config-kde kfind \
        --install neovim --install bat --install trash-cli --install htop --install lsd --install distrobox --install ksshaskpass
}

sudo bash -c "$(declare -f root_init); root_init"
