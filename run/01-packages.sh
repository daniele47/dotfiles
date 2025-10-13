#!/bin/bash

set -e

# necessary refresh
sudo apt update -y
sudo apt upgrade -y

# various utils
sudo apt install -y htop lm-sensors neovim tree git tmux
sudo apt install -y lsd bat zoxide
