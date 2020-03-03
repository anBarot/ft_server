FROM debian:buster

# COPY srcs/wordpress.tgz /root/.
# COPY srcs/wp-database.sql /root/.
# COPY srcs/nginx-conf  /root/.
COPY srcs/ft_server.sh .
CMD bash ft_server.sh && tail -f /dev/null