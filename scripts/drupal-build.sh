#!/usr/bin/env bash

set -xe

BUILD_ENV=${1}

if [ ! -f .env ]; then
    cp secrets/.env.remote > .env
fi

PROJECT_NAME=$(cat .env | grep PROJECT_NAME | cut -d '=' -f 2-)
DOMAIN_NAME=$(cat .env | grep DOMAIN_NAME | cut -d '=' -f 2-)


if [ ${BUILD_ENV} == 'dev' ]; then

    perl -i -lpe 's/^(DOMAIN_NAME=).*/\1'"$PROJECT_NAME".localhost'/' .env

    docker-compose up -d
    docker exec -i ${PROJECT_NAME} composer install
    docker exec -i ${PROJECT_NAME} drush si --yes
    docker exec -i ${PROJECT_NAME} drush cim --partial --yes
fi


if [ ${BUILD_ENV} == 'stage' ]; then





            perl -i -lpe 's/^(PROJECT_NAME=).*/\1'"$PROJECT_NAME"-stage-"$RANDOM"'/' .env
            perl -i -lpe 's/^(DOMAIN_NAME=).*/\1'stage."$DOMAIN_NAME"'/' .env
            STAGE_PROJECT_NAME=$(cat .env | grep PROJECT_NAME | cut -d '=' -f 2-)
            docker-compose up -d
            docker exec -i ${STAGE_PROJECT_NAME} composer install
            docker exec -i ${STAGE_PROJECT_NAME} drush si --yes
            docker exec -i ${STAGE_PROJECT_NAME} drush cim --partial
            docker exec -i ${STAGE_PROJECT_NAME} drush -y csim live_config
fi

if [ ${BUILD_ENV} == 'prod' ]; then

    MASTER_PROJECT_NAME=$(cat .env | grep PROJECT_NAME | cut -d '=' -f 2-)
    STAGE_PROJECT_NAME=${PROJECT_NAME//master/stage}

    if [ $(docker exec ${STAGE_PROJECT_NAME} drush status bootstrap 2> /dev/null | grep -c Successful) == 1 ]; then

        cd ..
        mv ${STAGE_PROJECT_NAME} ${MASTER_PROJECT_NAME}-new
        PROJECT_NAME=${MASTER_PROJECT_NAME}-new perl -lpe ' s/(.*)=(.*)/sprintf("%s=%s","$1",$ENV{$1}? $ENV{$1}:$2)/ge '  ${MASTER_PROJECT_NAME}/.env > ${MASTER_PROJECT_NAME}-new/.env
        cd ${MASTER_PROJECT_NAME}-new
        docker-compose -p ${STAGE_PROJECT_NAME} up -d

        cd ..
        mv ${MASTER_PROJECT_NAME} ${MASTER_PROJECT_NAME}-backup
      else
        docker-compose up -d
        docker exec -i ${PROJECT_NAME} composer install
        docker exec -i ${PROJECT_NAME} drush si --yes
        docker exec -i ${PROJECT_NAME} drush cim --partial
        docker exec -i ${PROJECT_NAME} drush -y csim live_config
    fi

fi


if [ $(docker exec ${PROJECT_NAME} drush status bootstrap | grep -c Successful) == 1 ]; then
   echo  Drupal has been sucessfully built up
else
   echo Drupal build failed
fi
