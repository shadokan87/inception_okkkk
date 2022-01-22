#! /bin/bash
if [[ $(ls ~/wp-config-template.php | wc -c) -ne 0 ]];
then
	cp ~/wp-config-template.php /home/ftserver/public_html/wp-config.php
	sed -i "s/__DB_NAME__/${DB_NAME}/g" /home/ftserver/public_html/wp-config.php
	sed -i "s/__DB_PSWD__/${DB_PSWD}/g" /home/ftserver/public_html/wp-config.php
	sed -i "s/__DB_USER__/${DB_USER}/g" /home/ftserver/public_html/wp-config.php
	cat /home/ftserver/public_html/wp-config.php
	wp --allow-root core install --path=/home/ftserver/public_html --url=https://motoure.42.fr/ \
	--title="site_inception" --admin_user=$DB_USER --admin_password=$DB_PSWD --admin_email=xxx@xxx.fr
	rm -rf ~/wp-config-template.php 
fi
php-fpm7.3 -F

