#!/usr/bin/env bash

set -xe

# Start ssh-agent
chmod 600 secrets/ssh/${DEPLOY_USER}_rsa
eval $(ssh-agent)
ssh-add secrets/ssh/${DEPLOY_USER}_rsa


#scp -o StrictHostKeyChecking=no -r . "${DEPLOY_USER}"@"${SERVER_IP}":~/test

rsync --version
rsync -a  -z --info=progress2 -e "ssh -T -c aes128-ctr -o Compression=no -o StrictHostKeyChecking=no -x" . "${DEPLOY_USER}"@"${SERVER_IP}":~/test

# ssh to server
#ssh -o StrictHostKeyChecking=no "${DEPLOY_USER}"@"${SERVER_IP}" docker-compose up -d