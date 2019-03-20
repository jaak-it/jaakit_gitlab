#!/bin/bash
set -e

/opt/gitlab/embedded/bin/runsvdir-start & gitlab-ctl reconfigure
#EXTERNAL_URL="http://gitlab.fiinlab.jaak-it.com" yum install -y gitlab-ce

exec "$@"