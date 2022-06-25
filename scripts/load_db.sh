#!/bin/bash

echo "Initialize Serge database"
echo "--------------------"
FILE_COUNT=`ls -1 /db/*.sqlite 2>/dev/null | wc -l`
if [[ $FILE_COUNT -gt 0 ]]
then
    echo "Found ${FILE_COUNT} saved database files. Clearing default application database files..."
    find /serge/packages/server/db/ -type f -delete -print
    echo "Transferring saved database files..."
    cp -vf /db/* /serge/packages/server/db
else
    echo "No saved database files found. Continue..."
fi
