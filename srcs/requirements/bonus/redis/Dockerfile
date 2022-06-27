FROM debian:buster

RUN apt update && apt upgrade -y

RUN apt install -y redis-server

RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/redis/redis.conf
CMD [ "redis-server", "--protected-mode", "no" ]