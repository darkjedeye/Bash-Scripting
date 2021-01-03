#!/bin/bash

# Determining if the user executing this script is the root user or not

# Display the UID of user

echo "Your UID is ${UID}."
# Bash has built in Variables, the above variable is one of them.

# Display if the user is root or not.

# Use the -eq if using numbers and = if using a string.
# Use double [[ ]] as this is the current preferred method, and the single brackets
# are obsolete

if [[ "${UID}" -eq 0 ]] # The spaces in the if statement are very important!
then
	echo "Now starting the script"
	# Script to install general things i use on my server and desktop installs

#get the system to most up to date specs....

apt update && apt upgrade -y
echo "your system has been updated and upgraded!"
read -t 5 -n 1 -s -r -p "Press any key to continue"
echo " "

# Install the software that is used.
echo "Now installing the Software on your machine "
read -t 5 -n 1 -s -r -p "Press any key to continue"
echo " "

echo "Is your system a server or a desktop OS?"
read answer
if [[ "$answer" = "server" ]]
then 
read -p "Would you like the following apps will be installed. mc sl konsole cmatrix openssh-server figlet toilet apache2 mysql-server php phpmyadmin [yes/no]: " SERVER
if [[ "$SERVER" = "yes" ]]
then
add-apt-repository ppa:dawidd0811/neofetch
apt update
apt install -y mc sl konsole cmatrix openssh-server apache2 mysql-server php phpmyadmin htop sshfs neofetch fortune-mod cowsay

apt install figlet -y
echo "your applications have been"
figlet "installed!" -f standard -c
 read -n 1 -s -r -p "Press any key to continue"
 echo " "
 echo "would you like to install RDP server? [y/n]"
 read rdp
 if [[ "$rdp" = "y" ]]
 then
apt update
apt install xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils -y
apt install xrdp -y
adduser xrdp ssl-cert  
systemctl restart xrdp
ufw allow 3389
apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y
else
echo "No Problem."
fi
 else
    echo "No Programs will be installed!"
fi

 else
 read -p "would you like the following apps will be installed. mc yakuake sl kate konsole cmatrix openssh-server figlet toilet virtualbox virtualbox-dkms [yes/no]: " DESKTOP
 if [[ "$DESKTOP" = "yes" ]]
 then
 add-apt-repository ppa:dawidd0811/neofetch
 apt update
 apt install -y mc yakuake sl kate konsole cmatrix openssh-server figlet toilet virtualbox virtualbox-dkms sshfs neofetch fortune cowsay
 echo "your applications have been"
figlet "installed!" -f standard -c
 read -t 5 -n 1 -s -r -p "Press any key to continue"
 echo
 else 
 echo "No Programs will be installed!"
 fi
fi 
 #Remove un-necessary installs!
 
 apt install gnome-disk-utility

 
 echo "Now removing Residual components that were not needed."
 read -n 1 -s -r -p "Press any key to continue"
 echo " "
 
 apt autoremove -y

 
 # Modify the bash.bashrc file to include the alias' i use.
 echo " we will now add to your Alias section!"
 read -t 5 -n 1 -s -r -p "Press any key to continue"
 echo 'alias      super="sudo su -"' >> /etc/bash.bashrc
 echo 'alias      update="sudo apt update"' >> /etc/bash.bashrc
 echo 'alias      upgrade="sudo apt upgrade -y"'  >> /etc/bash.bashrc
 echo 'alias      cls="clear"'  >> /etc/bash.bashrc
 echo 'alias      matrix="cmatrix"'  >> /etc/bash.bashrc
 echo 'alias	  external="dig +short myip.opendns.com @resolver1.opendns.com"' >> /etc/bash.bashrc
 echo 'alias      antserv="ssh steam@kleincore.us.to"' >> /etc/bash.bashrc
 echo 'alias	  remgit="git config --global credential.helper store'" >> /etc/bash.bashrc
 echo ' ' >> /etc/bash.bashrc
 echo '/usr/games/fortune | /usr/games/cowthink -f tux' >> /etc/bash.bashrc
 echo ' neofetch' >> /etc/bash.bashrc
echo " DONE!"
read -t 5 -n 1 -s -r -p "Press any key to continue"

# End of the script

echo " "
echo "This script has completed it's run."
read -t 5 -n 1 -s -r -p "Press any key to continue"
echo " "
echo "This script was written by the Linux Wizzard"
figlet "DARKJEDEYE"
read -t 5 -n 1 -s -r -p "Press any key to continue"
echo " "
echo "If you wish to have your own script like this, personalized with your own details."
echo "email Darkjedeye on"
echo "darkjedeye@cisit.co.za"
figlet "This concludes our presentation for this evening" -f small -c
else
	echo "You re not root and therefor may not install software. Please use root or sudo command."
fi

