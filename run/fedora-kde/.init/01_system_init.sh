#!/bin/bash

set -euo pipefail

sudo bash -c '{
    # remove everything from flatpak and replace fedora flatpak with flathub
    if flatpak remotes | grep -q fedora; then
        flatpak uninstall --all --delete-data -y
        sudo flatpak remote-delete fedora
        sudo flatpak remote-delete fedora-testing
        sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    fi

    # dnf packages cleanup
    dnf -y remove firefox akregator dragon kontact khelpcenter
    dnf -y remove kde-connect kmail korganizer elisa-player akonadi*
    dnf -y remove neochat krfb mediawriter krdc kleopatra
    dnf -y remove kamoso plasma-welcome kdebugsettings kfind kmahjongg
    dnf -y remove kmines skanpage kpat
    dnf -y autoremove

    # cli utilities
    dnf -y install git bat neovim lsd
    
    # gui apps
    dnf -y install haruna
}'
