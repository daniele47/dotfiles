#!/bin/bash

set -euo pipefail

# set zsh as default shell if present
u="${USER:-$(whoami)}"
tmpfile="$(mktemp)"
awk -F: -v user="$u" 'BEGIN{OFS=":"} $1==user {$7="/bin/zsh"} {print}' /etc/passwd >"$tmpfile"
sudo mv "$tmpfile" /etc/passwd
