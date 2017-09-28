# Ansible Role Testing (art) image of ubuntu-1604
# docker build -t welencm/art-ubuntu-1604:latest .

FROM ubuntu:xenial
MAINTAINER "Michal Welenc" <welencm@gmail.com>

RUN apt-get update -q && \
    apt-get install -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update -q && \
    apt-get install -y ansible apt-transport-https zip unzip&& \
    apt-get clean

CMD ["/bin/bash"]
