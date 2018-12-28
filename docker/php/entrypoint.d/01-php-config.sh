#!/bin/sh

# Enable xdebug while environment is in dev mode
if [ ${ENVIRONMENT} == 'dev' ]; then
    if [ $(which gosu) ]; then
        gosu root sh -c "echo "zend_extension=xdebug.so" > /etc/php7/conf.d/00_xdebug.ini"
    fi
fi