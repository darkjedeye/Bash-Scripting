#!/bin/bash

# This script displays information about the system on which it is executed

# tell the user that the script is starting

echo "Starting the System info script"

# Display the hostname of the system

hostname

# Display current date and time that the information was collected.

date

# Display Kernel release followed by architecture

uname -r
uname -m

# Display some disk uasage in human readable format

df -h
free -m

# End the script by letting the user know that it's done.
echo "Stopping the system info script."
