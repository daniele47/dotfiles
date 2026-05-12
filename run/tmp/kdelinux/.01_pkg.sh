#!/bin/bash

set -euo pipefail

# declare packages to install
BASE_PKGS=(base base-devel glibc glibc-locales)
CLI_TOOLS=(
    zsh bash-completion lsd bat trash-cli git
    tmux neovim tree man tldr wl-clipboard jq
    wget zip unzip podman htop openssh entr
)
GUI_TOOLS=(plasma-integration ksshaskpass)
PROG_LANG=(python rustup go nodejs npm)

# install packages
sudo pacman -Syu --needed --noconfirm "${BASE_PKGS[@]}" "${CLI_TOOLS[@]}" "${GUI_TOOLS[@]}" "${PROG_LANG[@]}"
