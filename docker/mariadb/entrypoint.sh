#!/bin/bash

set -ex

if [ ${ENVIRONMENT} == 'prod' ]; then
    ln -sf /conf.d/master.cnf /etc/mysql/conf.d/replica.cnf
    ln -sf /initdb.d/master.sh /docker-entrypoint-initdb.d/replica.sh
fi

if [ ${ENVIRONMENT} == 'stage' ]; then
    ln -sf /conf.d/slave.cnf /etc/mysql/conf.d/replica.cnf
    ln -sf /initdb.d/slave.sh /docker-entrypoint-initdb.d/replica.sh
fi

exec /docker-entrypoint.sh ${@}