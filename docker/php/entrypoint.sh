#!/bin/sh

# Change UID of 'deploy' as per host user UID
HOST_CURRENT_USER_ID=12000
if [ ${HOST_CURRENT_USER_ID} -ne 0 ]; then
    if [ $(which gosu) ]; then
        gosu root usermod -u ${HOST_CURRENT_USER_ID} deploy && \
        gosu root groupmod -g ${HOST_CURRENT_USER_ID} deploy
    fi
fi


# Execute pool of scripts
for ep in /entrypoint.d/*.sh; do
  if [ -x ${ep} ]; then
    if [ $(which gosu) ]; then
        echo "Running: ${ep} with gosu"
        gosu deploy "${ep}"
      else
        echo "Running: ${ep} without gosu"
        "${ep}"
    fi
  fi
done

exec "$@"