#!/usr/bin/env bash

red=$'\e[1;31m'
grn=$'\e[1;32m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
white=$'\e[0m'

set -xe

# Check if any changes has been made inside "docker" directory

if [ -n "$(git diff HEAD^ --exit-code --name-only docker/nginx)" ]; then
    docker build -t witbix/nginx ./docker/nginx
fi

if [ -n "$(git diff HEAD^ --exit-code --name-only docker/php)" ]; then
    docker build -t witbix/nginx ./docker/php
fi

if [ -n "$(git diff HEAD^ --exit-code --name-only docker/mariadb)" ]; then
    docker build -t witbix/nginx ./docker/nginx
fi

        # Building imgaes from docker files

    docker build -t witbix/php ./docker/php
    docker build -t witbix/mariadb ./docker/mariadb

    # Integration check of newly built images
    docker network create -d bridge traefik-network
    docker run -d --network=traefik-network -p 80:80 -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock --name=traefik traefik:latest --api --docker
    cp .env.example .env
    GITHUB_TOKEN=$GITHUB_TOKEN docker-compose up -d
    docker exec -it test composer install
    docker exec -it test drush si --yes

    # Push images to Docker Hub
    if [ $(docker exec test drush status bootstrap | grep -c Successful) == 1 ]; then
        echo $grn Drupal has been sucessfully installed. Images are ready to be pushed to Docker Hub $white
        echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
        docker push witbix/nginx
        docker push witbix/php
        docker push witbix/mariadb

        # Clean up
        docker rm -f $(docker ps -a -q)
        docker system prune -f
        rm -rf ./code/drupal
    else
        echo $red Docker build failed and images are not ready to push to dockerhub $white
        exit 1
    fi
fi
