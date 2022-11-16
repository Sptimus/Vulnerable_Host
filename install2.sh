#!/usr/bin/env bash

echo "


Installation process starts...
A collection of tools, tutorials, resources, and intentionally vulnerable 
applications running in Docker containers. Labs include 
over many exercises to learn and practice ethical hacking (penetration testing) skills.
"

# Initalize wordpress database
echo "Initalize database"
#wget https://raw.githubusercontent.com/Sptimus/Vulnerable_Host/main/wpdb.sql
mysql wpdb -u wpuser -puser < wpdb.sql

#echo "getting docker-compose.yml from Github Repository"
#wget https://raw.githubusercontent.com/Sptimus/Vulnerable_Host/main/docker-compose.yml

# instantiating the containers with docker-compose
echo "Setting up the containers and internal bridge network"
docker-compose -f docker-compose.yml up -d

# cloning NodeGoat
git clone https://github.com/OWASP/NodeGoat.git

#replacing the docker-compose.yml file with second bridge network (10.6.7.0/24)
curl -sSL https://raw.githubusercontent.com/Sptimus/Vulnerable_Host/main/nodegoat-docker-compose.yml  > /root/NodeGoat/docker-compose.yml

# downloading the nodegoat.sh from Github Repository
# this will be used manually to setup the NodeGoat environment
#wget https://raw.githubusercontent.com/Sptimus/Vulnerable_Host/main/nodegoat.sh
chmod 744 nodegoat.sh 

#cloning H4cker github
cd /root
mkdir Tools
cd /root/Tools
git clone https://github.com/The-Art-of-Hacking/h4cker.git

#cloning SecLists
git clone https://github.com/danielmiessler/SecLists.git

#cloning GitTools
git clone https://github.com/internetwache/GitTools.git

#cloning Payloads All The Thing
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git

#getting test ssl script
curl -L https://testssl.sh --output testssl.sh
chmod +x testssl.sh

#Installing ffuf 
apt install -y ffuf

#Installing tor
apt install -y tor

#Installing golang
apt install -y golang-go

#Installing Jupyter Notebooks
apt install -y jupyter-notebook

#Installing nmap
apt install -y nmap

#Installing net-tools
apt install -y net-tools

#Installing john
apt install -y john

#Installing hashcat
apt install -y hashcat

#Installing metasploit
cd /root/Tools
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod 755 msfinstall
./msfinstall


#Installing radamnsa
cd /root/Tools
git clone https://gitlab.com/akihe/radamsa.git && cd radamsa && make && sudo make install

#Installing Ghidra
cd /root/Tools


# first install Java Amazon Corretto is a no-cost, multiplatform, production-ready distribution of the 
# Open Java Development Kit (OpenJDK). Corretto comes with long-term support that includes performance 
# enhancements and security fixes. 
wget https://corretto.aws/downloads/latest/amazon-corretto-11-x64-linux-jdk.deb
apt install -y ./amazon-corretto-11-x64-linux-jdk.deb
rm *.deb

#then download and unzip ghidra
wget https://ghidra-sre.org/ghidra_9.2_PUBLIC_20201113.zip
unzip ghidra_9*
rm -rf *.zip

#Installing EDB
apt install -y edb-debugger

#Installing gobuster
apt install -y gobuster

#Installing Sublist3r
cd /root/Tools
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
pip3 install -r requirements.txt

# installing enum4linux-ng
cd /root/Tools
git clone https://github.com/cddmp/enum4linux-ng && cd enum4linux-ng

#Installing Knock
cd /root/Tools
git clone https://github.com/guelfoweb/knock.git
cd knock
python3 setup.py install

#Download linpeas
cd /home/user
wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh

#Setting up the navigation HUB
cd /root
git clone https://github.com/Sptimus/Vulnerable_Host.git
rm /var/www/html/index.html
cp /root/Vulnerable_Host/hub/* /var/www/html

#Local Privilege Escalation
chmod 777 /etc/shadow
chmod 777 /etc/passwd
chmod u+s /bin/find
chmod u+s /bin/vim
chown root /bin/vim
cd /home/user
wget https://raw.githubusercontent.com/Sptimus/Vulnerable_Host/main/crontab.bak
crontab crontab.bak
touch script.sh
echo "#!/bin/bash" >> script.sh
chmod 777 script.sh

#Getting the container info script
sudo cd /root
curl -sSL https://raw.githubusercontent.com/Sptimus/Vulnerable_Host/main/containers.sh > /root/containers.sh

chmod +x /root/containers.sh
mv /root/containers.sh /usr/local/bin/containers 

#Final confirmation
sudo /usr/local/bin/containers
echo "
All set! All tools, apps, and containers have been installed and setup.
Have fun hacking!
To install OWASP ZAP and Burp Suite

Burp Suite:
Visit: https://portswigger.net/burp/releases/startdownload?product=community&version=2022.3.9&type=Linux

Then run:
sudo ./burpsuite_community_linux_v2022_3_9.sh 

OWASP Zap:
Visit: https://github.com/zaproxy/zaproxy/releases/download/v2.11.1/ZAP_2_11_1_unix.sh

Then run:
sudo ./ZAP_2_11_1_unix.sh
"
