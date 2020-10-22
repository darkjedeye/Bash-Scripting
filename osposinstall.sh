#!/bin/bash

sudo apt-get update && apt-get dist-upgrade -y && apt install timeout
sudo apt-get update
sudo apt-get dist-upgrade -y
  echo "please wait while we install the rest"
read -n 1 -s -r -p "Press any key to continue"
echo " "
echo "Installing Apache Server"
  read -n 1 -s -r -p "Press any key to continue"
echo " "
echo "Please enter the url for your server." 
read servername
sudo apt-get install apache2 -y
echo 'ServerName $servername' >> /etc/apache2/apache2.conf
sudo apache2ctl configtest
sudo ufw allow in "Apache Full"
echo "Apache Server installed!"
  read -n 1 -s -r -p "Press any key to continue"
echo " "
echo "Now installing Mysql Server!"
  read -n 1 -s -r -p "Press any key to continue"
echo " "
sudo apt install mysql-server -y
echo "Mysql install done!"
echo " "
  read -n 1 -s -r -p "Press any key to continue"
echo " "
echo "Now installing PHP!"
  read -n 1 -s -r -p "Press any key to continue"
echo " "
sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql php-intl php-gd php-bcmath php-common php-curl
echo "Done!"
  read -n 1 -s -r -p "Press any key to continue"
echo " "
sudo a2enmod rewrite
sudo service apache2 restart
cd /var/www/html
sudo wget hhttps://github.com/opensourcepos/opensourcepos/releases/download/3.3.2/opensourcepos.20200903075833.3.3.2.bb309c.zip
sudo apt install unzip -y
sudo unzip opensourcepos.20200903075833.3.3.2.bb309c.zip
sudo rm opensourcepos.20200903075833.3.3.2.bb309c.zip
cd /etc/apache2/sites-available
cp 000-default.conf 000-default.old
echo "<VirtualHost *:80>
        # The ServerName directive sets the request scheme, hostname and port that
        # the server uses to identify itself. This is used when creating
        # redirection URLs. In the context of virtual hosts, the ServerName
        # specifies what hostname must appear in the request's Host: header to
        # match this virtual host. For the default virtual host (this file) this
        # value is not decisive as it is used as a last resort host regardless.
        # However, you must set it for any further virtual host explicitly.
        #ServerName www.example.com

        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html

        # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
        # error, crit, alert, emerg.
        # It is also possible to configure the loglevel for particular
        # modules, e.g.
        #LogLevel info ssl:warn

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        # For most configuration files from conf-available/, which are
        # enabled or disabled at a global level, it is possible to
        # include a line for only one particular virtual host. For example the
        # following line enables the CGI configuration for this host only
        # after it has been globally disabled with "a2disconf".
        #Include conf-available/serve-cgi-bin.conf
</VirtualHost>" > 000-default.conf
echo "The next password prompt will be the same as the one you entered when installing Mysql"
  read -n 1 -s -r -p "Press any key to continue"
echo " "
mysql -u root -p "CREATE SCHEMA ospos;CREATE USER 'admin'@'%' IDENTIFIED BY 'pointofsale';GRANT ALL PRIVILEGES ON ospos . * TO 'admin'@'%' IDENTIFIED BY 'pointofsale' WITH GRANT OPTION;FLUSH PRIVILEGES;"
echo "The next password, Please type the same password you used for MYSQL"
cd /var/www/html/database
mysql -u root -p ospos < database.sql
cd ../application/config
echo "Now you want to add your encryption key. You can generate a CodeIgniter encryption key automatically using the Random Key Generator website. Type:
nano config.php
Find the code that says $config['encryption_key'] and add your key. Then press Ctrl-x to exit, making sure you save your changes."
cd /etc/apache2
cp apache2.conf apache2.old
echo " "
echo " type nano apache2.conf and at this section, make sure it looks the same,
<Directory /var/www/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
</Directory>
and change AllowOverride from none to ALL"
echo "Now you can visit your IP address in your browser. When you do, you'll see a login form.
Login Form
Login using these credentials:
Username: admin
Password: pointofsale"
