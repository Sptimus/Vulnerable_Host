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

echo "Now you need to insert these commands:"
echo "sudo su"
echo "mysql -u root -p"
echo "CREATE DATABASE wpdb;"
echo "Now run sudo ./install2.sh"
