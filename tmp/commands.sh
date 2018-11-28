#!/usr/bin/env bash

docker run -d --network=traefik-network -p 80:80 -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock --name=traefik traefik:latest --api --docker


find . \! -name '.gitkeep' -exec rm -rv {} +
docker-compose up -d --build --remove-orphans --force-recreate
docker exec -it witbix sh


screen ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty


https://www.youtube.com/watch?v=27KBaI24jKI ( https://www.pascallandau.com/blog/setup-phpstorm-with-xdebug-on-docker/ )
https://blog.jetbrains.com/phpstorm/2018/08/quickstart-with-docker-in-phpstorm/
https://jtreminio.com/blog/developing-at-full-speed-with-xdebug/
https://www.jetbrains.com/help/phpstorm/zero-configuration-debugging.html



docker run -d -v /run/docker/plugins/:/run/docker/plugins/ cwspear/docker-local-persist-volume-plugin
or
#  local-persist:
#    image: cwspear/docker-local-persist-volume-plugin
#    volumes:
#      - /run/docker/plugins/:/run/docker/plugins/

#  drupal:
#    driver: local-persist
#    driver_opts:
#      mountpoint: $PWD/src


#  drupal:
#    driver: local
#    driver_opts:
#      type: none
#      device: $PWD/code/drupal
#      o: bind