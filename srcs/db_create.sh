service mysql start
echo "CREATE DATABASE wp_database;" | mysql -u root --skip-password --default-character-set=utf8
echo "CREATE USER \"user_test\"@\"localhost\";" | mysql -u root --skip-password --default-character-set=utf8
echo "GRANT ALL PRIVILEGES ON wp_database.* TO 'user_test'@'localhost';" | mysql -u root --skip-password --default-character-set=utf8
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password --default-character-set=utf8