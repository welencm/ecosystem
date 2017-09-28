# Ansible Role Testing (art) image of centos-7
# docker build -t welencm/art-centos-7:latest .

FROM centos:7
MAINTAINER "Michal Welenc" <welencm@gmail.com>

RUN yum -y update && \
    yum -y install epel-release.noarch && \
    yum -y install ansible which zip unzip && \
    yum clean all

CMD ["/bin/bash"]
