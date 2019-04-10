#! /bin/sh

username=$1


utente=$(gitlab-psql -c "select id,username from users where username= '$username';" |grep $username | cut -c2-3)

email=$username@jaak-it.com

gitlab-psql -c "insert into emails (user_id,email,created_at,updated_at,confirmed_at) values ($utente,'$email',now(),now(),now());"
gitlab-psql -c "update users set email='$email' where id=$utente;"