#!/usr/bin/env bash

#docker run -d --network=traefik-network -p 80:80 -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock --name=traefik traefik:latest --api --docker
#
#
#find . \! -name '.gitkeep' -exec rm -rv {} +
#docker-compose up --build --remove-orphans --force-recreate -d
#docker exec -it witbix sh
#
#
#screen ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty
#
#
#https://www.youtube.com/watch?v=27KBaI24jKI ( https://www.pascallandau.com/blog/setup-phpstorm-with-xdebug-on-docker/ )
#https://blog.jetbrains.com/phpstorm/2018/08/quickstart-with-docker-in-phpstorm/
#https://jtreminio.com/blog/developing-at-full-speed-with-xdebug/
#https://www.jetbrains.com/help/phpstorm/zero-configuration-debugging.html
#
#
#
#docker run -d -v /run/docker/plugins/:/run/docker/plugins/ cwspear/docker-local-persist-volume-plugin
#or
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

#find web -type f -perm /o=w
#
#wget https://getcomposer.org/installer -O - -q | php -- --install-dir=/usr/local/bin -- --filename=composer -- --quiet
#
#wget https://composer.github.io/snapshots.pub -O /home/deploy/.composer/keys.dev.pub
#
#wget https://composer.github.io/releases.pub -O /home/deploy/.composer/keys.tags.pub

#Know the uid/gid of a running process
#stat -c "%u %g" /proc/$pid/
#
#@todo
#envsubst "`printf '${%s} ' $(sh -c "env|cut -d'=' -f1")`" < in.txt > out.txt


#cp .env.example .env

#sed -E 's/^(PROJECT_NAME=).*/\1something/' .env > .pela
#
#
#sed -E 's/^(PROJECT_NAME=).*/\1'"$PROJECT_NAME"'/' .env > .pela

#env | awk -F = '{printf \" $$%s\", $$1}'
#
#envsubst "`printf '${%s} ' $(sh -c "env|cut -d'=' -f1")`" < in.txt > out.txt
#
#printf '%s ' $(sh -c "env|cut -d'=' -f1")


#for item in $(sh -c "env|cut -d'=' -f1") ;
#  do
#    echo $item
#    sed -E 's/^('"$item"'=).*/\'"${item}"'/' .env > .pela
#  done



#echo -e "Host *\n\tStrictHostKeyChecking no\n" > ~/.ssh/config
#sudo chmod 400 ~/.ssh/config

PROJECT_NAME=witbix-dev-test
echo ${PROJECT_NAME//dev/master}

perl -i -lpe 's/^(PROJECT_NAME=).*/\1something/' .env
perl -i -lpe ' s/(.*)=(.*)/sprintf("%s=%s","$1",$ENV{$1}? $ENV{$1}:$2)/ge ' .env
perl -lpe ' s/(.*)=(.*)/sprintf("%s=%s","$1",$ENV{$1}? $ENV{$1}:$2)/ge ' secrets/.env.remote > .env