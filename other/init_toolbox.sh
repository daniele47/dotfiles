#!/bin/bash

# cli tools used in bash init config
sudo dnf -y install zoxide bat lsd tmux neovim

# patch gui issues
sudo dnf -y install ksshaskpass kde-runtime plasma-workspace

# nice to have
sudo dnf -y install htop trash entr jq

# development tools
sudo dnf -y install @c-development dig

# download cloudflared
curl -fsSl https://pkg.cloudflare.com/cloudflared.repo | sudo tee /etc/yum.repos.d/cloudflared.repo
sudo dnf -y update
sudo dnf -y install cloudflared
