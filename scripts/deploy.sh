#!/usr/bin/env bash

set -xe

DEPLOY_USER=${1}
DEPLOY_SERVER=${2}
DEPLOY_PATH=${3}
PROJECT_NAME=${4}
DEPLOY_ENV=${5}

# Start ssh-agent
    chmod 600 secrets/ssh/${DEPLOY_USER}_rsa
    eval $(ssh-agent)
    ssh-add secrets/ssh/${DEPLOY_USER}_rsa
    ssh-keyscan ${DEPLOY_SERVER} >> ~/.ssh/known_hosts


if [ ${DEPLOY_ENV} == 'stage' ]; then

    # Start uploading artifacts to server using rsync
    rsync --info=progress2 \
        --archive  \
        --compress \
        --group \
        --include="secrets/traefik" \
        --exclude-from="./scripts/.rsyncexclude" \
        -e "ssh -T -c aes128-ctr -o Compression=no -x" \
        ./  "${DEPLOY_USER}"@"${DEPLOY_SERVER}":"${DEPLOY_PATH}/${PROJECT_NAME}-stage"

    # Run required scripts on server machine over ssh
    ssh ${DEPLOY_USER}@${DEPLOY_SERVER} "cd ${DEPLOY_PATH}/${PROJECT_NAME}-stage \
                                         && scripts/traefik-setup.sh remote \
                                         && scripts/drupal-build.sh stage"
fi


if [ ${DEPLOY_ENV} == 'prod' ]; then

    # Run required scripts on server machine over ssh
    ssh ${DEPLOY_USER}@${DEPLOY_SERVER} "cd ${DEPLOY_PATH}/${PROJECT_NAME} \
                                         && scripts/drupal-build.sh prod"
fi