# to dos : 
	# - mettre htmls dans /var/www (redirection)
	# - creer config file :
	# 	- mysql-conf
	# 	- phpadm-conf
	# 	- wordpress-conf

apt-get update
brew install nginx
brew install php-mysql
brew install php-fpm php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli php-mcrypt php-ldap php-zip php-curl
brew install wordpress
brew install mariadb-server
brew install openssl

cp  ./wordpress-conf /etc/nginx/sites-available/.
cp  ./mysql-conf /etc/nginx/sites-available/.
cp  ./phpadm-conf /etc/nginx/sites-available/.

brew services start nginx