#!/bin/bash

# cli tools used in bash init config
sudo dnf -y install zoxide bat lsd tmux neovim

# download cloudflared
curl -fsSl https://pkg.cloudflare.com/cloudflared.repo | sudo tee /etc/yum.repos.d/cloudflared.repo
sudo dnf -y update
sudo dnf -y install cloudflared
