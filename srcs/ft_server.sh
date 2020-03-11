#creation of my_site directories
mkdir /var/www/my_site.com
chown -R www-data: /var/www/my_site.com

#configuration of nginx
mv nginx.conf /etc/nginx/.
mv my_site.com.conf /etc/nginx/sites-available/.
rm /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/my_site.com.conf /etc/nginx/sites-enabled/.

#ssl key and certificate creation
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/my_site.pem -keyout /etc/ssl/private/my_site.key -subj \
"/C=FR/ST=Paris/L=Paris/O=NA/OU=NA/CN=abarot"

#download phpmyadmin to my_site 
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.4/phpMyAdmin-4.9.4-all-languages.tar.gz
tar xf phpMyAdmin-4.9.4-all-languages.tar.gz 
mv phpMyAdmin-4.9.4-all-languages phpmyadmin
mv phpmyadmin var/www/my_site.com/.

#download wordpress to my_site
wget https://wordpress.org/latest.tar.gz
tar xf latest.tar.gz
chown -R www-data:www-data wordpress
chmod 755 -R wordpress
mv wordpress my_blog
mv my_blog var/www/my_site.com/.

#creating database
bash db_create.sh

#starting nginx and php-fpm service
service nginx start
service php7.3-fpm start

#cleaning root
rm latest.tar.gz
rm phpMyAdmin-4.9.4-all-languages.tar.gz
rm db_create.sh
rm ft_server.sh

bash