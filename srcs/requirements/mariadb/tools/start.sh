service mysql start;
echo "CREATE DATABASE $DB;" | mysql;
echo "CREATE USER '$USER_NAME'@'%' IDENTIFIED BY '$USER_PASSWORD';" | mysql;
echo "GRANT ALL PRIVILEGES ON $DB.* TO '$USER_NAME'@'%';" | mysql;
echo "FLUSH PRIVILEGES;" | mysql;
mysqld;