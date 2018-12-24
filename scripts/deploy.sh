#!/usr/bin/env bash

set -xe

DEPLOY_USER=${1}
DEPLOY_SERVER=${2}
DEPLOY_PATH=${3}
DEPLOY_ENV=${5}


## Start ssh-agent and save the ssh session in a sock file defined in ControlPath
#chmod 600 secrets/ssh/${DEPLOY_USER}_rsa
#eval $(ssh-agent)
#ssh -o ControlMaster=auto \
#    -o ControlPath=/tmp/ssh-%r@%h:%p.sock \
#    -o ControlPersist=60 \
#    -o StrictHostKeyChecking=no \
#    -i secrets/ssh/${DEPLOY_USER}_rsa \
#    ${DEPLOY_USER}@${DEPLOY_SERVER}
#
#

#ps -p $SSH_AGENT_PID > /dev/null || eval "$(ssh-agent -s)"
#
#cat > /tmp/ssh_config << 'EOF'
#Host *
#    StrictHostKeyChecking no
#    ControlMaster auto
#    ControlPath /tmp/ssh_%r@%h:%p.sock
#    ControlPersist=60
#EOF
#
#ssh -F /tmp/ssh_config B6xrvy06QdGi1C8MfKsXLZ9Fw@to2.tmate.io "mkdir test"
#
#trap "kill $SSH_AGENT_PID" exit





ps aux | grep -c "[s]sh-agent" > /dev/null || eval $(ssh-agent)
cat > /tmp/ssh_config << EOF
Host ${DEPLOY_SERVER}
    IdentityFile ${PWD}/secrets/ssh/${DEPLOY_USER}_rsa
    StrictHostKeyChecking no
    ControlMaster auto
    ControlPath /tmp/ssh_%r@%h:%p.sock
    ControlPersist=60
EOF
ssh -F /tmp/ssh_config ${DEPLOY_USER}@${DEPLOY_SERVER}





#
#
#if [ ${DEPLOY_ENV} == 'stage' ]; then
#
#    # Access the master directory name
#    ssh ${DEPLOY_USER}@${DEPLOY_SERVER}
#
#    # Start uploading artifacts to server using rsync
#    rsync --info=progress2 \
#        --archive  \
#        --compress \
#        --group \
#        --include="secrets/traefik" \
#        --exclude-from="./scripts/.rsyncexclude" \
#        -e "ssh -T -c aes128-ctr -o Compression=no -o ControlPath=/tmp/ssh-%r@%h:%p.sock -x" \
#        ./  "${DEPLOY_USER}"@"${DEPLOY_SERVER}":"${DEPLOY_PATH}"/${PWD##*/}
#
#    # Run required scripts on server machine over ssh
#    ssh ${DEPLOY_USER}@${DEPLOY_SERVER} "cd ${DEPLOY_PATH}/$(git rev-parse --short HEAD) \
#                                         && scripts/traefik-setup.sh remote \
#                                         && scripts/drupal-build.sh stage"
#fi
#
#
#if [ ${DEPLOY_ENV} == 'prod' ]; then
#
#    # Run required scripts on server machine over ssh
#    ssh ${DEPLOY_USER}@${DEPLOY_SERVER} "cd ${DEPLOY_PATH} \
#                                         && mv ${PROJECT_NAME}-stage ${PROJECT_NAME}-prod-${RANDOM} \
#                                         && cd ${PROJECT_NAME}-prod-* \
#                                         && scripts/drupal-build.sh prod"
#fi