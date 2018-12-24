#!/usr/bin/env bash

SSH_USER=${1}
DEPLOY_SERVER=${2}
DEPLOY_USER=${3}

while [ -z ${SSH_USER} ] && [ -z ${DEPLOY_SERVER} ] && [ -z ${DEPLOY_USER} ]; do
    echo "Creating a separate user for deployment purposes"
    echo "###############################################################"
    read -p 'Username who already have ssh access to the deploy server: ' SSH_USER
    echo "###############################################################"
    read -p 'Deploy Server Address: ' DEPLOY_SERVER
    echo "###############################################################"
    read -p 'Deploy User Name for CI/CD: ' DEPLOY_USER
done

# Check if ssh credentials for deploy user has been already generated or exits in your local secrets/ssh dir
if [ ! -f secrets/ssh/${DEPLOY_USER}_rsa.pub ] && [ ! -f secrets/ssh/${DEPLOY_USER}_rsa ]; then
    # Generate ssh key pair
    ssh-keygen -t rsa -N "" -f secrets/ssh/${DEPLOY_USER}_rsa
fi
PUB_KEY=$(cat secrets/ssh/${DEPLOY_USER}_rsa.pub)

ssh -o StrictHostKeyChecking=no ${SSH_USER}@"${DEPLOY_SERVER}" << EOF
set -xe
id -u ${DEPLOY_USER} &>/dev/null || sudo adduser --disabled-password --gecos "" ${DEPLOY_USER}
sudo usermod -a -G docker ${DEPLOY_USER}
sudo mkdir -p /home/${DEPLOY_USER}/.ssh
sudo sh -c " echo ${PUB_KEY} >> /home/${DEPLOY_USER}/.ssh/authorized_keys "
sudo chown -R ${DEPLOY_USER} /home/${DEPLOY_USER}/.ssh
sudo chmod 700 /home/"${DEPLOY_USER}"/.ssh
echo "Authorized key successfully added for user ${DEPLOY_USER} "
EOF