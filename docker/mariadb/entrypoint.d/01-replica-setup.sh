#!/bin/bash

set -eo pipefail

if [ ${ENVIRONMENT} == 'prod' ]; then
    ln -sf /conf.d/master.cnf /etc/mysql/master.cnf
fi

if [ ${ENVIRONMENT} == 'stage' ]; then
    ln -sf /conf.d/slave.cnf /etc/mysql/conf.d/slave.cnf
fi