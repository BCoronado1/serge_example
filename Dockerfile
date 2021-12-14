# syntax=docker/dockerfile:1
FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y -q --no-install-recommends ca-certificates git wget

RUN wget https://nodejs.org/dist/v12.13.0/node-v12.13.0-linux-x64.tar.gz 
RUN tar -C /usr/local --strip-components 1 -xzf node-v12.13.0-linux-x64.tar.gz
RUN git clone https://github.com/serge-web/serge.git
WORKDIR /serge
RUN npm install -g yarn
RUN yarn install
RUN yarn build
CMD yarn serge
