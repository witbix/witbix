#!/bin/sh

set -e

composer config --global github-oauth.github.com ${GITHUB_TOKEN}

# Prefix `php-fpm` if first arg from CMD is not `php-fpm`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi

exec "$@"