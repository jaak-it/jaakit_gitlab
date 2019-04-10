#!bin/bash
for line in $(cat /users_ldap.txt);
do
       USER=$(echo $line)
       cd / && ./fixldap.sh "$USER"
done