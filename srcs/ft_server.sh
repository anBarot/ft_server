#creation of my_site directories
mkdir /var/www/my_site.com
chown -R www-data: /var/www/my_site.com
mv my_site_index.html /var/www/my_site.com/.
ln -s /usr/share/phpmyadmin /var/www/my_site.com/.

#configuration of nginx
mv nginx.conf /etc/nginx/.
mv my_site.com.conf /etc/nginx/sites-available/.
rm /etc/nginx/sites-available/default
rm /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/my_site.com.conf /etc/nginx/sites-enabled/.

#ssl key and certificate migration
mv my_site.key /etc/ssl/private/.
mv my_site.crt /etc/ssl/certs/.

# bash create_database.sh

#wordpress file transfer to my_site
wget https://wordpress.org/latest.tar.gz
tar xf latest.tar.gz
mv  /wordpress var/www/my_site.com/.

#starting nginx service
service nginx start

#cleaning root
rm latest.tar.gz
rm -rf wordpress
rm create_database.sh
rm ft_server.sh