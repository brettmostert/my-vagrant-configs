#!/bin/bash
echo -----------------------------------Provisioning Script - DEFAULT
echo -----------------------------------Provisioning Script - DEFAULT - Updating System Libs...

apt update

#This is for the mere mortals using windows and that still want to be able to use the guest hostname.
sudo apt install -y samba

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo -e "root\nroot" | sudo passwd root

#Should really use keys here ... https://help.ubuntu.com/community/SSH/OpenSSH/Keys but anyways :)
sudo sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo service ssh restart