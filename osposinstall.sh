#!/bin/bash
#check user status
echo "Your UID is ${UID}."

#check root
if [[ "${UID}" -eq 0 ]]
then
#!/bin/bash

git clone https://github.com/WebShells/WS-OSPOS-Installer.git

chmod +x WS-OSPOS-Installer/Get-POS

./WS-OSPOS-Installer/Get-POS
echo "Now you can visit your IP address in your browser. When you do, you'll see a login form.
Login using these credentials:
Username: admin
Password: pointofsale"
else
echo "You are not root! Please log as root or use sudo to run this script!"
fi
