##to do
#	- wp-conf.php
#	- mysql script

mv nginx.conf /etc/nginx/.
mv my_site /etc/nginx/sites-available/.
ln -s /etc/nginx/sites-available/my_site /etc/nginx/sites-enabled/.
mv hosts /etc/.

bash create_database.sh

service nginx start