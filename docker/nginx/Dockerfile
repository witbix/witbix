FROM nginx:stable-alpine

# add www-data user becaue php process start as same user
RUN adduser -D -u 82 -s /bin/sh www-data && \
    adduser -D -u 2000 -s /bin/sh deploy

# Drupal specific enviroment variables
ENV PROJECT_NAME=test \
    DOMAIN_NAME=localhost \
    DRUPAL_VERSION=8 \
    MYSQL_HOSTNAME=mariadb \
    MYSQL_DATABASE=drupal \
    MYSQL_USER=root \
    MYSQL_PASSWORD=pass \
    MYSQL_PORT=3306 \
    HOST_USER=admin

COPY nginx.conf /etc/nginx
COPY conf.d /etc/nginx/conf.d
COPY entrypoint.sh /
COPY drupal /drupal
RUN chown -R deploy: /drupal/*

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
