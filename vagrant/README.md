# Vagrant
## General information
Vagrant is used for creating and managing VMs that are part of the ecosystem.

Important files:
- Vagrantfile
- vagrant-inventory-home.yml
- vagrant-inventory-work.yml
- provision.sh

## IP addresses
VM's are assigned with IP addresses in following pattern: 10.0.0.[XX]

Special addresses:
- 20 - controller
- 21 - desktop-ubuntu
- 22 - jenkins-master

Groups:
- 30-49 - work VMs
- 50-69 - home VMs
- 60-69 - Windows VMs

## Port forwarding
- SSH XX22
- RDP XX89
- HTTP XX80
