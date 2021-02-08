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
	echo "Now installing software"

	#check for user input on update.

	echo "would you like to check if your system is up to date?"
	read UPDATE
	if [[ "$UPDATE" = "yes" ]]
	then
	apt update
	apt upgrade -y && apt dist-upgrade -y && apt autoclean -y
	else
	echo "We will now install your selection of software."
	fi

	#chek if machine is a server or a desktop

	echo "is this a server or a desktop?"
	read MACHINE
	if [[ "$MACHINE" = "desktop" ]]
	then
	add-apt-repository ppa:dawidd0811/neofetch
	apt install -y mc yakuake sl kate konsole cmatrix openssh-server figlet toilet sshfs neofetch fortune cowsay git htop
	echo "your applications have been"
	figlet "installed!" -f standard -c
	read -t 5 -n 1 -s -r -p "Press any key to continue"
	echo " "
	echo "Would you like to install OSPOS on this machine?"
	read DANSWER
	if [[ "$DANSWER" = "yes" ]]
	then
	cd /opt
	git clone https://github.com/opensourcepos/opensourcepos.git
	cd opesourcepos/docker/
	sed -i 's|OSPOS_MYSQL_USERNAME=admin | OSPOS_MYSQL_USERNAME=root|' .env
	sed -i 's|OSPOS_MYSQL_PASSWORD=pointofsale | OSPOS_MYSQL_PASSWORD=Mundane1|' .env
	sed -i 's|OSPOS_MYSQL_ROOT_PASSWORD=ospos_mysql | OSPOS_MYSQL_ROOT_PASSWORD=Mundane1|' .env
	sed -i 's|OSPOS_DOMAIN_NAME=ospos.ospos | OSPOS_DOMAIN_NAME=localhost.lan|' .env
	sed -i 's|OSPOS_CONTACT_EMAIL=admin@ospos.ospos | OSPOS_CONTACT_EMAIL=eric@kleincore.co.za|' .env
	apt install docker docker.io -y
	curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
	bash install-local.sh
	echo "your applications have been"
	figlet "installed!" -f standard -c
	read -t 5 -n 1 -s -r -p "Press any key to continue"
	echo " "
	else
	echo "Nothing to install the..."
	fi
	else
	echo " The server script has not been completed as yet!"
	fi

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
 echo '/usr/games/fortune | /usr/games/cowthink -f tux' >> /etc/bash.bashrc
 echo ' neofetch' >> /etc/bash.bashrc
echo " DONE!"
read -t 5 -n 1 -s -r -p "Press any key to continue"

# End of the script

else
	echo "You re not root and therefor may not install software. Please use root or sudo command."
fi
