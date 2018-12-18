#!/usr/bin/env bash

set -xe

BUILD_ENV=${1}


if [ ${BUILD_ENV} == 'dev' ]; then
    if [ ! -f .env ]; then
        perl -lpe ' s/(.*)=(.*)/sprintf("%s=%s","$1",$ENV{$1}? $ENV{$1}:$2)/ge ' .env.example > .env
    fi
    PROJECT_NAME=$(cat .env | grep PROJECT_NAME | cut -d '=' -f 2-)
    docker-compose up -d
    docker exec -i ${PROJECT_NAME} composer install
    docker exec -i ${PROJECT_NAME} drush si --yes
    docker exec -i ${PROJECT_NAME} drush cim --partial --yes
fi


if [ ${BUILD_ENV} == 'stage' ]; then

    STAGE_PROJECT_NAME=$(cat .env | grep PROJECT_NAME | cut -d '=' -f 2-)
    MASTER_PROJECT_NAME=${PROJECT_NAME//stage/master}

    if [ $(docker exec ${MASTER_PROJECT_NAME} drush status bootstrap 2> /dev/null | grep -c Successful) == 1 ]; then
            docker exec -i ${MASTER_PROJECT_NAME} drush sql-dump --result-file=../dump.sql
            mv ../${MASTER_PROJECT_NAME}/code/drupal/dump.sql ./code/drupal
            docker-compose up -d
            docker exec -i ${STAGE_PROJECT_NAME} composer install
            docker exec -i ${STAGE_PROJECT_NAME} drush si --yes
            docker exec -i ${STAGE_PROJECT_NAME} drush sql-cli < ./code/drupal/dump.sql
            docker exec -i ${STAGE_PROJECT_NAME} drush -y cim
     else
            docker-compose up -d
            docker exec -i ${STAGE_PROJECT_NAME} composer install
            docker exec -i ${STAGE_PROJECT_NAME} drush si --yes
            docker exec -i ${STAGE_PROJECT_NAME} drush cim --partial
            docker exec -i ${STAGE_PROJECT_NAME} drush -y csim live_config
    fi
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
