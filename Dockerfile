FROM debian:buster

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y php-mysql php-fpm php-cli php-mysql php-curl php-gd php-intl
RUN apt-get install -y nginx
RUN apt-get install -y wordpress
RUN apt-get install -y mariadb-server
RUN apt-get install -y openssl
COPY ./srcs .
CMD bash ft_server.sh && tail -f /dev/null