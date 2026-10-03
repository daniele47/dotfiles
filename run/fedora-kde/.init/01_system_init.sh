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

    # dnf packages cleanup
    dnf -y remove firefox akregator dragon kontact khelpcenter
    dnf -y remove kde-connect kmail korganizer elisa-player akonadi*
    dnf -y remove neochat krfb mediawriter krdc kleopatra
    dnf -y remove kamoso plasma-welcome kdebugsettings kfind kmahjongg
    dnf -y remove kmines skanpage kpat kcharselect plasma-drkonqi
    dnf -y remove im-chooser kjournald kmouth kolourpaint setroubleshoot
    dnf -y remove gnome-abrt firewall-config toolbox gwenview okular
    dnf -y autoremove

    # cli utilities
    dnf -y install git bat neovim lsd distrobox htop trash-cli
    dnf -y install uv rust rust-src rustfmt cargo cargo-clippy

    # update
    dnf -y update

}

sudo bash -c "$(declare -f root_init); root_init"
