#!/bin/bash

set -e

# remove everything from flatpak
flatpak uninstall --all --delete-data -y

# replace fedora flatpak remote with flathub
sudo flatpak remote-delete fedora || true
sudo flatpak remote-delete fedora-testing || true
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# install necessary flatpaks
flatpak install -y org.kde.okular org.kde.haruna org.kde.gwenview com.protonvpn.www org.libreoffice.LibreOffice

