#!/bin/bash
# Script to periodically dump the Serge database to file
while :
do
    sleep 60 # Do this once every minute, overwriting the previous database information
    echo "Dumping database..."
    echo "--------------------"
    echo "Deleting stale database backup..."
    find /db/ -type f ! -name '.gitkeep' -delete -print
    echo "Transferring latest database files..."
    cp -rv /serge/packages/server/db/* /db/
done
