#!/usr/bin/env bash

echo "


Installation process starts...
A collection of tools, tutorials, resources, and intentionally vulnerable 
applications running in Docker containers. Labs include 
over many exercises to learn and practice ethical hacking (penetration testing) skills.
"

# Install wordpress
apt install -y nginx mariadb-server php php-fpm php-curl php-mysql php-gd php-mbstring php-xml php-imagick php-zip php-xmlrpc
cd ~/
echo "Configuring wordpress"
wget https://raw.githubusercontent.com/Sptimus/Vulnerable_Host/main/php.ini
mv php.ini /etc/php/8.1/fpm/php.ini


cd /var/www/html
wget https://raw.githubusercontent.com/Sptimus/Vulnerable_Host/main/wordpress.tar.gz
tar -zxvf wordpress.tar.gz
chown -R www-data:www-data /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress

cd ~/
wget https://raw.githubusercontent.com/Sptimus/Vulnerable_Host/main/wordpress.conf
mv wordpress.conf /etc/nginx/conf.d/wordpress.conf

echo "127.0.0.1 wordpress.example.com" >> /etc/hosts

systemctl restart nginx
systemctl restart php8.1-fpm
echo "Now you need to insert these commands:"
echo "sudo su"
echo "mysql"
echo "CREATE DATABASE wpdb;"
echo "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'user';"
echo "GRANT ALL ON wpdb.* TO 'wpuser'@'localhost';"
echo "FLUSH PRIVILEGES;"
echo "EXIT;"

echo "Now go to http://wordpress.example.com and initialize wordpress dont worry about credentials"
echo "Then run sudo ./install2.sh"
