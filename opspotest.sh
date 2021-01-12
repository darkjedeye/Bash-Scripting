#!/bin/bash
#check user status
echo "Your UID is ${UID}."

#check root
if [[ "${UID}" -eq 0 ]]
then
echo "Updating system."
read -n 1 -s -r -p "Press any key to continue"
echo
apt-get update && apt-get dist-upgrade -y && apt install timeout
apt-get update
apt-get dist-upgrade -y
echo "please wait while we install the rest"
read -n 1 -s -r -p "Press any key to continue"
echo " "
echo "Installing Apache Server"
  read -n 1 -s -r -p "Press any key to continue"
echo " "
echo "Please enter the url for your server." 
read servername
apt-get install apache2 -y
echo "Adding your server name to apache config."
read -n 1 -s -r -p "Press any key to continue"
echo 'ServerName $servername' >> /etc/apache2/apache2.conf
echo
echo "Testing apache config."
read -n 1 -s -r -p "Press any key to continue"
echo
apache2ctl configtest
ufw allow in "Apache Full"
echo "Apache Server installed!"
  read -n 1 -s -r -p "Press any key to continue"
echo " "
echo "Now installing Mysql Server!"
  read -n 1 -s -r -p "Press any key to continue"
echo " "
apt install mysql-server -y
echo "Mysql install done!"
echo " "
  read -n 1 -s -r -p "Press any key to continue"
echo " "
echo "Now installing PHP!"
  read -n 1 -s -r -p "Press any key to continue"
echo " "
apt-get install php libapache2-mod-php php-mcrypt php-mysql php-intl php-gd php-bcmath php-common php-curl phpmyadmin -y
echo "Done!"
  read -n 1 -s -r -p "Press any key to continue"
echo " "
a2enmod rewrite
echo "Rewrite mod is enabed!"
read -n 1 -s -r -p "Press any key to continue."
echo
service apache2 restart
echo "Please type the name for the directory you would like for install"
read DIR
echo "Please give desired port ranging from 80 - 89"
read Port
cd /var/www/
mkdir $DIR
cd /var/www/$DIR
wget https://github.com/opensourcepos/opensourcepos/releases/download/3.3.2/opensourcepos.20200903075833.3.3.2.bb309c.zip
apt install unzip -y
unzip opensourcepos.20200903075833.3.3.2.bb309c.zip
rm opensourcepos.20200903075833.3.3.2.bb309c.zip
cd /etc/apache2/sites-available
cp 000-default.conf 000-default.old
sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www/'"$DIR"'|' /etc/apache2/sites-available/000-default.conf
sed -i 's|^<VirtualHost[ ]\*:80>|^<VirtualHost[ ]\*:'"$Port"'>|' /etc/apache2/sites-available/000-default.conf 
echo "The next password prompt will be the same as the one you entered when installing Mysql"
  read -n 1 -s -r -p "Press any key to continue"
echo " "
mysql -uroot -p -e "CREATE DATABASE ospos;CREATE USER 'admin'@'%' IDENTIFIED BY 'pointofsale';GRANT ALL PRIVILEGES ON ospos . * TO 'admin'@'%' IDENTIFIED BY 'pointofsale' WITH GRANT OPTION;FLUSH PRIVILEGES;"
echo "The next password, Please type the same password you used for MYSQL"
cd /var/www/$DIR/database
mysql -u root -p ospos < database.sql
cd ../application/config
key=$(openssl rand -base64 32) 
sed -i 's|.|'"$key"'|83' config.php
cd /etc/apache2
cp apache2.conf apache2.old
echo " "
sed -i '166s|AllowOverride None|AllowOverride All|' /etc/apache2/apache2.conf
echo "Now you can visit your IP address in your browser. When you do, you'll see a login form.
Login Form
Login using these credentials:
Username: admin
Password: pointofsale"
else
echo "You are not root! Please log as root or use sudo to run this script!"
fi

