#!/bin/sh

set -ex

gosu root sh -c "envsubst \
          '\$DOMAIN_NAME \$PROJECT_NAME' \
          < /vhost-templates/drupal-${DRUPAL_VERSION}.conf \
          > /etc/nginx/conf.d/${DOMAIN_NAME}.conf" \
          2>/dev/null || :

gosu root chmod o-rwx /bin/su 2>/dev/null || :
gosu root chmod o-rwx /usr/bin/gosu 2>/dev/null || :
exec "$@"
