!#/bin/sh

apt update;
# apt upgrade -y;
apt install -y nginx openssl ufw;
ufw enable;
ufw allow 'Nginx HTTPS';

cp /etc/tmp/server.conf /etc/nginx/sites-available/default 
service nginx start;
tail -f /var/log/nginx/access.log;
nginx -g daemon off;