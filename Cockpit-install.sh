#!/bin/bash
#check user status
echo "Your UID is ${UID}."

#check root
if [[ "${UID}" -eq 0 ]]
then
echo "This script will install Cockpit on your system. Are you sure you would like to do this?: (y/n)" 
read ANSWER
if [[ $ANSWER = "y" ]]
then
apt-get install cockpit
systemctl enable --now cockpit.socket
netstat -a | grep 9090
systemctl enable --now cockpit.socket
ufw allow 9090
ufw allo ssh
else 
echo "why run the script?"
fi
else
echo "You are not root! Please log as root or use sudo to run this script!"
fi

