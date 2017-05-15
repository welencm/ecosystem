#!/bin/bash

echo "[INFO] Install ansible and git"
if [[ -f /etc/redhat-release ]]; then
  sudo yum -y update
  sudo yum -y install epel-release.noarch
  sudo yum -y install ansible
else
  sudo apt-get install software-properties-common
  sudo apt-add-repository ppa:ansible/ansible
  sudo apt-get update -q
  sudo apt-get install -y ansible
fi

echo "[INFO] Configure hosts file"
sudo tee -a /etc/hosts > /dev/null <<EOL
10.0.0.10 controller
10.0.0.20 desktop-ubuntu
EOL

echo "[INFO] Generate SSH key"
if [ ! -f ${HOME}/.ssh/id_rsa.pub ]; then
    sudo -u ${USER} ssh-keygen -t rsa -b 2048 -f ${HOME}/.ssh/id_rsa -q -N ""
    cat ${HOME}/.ssh/id_rsa.pub >> ${HOME}/.ssh/authorized_keys
fi

if [[ "${USER}" == "ubuntu" ]]; then
  echo "[INFO] Set password for user ${USER}"
  echo 'ubuntu:$6$IR67Da8C$IE.9h/ECXI4Z9S1h6kgLuRXdrr7Qv4F6UeKzA.tXY.x5Lx7SaTYfD7mTW6dMS1nxF2R62fMVIqNkZVo.Kn8vW0' | sudo chpasswd -e
fi
