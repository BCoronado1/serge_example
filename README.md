# serge_example

A dockerized version of the SERious Gaming Evolved (SERGE) wargaming framework. These configs create an Ubuntu container that builds and runs SERGE which is then accessible at localhost:8080.

For local development, the SERGE container uses a volume mapping from "db" directory in this repository to /db in the container (e.g. -v $(pwd)/db:/db in docker run).
On initialization, a script syncs SERGE with the latest data while another script periodically dumps the SERGE databases to the mapped volume.

# Usage
Build with `./build_container.sh` then `./start_serge_container.sh` to start SERGE. `clean.sh` stops and deletes the container.

# Links
SERGE website: https://sites.google.com/deepbluec.com/serge

SERGE intro: https://sites.google.com/deepbluec.com/serge/introduction

SERGE sourcecode: https://github.com/serge-web/serge

Tested
- Ubuntu 20.04.3 LTS host with Docker version 20.10.10, build b485636.
- macOS Catalina 10.15.7 with Docker version 20.10.16, build aa7e414. (Required increasing memory to 4GB in Docker Desktop preferences)
