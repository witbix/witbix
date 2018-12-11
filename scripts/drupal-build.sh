#!/usr/bin/env bash

set -xe

docker-compose up
docker exec -it test composer install
docker exec -it test drush si --yes

if [ $(docker exec test drush status bootstrap | grep -c Successful) == 1 ]; then
   echo  Drupal has been sucessfully built and tested.
else
   echo Drupal build failed
fi
