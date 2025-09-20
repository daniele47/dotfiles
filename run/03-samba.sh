#!/bin/bash

set -e

# install samba
sudo apt install -y samba samba-common-bin

# init samba
sudo mkdir -p /opt/samba-share
sudo chmod -R 777 /opt/samba-share
sudo chown $USER:$USER /opt/samba-share
echo "[raspberry]
path = /opt/samba-share
writeable = yes
browseable = yes
valid users = $USER
create mask = 0777
directory mask = 0777
public = no" | sudo tee /etc/samba/smb.conf
sudo smbpasswd -a $USER
sudo systemctl restart smbd
