FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y; \
    apt-get -y install mariadb-server vim dumb-init

RUN sed -i 's/bind-address/#bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/start.sh /

RUN chmod 777 /start.sh

ENTRYPOINT	[ "/usr/bin/dumb-init" ]

EXPOSE 3306

CMD [ "/start.sh" ]
