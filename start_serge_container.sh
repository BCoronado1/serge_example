#!/bin/bash

docker run -d -v $(pwd)/db:/db --name serge -p 8080:8080 serge_image
