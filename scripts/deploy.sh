#!/usr/bin/env bash

set -xe

# Start ssh-agent
chmod 600 secrets/ssh/${1}_rsa
eval $(ssh-agent)
ssh-add secrets/ssh/${1}_rsa
ssh-keyscan  ${DEPLOY_SERVER} >> ~/.ssh/known_hosts

# Start uploading artifacts to server using rsync
rsync --info=progress2 \
      --archive  \
      --compress \
      --group \
      --exclude-from="./scripts/.rsyncignore" \
      -e "ssh -T -c aes128-ctr -o Compression=no -o StrictHostKeyChecking=no -x" . "${1}"@"${2}":"${3}"

# Run required scripts on server machine over ssh
ssh -o StrictHostKeyChecking=no travis@witbix.com "cd ~/witbix-debug && scripts/test.sh"
ssh -o StrictHostKeyChecking=no travis@witbix.com "cd ~/witbix-debug && scripts/foo.sh"
