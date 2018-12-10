#!/bin/sh

set -ex

# Enable xdebug while environment is in dev mode
if [ ${ENVIRONMENT} == 'dev' ]; then
    gosu root sh -c "echo "zend_extension=xdebug.so" > /etc/php7/conf.d/00_xdebug.ini" 2>/dev/null || :
fi

# Change UID of 'deploy' as per host user UID
HOST_CURRENT_USER_ID=$(stat -c "%u" /var/www/${PROJECT_NAME})
if [ ${HOST_CURRENT_USER_ID} -ne 0 ]; then
gosu root usermod -u ${HOST_CURRENT_USER_ID} deploy 2>/dev/null || :
gosu root groupmod -g ${HOST_CURRENT_USER_ID} deploy 2>/dev/null || :
fi

# Prepare Drupal
umask u=rwx,g=rx,o=
cp -r -u /home/deploy/drupal-templates/${DRUPAL_VERSION}.x/. /var/www/${PROJECT_NAME}/ 2>/dev/null || :
mkdir /var/www/${PROJECT_NAME}/web 2>/dev/null || :
{
    echo "MYSQL_HOSTNAME=${MYSQL_HOSTNAME}"
    echo "MYSQL_DATABASE=${MYSQL_DATABASE}"
    echo "MYSQL_USER=${MYSQL_USER}"
    echo "MYSQL_PASSWORD=${MYSQL_PASSWORD}"
    echo "MYSQL_PORT=${MYSQL_PORT}"
}   > /var/www/${PROJECT_NAME}/.env

# Set github api key to allow composer to access private repo
composer config --global github-oauth.github.com ${GITHUB_TOKEN}

gosu root chown deploy:www-php /var/www/${PROJECT_NAME}/*
gosu root chmod g=rX,o= /var/www/${PROJECT_NAME}/*

gosu root chgrp -R www /var/www/${PROJECT_NAME}/web
gosu root chmod -R g=rX,o= /var/www/${PROJECT_NAME}/web

# Jail 'su' & 'gosu'
#gosu root chmod o-rwx /bin/su 2>/dev/null || :
#gosu root chmod o-rwx /usr/bin/gosu 2>/dev/null || :

exec "$@"
