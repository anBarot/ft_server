mysql -u root -p wp_database --default-character-set=utf8
CREATE USER 'abarot'@'localhost' IDENTIFIED BY 'mdp';
CREATE DATABASE wp_database CHARACTER SET 'utf8';
GRANT ALL PRIVILEGES ON <nom bd> TO 'abarot'@'localhost';
