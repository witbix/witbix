#!/bin/sh

set -e

if [ "${1:0:1}" = '-' ]; then
	set -- mysqld "$@"
fi


if [ ! -p "/tmp/mysqld.init" ]; then
    mkfifo /tmp/mysqld.init
fi


{

    if [ "$MYSQL_DATABASE" != "" ]; then
        echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` CHARACTER SET utf8 COLLATE utf8_general_ci;"

        if [ "$MYSQL_USER" != "" ]; then
            echo "GRANT ALL ON \`$MYSQL_DATABASE\`.* to '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
	    fi
    fi

    if [ "$REPL_ENABLE" == 'yes' ]; then
        if [ "$REPL_USER" -a "$REPL_PASS" ]; then
            echo "CALL mysql.replica_setup('$REPL_USER','$REPL_PASS');"
        fi
    fi
} > /tmp/mysqld.init &


randNumber=$(head /dev/urandom | tr -dc 0-9 | head -c 3 ; echo '')

if [ "$REPL_ENABLE" == 'yes' ]; then

    exec tini -g -- "$@" --init-file="/tmp/mysqld.init" --server-id=${randNumber} --log-bin=mariadb-bin --relay-log=mariadb-relay-bin

else

    exec tini -g -- "$@" --init-file="/tmp/mysqld.init"

fi