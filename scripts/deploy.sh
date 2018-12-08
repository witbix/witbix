#!/usr/bin/env bash

set -xe

# Start ssh-agent
chmod 600 secrets/ssh/${DEPLOY_USER}_rsa
eval $(ssh-agent)
ssh-add secrets/ssh/${DEPLOY_USER}_rsa


scp -o StrictHostKeyChecking=no -r . "${DEPLOY_USER}"@"${SERVER_IP}":~/test

# ssh to server
ssh -o StrictHostKeyChecking=no "${DEPLOY_USER}"@"${SERVER_IP}" docker-compose up -d