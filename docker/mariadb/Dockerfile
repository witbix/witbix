FROM alpine:edge


COPY my.cnf /etc/mysql/my.cnf
COPY conf.d/* /etc/mysql/conf.d/
COPY procedures.sql /procedures.sql

RUN set -ex \
#    && echo 'http://mirror.yandex.ru/mirrors/alpine/edge/main' > /etc/apk/repositories \
#    && echo 'http://mirror.yandex.ru/mirrors/alpine/edge/community' >> /etc/apk/repositories \
    && echo '@et http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
    && apk add --no-cache mariadb mariadb-client tini \
    && mkdir -p /run/mysqld \
    && chown -R mysql:mysql /run/mysqld \
    && ln -snf /usr/lib/mariadb /usr/lib/mysql \
    && mysql_install_db --user=mysql --skip-name-resolve --auth-root-authentication-method=socket --auth-root-socket-user=root --force --rpm --skip-test-db \
    && mysql_embedded < procedures.sql

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 3306

CMD ["mysqld"]