#!/bin/bash
#check user status
echo "Your UID is ${UID}."

#check root
if [[ "${UID}" -eq 0 ]]
then
echo "Updating the system!"
read -t 10 -n 1 -s -r -p "Press any key to continue"
apt update
apt upgrade -y && apt dist-upgrade -y
echo "This script will install Cockpit on your system. Are you sure you would like to do this?: (y/n)" 
read ANSWER
if [[ $ANSWER = "y" ]]
then
apt-get install cockpit cockpit-* -y
echo "enableing socket"
read -t 10 -n 1 -s -r -p "Press any key to continue"
systemctl enable --now cockpit.socket
netstat -a | grep 9090
systemctl enable --now cockpit.socket
ufw allow 9090
ufw allow ssh
echo "now removing unneccesary files!"
read -t 10 -n 1 -s -r -p "Press any key to continue"
apt-get autoremove -y
else 
echo "why run the script?"
fi
else
echo "You are not root! Please log as root or use sudo to run this script!"
fi

