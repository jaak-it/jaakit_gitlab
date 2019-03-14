FROM doomtreader.jaak-it.com:8083/jaakit_base:0.0.1 as base

FROM base as builder

MAINTAINER JAAK-IT <hello@jaak-it.com>

RUN yum install -y curl policycoreutils-python openssh-server openssh-clients

RUN yum -y install postfix

RUN systemctl enable postfix.service

RUN systemctl start postfix.service

EXPOSE 8080