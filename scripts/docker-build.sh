#!/usr/bin/env bash

#################################################################################
#  DOCKER_DIR : Path to the dir which contains all docker images.
#  DOCKER_TAG : Prefix of an image tag usually username/org name in docker-hub
#################################################################################

set -xe

DOCKER_DIR=${1}
DOCKER_TAG=${2}

# Build the images if any changes has been made inside "docker" directory
ls -d ${DOCKER_DIR}/* | while read d
do
    if [ -n "$(git diff HEAD^ --exit-code --name-only $d)" ]; then
        docker build -t ${DOCKER_TAG}/${d##*/} $d
    fi
done