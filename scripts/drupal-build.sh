#!/usr/bin/env bash

set -xe

PROJECT_NAME=$(cat .env | grep PROJECT_NAME | cut -d '=' -f 2-)
docker exec -i ${PROJECT_NAME} composer install
docker exec -i ${PROJECT_NAME} drush si --yes

if [ $(docker exec ${PROJECT_NAME} drush status bootstrap | grep -c Successful) == 1 ]; then
   echo  Drupal has been sucessfully built up
else
   echo Drupal build failed
fi
