# syntax=docker/dockerfile:1
FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y -q --no-install-recommends ca-certificates git wget curl jq make python2 gcc g++
RUN update-alternatives --install /usr/bin/python python /usr/bin/python2 1
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash
RUN apt-get install -y nodejs
RUN git clone -b 20220616 https://github.com/serge-web/serge.git
WORKDIR /serge
RUN npm install --location=global npm yarn
RUN yarn install
RUN yarn build
#COPY scripts/load_db.sh /serge/load_db.sh
#COPY scripts/dump_db.sh /serge/dump_db.sh
COPY scripts/start_serge.sh /serge/start_serge.sh
CMD bash start_serge.sh
