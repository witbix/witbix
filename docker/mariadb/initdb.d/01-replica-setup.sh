#!/bin/bash

set -ex

"${mysql[@]}" <<-EOSQL
GRANT REPLICATION SLAVE ON *.* TO '$MYSQL_USER'@'%';
EOSQL