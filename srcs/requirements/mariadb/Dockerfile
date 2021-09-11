FROM debian:buster

ARG USER_NAME=spark
ARG USER_PASSWORD=0000
ARG DB=wordpress_db

RUN apt-get update -y && apt-get upgrade -y; \
    apt-get -y install mariadb-server;

RUN sed -i 's/bind-address/#bind-address/' /etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mysql start && mysql -e "CREATE DATABASE ${DB}; \
            CREATE USER '${USER_NAME}'@'%' IDENTIFIED BY '${USER_PASSWORD}'; \
            GRANT ALL ON ${DB}.* TO '${USER_NAME}'@'%'; \
            FLUSH PRIVILEGES;"
EXPOSE 3306

CMD ["mysqld"]