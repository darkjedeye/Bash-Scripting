#!/bin/bash
sudo apt update
sudo apt install xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils
sudo apt install xrdp 
sudo adduser xrdp ssl-cert  
sudo systemctl restart xrdp
sudo ufw allow 3389
sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y
