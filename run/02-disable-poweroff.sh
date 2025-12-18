#!/bin/bash

set -e

# disable poweroff and halt (avoid making raspberry pi unreachable)
sudo systemctl mask poweroff.target
sudo systemctl mask halt.target
