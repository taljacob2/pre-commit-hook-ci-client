#!/bin/sh
git stash -q --keep-index
./git-config-setup/db-vcs-ci/export-db/export-db.sh
RESULT=$?
git stash pop -q
[ $RESULT -ne 0 ] && exit 1
exit 0