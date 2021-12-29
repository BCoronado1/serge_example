# syntax=docker/dockerfile:1
FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y -q --no-install-recommends ca-certificates git wget curl jq

RUN wget https://nodejs.org/dist/v12.13.0/node-v12.13.0-linux-x64.tar.gz 
RUN tar -C /usr/local --strip-components 1 -xzf node-v12.13.0-linux-x64.tar.gz
RUN git clone -b 20211222b https://github.com/serge-web/serge.git
WORKDIR /serge
RUN npm install -g yarn
RUN yarn install
RUN yarn build
COPY scripts/load_db.sh /serge/load_db.sh
COPY scripts/dump_db.sh /serge/dump_db.sh
COPY scripts/start_serge.sh /serge/start_serge.sh
CMD bash start_serge.sh
