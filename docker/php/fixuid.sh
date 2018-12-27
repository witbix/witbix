#!/bin/sh

# Change UID of 'deploy' as per host user UID
HOST_CURRENT_USER_ID=$(stat -c "%u" /var/www/${PROJECT_NAME})
if [ ${HOST_CURRENT_USER_ID} -ne 0 ]; then
    gosu root usermod -u ${HOST_CURRENT_USER_ID} deploy
    gosu root groupmod -g ${HOST_CURRENT_USER_ID} deploy
fi

exec gosu deploy:deploy "$@"