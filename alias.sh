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
	echo "Now starting the script"
	# Script to install alias's

#get the system to most up to date specs....

apt update && apt upgrade -y
echo "your system has been updated and upgraded!"
read -t 5 -n 1 -s -r -p "Press any key to continue"
echo " "


 add-apt-repository ppa:dawidd0811/neofetch
 apt update
 apt install figlet neofetch cowsay fortune-mod
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
 echo 'alias	  remgit="git config --global credential.helper store"' >> /etc/bash.bashrc
 echo ' ' >> /etc/bash.bashrc
 echo ' neofetch' >> /etc/bash.bashrc
 echo '/usr/games/fortune | /usr/games/cowthink -f tux' >> /etc/bash.bashrc
echo " DONE!"
read -t 5 -n 1 -s -r -p "Press any key to continue"

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
