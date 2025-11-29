#!/bin/bash

set -e

# install netbird if missing
if ! command -v netbird &>/dev/null; then
    curl -fsSL https://pkgs.netbird.io/install.sh | sh
else
    echo 'netbird already installed!'
fi

