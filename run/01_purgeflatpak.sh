#!/bin/bash

set -euo pipefail

if command -v flatpak &> /dev/null; then
    echo "*** PURGE ALL FLATPAKS ***"
    flatpak uninstall --all --delete-data -y
fi
