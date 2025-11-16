# fedora kiniote configuration

- NOTE: ALL THE FOLLOWING COMMANDS MUST BE RUN ON THE HOST!!!

## initialize

```bash
sudo -v &&
    { while sleep 200; do sudo -v; done & } &&
    { systemd-inhibit --what=idle:sleep sleep infinity & } &&
    tuned-adm profile throughput-performance &&
    TMP_DIR="$(mktemp -d)" &&
    wget -O "$TMP_DIR/dotfiles.zip" https://github.com/daniele47/dotfiles/archive/refs/heads/kiniote.zip &&
    unzip -d "$TMP_DIR" "$TMP_DIR/dotfiles.zip" &&
    "${TMP_DIR}/dotfiles-kiniote/autosaver" run -- restoreall &&
    for i in {15..1}; do echo -en "\r\e[Krebooting in $i seconds... ctrl+c to skip"; sleep 1; done &&
    tuned-adm profile powersave &&
    reboot || 
    echo -e "\e[1;31mfailed to download and run init scripts\e[m"
```

## fix bluetooth stuttering on realtek chips

```bash
echo -e "options rtw88_core disable_lps_deep=y\noptions rtw88_pci disable_aspm=y" | sudo tee /etc/modprobe.d/rtw88-fix.conf
sudo systemctl reboot
```

## enable automagical updates

```bash
echo -e "[Daemon]\nAutomaticUpdatePolicy=stage" | sudo tee /etc/rpm-ostreed.conf
rpm-ostree reload
systemctl enable rpm-ostreed-automatic.timer --now
```

## disable automagical updates

```bash
sudo cp /usr/etc/rpm-ostreed.conf /etc/rpm-ostreed.conf
rpm-ostree reload
systemctl disable rpm-ostreed-automatic.timer --now
```
