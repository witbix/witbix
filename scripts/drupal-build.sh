#!/usr/bin/env bash

set -xe

BUILD_ENV=${1}

if [ ! -f .env ]; then
    cp secrets/.env.remote .env
fi

PROJECT_NAME=$(cat .env | grep PROJECT_NAME | cut -d '=' -f 2-)
DOMAIN_NAME=$(cat .env | grep DOMAIN_NAME | cut -d '=' -f 2-)


if [ ${BUILD_ENV} == 'dev' ]; then
    docker-compose up -d
    docker exec -i ${PROJECT_NAME} composer install
    docker exec -i ${PROJECT_NAME} drush si --yes
    docker exec -i ${PROJECT_NAME} drush cim --partial --yes
fi


if [ ${BUILD_ENV} == 'stage' ]; then

    perl -i -lpe 's/^(PROJECT_NAME=).*/\1'"$PROJECT_NAME"-stage'/' .env
    perl -i -lpe 's/^(DOMAIN_NAME=).*/\1'stage."$DOMAIN_NAME"'/' .env
    perl -i -lpe 's/^(MYSQL_HOSTNAME=).*/\1'"$PROJECT_NAME"-stage.mariadb'/' .env

    STAGE_PROJECT_NAME=$(cat .env | grep PROJECT_NAME | cut -d '=' -f 2-)
    docker-compose up -d
    docker exec -i ${STAGE_PROJECT_NAME} composer install
    docker exec -i ${STAGE_PROJECT_NAME} drush si --yes
    docker exec -i ${STAGE_PROJECT_NAME} drush cim --partial
    docker exec -i ${STAGE_PROJECT_NAME} drush -y csim live_config
fi

if [ ${BUILD_ENV} == 'prod' ]; then

    MASTER_PROJECT_NAME=${PROJECT_NAME}-master-${RANDOM}
    mv ${PROJECT_NAME}-stage ${MASTER_PROJECT_NAME}
    cd ${MASTER_PROJECT_NAME}
    perl -i -lpe 's/^(PROJECT_NAME=).*/\1'"$MASTER_PROJECT_NAME"'/' .env
    perl -i -lpe 's/^(DOMAIN_NAME=).*/\1'"$DOMAIN_NAME"'/' .env
    perl -i -lpe 's/^(MYSQL_HOSTNAME=).*/\1'"$MASTER_PROJECT_NAME"'/' .env

fi


if [ $(docker exec ${PROJECT_NAME} drush status bootstrap | grep -c Successful) == 1 ]; then
   echo  Drupal has been sucessfully built up
else
   echo Drupal build failed
fi
