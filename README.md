# fedora kiniote configuration

## initialize

```bash
sudo -v &&
    TMP_DIR="$(mktemp -d)" &&
    wget -O "$TMP_DIR/dotfiles.zip" https://github.com/daniele47/dotfiles/archive/refs/heads/fedora-kiniote.zip &&
    unzip -d "$TMP_DIR" "$TMP_DIR/dotfiles.zip" &&
    "${TMP_DIR}/dotfiles-fedora-kiniote/autosaver" restoreall &&
    tuned-adm profile powersave &&
    reboot || echo -e "\e[1;31mfailed to download and init system\e[m"
```

## fix bluetooth stuttering on realtek chips

```bash
echo -e "options rtw88_core disable_lps_deep=y\noptions rtw88_pci disable_aspm=y" | sudo tee /etc/modprobe.d/rtw88-fix.conf
sudo systemctl reboot
```

## autounlock disk encryption by storing password on tpm

```bash
sudo systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=0,7
```
