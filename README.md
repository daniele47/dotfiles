# fedora kiniote configuration

## initialize

```bash
sudo -v &&
    { while sleep 200; do sudo -v; done & } &&
    { systemd-inhibit --what=idle:sleep sleep infinity & } &&
    tuned-adm profile throughput-performance &&
    TMP_DIR="$(mktemp -d)" &&
    git clone https://github.com/daniele47/dotfiles "$TMP_DIR" &&
    git -C "$TMP_DIR" switch kiniote &&
    "${TMP_DIR}/autosaver" run -- purge -f -- restoreall -f &&
    for i in {15..1}; do echo -en "\r\e[Krebooting in $i seconds... ctrl+c to skip"; sleep 1; done &&
    tuned-adm profile powersave &&
    reboot || 
    echo -e "\e[1;31mfailed to download and run init scripts\e[m"
```

## enable rpm-ostree automatic updates

```bash
echo '
[Daemon]
AutomaticUpdatePolicy=stage
' | sudo tee /etc/rpm-ostreed.conf
sudo systemctl restart rpm-ostreed
sudo systemctl enable --now rpm-ostreed-automatic.timer
```
