cp ~/nginx.conf /etc/nginx
mkdir -p  /etc/nginx/tls
openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/tls/nginx.crt \
		-keyout /etc/nginx/tls/nginx.key -subj '/CN=localhost'
cp ~/ftserver.conf /etc/nginx/conf.d
mkdir -p /usr/share/nginx/cache/fcgi
adduser --disabled-password --gecos "" ftserver
mkdir -p /home/ftserver/logs
rm /etc/nginx/sites-enabled/default
bash ~/restart_nginx.sh
