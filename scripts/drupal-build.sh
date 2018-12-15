#!/usr/bin/env bash

set -xe

docker-compose up -d --build --remove-orphans --force-recreate
docker exec -it witbix-debug composer install
docker exec -it witbix-debug drush si --yes

if [ $(docker exec witbix-debug drush status bootstrap | grep -c Successful) == 1 ]; then
   echo  Drupal has been sucessfully built and tested.
else
   echo Drupal build failed
fi
