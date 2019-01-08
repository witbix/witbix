#!/bin/bash

set -ex

if [ ${ENVIRONMENT} == 'prod' ]; then
    ln -sf /conf.d/master.cnf /etc/mysql/conf.d/replica.cnf
    ln -sf /initdb.d/master.sh /docker-entrypoint-initdb.d/replica.sh
    exec /docker-entrypoint.sh ${@} --server-id=${RANDOM}

elif [ ${ENVIRONMENT} == 'stage' ]; then
      ln -sf /conf.d/slave.cnf /etc/mysql/conf.d/replica.cnf
      ln -sf /initdb.d/slave.sh /docker-entrypoint-initdb.d/replica.sh
      exec /docker-entrypoint.sh ${@} --server-id=${RANDOM}
else
    exec /docker-entrypoint.sh ${@}
fi