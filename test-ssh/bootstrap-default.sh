#!/bin/bash

echo "Username :" $1
echo "Password :" $2

sudo adduser $1 --gecos "Administrator" --disabled-password
echo $1":"$2 | sudo chpasswd

sudo usermod -aG sudo admin



#just use this to copy to the machines
#ssh-copy-id admin@test