ARG GO_VERSION="1.20"
FROM golang:${GO_VERSION}-bullseye

ARG HUGO_VERSION="0.115.4"
ARG NODE_VERSION="18"

RUN apt update -y
RUN apt install tar gzip build-essential -y
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt-get install -y nodejs
RUN npm i -g yarn pnpm
RUN mkdir /tmp/temph
RUN mkdir /home/app
WORKDIR /tmp/temph
RUN wget "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz"
RUN tar xf "hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz"
RUN mv ./hugo /usr/bin/hugo
WORKDIR /home/app
# Cleanup
RUN rm -rfv /tmp/temph 

ENTRYPOINT [ "/bin/bash" ]