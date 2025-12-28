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

## install rpm-fusion repos and codecs
```bash
rpm-ostree install \
  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

- after it, reboot to apply the new repos

```bash
```

## enable rpm-ostree automatic updates

## fix bluetooth stuttering on realtek chips

```bash
echo -e "options rtw88_core disable_lps_deep=y\noptions rtw88_pci disable_aspm=y" | sudo tee /etc/modprobe.d/rtw88-fix.conf
sudo systemctl reboot
```
