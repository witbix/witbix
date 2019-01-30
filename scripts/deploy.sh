#!/usr/bin/env bash

set -e

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

    ssh_exec "mkdir -p ${DEPLOY_PATH} && if [ ! -f ${DEPLOY_PATH}/project.info ]; then echo -e 'PROD_PROJECT=yang\nSTAGE_PROJECT=ying\n' >${DEPLOY_PATH}/project.info; fi"

    STAGE_PROJECT=$(ssh_exec "grep STAGE_PROJECT ${DEPLOY_PATH}/project.info | cut -d '=' -f 2-")
    PROD_PROJECT=$(ssh_exec "grep PROD_PROJECT ${DEPLOY_PATH}/project.info | cut -d '=' -f 2-")

    # Start uploading artifacts to server using rsync
    rsync --info=progress2 \
        --archive  \
        --compress \
        --group \
        --delete \
        --include="secrets/traefik" \
        --exclude-from="./scripts/.rsyncexclude" \
        -e "ssh -T -c aes128-ctr -o Compression=no -o ControlPath=/tmp/ssh-%r@%h:%p.sock -x" \
        ./  ${DEPLOY_USER}@${DEPLOY_SERVER}:${DEPLOY_PATH}/${STAGE_PROJECT}/


    # Copy sql dump from Production to Stage
    if [ $(ssh_exec "docker exec ${DEPLOY_PATH##*/}-${PROD_PROJECT} drush status bootstrap 2> /dev/null | grep -c Successful") == 1 ]; then
        ssh_exec "docker exec -i ${DEPLOY_PATH##*/}-${PROD_PROJECT}.mariadb mysqldump --gtid --master-data --single-transaction --apply-slave-statements drupal > dump.sql"
        ssh_exec 'perl -pi -e "s/CHANGE MASTER TO MASTER_USE_GTID=slave_pos;/CHANGE MASTER TO MASTER_HOST='${DEPLOY_PATH##*/}-${PROD_PROJECT}', MASTER_USE_GTID=slave_pos;/ if $. == 34" dump.sql'
        ssh_exec "mv dump.sql ${DEPLOY_PATH}/${STAGE_PROJECT}/code/drupal"
    fi


    # Run required scripts on server machine over ssh
    ssh_exec "cd ${DEPLOY_PATH}/${STAGE_PROJECT} \
              && scripts/traefik-setup.sh remote \
              && scripts/prepare-env.sh 'stage' \
              && scripts/drupal-build.sh stage"



fi


if [ ${DEPLOY_ENV} == 'prod' ]; then

    # @toDo
    # Take a back up of existing production project
    PROD_PROJECT=$(ssh_exec "grep PROD_PROJECT ${DEPLOY_PATH}/project.info | cut -d '=' -f 2-")


    # Migrate existing stage server to Prod
    STAGE_PROJECT=$(ssh_exec "grep STAGE_PROJECT ${DEPLOY_PATH}/project.info | cut -d '=' -f 2-")
    ssh_exec "cd ${DEPLOY_PATH}/${STAGE_PROJECT} \
              && scripts/prepare-env.sh 'prod' \
              && scripts/drupal-build.sh prod"

    # Update project.info
    if [ ${STAGE_PROJECT} == 'ying' ]; then
        ssh_exec "echo -e 'PROD_PROJECT=ying\nSTAGE_PROJECT=yang\n' >${DEPLOY_PATH}/project.info"
      else
        ssh_exec "echo -e 'PROD_PROJECT=yang\nSTAGE_PROJECT=ying\n' >${DEPLOY_PATH}/project.info"
    fi

fi