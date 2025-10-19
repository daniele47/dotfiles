#!/bin/env bash

set -e

# set to safer and more restrictive default zone
sudo firewall-cmd --set-default-zone=public
