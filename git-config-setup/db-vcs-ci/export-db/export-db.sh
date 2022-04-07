#!/bin/sh

# ---------------------------- Basic Settings ---------------------------------

COMPUTER_NAME="(localdb)"
INSTANCE_NAME="Local"
DB_NAME="Klil-Local-Tal"
EXPORTED_DB_BAK_PATH_IN_CLIENT="git-config-setup/db-vcs-ci/db.bak"

# ------------------------ Server Advaced Settings ----------------------------

WORKING_DIRECTORY_IN_SERVER="C:\Bak"
EXPORTED_DB_BAK_NAME_IN_SERVER_WORKING_DIRECTORY="db.bak"
SERVER="https://localhost:7179"

# ---------------------------------- Code -------------------------------------

LOG_TITLE="### export-db.sh ###: "
LOG_BOUNDARY="################################"
SERVER_LOG_HALF_BOUNDARY="###########"

echo
echo $LOG_BOUNDARY
echo $LOG_TITLE "Attempting To Export DB From Server..."

echo $LOG_TITLE "Attempting To Create .bak File In The Server..."

echo $LOG_TITLE $SERVER_LOG_HALF_BOUNDARY OPENED OUTPUT FROM SERVER $SERVER_LOG_HALF_BOUNDARY

echo

URL="$SERVER/api/execute-cmd-command?workingDirectory=$WORKING_DIRECTORY_IN_SERVER"

curl -k -X 'POST' \
                $URL \
                -H 'accept: */*' \
                -H 'Content-Type: application/sql' \
                -d @git-config-setup/db-vcs-ci/export-db/export-db-sql-query.bat \
                --write-out "HTTPSTATUS:%{http_code}"


exit
