#creation of my_site directories
mkdir /var/www/my_site.com
mv index.html /var/www/my_site.com/.

#configuration of nginx
mv nginx.conf /etc/nginx/.
mv my_site.com.conf /etc/nginx/sites-available/.
rm /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/my_site.com.conf /etc/nginx/sites-enabled/.

#ssl key and self-signed certificate creation
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/my_site.pem -keyout /etc/ssl/private/my_site.key \
-subj "/C=FR/ST=Paris/L=Paris/O=NA/OU=abarot/CN=mysite.com"

#creating database
service mysql start
echo "CREATE DATABASE wp_database;" | mysql -u root --skip-password --default-character-set=utf8
echo "CREATE USER \"wp_user\"@\"localhost\" IDENTIFIED BY 'psw';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wp_database.* TO 'wp_user'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

#download phpmyadmin to my_site 
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.4/phpMyAdmin-4.9.4-all-languages.tar.gz
tar xf phpMyAdmin-4.9.4-all-languages.tar.gz 
chown -R www-data:www-data phpMyAdmin-4.9.4-all-languages
chmod 755 -R phpMyAdmin-4.9.4-all-languages
mv phpMyAdmin-4.9.4-all-languages var/www/my_site.com/phpmyadmin

#download wordpress to my_site
wget https://wordpress.org/latest.tar.gz
tar xf latest.tar.gz
chown -R www-data:www-data wordpress
chmod 755 -R wordpress
mv wp-config.php wordpress/.
mv wordpress var/www/my_site.com/my_blog

#starting nginx and php-fpm service
service nginx start
service php7.3-fpm start

#cleaning root
rm latest.tar.gz
rm phpMyAdmin-4.9.4-all-languages.tar.gz
rm ft_server.sh

bash