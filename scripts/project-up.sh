#!/usr/bin/env bash

set -xe

if [ ! -f .env ]; then
    # Prepare .env file
    perl -lpe ' s/(.*)=(.*)/sprintf("%s=%s","$1",$ENV{$1}? $ENV{$1}:$2)/ge ' .env.example > .env
fi
docker-compose up -d --build --remove-orphans --force-recreate