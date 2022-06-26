FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl
RUN mkdir -p /etc/ssl /etc/ssl/private /etc/ssl/certs/
COPY ./conf/ssl/cert.crt /etc/ssl/certs/.crt
COPY ./conf/ssl/key.key /etc/ssl/private/key.key
COPY ./conf/ssl/server.conf /etc/nginx/sites-available/wordpress.conf
RUN ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/
EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]