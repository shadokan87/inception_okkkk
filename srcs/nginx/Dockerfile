FROM debian:buster

RUN apt-get update && apt-get install -y wget nginx openssl dumb-init
COPY ./srcs/* /root/
RUN bash ~/configure_nginx.sh
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["nginx", "-g", "daemon off;"]
