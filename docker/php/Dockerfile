# From https://www.drupal.org/docs/8/system-requirements/drupal-8-php-requirements
FROM php:7.2-fpm-alpine

ENV GITHUB_TOKEN=XXXXXXXXXXXXXXXXXXXXXXX \
    COMPOSER_HOME=/var/www/.composer

RUN addgroup -g 101 nginx && \
    adduser -D -u 100 -G nginx -s /bin/sh nginx && \
    adduser -D -u 2000 -s /bin/sh -h /var/www/ deploy && \
    apk --no-cache add shadow && \
    apk add --no-cache su-exec && \
    apk add --no-cache inotify-tools 

# Install the PHP extensions we need
# postgresql-dev is needed for https://bugs.alpinelinux.org/issues/3642
RUN set -ex \
	&& apk add --no-cache --virtual .build-deps \
		coreutils \
		freetype-dev \
		libjpeg-turbo-dev \
		libpng-dev \
		postgresql-dev \
		${PHPIZE_DEPS} \
	&& docker-php-ext-configure gd \
		--with-freetype-dir=/usr/include/ \
		--with-jpeg-dir=/usr/include/ \
		--with-png-dir=/usr/include/ \
	&& docker-php-ext-install -j "$(nproc)" \
		gd \
		opcache \
		pdo_mysql \
		pdo_pgsql \
		zip \
	&& pecl install xdebug \
	&& runDeps="$( \
		scanelf --needed --nobanner --format '%n#p' --recursive /usr/local \
			| tr ',' '\n' \
			| sort -u \
			| awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
	)" \
	&& apk add --virtual .drupal-phpexts-rundeps $runDeps \
	&& apk del .build-deps

# Set recommended PHP.ini settings
# See https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=60'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

RUN { \
		echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)"; \
		echo 'xdebug.remote_enable=1'; \
		echo 'xdebug.remote_autostart=off'; \
        echo 'xdebug.remote_handler=dbgp'; \
        echo 'xdebug.remote_port=9000'; \
        echo 'xdebug.remote_connect_back=0'; \
        echo 'xdebug.idekey=docker'; \
        echo 'xdebug.remote_host=host.docker.internal'; \
        echo 'xdebug.extended_info = 1'; \
	} > /usr/local/etc/php/conf.d/xdebug.ini


RUN  set ex \
  # Install Composer( Requires git )
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin -- --filename=composer.phar \
  # Create a helper script to call composer.phar always as user `deploy`
  && echo "su-exec deploy composer.phar \"\$@\";" >> /usr/local/bin/composer \
  && chmod +x /usr/local/bin/composer \
  && chown deploy /var/www/.composer \
  # Install git
  && apk add --no-cache git \
  # Install Prestissimo to force composer to download packages in parallel
  && composer global require hirak/prestissimo \
  # Install Drush luncher
  && wget -O /usr/local/bin/drush.phar https://github.com/drush-ops/drush-launcher/releases/download/0.6.0/drush.phar \
  && chmod +x /usr/local/bin/drush.phar \
  && echo "su-exec deploy drush.phar \"\$@\";" >> /usr/local/bin/drush \
  && chmod +x /usr/local/bin/drush \
  # Install Mysql-client (Required by Drush)
  && apk add --no-cache mysql-client \
  # Install Drupal console luncher
  && curl https://drupalconsole.com/installer -L -o drupal.phar \
  && mv drupal.phar /usr/local/bin/drupal \
  && chmod +x /usr/local/bin/drupal


COPY conf.d/* /usr/local/etc/php/conf.d/
COPY php-fpm.d/* /usr/local/etc/php-fpm.d/
COPY php-fpm.conf /usr/local/etc/

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]
