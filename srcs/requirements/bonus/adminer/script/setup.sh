echo "ServerName 0.0.0.0" >> /etc/apache2/apache2.conf;
service apache2 start;
php -S localhost:8000;