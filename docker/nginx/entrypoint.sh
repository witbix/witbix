#!/bin/sh

set -e
HOST_CURRENT_USER_ID=$(stat -c "%u" /var/www/"$PROJECT_NAME"/.gitkeep)

mkdir -p /etc/nginx/sites-enabled
cp /etc/nginx/conf.d/drupal-"$DRUPAL_VERSION".conf /etc/nginx/sites-enabled/"$DOMAIN_NAME"
sed -i "s% domain_name% $DOMAIN_NAME%" /etc/nginx/sites-enabled/"$DOMAIN_NAME"
sed -i "s% public_html_root% /var/www/$PROJECT_NAME/web%" /etc/nginx/sites-enabled/"$DOMAIN_NAME"
sed -i "s% php_container_name% "$PROJECT_NAME"%" /etc/nginx/sites-enabled/"$DOMAIN_NAME"

mkdir -p /var/www/"$PROJECT_NAME"/web
cp -a -u /drupal/"$DRUPAL_VERSION".x/. /var/www/"$PROJECT_NAME"/ 2>/dev/null || :

cat >/var/www/"$PROJECT_NAME"/.env << EOF
MYSQL_HOSTNAME=$MYSQL_HOSTNAME
MYSQL_DATABASE=$MYSQL_DATABASE
MYSQL_USER=$MYSQL_USER
MYSQL_PASSWORD=$MYSQL_PASSWORD
MYSQL_PORT=$MYSQL_PORT
EOF


chown -R www-data:${HOST_CURRENT_USER_ID} /var/www/"$PROJECT_NAME"
chmod -R 2570 /var/www/"$PROJECT_NAME"

chown -R nginx:${HOST_CURRENT_USER_ID} /var/www/"$PROJECT_NAME"/web
chmod -R 2570 /var/www/"$PROJECT_NAME"/web

exec "$@"
