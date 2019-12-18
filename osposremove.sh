#!/bin/bash

# Determing if the user executing this script is the root user or not

# Display the UID

echo "Your UID is ${UID}."
# Bash has built in Variables, the above variable is one of them.

# Display if the user is root or not.

# Use the -eq if using numbers and = if using a string.
# Use double [[ ]] as this is the current preferred method, and the sigle brackets
# are obsolete

if [[ "${UID}" -eq 0 ]] # The spaces in the if statment are very important!
then
	echo "Now removing Apache Server"
timeout 30 read -n 1 -s -r -p "Press any key to continue"
echo " "
sudo apt-get purge apache2 -y
echo "ServerName 192.168.1.160" >> /etc/apache2/apache2.conf
echo "Apache Server Removed!"
timeout 30 read -n 1 -s -r -p "Press any key to continue"
echo " "
echo "Now Removing Mysql Server!"
timeout 30 read -n 1 -s -r -p "Press any key to continue"
echo " "
sudo apt Purge mysql-server -y
echo "Mysql removal done!"
echo " "
timeout 30 read -n 1 -s -r -p "Press any key to continue"
echo " "
echo "Now removing PHP!"
timeout 30 read -n 1 -s -r -p "Press any key to continue"
echo " "
sudo apt-get purge php libapache2-mod-php php-mcrypt php-mysql php-intl php-gd php-bcmath php-common php-curl -y
echo "Done!"
timeout 30 read -n 1 -s -r -p "Press any key to continue"
echo " "
cd /opt/
sudo rm -rf opensourcepos
apt autoremove -y
rm -rf /var/www/
echo " OSPOS HAS NOW BEEN REMOVED FROM YOUR MACHINE!"
else
	echo "You re not root and therefor may not install software. Please use root or sudo command."
fi

#


