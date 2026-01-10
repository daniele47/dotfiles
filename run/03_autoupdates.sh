#!/bin/bash

set -euo pipefail

echo "*** ENABLE AUTOMATIC RPM-OSTREE UPDATES ***"
echo -n '[Daemon]
AutomaticUpdatePolicy=stage
' | sudo tee /etc/rpm-ostreed.conf >/dev/null
sudo systemctl restart rpm-ostreed
sudo systemctl enable --now rpm-ostreed-automatic.timer

