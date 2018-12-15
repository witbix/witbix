#!/usr/bin/env bash

set -xe

# Start ssh-agent
chmod 600 secrets/ssh/${1}_rsa
eval $(ssh-agent)
ssh-add secrets/ssh/${1}_rsa
ssh-keyscan ${2} >> ~/.ssh/known_hosts

# Modify some variables specific to production server in .env file before uploading it
scripts/prepare-env.sh

# Start uploading artifacts to server using rsync
rsync --info=progress2 \
      --archive  \
      --compress \
      --group \
      --exclude-from="./scripts/.rsyncignore" \
      -e "ssh -T -c aes128-ctr -o Compression=no -x" . "${1}"@"${2}":"${3}"

# Run required scripts on server machine over ssh
ssh "${1}"@"${2}" "cd ${3} && scripts/traefik-setup.sh remote && scripts/drupal-build.sh"