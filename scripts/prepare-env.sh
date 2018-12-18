#!/usr/bin/env bash

set -xe

BUILD_ENV=${1}

if [ ${BUILD_ENV} == 'dev' ]; then

    if [ ! -f .env ]; then
        GITHUB_TOKEN=$(cat secrets/.env.remote | grep GITHUB_TOKEN | cut -d '=' -f 2-) \
        perl -lpe ' s/(.*)=(.*)/sprintf("%s=%s","$1",$ENV{$1}? $ENV{$1}:$2)/ge ' .env.local > .test
    fi
fi


if [ ${BUILD_ENV} == 'stage' ]; then

    if [ ! -f .env ]; then
        PROJECT_NAME=$(cat secrets/.env.remote | grep PROJECT_NAME | cut -d '=' -f 2-)-stage \
        DOMAIN_NAME=stage.$(cat secrets/.env.remote | grep DOMAIN_NAME | cut -d '=' -f 2-) \
        MYSQL_HOSTNAME=${PROJECT_NAME}.mariadb \
        perl -lpe ' s/(.*)=(.*)/sprintf("%s=%s","$1",$ENV{$1}? $ENV{$1}:$2)/ge ' secrets/.env.remote > .env
    fi
fi


if [ ${BUILD_ENV} == 'prod' ]; then

    if [ ! -f .env ]; then
        PROJECT_NAME=$(cat secrets/.env.remote | grep PROJECT_NAME | cut -d '=' -f 2-)-master \
        MYSQL_HOSTNAME=${PROJECT_NAME}.mariadb \
        perl -lpe ' s/(.*)=(.*)/sprintf("%s=%s","$1",$ENV{$1}? $ENV{$1}:$2)/ge ' secrets/.env.remote > .env
    fi

fi