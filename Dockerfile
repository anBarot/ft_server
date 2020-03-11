FROM debian:buster
LABEL maintainer="abarot@42.student.fr"

EXPOSE 80
EXPOSE 443

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y vim
RUN apt-get install -y nginx
RUN apt-get install -y openssl
RUN apt-get install -y php7.3-fpm 
RUN apt-get install -y php-cli php-mysql php-curl php-gd php-intl php-fpm
RUN apt-get install -y wget
RUN apt-get install -y mariadb-server mariadb-client
COPY srcs/ .
CMD bash ft_server.sh