FROM debian:buster

ARG WP_REQUIREMENTS="php7.3 \
                 php-fpm \
                 php-cli \
                 wget \
                 curl \
                 php-mysql \
                 php-mbstring \
                 php-xml \
                 sendmail \
                 dumb-init \
                 vim"

RUN apt-get update -y && apt-get upgrade -y; \
    apt-get -y install ${WP_REQUIREMENTS}

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvf latest.tar.gz

RUN mkdir -p /var/www/html

RUN mv /wordpress/* /var/www/html/ && \
    chown -R www-data:www-data /var/www/html && \
    rm -r /wordpress && rm latest.tar.gz

COPY ./tools/start.sh /

RUN chmod 777 /start.sh

RUN mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php; \
    echo  "listen = 0.0.0.0:9000" >> /etc/php/7.3/fpm/pool.d/www.conf; \
    sed -i -e "s|;daemonize = yes|daemonize = no|g" /etc/php/7.3/fpm/php-fpm.conf

RUN mkdir -p /run/php/

ENTRYPOINT	[ "/usr/bin/dumb-init" ]

EXPOSE 9000

CMD	[ "/start.sh" ]
