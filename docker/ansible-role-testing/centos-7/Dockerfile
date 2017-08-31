# Ansible Role Testing (art) image of centos-7
# docker build -t art-centos-7:latest .

FROM centos:7
MAINTAINER "Michal Welenc" <michal.welenc@misys.com>

RUN yum -y update; \
    yum -y install epel-release.noarch; \
    yum -y install ansible
