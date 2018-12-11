FROM nginx:stable-alpine

ENV ENV='/var/cache/nginx/.profile'

RUN set -ex \
    && echo '@et http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
    && apk --no-cache add gosu@et shadow \
    && addgroup -g 5000 www \
    && usermod -a -G www nginx \
    && chmod u+s /usr/bin/gosu \
    && rm /etc/nginx/conf.d/default.conf \
    && chmod u+s /usr/sbin/nginx \
    && echo "umask u=r,go=" > /var/cache/nginx/.profile

COPY nginx.conf /etc/nginx
COPY vhost-templates /vhost-templates
COPY entrypoint.sh /

USER nginx
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
