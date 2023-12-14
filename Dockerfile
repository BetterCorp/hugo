ARG GO_VERSION="1.21"
FROM golang:${GO_VERSION}-bullseye

ARG HUGO_VERSION="0.121.1"
ARG NODE_VERSION="18"

RUN apt update -y
RUN apt install tar gzip build-essential ca-certificates curl gnupg -y
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_VERSION.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
RUN apt update -y && apt-get install -y nodejs
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
