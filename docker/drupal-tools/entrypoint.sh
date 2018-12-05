#!/bin/sh

set -ex
umask u=rwx,g=rx,o=

HOST_CURRENT_USER_ID=$(stat -c "%u" /var/www/${PROJECT_NAME})
#HOST_CURRENT_USER_ID=1500

if [ ${HOST_CURRENT_USER_ID} -ne 0 ]; then
gosu root usermod -u ${HOST_CURRENT_USER_ID} deploy 2>/dev/null || :
gosu root groupmod -g ${HOST_CURRENT_USER_ID} deploy 2>/dev/null || :
fi

cp -r -u /home/deploy/drupal-templates/${DRUPAL_VERSION}.x/. /var/www/${PROJECT_NAME}/ 2>/dev/null || :

mkdir /var/www/${PROJECT_NAME}/web 2>/dev/null || :

{
    echo "MYSQL_HOSTNAME=${MYSQL_HOSTNAME}"
    echo "MYSQL_DATABASE=${MYSQL_DATABASE}"
    echo "MYSQL_USER=${MYSQL_USER}"
    echo "MYSQL_PASSWORD=${MYSQL_PASSWORD}"
    echo "MYSQL_PORT=${MYSQL_PORT}"
}   > /var/www/${PROJECT_NAME}/.env


gosu root chmod o-rwx /usr/bin/gosu 2>/dev/null || :

exec "$@"
