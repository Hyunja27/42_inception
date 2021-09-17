FROM debian:buster

# ARG USER_NAME=spark
# ARG USER_PASSWORD=0000
# ARG DB=wordpress_db
# ARG DB=mariadb
ARG NGINX_REQUIREMENTS="nginx openssl vim"

RUN apt-get update -y && apt-get upgrade -y; \
    apt-get -y install ${NGINX_REQUIREMENTS}

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=spark/CN=spark.42.fr" \
    -keyout /etc/ssl/private/server_pkey.pem -out /etc/ssl/certs/server.crt;

# COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./default /etc/nginx/sites-available/ 
# RUN cp /default /etc/nginx/sites-available/default;

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]