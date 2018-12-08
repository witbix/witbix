#!/usr/bin/env bash

echo "Creating a separate user who have deploy access on your server"
read -p 'Server Address ' SERVER
read -p 'Deploy User Name ' USER

# Generate ssh key pair
ssh-keygen -t rsa -N "" -f secrets/ssh/${USER}_rsa
PUB_KEY=$(cat secrets/ssh/${USER}_rsa.pub)

ssh -t -o StrictHostKeyChecking=no root@"${SERVER}" << EOF
adduser --disabled-password --gecos "" ${USER}
usermod -a -G docker ${USER}
su ${USER}
mkdir -p /home/${USER}/.ssh
chmod 700 /home/${USER}/.ssh
echo "${PUB_KEY}" >> ~/.ssh/authorized_keys
EOF