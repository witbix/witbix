#!/bin/sh

DOCUMENTROOT=web

# Prepare the scaffold files if they are not already present
if [ ! -f $DOCUMENTROOT/autoload.php ]
  then
    composer drupal:scaffold
fi

# Create these dirs. Required for unit testing
dirs=""
dirs="${dirs} modules"
dirs="${dirs} profiles"
dirs="${dirs} themes"
for dir in ${dirs}
   do
     if [ ! -d ${DOCUMENTROOT}/${dir} ]
       then
         mkdir -p ${DOCUMENTROOT}/${dir}
         touch ${DOCUMENTROOT}/${dir}/.gitkeep
     fi
done

# Prepare config and content directories for synchronization of configuration and content
mkdir -p config/sync content/sync && touch config/sync/.gitkeep content/sync/.gitkeep

# Set appropriate permissions for `web` to be accessed by server
chmod -R o=rX web

# Prepare the settings file for installation
if [ ! -f $DOCUMENTROOT/sites/default/settings.php ]
  then
    sed \
      -e "s/\(\$settings\['hash_salt'\] = \)'';/\1'$(php -r 'print bin2hex(openssl_random_pseudo_bytes(32));')';/" \
      $DOCUMENTROOT/sites/default/default.settings.php \
      > $DOCUMENTROOT/sites/default/settings.php

    if [ -f .env ]; then cat >> $DOCUMENTROOT/sites/default/settings.php << 'EOF'
$config_directories['sync'] = '../config/sync';
$config['content_directory'] = '../content/sync';
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
    chmod 740 $DOCUMENTROOT/sites/default/settings.php
    echo "Create a sites/default/settings.php file with chmod 740"
fi

# Prepare the services file for installation
if [ ! -f $DOCUMENTROOT/sites/default/services.yml ]
  then
    cp $DOCUMENTROOT/sites/default/default.services.yml $DOCUMENTROOT/sites/default/services.yml
    chmod 740 $DOCUMENTROOT/sites/default/services.yml
    echo "Create a sites/default/services.yml services.yml file with chmod 740"
fi

# Prepare the files directory for installation
if [ ! -d $DOCUMENTROOT/sites/default/files ]
  then
    ln -s /tmp/files/ web/sites/default/
    echo "Create a symbolic link from sites/default/files to /tmp/files"
fi
