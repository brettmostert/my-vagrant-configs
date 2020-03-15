#!/bin/bash
#~/.ssh/id_rsa.pub

echo $1
echo $2

sudo adduser $1 --gecos "Administrator" --disabled-password
echo $1":"$2 | sudo chpasswd

sudo usermod -aG sudo admin

# echo -e "root\nroot" | sudo passwd root

#Should really use keys here ... https://help.ubuntu.com/community/SSH/OpenSSH/Keys but anyways :)
# sudo sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# sudo service ssh restart