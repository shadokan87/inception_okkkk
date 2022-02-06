#! /bin/bash
mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS __DB_NAME__;
CREATE USER '__DB_USER__'@'localhost' IDENTIFIED BY '__DB_PSWD__';
GRANT ALL PRIVILEGES ON *.* TO __DB_USER__@localhost;
CREATE USER 'IamBob'@'localhost' IDENTIFIED BY 'IamDumb';
GRANT ALL PRIVILEGES ON *.* TO IamBob@localhost;
ALTER USER root@localhost IDENTIFIED VIA mysql_native_password;
SET PASSWORD = PASSWORD("$DB_PSWD");
FLUSH PRIVILEGES;
EOF
