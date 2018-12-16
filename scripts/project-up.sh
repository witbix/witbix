#!/usr/bin/env bash

set -xe

if [ ! -f .env ]; then
    # Prepare .env file
    perl -lpe ' s/(.*)=(.*)/sprintf("%s=%s","$1",$ENV{$1}? $ENV{$1}:$2)/ge ' .env.example > .env
fi
docker-compose up -d --build --remove-orphans --force-recreate
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push witbix/nginx
docker push witbix/php
docker push witbix/mariadb