FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && \
	apt-get install wget -y && \
	apt-get install apache2 php libapache2-mod-php php-curl php-cli php-mysql php-gd mariadb-server -y


# change the listener port of the apache2 server
COPY ./script/setup.sh .
RUN chmod +x setup.sh
# get adminer setup of the apache2 server
RUN wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php
# chown the adminer file to the apache2 server
RUN chown -R www-data:www-data /var/www/html/adminer.php
RUN chmod 755 /var/www/html/adminer.php
CMD [ "sh", "setup.sh" ] 