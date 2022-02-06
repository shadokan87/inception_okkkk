#! /bin/bash
#sleep 30
mysql -u root -p$DB_PSWD<< EOF
SELECT host, user, password, plugin FROM mysql.user;
UPDATE mysql.user SET plugin = 'unix_socket' WHERE user = 'root' AND host = 'localhost';
FLUSH PRIVILEGES;
EOF
