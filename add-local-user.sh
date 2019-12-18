#!/bin/bash

# Check for root if not, exit with error 1

if [[ "$UID" = 0 ]]
	then

# Promt user for Username and password
	read -p "Please enter your desired user name: " USER_NAME
	read -p "Please enter your real name: "	COMENT
	read -p "Please enter your desired password: " PASSWORD
#Create new user with input from the user
	adduser -c "${COMENT}" -m ${USER_NAME}
		echo ${PASSWORD} | passwd --stdin ${USER_NAME} 
		passwd -e ${USER_NAME}
	else
		echo "YOU ARE NOT ROOT!"
	exit 1
fi
#Inform the user if the account is not created correctly with exit code 1
if [[ "${?}" -ne 0 ]]
then
	echo " Adding this user, was unsuccessful!"
fi
#Dispaly username, password and host where the account is created for records
echo "Usernmae: "
echo " "
echo "${USER_NAME}"
echo " "
echo "Real Name: "
echo " "
echo "${COMENT}"
echo " "
echo "Password: "
echo " "
echo "${PASSWORD}"
echo " "
hostname