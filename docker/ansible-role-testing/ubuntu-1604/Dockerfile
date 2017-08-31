# Ansible Role Testing (art) image of ubuntu-1604
# docker build -t art-ubuntu-1604:latest .

FROM ubuntu:xenial
MAINTAINER "Michal Welenc" <michal.welenc@misys.com>

RUN apt-get update -q; \
    apt-get install -y software-properties-common; \
    apt-add-repository ppa:ansible/ansible; \
    apt-get update -q; \
    apt-get install -y ansible apt-transport-https
