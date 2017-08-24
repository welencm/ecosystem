# Ansible Role Testing (art) image of ubuntu-xenial
# docker build -t art-ubuntu-xenial:latest .

FROM ubuntu:xenial
MAINTAINER "Michal Welenc" <michal.welenc@misys.com>

RUN apt-get update -q; \
    apt-get install -y software-properties-common; \
    apt-add-repository ppa:ansible/ansible; \
    apt-get update -q; \
    apt-get install -y ansible
