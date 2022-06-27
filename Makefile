# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abdait-m <abdait-m@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/23 23:35:38 by abdait-m          #+#    #+#              #
#    Updated: 2022/06/27 13:38:30 by abdait-m         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SERVICES = wordpress nginx mariadb adminer redis website

DCMP = srcs/docker-compose.yml

VOLUMES = `docker volume ls -q`

set:
	mkdir -p /home/abdait-m/data/wp /home/abdait-m/data/db
	echo "127.0.0.1 abdait-m.42.fr" >> /etc/hosts

all: set
	docker-compose -f $(DCMP) up -d --build

clean:
	docker-compose -f $(DCMP) down

remove_imgs:
	docker rmi -f $(SERVICES) || true

remove_volumes:
	docker volume rm $(VOLUMES) || true

fclean: clean remove_imgs remove_volumes

re: fclean all