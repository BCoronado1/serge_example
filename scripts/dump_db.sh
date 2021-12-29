#!/bin/bash
# Script to periodically dump the SERGE databases to file
while :
do
    sleep 60 # Do this once every minute, overwriting the previous database information
    echo "Dumping database..."
    ALL_DBS_TEXT=$(curl -X GET http://localhost:8080/allDbs) # Fetch all the currently existing database names
    readarray -t DB_NAMES < <(jq -r '.[]' <<<"${ALL_DBS_TEXT}") # Convert text to array
    declare -p DB_NAMES # Declare array
    for DB_NAME in "${DB_NAMES[@]}" # Loop through each database name
    do
      # Get all documents in json format and save to file
      curl -X GET http://localhost:8080/db/$DB_NAME/_all_docs\?include_docs\=true | jq '{"docs": [.rows[].doc]}' | jq 'del(.docs[]._rev)' > /db/$DB_NAME
    done
done
