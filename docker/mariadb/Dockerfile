FROM mariadb:10.3


COPY conf.d /conf.d
COPY initdb.d /initdb.d


COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["mysqld"]