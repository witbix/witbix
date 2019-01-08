#!/bin/bash

set -ex

"${mysql[@]}" <<-EOSQL
GRANT REPLICATION SLAVE ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
EOSQL

#
#file_env 'REPL_USER'
#file_env 'REPL_PASSWORD'
#if [ "$REPL_USER" -a "$REPL_PASSWORD" ]; then
#    echo "CREATE USER '$REPL_USER'@'%' IDENTIFIED BY '$REPL_PASSWORD' ;" | "${mysql[@]}"
#    echo "GRANT REPLICATION SLAVE ON *.* TO '$REPL_USER'@'%' IDENTIFIED BY '$REPL_PASSWORD';" | "${mysql[@]}"
#fi