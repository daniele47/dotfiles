# fedora kde configuration

## initialize

```bash
sudo -v &&
    { while sleep 200; do sudo -v; done & } &&
    { systemd-inhibit --what=idle:sleep sleep infinity & } &&
    tuned-adm profile throughput-performance &&
    TMP_DIR="$(mktemp -d)" &&
    wget -O "$TMP_DIR/dotfiles.zip" https://github.com/daniele47/dotfiles/archive/refs/heads/fedora-kde.zip &&
    unzip -d "$TMP_DIR" "$TMP_DIR/dotfiles.zip" &&
    "${TMP_DIR}/dotfiles-fedora-kde/autosaver" run -- restoreall &&
    for i in {15..1}; do echo -en "\r\e[Krebooting in $i seconds... ctrl+c to skip"; sleep 1; done &&
    tuned-adm profile powersave &&
    reboot || echo -e "\e[1;31mfailed to download and run init scripts\e[m"
```

## remove fractional scaling

```bash
kscreen-doctor -o
read -p "Write screen to remove fractional scaling from: " SCREEN
kscreen-doctor "output.$SCREEN.scale.1"
```
