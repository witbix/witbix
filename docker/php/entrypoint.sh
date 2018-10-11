#!/bin/sh

set -e
composer config -g github-oauth.github.com "$GITHUB_TOKEN"

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi

exec "$@"