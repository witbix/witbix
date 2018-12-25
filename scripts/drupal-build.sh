#!/usr/bin/env bash

set -xe

BUILD_ENV=${1}



if [ ${BUILD_ENV} == 'dev' ]; then

    if [ ! -f .env ]; then
        GITHUB_TOKEN=$(cat secrets/.env.remote | grep GITHUB_TOKEN | cut -d '=' -f 2-) \
        perl -lpe ' s/(.*)=(.*)/sprintf("%s=%s","$1",$ENV{$1}? $ENV{$1}:$2)/ge ' .env.local > .test
    fi

    DEV_PROJECT_NAME=$(cat .env | grep PROJECT_NAME | cut -d '=' -f 2-)
    docker-compose up -d
    docker exec -i ${DEV_PROJECT_NAME} composer install
    docker exec -i ${DEV_PROJECT_NAME} drush si --yes
fi


if [ ${BUILD_ENV} == 'stage' ]; then

    if [ ! -f .env ]; then
        PROJECT_NAME=$(cat secrets/.env.remote | grep PROJECT_NAME | cut -d '=' -f 2-)-${PWD##*/} \
        DOMAIN_NAME=stage.$(cat secrets/.env.remote | grep DOMAIN_NAME | cut -d '=' -f 2-) \
        MYSQL_HOSTNAME=${PROJECT_NAME}.mariadb \
        perl -lpe ' s/(.*)=(.*)/sprintf("%s=%s","$1",$ENV{$1}? $ENV{$1}:$2)/ge ' secrets/.env.remote > .env
    fi

    docker-compose up -d
    docker-compose exec php composer install
    docker-compose exec php drush si --yes

    if [ -f code/drupal/dump.sql ]; then
        docker-compose exec php drush sql-cli < /code/drupal/dump.sql
        docker-compose exec php drush cim --yes
      else
        docker-compose exec php drush cim --partial --yes
        docker-compose exec php drush csim live_config --yes
    fi

fi



if [ ${BUILD_ENV} == 'prod' ]; then

    DOMAIN_NAME=$(cat secrets/.env.remote | grep DOMAIN_NAME | cut -d '=' -f 2-) \
    perl -i -lpe ' s/(.*)=(.*)/sprintf("%s=%s","$1",$ENV{$1}? $ENV{$1}:$2)/ge ' .env
    docker-compose up -d nginx
fi

