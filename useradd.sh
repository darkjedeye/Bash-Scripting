#!/bin/bash

# This script will create an account on the local system.
#You will be prompted for the username and password.

#Ask for the user's name

read -p "please enter youre desired username: " USER_NAME

#Ask for the real name of user

read -p "Please enter your Real Name: " COMENT

#Ask for password

read -p "Please enter desire password: " PASSWORD

#Create uaser
 
 adduser -c "${COMENT}" -m ${USER_NAME}

#Set Password

echo ${PASSWORD} | passwd --stdin ${USER_NAME} 

#Force user to change password on first login

passwd -e ${USER_NAME}