#!/usr/bin/env bash

set -xe

DEPLOY_USER=${1}
DEPLOY_SERVER=${2}
DEPLOY_PATH=${3}
DEPLOY_ENV=${4}

# Start ssh-agent
chmod 600 secrets/ssh/${DEPLOY_USER}_rsa
eval $(ssh-agent)
ssh-add secrets/ssh/${DEPLOY_USER}_rsa
ssh-keyscan ${DEPLOY_SERVER} >> ~/.ssh/known_hosts

# Ensure you have latest .env file before uploading.
#perl -i -lpe ' s/(.*)=(.*)/sprintf("%s=%s","$1",$ENV{$1}? $ENV{$1}:$2)/ge ' .env

# Copy only necessary secrets
cp secrets/traefik

# Start uploading artifacts to server using rsync
rsync --info=progress2 \
      --archive  \
      --compress \
      --group \
      --include="secrets/traefik" \
      --exclude-from="./scripts/.rsyncexclude" \
      -e "ssh -T -c aes128-ctr -o Compression=no -x" \
      ./  "${DEPLOY_USER}"@"${DEPLOY_SERVER}":"${DEPLOY_PATH}"

# Run required scripts on server machine over ssh
ssh ${DEPLOY_USER}@${DEPLOY_SERVER} "cd ${DEPLOY_PATH} && scripts/traefik-setup.sh remote && scripts/drupal-build.sh ${DEPLOY_ENV}"