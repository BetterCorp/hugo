ARG HUGO_VERSION=0.115.4

FROM golang:1.20.6-bullseye

RUN apt update -y
RUN apt install tar gzip build-essential -y
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt-get install -y nodejs
RUN npm i -g yarn pnpm
RUN mkdir /tmp/temph
RUN mkdir /home/app
WORKDIR /tmp/temph
RUN wget https://github.com/gohugoio/hugo/releases/download/v$HUGO_VERSION/hugo_extended_$HUGO_VERSION_Linux-64bit.tar.gz
RUN tar xf ./hugo_extended_$HUGO_VERSION_Linux-64bit.tar.gz 
RUN mv ./hugo /usr/bin/hugo

WORKDIR /home/app

ENTRYPOINT [ "/bin/bash" ]