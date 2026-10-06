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
    rpm-ostree install -y bat lsd distrobox
}

sudo bash -c "$(declare -f root_init); root_init"
