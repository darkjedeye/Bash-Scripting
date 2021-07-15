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
	
#get the system to most up to date specs....
apt update && apt upgrade -y
echo "your system has been updated and upgraded!"
read -t 5 -n 1 -s -r -p "Press any key to continue"
echo " "

# Install the software that is used.
echo "Now installing the Software on your machine "
read -t 5 -n 1 -s -r -p "Press any key to continue"
echo " "
#Install apps needed and some tools
read -p "Would you like the following apps will be installed. mc sl konsole cmatrix openssh-server figlet toilet apache2 mysql-server php phpmyadmin neofetch cockpit cowsay fortune [yes/no]: " SERVER
if [[ "$SERVER" = "yes" ]]
then
sudo add-apt-repository ppa:dawidd0811/neofetch
sudo apt -y install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt install figlet
apt install -y mc sl konsole cmatrix openssh-server toilet apache2 mysql-server phpmyadmin htop sshfs neofetch cockpit  fortune-mod cowsay unzip php-imagick php7.2-{fpm,mysql,common,gd,imap,json,curl,zip,xml,mbstring,bz2,intl,gmp}
#user notify
echo "your applications have been"
figlet "installed!" -f standard -c
read -n 1 -s -r -p "Press any key to continue"
echo " "
#Setup Pre-requisites for Suite CRM
echo "Setting Parameters for SuiteCRM"
read -n 1 -s -r -p "Press any key to continue"
sudo a2dismod php7.4
sudo a2dismod mpm_prefork
sudo a2enmod mpm_event proxy_fcgi setenvif
#disable default site to ensure that suitecrm is the default port 80
sudo a2dissite 000-default.conf
sudo systemctl restart apache2
sudo touch /etc/apache2/sites-available/suitecrm.conf
sudo echo "
	<VirtualHost *:80>
  ServerName suitecrm.example.com
  DocumentRoot /var/www/suitecrm/

  ErrorLog ${APACHE_LOG_DIR}/suitecrm_error.log
  CustomLog ${APACHE_LOG_DIR}/suitecrm_access.log combined

  <Directory />
    Options FollowSymLinks
    AllowOverride All
  </Directory>

  <Directory /var/www/suitecrm/>
    Options FollowSymLinks MultiViews
    AllowOverride All
    Order allow,deny
    allow from all
  </Directory>
  

Include /etc/apache2/conf-available/php7.2-fpm.conf

</VirtualHost>
" >> /etc/apache2/sites-available/suitecrm.conf
#enable site on the server so apache 2 serves it up to user
sudo a2ensite suitecrm.conf
sudo systemctl reload apache2
#Setup SQL
echo "Setting Parameters for MYSQL"
read -n 1 -s -r -p "Press any key to continue" 
sudo mysql -u root -p -e "CREATE DATABASE suitecrm;CREATE USER 'lynxsolve'@'%' IDENTIFIED BY 'lynxsolve1';GRANT ALL PRIVILEGES ON suitecrm . * TO 'lynxsolve'@'%' IDENTIFIED BY 'lynxsolve1' WITH GRANT OPTION;FLUSH PRIVILEGES;"
#Create and popul;ate Directories for SuiteCRM
echo "Provisioning files and Directories"
read -n 1 -s -r -p "Press any key to continue"
#Download and extract suitecrm
sudo cd /tmp
sudo wget https://suitecrm.com/files/162/SuiteCRM-7.11/525/SuiteCRM-7.11.18.zip
sudo unzip SuiteCRM-7.11.18.zip -d /var/www/
sudo mv /var/www/SuiteCRM-7.11.18/ /var/www/suitecrm
#Permissions and setting for suitecrm to work
cd /var/www/suitecrm
sudo chown -R www-data:www-data /var/www/suitecrm/
sudo chmod -R 755 .
sudo chmod -R 775 cache custom modules themes data upload
sudo chmod 775 config_override.php 2>/dev/null
sed -i 's|upload_max_filesize = 2M|upload_max_filesize = 2G|' /etc/php/7.2/fpm/php.ini
sed -i 's|upload_max_filesize = 2M|upload_max_filesize = 2G|' /etc/php/8.0/apache2/php.ini
sudo systemctl restart php7.4-fpm
sed -i 's|default_socket_timeout = 60|default_socket_timeout = 6000|' /etc/php/7.2/fpm/php.ini
sed -i 's|default_socket_timeout = 60|default_socket_timeout = 6000|' /etc/php/8.0/apache2/php.ini
sudo systemctl restart apache2
sudo rm -rf /etc/apt/sources.list.d/ondrej-ubuntu-php-xenial.list
sudo rm -rf /etc/apt/trusted.gpg.d/ondrej_ubuntu_php*
#Clean up and update anything that needs updating
sudo apt update
sudo apt autoremove -y
#My little final signature
# Modify the bash.bashrc file to include the alias' i use.
 echo " we will now add to your Alias section!"
 read -t 5 -n 1 -s -r -p "Press any key to continue"
 echo 'alias      super="sudo su -"' >> /etc/bash.bashrc
 echo 'alias      update="sudo apt update"' >> /etc/bash.bashrc
 echo 'alias      upgrade="sudo apt upgrade -y"'  >> /etc/bash.bashrc
 echo 'alias      cls="clear"'  >> /etc/bash.bashrc
 echo 'alias      matrix="cmatrix"'  >> /etc/bash.bashrc
 echo 'alias	  external="dig +short myip.opendns.com @resolver1.opendns.com"' >> /etc/bash.bashrc
 
 echo ' ' >> /etc/bash.bashrc
 echo '/usr/games/fortune | /usr/games/cowthink -f tux' >> /etc/bash.bashrc
 echo ' neofetch' >> /etc/bash.bashrc
echo " DONE!"
read -t 5 -n 1 -s -r -p "Press any key to continue"

# End of the script
figlet "Porvisioned" -f standard -c 

echo "Now you can visit your IP address  or Defined url in your browser. When you do, you'll see an instalation wizard."
read -n 1 -s -r -p "Press any key to continue"

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
echo "cisitservices275@gmail.com"
figlet "This concludes our presentation for this evening" -f small -c
 else
    echo "No Programs will be installed!"
fi
	
else
	echo "You are not root user and therefor may not install software. Please use root or sudo command."
fi

#

