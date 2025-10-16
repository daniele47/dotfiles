# fedora kde configuration

## initialize

```bash
sudo -v &&
    { while sleep 200; do sudo -v; done & } &&
    { systemd-inhibit --what=idle:sleep sleep 7200 & } &&
    tuned-adm profile throughput-performance &&
    TMP_DIR="$(mktemp -d)" &&
    wget -O "$TMP_DIR/dotfiles.zip" https://github.com/daniele47/dotfiles/archive/refs/heads/fedora-kde.zip &&
    unzip -d "$TMP_DIR" "$TMP_DIR/dotfiles.zip" &&
    "${TMP_DIR}/dotfiles-fedora-kde/autosaver" run -- restoreall &&
    ! timeout 10 firefox --headless &&
    for i in {15..1}; do
        echo -en "\r\e[Krebooting in $i seconds... ctrl+c to skip"
        sleep 1
    done &&
    tuned-adm profile powersave &&
    reboot || echo -e "\e[1;31mfailed to download and run init scripts\e[m"
```

## automatic disk unlocking

```bash
sudo systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=0,7 <encrypted-partition-path>
```

- <encrypted-partition-path>
    - a path like `/dev/nvme0n1p3`, that indicates the encrypted partition
    - can be found with `lsblk`

