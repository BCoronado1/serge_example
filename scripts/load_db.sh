#!/bin/bash

#!/bin/bash

SQLITE_COUNT=`ls -1 /db/*.sqlite 2>/dev/null | wc -l`
if [ $SQLITE_COUNT != 0 ]
then
cp -vf /db/* /serge/packages/server/db
fi
