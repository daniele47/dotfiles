#!/bin/bash

set -e

# necessary refresh
sudo apt-get update -y
sudo apt-get upgrade -y

# various utils
sudo apt-get install -y htop lm-sensors neovim tree git tmux
sudo apt-get install -y bat zoxide jq

