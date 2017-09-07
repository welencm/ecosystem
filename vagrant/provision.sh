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

echo "[INFO] Authorize ssh keys"
mkdir -p ${HOME}/.ssh
cat /vagrant/id_rsa.pub >> ${HOME}/.ssh/authorized_keys
