#!/bin/sh

# Prepare the scaffold files if they are not already present
if [ ! -f web/autoload.php ]
  then
    composer drupal:scaffold
fi

# Create necessary directories required for unit testing
mkdir -p config/sync \
    content/sync \
    web/modules \
    web/profiles \
    web/themes
touch config/sync/.gitkeep \
    content/sync/.gitkeep \
    web/modules/.gitkeep \
    web/profiles/.gitkeep \
    web/themes/.gitkeep


# Prepare the settings file for installation
if [ ! -f web/sites/default/settings.php ];
  then
    sed \
      -e "s/\(\$settings\['hash_salt'\] = \)'';/\1'$(php -r 'print bin2hex(openssl_random_pseudo_bytes(32));')';/" \
      web/sites/default/default.settings.php \
      > web/sites/default/settings.php

    if [ -f .env ]; then cat >> web/sites/default/settings.php << 'EOF'

$config_directories['sync'] = '../config/sync';
$settings["default_content_deploy_content_directory"] = '../content/sync';
$databases['default']['default'] = array (
  'database' => getenv('MYSQL_DATABASE'),
   'username' => getenv('MYSQL_USER'),
   'password' => getenv('MYSQL_PASSWORD'),
   'prefix' => '',
   'host' => getenv('MYSQL_HOSTNAME'),
   'port' => getenv('MYSQL_PORT'),
   'namespace' => 'Drupal\\Core\\Database\\Driver\\mysql',
   'driver' => 'mysql',
 );
EOF
    fi

    if [ ${REDIS_ENABLE} == 'yes' ]; then cat >> web/sites/default/settings.php << 'EOF'

/**
* Redis Configuration.
*/
$settings['redis.connection']['interface'] = 'PhpRedis';
$settings['cache']['default'] = 'cache.backend.redis';
$settings['redis.connection']['host'] = getenv('REDIS_HOSTNAME');
$settings['container_yamls'][] = 'modules/redis/example.services.yml';
EOF
    fi


    chmod 740 web/sites/default/settings.php
    echo "Create a sites/default/settings.php file with chmod 740"
fi

# Prepare the services file for installation
if [ ! -f web/sites/default/services.yml ]
  then
    cp web/sites/default/default.services.yml web/sites/default/services.yml
    chmod 740 web/sites/default/services.yml
    echo "Create a sites/default/services.yml services.yml file with chmod 740"
fi

# Prepare the files directory for installation
if [ ! -d web/sites/default/files ]
  then
    ln -s /tmp/files/ web/sites/default/
    echo "Create a symbolic link from sites/default/files to /tmp/files"
fi

# Set appropriate permissions for `web`
echo "Setting appropriate permissions"
chgrp -R www web
chgrp -R php-fpm vendor load.environment.php .env
chmod -R o= .
chmod -R g=rX web vendor load.environment.php .env
chmod o=X . web