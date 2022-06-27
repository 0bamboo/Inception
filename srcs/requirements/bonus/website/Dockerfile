FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y \
	curl \
	git
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | sh
RUN apt update && apt install -y nodejs
RUN git clone https://github.com/nowl01/demo.git /demo
WORKDIR /demo/next-app
RUN npm install
CMD ["npm", "run", "dev"]
