FROM debian:buster
RUN apt-get update && apt-get install -y wget php7.3-fpm php7.3-mysql php7.3-json php7.3-xmlrpc php7.3-curl php7.3-gd php7.3-xml php7.3-mbstring expect
COPY ./srcs/* /root/
# -- downloading wp-cli to bypass wordpress frond-end configuration AND chmod'ing every .sh in root folder
RUN  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mv wp-cli.phar /usr/bin/wp && chmod 777 /usr/bin/wp ~/*.sh
# -- configure php, install wordpress and phpmyadmin
RUN bash ~/configure_php.sh
RUN bash ~/install_wordpress.sh
# --
EXPOSE 9000
ENTRYPOINT ~/init.sh
