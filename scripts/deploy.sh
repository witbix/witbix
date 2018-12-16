#!/usr/bin/env bash

set -xe

DEPLOY_USER=${1}
DEPLOY_SERVER=${2}
DEPLOY_PATH=${3}

# Start ssh-agent
chmod 600 secrets/ssh/${1}_rsa
eval $(ssh-agent)
ssh-add secrets/ssh/${1}_rsa
ssh-keyscan ${2} >> ~/.ssh/known_hosts

# Ensure you have latest .env file before uploading.
perl -i -lpe ' s/(.*)=(.*)/sprintf("%s=%s","$1",$ENV{$1}? $ENV{$1}:$2)/ge ' .env

# Start uploading artifacts to server using rsync
rsync --info=progress2 \
      --archive  \
      --compress \
      --group \
      --exclude-from="./scripts/.rsyncignore" \
      -e "ssh -T -c aes128-ctr -o Compression=no -x" . "${1}"@"${2}":"${3}"

# Run required scripts on server machine over ssh
ssh ${DEPLOY_USER}@${DEPLOY_SERVER} "cd ${DEPLOY_PATH} && scripts/traefik-setup.sh remote && scripts/project-up.sh && scripts/drupal-build.sh"