FROM doomtreader.jaak-it.com:8083/jaakit_base:0.0.1 as base

FROM base as builder

MAINTAINER JAAK-IT <hello@jaak-it.com>

RUN yum install -y curl policycoreutils-python openssh-server openssh-clients

RUN systemctl enable sshd

#RUN systemctl start sshd

RUN yum -y install postfix

RUN systemctl enable postfix

#RUN systemctl start postfix

RUN curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | sudo bash

RUN EXTERNAL_URL="http://gitlab.fiinlab.jaak-it.com" yum install -y gitlab-ee

EXPOSE 8080