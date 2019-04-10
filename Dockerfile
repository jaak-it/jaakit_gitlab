FROM doomtreader.jaak-it.com:8083/jaakit_base:0.0.1 as base

FROM base as builder

MAINTAINER JAAK-IT <hello@jaak-it.com>

RUN yum install -y curl policycoreutils-python openssh-server openssh-clients

RUN systemctl enable sshd

RUN yum -y install postfix

RUN systemctl enable postfix

RUN yum -y install ruby redis which

RUN systemctl enable redis

# Setup the GitLab RPM repo
RUN curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | bash

#Install GitLab
#RUN EXTERNAL_URL="http://gitlab.fiinlab.jaak-it.com" yum install -y gitlab-ce
RUN yum install -y gitlab-ce
RUN yum install -y openldap openldap-clients

# Copy configuration file to gitlab-ctl reconfigure
COPY gitlab.rb /etc/gitlab/gitlab.rb

# Reconfigure gitlab
RUN /opt/gitlab/embedded/bin/runsvdir-start & gitlab-ctl reconfigure; exit 0
RUN /opt/gitlab/embedded/bin/runsvdir-start & gitlab-ctl reconfigure; exit 0
RUN /opt/gitlab/embedded/bin/runsvdir-start & gitlab-ctl reconfigure; exit 0
RUN /opt/gitlab/embedded/bin/runsvdir-start & gitlab-ctl reconfigure; exit 0
RUN /opt/gitlab/embedded/bin/runsvdir-start & gitlab-ctl reconfigure; exit 0
RUN /opt/gitlab/embedded/bin/runsvdir-start & gitlab-ctl reconfigure; exit 0
RUN /opt/gitlab/embedded/bin/runsvdir-start & gitlab-ctl reconfigure; exit 0
RUN /opt/gitlab/embedded/bin/runsvdir-start & gitlab-ctl reconfigure; exit 0
RUN /opt/gitlab/embedded/bin/runsvdir-start & gitlab-ctl reconfigure

COPY ./fixldap.sh /
RUN chmod +x ./fixldap.sh

COPY ./runfixldap.sh /
RUN chmod +x ./runfixldap.sh

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 80

VOLUME ["/etc/gitlab", "/var/opt/gitlab", "/var/log/gitlab", "/sys/fs/cgroup"]