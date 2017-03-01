#!/bin/bash

# install ansible
echo "[INFO] Install ansible"
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update -q
sudo apt-get install -y ansible

# install git
echo "[INFO] Install git"
sudo apt-get install -y git

