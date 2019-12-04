#!/bin/bash

# Determing if the user executing this script is the root user or not

# Display the UID of user

echo "Your UID is ${UID}."
# Bash has built in Variables, the above variable is one of them.

# Display if the user is root or not.

# Use the -eq if using numbers and = if using a string.
# Use double [[ ]] as this is the current preferred method, and the sigle brackets
# are obsolete

if [[ "${UID}" -eq 0 ]] # The spaces in the if statment are very important!
then
	echo "Now starting the script"
	# Script to install general things i use on my server and desktop installs

#get the system to most up to date specs....

apt update && apt upgrade -y
echo "your system has been updated and upgraded!"
read -n 1 -s -r -p "Press any key to continue"
echo " "

# Install the software that is used.
echo "Now installin the Software on your machine "
read -n 1 -s -r -p "Press any key to continue"
echo " "

echo "Is your system a server or a desktop os?"
read answer
if [[ "$answer" = "server" ]]
then 
echo "The folowing apps will be installed. mc sl konsole cmatrix openssh-server figlet toilet apache2 mysql-server php phpmyadmin"
read -n 1 -s -r -p "Press any key to continue"
apt install -y mc sl konsole cmatrix openssh-server figlet toilet apache2 mysql-server php phpmyadmin htop
echo "your applications have been"
figlet "installed!" -f standard -c
 read -n 1 -s -r -p "Press any key to continue"
 echo " "
 else
 echo "The folowing apps will be installed. mc yakuake sl kate konsole cmatrix openssh-server figlet toilet virtualbox virtualbox-dkms"
 read -n 1 -s -r -p "Press any key to continue"
 apt install -y mc yakuake sl kate konsole cmatrix openssh-server figlet toilet virtualbox virtualbox-dkms
 echo "your applications have been"
figlet "installed!" -f standard -c
 read -n 1 -s -r -p "Press any key to continue"
 echo " "
fi 
 #Remove un-neccessary installs!
 
 echo "Npw removing Residule components that were not needed."
 read -n 1 -s -r -p "Press any key to continue"
 echo " "
 
 apt autoremove -y

 
 # Modify the bash.bashrc file to include the alias' i use.
 echo " we will now add to your Alias section!"
 read -n 1 -s -r -p "Press any key to continue"
 echo 'alias      super="sudo su -"' >> /etc/bash.bashrc
 echo 'alias      update="sudo apt update"' >> /etc/bash.bashrc
 echo 'alias      upgrade="sudo apt upgrade -y"'  >> /etc/bash.bashrc
 echo 'alias      cls="clear"'  >> /etc/bash.bashrc
 echo 'alias      matrix="cmatrix"'  >> /etc/bash.bashrc
echo " DONE!"
read -n 1 -s -r -p "Press any key to continue"

# End of the script

echo " "
echo "This script has completed it's run."
read -n 1 -s -r -p "Press any key to continue"
echo " "
echo "This script was written by the linux GOD"
figlet "DARKJEDEYE"
read -n 1 -s -r -p "Press any key to continue"
echo " "
echo "If you wish to have your own script like this, personalized with your own details."
echo "email Darkjedeye on"
echo "darkjedeye@cisit.co.za"
figlet "This conculeds our presentation for this evening" -f small -c
else
	echo "You re not root and therefor may not install software. Please use root or sudo command."
fi

