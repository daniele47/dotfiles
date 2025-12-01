#!/bin/bash

set -e

# remove everything from flatpak and replace fedora flatpak with flathub
if flatpak remotes | grep -q fedora; then
    flatpak uninstall --all --delete-data -y
    sudo flatpak remote-delete fedora
    sudo flatpak remote-delete fedora-testing
    sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
fi

# install necessary flatpaks
flatpak install -y org.kde.okular org.kde.haruna org.kde.gwenview org.mozilla.firefox
