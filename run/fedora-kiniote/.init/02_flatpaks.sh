#!/bin/bash

set -euo pipefail

flatpak install -y \
    org.kde.okular \
    org.kde.haruna \
    org.kde.gwenview \
    org.keepassxc.KeePassXC \
    org.mozilla.firefox
