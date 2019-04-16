#!/bin/bash
set -e

/opt/gitlab/embedded/bin/runsvdir-start & gitlab-ctl reconfigure
while true; do sleep 1; done

exec "$@"