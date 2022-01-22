FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server expect procps
COPY ./srcs/* /root/
RUN mv /root/mysql.cnf /etc/mysql/conf.d
EXPOSE 3306
RUN chmod 777 ~/*.sh ~/*exp #To avoid permission issues =-)
ENTRYPOINT ~/init.sh
