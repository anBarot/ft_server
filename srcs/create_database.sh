mysql -u root -p wp_database --default-character-set=utf8 \
CREATE USER 'abarot'@'localhost' IDENTIFIED BY ''; \
CREATE DATABASE wordpress CHARACTER SET 'utf8'; \
GRANT ALL PRIVILEGES ON wp_database TO 'abarot'@'localhost';
