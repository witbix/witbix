FROM alpine:3.8

ENV ENV='/home/deploy/.profile'

RUN set -ex \
    && echo '@em http://dl-cdn.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories  \
    && echo '@ec http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories \
    && echo '@et http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
    && apk --no-cache add \
            php7-fpm \
            php7-ctype \
            mysql-client \
            php7-curl \
            php7-dom \
            php7-ftp \
            php7-gd \
            php7-json \
            php7-mbstring \
            php7-pdo \
            php7-pdo_mysql \
            php7-session \
            php7-simplexml \
            php7-tokenizer \
            php7-xml \
            php7-xmlwriter \
            php7-opcache \
            php7-xdebug \
            php7 \
            zip \
            git \
            php7-posix \
            composer@ec \
            shadow \
            gosu@et \
            acl \
    && addgroup -g 1000 deploy \
    && adduser -D -u 1000 -G deploy -s /bin/sh deploy \
    && addgroup -g 4000 php-fpm \
    && adduser -D -u 4000 -G php-fpm php-fpm \
    && addgroup -g 5000 www \
    && usermod -a -G www php-fpm \
    && usermod -a -G www deploy \
    && usermod -a -G php-fpm deploy \
    && chmod u+s /usr/sbin/php-fpm7 \
    && chmod u+s /usr/bin/gosu \
    && wget -O /usr/local/bin/drush https://github.com/drush-ops/drush-launcher/releases/download/0.6.0/drush.phar \
    && chmod +x /usr/local/bin/drush \
    && wget -O /usr/local/bin/drupal https://drupalconsole.com/installer \
    && chmod +x /usr/local/bin/drupal \
    && mkdir /tmp/files \
    && chmod 777 /tmp/files \
    && echo "umask u=rwx,g=rX,o=" > /home/deploy/.profile

COPY php-ini.d /etc/php7/conf.d
COPY php-fpm.d /etc/php7/php-fpm.d
EXPOSE 9000

USER deploy
COPY --chown=deploy drupal-templates /home/deploy/drupal-templates
RUN composer global require hirak/prestissimo \
    && wget https://composer.github.io/snapshots.pub -O /home/deploy/.composer/keys.dev.pub \
    && wget https://composer.github.io/releases.pub -O /home/deploy/.composer/keys.tags.pub

COPY entrypoint.d /entrypoint.d
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm7","-F"]
