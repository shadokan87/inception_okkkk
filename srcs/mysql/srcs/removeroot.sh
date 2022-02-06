#! /bin/bash
sleep 8
mysql -u root << EOF
SELECT host, user, password, plugin FROM mysql.user;
UPDATE mysql.user SET plugin = '' WHERE user = 'root' AND host = 'localhost';
FLUSH PRIVILEGES;
EOF
