#!/usr/bin/env bash

#################################################################################
#  docker_dir : Path to the dir which contains all docker sub-dirs
#  tag_prefix : Prefix of an image tag usually username/org name in docker-hub
#################################################################################

set -xe

# Build the images if any changes has been made inside "docker" directory
ls -d ${1}/* | while read d
do
    if [ -n "$(git diff HEAD^ --exit-code --name-only $d)" ]; then
        docker build -t ${2}/${d##*/} $d
    fi
done