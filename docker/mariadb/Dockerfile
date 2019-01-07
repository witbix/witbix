FROM mariadb:10.3


COPY conf.d /conf.d
COPY entrypoint.d /entrypoint.d
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["mysqld"]