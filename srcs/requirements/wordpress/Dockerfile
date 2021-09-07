FROM debian:buster

ARG USER_NAME=spark
ARG USER_PASSWORD=0000
ARG DB=wordpress_db
ARG DB_KIND=mariadb
ARG WP_REQUIREMENTS="php7.3 \
                 php-fpm \
                 php-cli \
                 wget \
                 curl \
                 php-mysql \
                 php-mbstring \
                 php-xml \
                 sendmail \
                 vim"

RUN apt-get update -y && apt-get upgrade -y; \
    apt-get -y install ${WP_REQUIREMENTS}

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvf latest.tar.gz;

RUN mkdir -p /var/www/html;

RUN mv /wordpress/* /var/www/html/ && \
    chown -R www-data:www-data /var/www/html && \
    rm -r /wordpress && rm latest.tar.gz;

RUN mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php; \
    sed -i "s/database_name_here/${DB}/g" /var/www/html/wp-config.php; \
    sed -i "s/username_here/${USER_NAME}/g" /var/www/html/wp-config.php; \
    sed -i "s/password_here/${USER_PASSWORD}/g" /var/www/html/wp-config.php; \
    sed -i "s/localhost/${DB_KIND}}/g" /var/www/html/wp-config.php;

RUN sed -i "s/run\/php\/php7.3-fpm.sock/0.0.0.0:9000/g" /etc/php/7.3/fpm/pool.d/www.conf

RUN service php7.3-fpm start
