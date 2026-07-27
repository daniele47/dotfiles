#!/bin/bash

set -euo pipefail

SCRIPT_PATH="$(realpath "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

# for each possible flatpak location, install firefox policies
for dir in /var/lib/flatpak /.kapsule/host/var/lib/flatpak; do
    if [[ -d "$dir" ]]; then
        policy_dir="$dir/extension/org.mozilla.firefox.systemconfig/$(uname -m)/stable/policies"
        policy_path="$policy_dir/policies.json"
        this_pol_path="$SCRIPT_DIR/files/policies.json"

        # skip if policy is already in place correctly
        if [[ -f "$policy_path" ]] && cmp -s "$this_pol_path" "$policy_path"; then
            echo "- Policies file is already in place at '$policy_path'"
            continue
        fi

        echo "- Putting policies.json into '$policy_path'..."
        sudo mkdir -p "$policy_dir"
        sudo cp "$this_pol_path" "$policy_path"
    fi
done
