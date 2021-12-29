#!/bin/bash
# TODO Getting Document update conflict error messages when trying to load. Need to work out how revision numbers
# TODO affect the loading of documents.
for FILE in $(ls ../db)
do
  curl -d @/db/$FILE -H "Content-Type: application/json" -X POST http://localhost:8080/db/${FILE}/_bulk_docs
  echo "Loaded ${FILE}."
done
