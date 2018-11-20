#!/bin/sh

set -ex

#cp /home/deploy/vhost-templates/drupal-${DRUPAL_VERSION}.conf /etc/nginx/conf.d/${DOMAIN_NAME}.conf
#sed -i "s% domain_name% $DOMAIN_NAME%" /etc/nginx/conf.d/${DOMAIN_NAME}.conf
#sed -i "s% public_html_root% /var/www/$PROJECT_NAME/web%" /etc/nginx/conf.d/${DOMAIN_NAME}.conf
#sed -i "s% php_container_name% "$PROJECT_NAME"%" /etc/nginx/conf.d/${DOMAIN_NAME}.conf


#gosu root sh -c "envsubst < /home/deploy/vhost-templates/drupal-${DRUPAL_VERSION}.conf > /etc/nginx/conf.d/${DOMAIN_NAME}.conf"

gosu root sh -c "envsubst \
          '\$DOMAIN_NAME \$PROJECT_NAME' \
          < /vhost-templates/drupal-${DRUPAL_VERSION}.conf \
          > /etc/nginx/conf.d/${DOMAIN_NAME}.conf" \
          2>/dev/null || :


gosu root chmod o-rwx /usr/bin/gosu 2>/dev/null || :
exec "$@"
