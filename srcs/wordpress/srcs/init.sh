#! /bin/bash

path=/home/ftserver/public_html
url="motoure.42.fr"
title="site_inception"
admin_user=$DB_USER
admin_password=$DB_PSWD
admin_email=xxx@xxx.fr

function wp-cli () #path url title admin_user admin_password admin_email
{
	wp --allow-root core install \
	--path=$1 \
	--url=$2/ \
	--title=$3 \
	--admin_user=$4 \
	--admin_password=$5 \
	--admin_email=$6
}

function use_template()
{
	cp ~/wp-config-template.php /home/ftserver/public_html/wp-config.php
	sed -i "s/__DB_NAME__/${DB_NAME}/g" /home/ftserver/public_html/wp-config.php
	sed -i "s/__DB_PSWD__/${DB_PSWD}/g" /home/ftserver/public_html/wp-config.php
	sed -i "s/__DB_USER__/${DB_USER}/g" /home/ftserver/public_html/wp-config.php
	cat /home/ftserver/public_html/wp-config.php
}

if [[ $(ls ~/wp-config-template.php | wc -c) -ne 0 ]];
then
	use_template;
	wp-cli $path $title $admin_user $admin_password $admin_email;
	if [[ $? -ne 0 ]];
	then
		echo "wp-cli failed . . . retrying in 10 seconds";
		sleep 10;
		wp-cli $path $url $title $admin_user $admin_password $admin_email;
	fi
	rm -rf ~/wp-config-template.php;
fi
php-fpm7.3 -F

