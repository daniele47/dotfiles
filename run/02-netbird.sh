#!/bin/bash

set -e

# install netbird if missing
! command -v netbird &>/dev/null && curl -fsSL https://pkgs.netbird.io/install.sh | sh
