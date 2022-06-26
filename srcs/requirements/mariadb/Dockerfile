FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/Database.sql .
RUN service mysql start && mysql -u root < Database.sql
EXPOSE 3306
CMD ["mysqld_safe"]
