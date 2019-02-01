#!/bin/sh

# Prepare Drupal
cp -r -u /home/deploy/drupal-templates/${DRUPAL_VERSION}.x/. /var/www/${PROJECT_NAME}/
{
    echo "MYSQL_HOSTNAME=${MYSQL_HOSTNAME}"
    echo "MYSQL_DATABASE=${MYSQL_DATABASE}"
    echo "MYSQL_USER=${MYSQL_USER}"
    echo "MYSQL_PASSWORD=${MYSQL_PASSWORD}"
    echo "MYSQL_PORT=${MYSQL_PORT}"
    echo "REDIS_HOSTNAME=${REDIS_HOSTNAME}"
}   > /var/www/${PROJECT_NAME}/.env