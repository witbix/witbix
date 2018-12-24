#!/usr/bin/env bash

set -xe

DEPLOY_USER=${1}
DEPLOY_SERVER=${2}
DEPLOY_PATH=${3}
DEPLOY_ENV=${4}


# Start ssh-agent
ps aux | grep -c "[s]sh-agent" > /dev/null || eval $(ssh-agent)
function ssh_exec (){
ssh -o ControlMaster=auto \
    -o ControlPath=/tmp/ssh-%r@%h:%p.sock \
    -o ControlPersist=60 \
    -o StrictHostKeyChecking=no \
    -i secrets/ssh/${DEPLOY_USER}_rsa \
    ${DEPLOY_USER}@${DEPLOY_SERVER} \
    "$@"
}



if [ ${DEPLOY_ENV} == 'stage' ]; then

    ssh_exec "if [ ! -d ${DEPLOY_PATH} ]; then mkdir -p ${DEPLOY_PATH}; echo 'STAGE_PROJECT=ying' >${DEPLOY_PATH}/project.info; fi"
    STAGE_PROJECT=$(ssh_exec "cut -d '=' -f 2- ${DEPLOY_PATH}/project.info")

    # Start uploading artifacts to server using rsync
    rsync --info=progress2 \
        --archive  \
        --compress \
        --group \
        --include="secrets/traefik" \
        --exclude-from="./scripts/.rsyncexclude" \
        -e "ssh -T -c aes128-ctr -o Compression=no -o ControlPath=/tmp/ssh-%r@%h:%p.sock -x" \
        ./  ${DEPLOY_USER}@${DEPLOY_SERVER}:${DEPLOY_PATH}/${STAGE_PROJECT}/


    # Run required scripts on server machine over ssh
    ssh_exec "cd ${DEPLOY_PATH}/${STAGE_PROJECT} \
              && scripts/traefik-setup.sh remote \
              && scripts/drupal-build.sh stage"
fi







if [ ${DEPLOY_ENV} == 'prod' ]; then

    STAGE_PROJECT=$(ssh_exec "cut -d '=' -f 2- ${DEPLOY_PATH}/project.info")

    # Run required scripts on server machine over ssh
    ssh_exec "cd ${DEPLOY_PATH}/${STAGE_PROJECT} \
              && scripts/drupal-build.sh prod"


    if [ ${STAGE_PROJECT} == 'ying' ]; then
        ssh_exec "echo 'STAGE_PROJECT=yang' >${DEPLOY_PATH}/project.info"
      else
        ssh_exec "echo 'STAGE_PROJECT=ying' >${DEPLOY_PATH}/project.info"
    fi


fi