#!/bin/bash
sudo apt update

curl https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.deb -o ~/vagrant_2.2.7_x86_64.deb
sudo apt install -y ~/vagrant_2.2.7_x86_64.deb

vagrant --version

export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
export PATH="$PATH:/c/Program Files/Hyper-V"