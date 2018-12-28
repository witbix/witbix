#!/bin/sh


# Set github api key to allow composer to access private repo
if [ ${GITHUB_TOKEN} != 'XXXXXXXXXXXXXXXXXXXXXXX' ]; then
    composer config --global github-oauth.github.com ${GITHUB_TOKEN}
fi