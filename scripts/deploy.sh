#!/usr/bin/env bash

set -xe

# Start ssh-agent
chmod 600 secrets/ssh/${DEPLOY_USER}_rsa
eval $(ssh-agent)
ssh-add secrets/ssh/${DEPLOY_USER}_rsa

# Start uploading artifacts to server using rsync
rsync --info=progress2 \
      --archive  \
      --compress \
      --group \
      --filter=":- .gitignore" \
      -e "ssh -T -c aes128-ctr -o Compression=no -o StrictHostKeyChecking=no -x" . "${DEPLOY_USER}"@"${SERVER_IP}":~/test
