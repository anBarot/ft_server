# to dos : 
	# - mettre htmls dans /var/www (redirection)
	# - creer config file :
	# 	- mysql-conf
	# 	- phpadm-conf
	# 	- wordpress-conf

apt-get update
apt-get install -y nginx
apt-get install -y php-mysql
apt-get install -y php-fpm php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli php-mcrypt php-ldap php-zip php-curl
apt-get install -y wordpress
apt-get install -y mariadb-server
apt-get install -y openssl

cp  ./wordpress-conf /etc/nginx/sites-available/.
cp  ./mysql-conf /etc/nginx/sites-available/.
cp  ./phpadm-conf /etc/nginx/sites-available/.

service nginx start