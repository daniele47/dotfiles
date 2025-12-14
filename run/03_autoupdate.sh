#!/bin/bash

set -euo pipefail

# add automatic updates
echo '[Unit]
Description=Update everything
After=network-online.target
Wants=network-online.target

[Service]
Type=oneshot
TimeoutStopSec=30m
KillMode=mixed
TimeoutStopFailureMode=kill
ExecStart=/usr/bin/sh -c "/usr/bin/rpm-ostree upgrade && /usr/bin/flatpak update -y --noninteractive"' | sudo tee /etc/systemd/system/personal-autoupdate.service >/dev/null

echo '[Unit]
Description=Automatic update timer
ConditionPathExists=/run/ostree-booted
After=network-online.target
Wants=network-online.target

[Timer]
OnCalendar=daily
Persistent=true
RandomizedDelaySec=5m

[Install]
WantedBy=timers.target' | sudo tee /etc/systemd/system/personal-autoupdate.timer >/dev/null

sudo systemctl daemon-reload
sudo systemctl enable --now personal-autoupdate.timer
