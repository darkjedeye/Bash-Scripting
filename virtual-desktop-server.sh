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
	read -n 1 -s -r -p "Press any key to continue"
	echo " "
	echo "Updating you system"
	apt-get update && apt upgrade -y
	read -n 1 -s -r -p "Upgraded system."
	echo " "
	echo "Installing Remote desktop system!"
	apt-get install xrdp -y
	read -n 1 -s -r -p "Installed Remote Desktop"
	echo " "
	
else
echo "Please log in as root or use sudo if you are an admin!"
fi
	while true
		do
		echo "Please select a desktop environment (GUI):"
		select GUI in MATE XFCE Exit
			do
			case $GUI in
			MATE)
			echo "You have chosen MATE Desktop"
			apt-get install -y mate-core mate-desktop-environment mate-notification-daemon
			sed -i.bak '/fi/a #xrdp multiple users configuration \n mate-session \n' /etc/xrdp/startwm.sh
			adduser xrdp ssl-cert
			ufw allow 3389/tcp
			/etc/init.d/xrdp restart
			break
			;;
			XFCE)
			echo "You have chosen XFCE4 Desktop"
			apt-get install -y xfce4 xfce4-terminal
			adduser xrdp ssl-cert
			ufw allow 3389/tcp
			/etc/init.d/xrdp restart
			break
			;;
			Exit)
			apt install -y figlet cmatrix mc kate yakuake konsole sl cowsay fortune
    			echo "This Script was written by The Linux GOD! Darkjedeye!"
    			read -n 1 -s -r -p "Press any key to continue"
    			echo " "
    			echo "If you would like your own personalised script, with your own specific general commands,"
    			echo "Email Darkjedeye on info@cisit.co.za"
    			read -n 1 -s -r -p "Press any key to continue"
    			echo "Good Bye!"
			apt autoremove
    			break 2
    			;;
			*)
			echo "Invalid option"
			;;
			esac
			done
  		done
  

		
	

	


