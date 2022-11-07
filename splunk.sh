#!/usr/bin/env bash
echo " "
# Setting Up default Tools

cd ~/
apt update
apt install -y wget vim vim-python-jedi curl exuberant-ctags git ack-grep python3-pip git
pip3 install pep8 flake8 pyflakes isort yapf Flask

#Installing apache
apt install -y apache2
ufw allow 'Apache'
wget https://raw.githubusercontent.com/Sptimus/Vulnerable_Host/main/ports.conf
rm /etc/apache2/ports.conf
mv ports.conf /etc/apache2/
systemctl stop apache2
systemctl start apache2

echo "Installing Splunk and necessary dependencies!"
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo 'deb [arch=amd64] https://download.docker.com/linux/debian buster stable' | sudo tee /etc/apt/sources.list.d/docker.list
apt update
apt remove docker docker-engine docker.io
apt install -y docker-ce

echo "Installing Updating Docker-Compose!"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker run -d --mount source=logs-webgoat,target=/mnt/webgoat --mount source=logs-juice-shop,target=/mnt/juice-shop --mount source=logs-mutillidae_2,target=/mnt/mutillidae_2 --mount source=logs-dvwa,target=/mnt/dvwa --mount source=logs-hackazon,target=/mnt/hackazon -p 8000:8000 -p 8088:8088 -e "SPLUNK_START_ARGS=--accept-license" -e "SPLUNK_PASSWORD=Adam1000" --name splunk splunk/splunk:latest

echo "Please now ADD your Splunk token to .env file in /root directory use instructions .pdf file to configure splunk. Then run sudo ./install.sh"
