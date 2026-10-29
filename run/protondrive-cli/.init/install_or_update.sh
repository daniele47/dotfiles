#!/bin/bash

set -eou pipefail

# utils
function ok_exit() {
    echo -e "\e[1;32m$1\e[m" >&2
    exit 0
}
function err_exit() {
    echo -e "\e[1;31mERROR: $1\e[m" >&2
    exit 1
}
function warn() {
    echo -e "\e[1;33mWARNING: $1\e[m" >&2
}

# check deps
for cmd in curl jq sha512sum; do
    command -v "$cmd" >/dev/null || err_exit "Missing required command: $cmd"
done

# issue deprecation warning
warn "this is meant as a temporary script until proton-ag releases a proper path to download proton-drive client!\n"

# env variables
JSON_URL="https://proton.me/download/drive/cli/version.json"
BINARY_DIR="${XDG_BIN_HOME:-$HOME/.local/bin}"
BINARY_PATH="$BINARY_DIR/proton-drive"

# download json url
echo "- Downloading json metadata from '$JSON_URL'..."
json="$(curl -L --fail --show-error --progress-bar "$JSON_URL")"

# querying for platform
platform=""
case "$(uname -m)" in
x86_64) platform=linux/x64 ;;
aarch64) platform=linux/arm64 ;;
*) err_exit "Unsupported architecture: $(uname -m)" ;;
esac
echo "- Found platform: '$platform'"

# parsing json
file_json="$(jq --arg platform "$platform" '.Releases[0].Files[] | select(.Platform == $platform)' <<<"$json")"
bin_url="$(jq -r '.Url' <<<"$file_json")"
hash_url="$(jq -r '.Sha512CheckSum' <<<"$file_json")"
version="$(jq -r '.Releases[0].Version' <<<"$json")"

# skip updating if already has latest version
operation_msg="Installing"
curr_version=""
if [[ -x "$BINARY_PATH" ]]; then
    curr_version="$(proton-drive version | sed -n 's/.*cli-drive@\([^+]*\).*/\1/p')"
    if [[ "$curr_version" == "$version" ]]; then
        ok_exit "\n\e[32;1mBinary is already at latest version: $version\e[m"
    fi
    curr_version=" ($curr_version)"
fi

# install/update
echo "- $operation_msg proton-drive$curr_version at '$BINARY_PATH'..."
TMP_FILE="$(mktemp)"
curl -L --fail --show-error --progress-bar --output "$TMP_FILE" "$bin_url"

echo "- Validating checksum..."
hash_downloaded="$(sha512sum "$TMP_FILE" | cut -d ' ' -f1)"
if [[ "$hash_url" != "$hash_downloaded" ]]; then
    err_exit "Checksum validation failed!"
fi
chmod +x "$TMP_FILE"
mkdir -p "$BINARY_DIR"
mv "$TMP_FILE" "$BINARY_PATH"

ok_exit "Installation succeded! Installed version $version"
