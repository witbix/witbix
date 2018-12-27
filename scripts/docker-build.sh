#!/usr/bin/env bash

set -e

DOCKER_DIR=docker
DOCKER_USERNAME=$(grep DOCKER_USERNAME secrets/.env.remote | cut -d '=' -f 2-)
DOCKER_PASSWORD=$(grep DOCKER_PASSWORD secrets/.env.remote | cut -d '=' -f 2-)
IMAGE_TAG_PREFIX=$(grep IMAGE_TAG_PREFIX secrets/.env.remote | cut -d '=' -f 2-)

# Build the images if any changes has been made inside "docker" directory and push it to docker hub
ls -d ${DOCKER_DIR}/* | while read d
do
    if [ -n "$(git diff HEAD^ --exit-code --name-only $d)" ]; then
        docker build -t ${IMAGE_TAG_PREFIX}/${d##*/} --no-cache $d
    fi
done

# Integration check of newly built images
scripts/drupal-build.sh dev
scripts/drupal-build.sh dev

# Push the newly built image
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
ls -d ${DOCKER_DIR}/* | while read d
do
    if [ -n "$(git diff HEAD^ --exit-code --name-only $d)" ]; then
        docker push ${IMAGE_TAG_PREFIX}/${d##*/}
    fi
done