#!/usr/bin/env bash

set -xe

chmod 600 secrets/ssh/${DEPLOY_USER}_rsa
eval $(ssh-agent)
ssh-add secrets/ssh/${DEPLOY_USER}_rsa
ls -al