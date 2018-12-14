#!/usr/bin/env bash

set -xe

# Start ssh-agent
chmod 600 secrets/ssh/${1}_rsa
eval $(ssh-agent)
ssh-add secrets/ssh/${1}_rsa

# Start uploading artifacts to server using rsync
rsync --info=progress2 \
      --archive  \
      --compress \
      --group \
      --exclude-from="./scripts/.rsyncignore" \
      -e "ssh -T -c aes128-ctr -o Compression=no -o StrictHostKeyChecking=no -x" . "${1}"@"${2}":"${3}"

# Run required scripts on server machine over ssh
ssh travis@witbix.com "cd ~/test && scripts/test.sh"
ssh travis@witbix.com "cd ~/test && scripts/foo.sh"


