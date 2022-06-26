FROM debian:buster

RUN apt-get update && apt-get install -y wget unzip php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip php-fpm
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY ./conf/www.conf  /etc/php/7.3/fpm/pool.d/www.conf
RUN mkdir /run/php
EXPOSE 9000
COPY ./tools/setup.sh /tmp
ENTRYPOINT [ "sh", "/tmp/setup.sh" ]
CMD [ "php-fpm7.3", "-F" ]
