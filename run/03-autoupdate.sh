#!/bin/bash

echo '[Unit]    
Description=Automatically update the system          
After=network.target            
    
[Service]  
Type=oneshot         
ExecStart=/usr/bin/apt-get update
ExecStart=/usr/bin/apt-get upgrade -y
ExecStart=/usr/bin/apt-get autoremove -y
ExecStart=/usr/bin/apt-get autoclean -y
ExecStart=/usr/bin/sync   
ExecStart=/usr/bin/sleep 5
ExecStart=/usr/sbin/reboot

[Install]
WantedBy=multi-user.target' | sudo tee /etc/systemd/system/autoupdate.service >/dev/null 

echo '[Unit]    
Description=Run automatic updates on a schedule    
Requires=autoupdate.service    
    
[Timer]    
OnCalendar=weekly    
Persistent=true    
RandomizedDelaySec=3600    
    
[Install]    
WantedBy=timers.target' | sudo tee /etc/systemd/system/autoupdate.timer >/dev/null 

sudo systemctl daemon-reload 
sudo systemctl enable --now autoupdate.timer
