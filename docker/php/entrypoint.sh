#!/bin/sh

# Enable xdebug while environment is in dev mode
if [ ${ENVIRONMENT} == 'dev' ]; then
    gosu root sh -c "echo "zend_extension=xdebug.so" > /etc/php7/conf.d/00_xdebug.ini"
fi

# Prepare Drupal
cp -r -u /home/deploy/drupal-templates/${DRUPAL_VERSION}.x/. /var/www/${PROJECT_NAME}/
{
    echo "MYSQL_HOSTNAME=${MYSQL_HOSTNAME}"
    echo "MYSQL_DATABASE=${MYSQL_DATABASE}"
    echo "MYSQL_USER=${MYSQL_USER}"
    echo "MYSQL_PASSWORD=${MYSQL_PASSWORD}"
    echo "MYSQL_PORT=${MYSQL_PORT}"
}   > /var/www/${PROJECT_NAME}/.env

# Set github api key to allow composer to access private repo
if [ ${GITHUB_TOKEN} != 'XXXXXXXXXXXXXXXXXXXXXXX' ]; then
    composer config --global github-oauth.github.com ${GITHUB_TOKEN}
fi

# Jail 'su' and 'gosu'
gosu root chmod o-rwx /bin/su
gosu root chmod o-rwx /usr/bin/gosu

exec "$@"
