#!/bin/sh

set -e

HOST_CURRENT_USER_ID=$(stat -c "%u" /var/www/witbix/.gitkeep)
usermod -u ${HOST_CURRENT_USER_ID} deploy
groupmod -g ${HOST_CURRENT_USER_ID} deploy
#chown deploy /usr/local/bin/php
#chmod u+s /usr/local/bin/php

#composer config --global github-oauth.github.com ${GITHUB_TOKEN}

# Prefix `php-fpm` if first arg from CMD is not `php-fpm`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi

touch /var/www/witbix/output.txt
#while inotifywait -r -d -o /var/www/witbix/output.txt -e CREATE /var/www/witbix/web/sites/default/files; do chown -R deploy: /var/www/witbix/web/sites/default/files; done
#while inotifywait -d -o /var/www/witbix/output.txt -r -e CREATE /var/www/witbix/web/sites/default/files; do chown -R :deploy /var/www/witbix/web/sites/default/files/; done
exec "$@"
