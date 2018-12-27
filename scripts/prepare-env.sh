#!/usr/bin/env bash

set -xe

BUILD_ENV=${1}


if [ ${BUILD_ENV} == 'dev' ]; then

        GITHUB_TOKEN=$(cat secrets/.env.remote | grep GITHUB_TOKEN | cut -d '=' -f 2-) \
        perl -lpe ' s/(.*)=(.*)/sprintf("%s=%s","$1",$ENV{$1}? $ENV{$1}:$2)/ge ' .env.local > .env
fi


if [ ${BUILD_ENV} == 'stage' ]; then

        PROJECT_NAME=$(cat secrets/.env.remote | grep PROJECT_NAME | cut -d '=' -f 2-)-${PWD##*/} \
        DOMAIN_NAME=stage.$(cat secrets/.env.remote | grep DOMAIN_NAME | cut -d '=' -f 2-) \
        MYSQL_HOSTNAME=${PROJECT_NAME}.mariadb \
        perl -lpe ' s/(.*)=(.*)/sprintf("%s=%s","$1",$ENV{$1}? $ENV{$1}:$2)/ge ' secrets/.env.remote > .env
fi


if [ ${BUILD_ENV} == 'prod' ]; then

        DOMAIN_NAME=$(cat secrets/.env.remote | grep DOMAIN_NAME | cut -d '=' -f 2-) \
        perl -i -lpe ' s/(.*)=(.*)/sprintf("%s=%s","$1",$ENV{$1}? $ENV{$1}:$2)/ge ' .env
fi