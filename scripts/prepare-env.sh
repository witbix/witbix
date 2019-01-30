#!/usr/bin/env bash

set -e

BUILD_ENV=${1}

function env_modify (){
    perl -lpe ' s/(.*)=(.*)/sprintf("%s=%s","$1",$ENV{$1}? $ENV{$1}:$2)/ge ' .env.local > .env
}



if [ ${BUILD_ENV} == 'dev' ]; then

        GITHUB_TOKEN=$(grep GITHUB_TOKEN secrets/.env.remote | cut -d '=' -f 2-) \
        perl -lpe ' s/(.*)=(.*)/sprintf("%s=%s","$1",$ENV{$1}? $ENV{$1}:$2)/ge ' .env.local > .env
fi


if [ ${BUILD_ENV} == 'stage' ]; then

        PROJECT_NAME=$(grep PROJECT_NAME secrets/.env.remote | cut -d '=' -f 2-)-${PWD##*/} \
        DOMAIN_NAME=stage.$(cat secrets/.env.remote | grep DOMAIN_NAME | cut -d '=' -f 2-) \
        MYSQL_HOSTNAME=${PROJECT_NAME}.mariadb \
        ENVIRONMENT=stage \
        perl -lpe ' s/(.*)=(.*)/sprintf("%s=%s","$1",$ENV{$1}? $ENV{$1}:$2)/ge ' secrets/.env.remote > .env
fi


if [ ${BUILD_ENV} == 'prod' ]; then

        DOMAIN_NAME=$(grep DOMAIN_NAME secrets/.env.remote | cut -d '=' -f 2-) \
        ENVIRONMENT=prod \
        perl -i -lpe ' s/(.*)=(.*)/sprintf("%s=%s","$1",$ENV{$1}? $ENV{$1}:$2)/ge ' .env
fi