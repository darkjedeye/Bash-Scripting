#!/bin/bash

echo " please enter the URL"
read URL
echo "Here is the NSLOOKUP results!"
nslookup $URL
read -n 1 -s -r -p "Press any key to continue"
echo " "
echo "Here is the Dig Result!"
dig $URL
read -n 1 -s -r -p "Press any key to continue"
echo " "
echo "And Finaly, Here is the ping result!"
ping -c 3 $URL
read -n 1 -s -r -p "Press any key to continue"
echo " "
echo " "
echo "Thank you for using another script from:"
figlet "Darkjedeye"
