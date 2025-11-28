#!/bin/bash

set -e

# install system tools
sudo rpm-ostree install neovim tmux bat -y || true
