#!/bin/bash

set -ex

if [ ${ENVIRONMENT} == 'prod' ]; then
    ln -sf /conf.d/master.cnf /etc/mysql/conf.d/replica.cnf
    ln -sf /initdb.d/01-replica-setup.sh /docker-entrypoint-initdb.d/01-replica-setup.sh
fi

if [ ${ENVIRONMENT} == 'stage' ]; then
    ln -sf /conf.d/slave.cnf /etc/mysql/conf.d/replica.cnf
fi

exec /docker-entrypoint.sh ${@}