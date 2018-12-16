#!/usr/bin/env bash

###################################################
#  local : ssl wil not be enabled
#  remote : ssl will be enabled
###################################################

set -xe

if [ $(docker network ls | grep -c traefik-network) == 0 ]; then
    echo "Creating traefik network"
    docker network create -d bridge traefik-network
fi

if [ $(docker ps | grep -c traefik) == 0 ]; then
    echo "Creating traefik container"
    if [ $1 == 'local' ]; then
        docker run -d --network=traefik-network -p 80:80 \
        -v /var/run/docker.sock:/var/run/docker.sock \
        --name=traefik traefik:latest --api --docker
    fi
    if [ $1 == 'remote' ]; then
        chmod 600 traefik/acme.json
        docker run --network=traefik-network -p 80:80 -p 443:443 \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v $PWD/traefik:/etc/traefik \
        -v $PWD/secrets/ssl:/etc/ssl \
        --name=traefik traefik:latest --api --docker
    fi
fi