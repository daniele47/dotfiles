#!/bin/bash

set -euo pipefail

# enable automatic rpm-ostree updates
echo -n '[Daemon]
AutomaticUpdatePolicy=stage
' | sudo tee /etc/rpm-ostreed.conf

# enable rpm-ostree timer
sudo systemctl restart rpm-ostreed
sudo systemctl enable --now rpm-ostreed-automatic.timer

