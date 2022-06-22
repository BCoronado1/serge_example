#!/bin/bash
# Script to periodically dump the SERGE databases to file
while :
do
    sleep 60 # Do this once every minute, overwriting the previous database information
    echo "Dumping database..."
    cp -vf /serge/packages/server/db/* /db/ # copy all database files to shared volume
done
