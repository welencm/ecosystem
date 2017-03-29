#!/bin/bash

echo "[INFO] Install Ansible"
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update -q
sudo apt-get install -y ansible

echo "[INFO] Install git"
sudo apt-get install -y git

echo "[INFO] Configure hosts file"
sudo tee -a /etc/hosts > /dev/null <<EOL
10.0.0.10 controller
10.0.0.11 desktop
EOL

echo "[INFO] Generate SSH key"
if [ ! -f /home/ubuntu/.ssh/id_rsa.pub ]; then
    sudo -u ubuntu ssh-keygen -t rsa -b 2048 -f /home/ubuntu/.ssh/id_rsa -q -N ""
fi

echo "[INFO] Set password for user ubuntu"
echo 'ubuntu:$6$IR67Da8C$IE.9h/ECXI4Z9S1h6kgLuRXdrr7Qv4F6UeKzA.tXY.x5Lx7SaTYfD7mTW6dMS1nxF2R62fMVIqNkZVo.Kn8vW0' | sudo chpasswd -e
