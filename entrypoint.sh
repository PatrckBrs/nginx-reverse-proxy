#!/bin/bash

NGINX_FOLDER="/etc/nginx/sites-available"

if [ ! "$(ls -A $NGINX_FOLDER)" ]
then
	echo "$NGINX_FOLDER is empty!"
else
	echo "$NGINX_FOLDER is not empty"
	for WEBSITES in $(ls $NGINX_FOLDER/* | awk -F/ '{print $NF}')
	do
		ln -s /etc/nginx/sites-available/$WEBSITES /etc/nginx/sites-enabled/$WEBSITES
	done
fi
/usr/sbin/nginx && tail -f /var/log/nginx/*
