## raspberry pi configuration

- to initialize, run the following:

```bash
sudo -v &&
    TMP_DIR="$(mktemp -d)" &&
    wget -O "$TMP_DIR/dotfiles.zip" https://github.com/daniele47/dotfiles/archive/refs/heads/raspberrypi2w.zip &&
    unzip -d "$TMP_DIR" "$TMP_DIR/dotfiles.zip" &&
    "${TMP_DIR}/dotfiles-raspberrypi2w/autosaver" run &&
    "${TMP_DIR}/dotfiles-raspberrypi2w/autosaver" restoreall -f &&
    sudo reboot || echo -e "UNKNOWN FAILURE!"
```
