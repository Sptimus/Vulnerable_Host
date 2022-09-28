#!/usr/bin/env bash

# WebSploit installation script
# Author: Omar Ωr Santos
# Web: https://websploit.org
# Twitter: @santosomar
# Version: 3.1

wget https://websploit.org/install.sha

clear
echo "

██╗    ██╗███████╗██████╗ ███████╗██████╗ ██╗      ██████╗ ██╗████████╗
██║    ██║██╔════╝██╔══██╗██╔════╝██╔══██╗██║     ██╔═══██╗██║╚══██╔══╝
██║ █╗ ██║█████╗  ██████╔╝███████╗██████╔╝██║     ██║   ██║██║   ██║
██║███╗██║██╔══╝  ██╔══██╗╚════██║██╔═══╝ ██║     ██║   ██║██║   ██║
╚███╔███╔╝███████╗██████╔╝███████║██║     ███████╗╚██████╔╝██║   ██║
 ╚══╝╚══╝ ╚══════╝╚═════╝ ╚══════╝╚═╝     ╚══════╝ ╚═════╝ ╚═╝   ╚═╝
L A B S      B Y     O M A R   S A N T O S 

https://websploit.org
Author: Omar Ωr Santos
Twitter: @santosomar
Version: 3.1

A collection of tools, tutorials, resources, and intentionally vulnerable 
applications running in Docker containers. WebSploit Labs include 
over 450 exercises to learn and practice ethical hacking (penetration testing) skills.
--------------------------------------------------------------------------------------
Verifying install script SHA-512 checksum:
"

shasum -a 512 -c install.sha

read -n 1 -s -r -p "Press any key to continue the setup..."

echo " "
# Setting Up vim with Python Jedi to be used in several training courses

cd ~/
apt update
apt install -y wget vim vim-python-jedi curl exuberant-ctags git ack-grep python3-pip
pip3 install pep8 flake8 pyflakes isort yapf Flask

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo 'deb [arch=amd64] https://download.docker.com/linux/debian buster stable' | sudo tee /etc/apt/sources.list.d/docker.list
apt update
apt remove docker docker-engine docker.io
apt install -y docker-ce


echo "Installing Updating Docker-Compose!"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "getting docker-compose.yml from WebSploit.org"
wget https://websploit.org/docker-compose.yml


# instantiating the containers with docker-compose
echo "Setting up the containers and internal bridge network"
docker-compose -f docker-compose.yml up -d

# cloning NodeGoat
git clone https://github.com/OWASP/NodeGoat.git

#replacing the docker-compose.yml file with my second bridge network (10.6.7.0/24)
curl -sSL https://websploit.org/nodegoat-docker-compose.yml > /root/NodeGoat/docker-compose.yml


# downloading the nodegoat.sh script from websploit
# this will be used manually to setup the NodeGoat environment
wget https://websploit.org/nodegoat.sh
chmod 744 nodegoat.sh 

# downloading API Gateway configuration
mkdir /opt/api_gateway
wget https://websploit.org/api_gateway/config.yml
mv config.yml /opt/api_gateway/.

#cloning H4cker github
cd /root
git clone https://github.com/The-Art-of-Hacking/h4cker.git

#cloning SecLists
git clone https://github.com/danielmiessler/SecLists.git

#cloning GitTools
git clone https://github.com/internetwache/GitTools.git

#cloning Payloads All The Things - A list of useful payloads and bypasses for Web Application Security. 
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git

#getting test ssl script
#curl -L https://testssl.sh --output testssl.sh
#chmod +x testssl.sh

#Installing ffuf 
apt install -y ffuf

#Installing tor
apt install -y tor

#Installing Jupyter Notebooks
apt install -y jupyter-notebook

#Installing radamnsa
cd /root
git clone https://gitlab.com/akihe/radamsa.git && cd radamsa && make && sudo make install

#Installing Ghidra
#cd /root

# first install Java Amazon Corretto is a no-cost, multiplatform, production-ready distribution of the 
# Open Java Development Kit (OpenJDK). Corretto comes with long-term support that includes performance 
# enhancements and security fixes. 
#wget https://corretto.aws/downloads/latest/amazon-corretto-11-x64-linux-jdk.deb
#apt install -y ./amazon-corretto-11-x64-linux-jdk.deb
#rm *.deb

#then download and unzip ghidra
##wget https://ghidra-sre.org/ghidra_9.2_PUBLIC_20201113.zip
#unzip ghidra_9*
#rm -rf *.zip

#Installing EDB
apt install -y edb-debugger

#Installing gobuster
apt install -y gobuster

#Installing Sublist3r
cd /root
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
pip3 install -r requirements.txt

# installing enum4linux-ng
cd /root
git clone https://github.com/cddmp/enum4linux-ng && cd enum4linux-ng


#Installing searchsploit in Parrot
# Parrot does not come with searchsploit. This will install it if the user opts to use Parrot vs Kali.

distribution=$(lsb_release -i | awk '{print $(NF)}')
if [[ "$distribution" == "Parrot" ]];
then
  git clone https://github.com/offensive-security/exploitdb.git /opt/exploitdb
  ln -sf /opt/exploitdb/searchsploit /usr/local/bin/searchsploit
fi


#Installing Knock
cd /root
git clone https://github.com/guelfoweb/knock.git
cd knock
python3 setup.py install

#Installing OWASP ZAP
apt install -y zaproxy

#Getting the container info script
sudo cd /root
curl -sSL https://websploit.org/containers.sh > /root/containers.sh

chmod +x /root/containers.sh
mv /root/containers.sh /usr/local/bin/containers 

#Final confirmation
sudo /usr/local/bin/containers
echo "
All set! All tools, apps, and containers have been installed and setup.
Have fun hacking! - Ωr
"
