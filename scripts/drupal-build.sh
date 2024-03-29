#!/usr/bin/env bash

set -e

BUILD_ENV=${1}


if [ ${BUILD_ENV} == 'dev' ]; then

    docker-compose up -d
    docker-compose exec php composer install
    docker-compose exec php drush si --yes
    docker-compose exec -T php drush cr
fi


if [ ${BUILD_ENV} == 'stage' ]; then

    docker-compose up -d
    docker-compose exec -T php composer install
    docker-compose exec -T php drush si --yes

    if [ -f code/drupal/dump.sql ]; then

        docker-compose exec -T php drush sql-cli < code/drupal/dump.sql
        docker-compose exec -T php drush cim --yes
      else
        docker-compose exec -T php drush cim --partial --yes
        docker-compose exec -T php drush csim live_config --yes
    fi

    docker-compose exec -T php drush cr
fi


if [ ${BUILD_ENV} == 'prod' ]; then

    docker-compose up -d nginx
fi