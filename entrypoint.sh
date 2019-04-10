#!/bin/bash
set -e

/opt/gitlab/embedded/bin/runsvdir-start & gitlab-ctl reconfigure
ldapsearch -x -H ldap://172.17.77.99 -D "cn=Manager,dc=work,dc=fiinlab,dc=local" -w F11nl4b -b "cn=git,ou=Group,dc=work,dc=fiinlab,dc=local" | grep member | cut -d "=" -f2 | tr ',' ' ' | awk '{print $1}' > /users_ldap.txt
cd / && ./runfixldap.sh
while true; do sleep 1; done

exec "$@"