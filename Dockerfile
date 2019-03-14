#FROM doomtreader.jaak-it.com:8083/jaakit_base:0.0.1 as base
FROM centos:latest as base

FROM base as builder

MAINTAINER JAAK-IT <hello@jaak-it.com>

ENV container docker

RUN yum -y update; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN yum -y install epel-release https://centos7.iuscommunity.org/ius-release.rpm

RUN yum install -y curl policycoreutils-python openssh-server openssh-clients

RUN systemctl enable sshd

#RUN systemctl start sshd

RUN yum -y install postfix

RUN systemctl enable postfix

#RUN systemctl start postfix

# Setup the GitLab RPM repo
# RUN curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | bash
RUN curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | bash

#Install GitLab
#RUN EXTERNAL_URL="http://gitlab.fiinlab.jaak-it.com" yum install -y gitlab-ee
RUN EXTERNAL_URL="http://gitlab.fiinlab.jaak-it.com" yum install -y gitlab-ce

EXPOSE 8080

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]