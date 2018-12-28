**Build status**

dev: 
[![Build Status](https://travis-ci.com/witbix/witbix.svg?token=55CADUHzgmryMHLpbyAs&branch=dev)](https://travis-ci.com/witbix/witbix)
stage:
[![Build Status](https://travis-ci.com/witbix/witbix.svg?token=55CADUHzgmryMHLpbyAs&branch=stage)](https://travis-ci.com/witbix/witbix)
prod: 
[![Build Status](https://travis-ci.com/witbix/witbix.svg?token=55CADUHzgmryMHLpbyAs&branch=prod)](https://travis-ci.com/witbix/witbix)


# Ground Work (If you have not completed yet)
* Install [Docker](https://docs.docker.com/install). For Mac users Docker 'Edge' version is recommended. 

* Enable Traefik proxy server following below commands to access your services using a "Domain name" instead of "IP:port". This is an one time setup and can be used with all docker projects. This is useful for both Drupal and Non-Drupal projects. As this project is configured to work with Traefik by default so we recommend you should set up it first if you have not done it yet. If you don't want to enable Traefik, then you need to manually provide a port number to services and access them using localhost:port.
    ```
    docker network create -d bridge traefik-network
    docker run -d --network=traefik-network -p 80:80 -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock --name=traefik traefik:latest --api --docker
    ```

# Project Setup 

Step 1 
``````
git clone https://github.com/blogenic/blogenic.git
```````
Step 2 
````````
Rename .env.example to .env and modify the variables like PROJECT_NAME etc as per your requirements
``````````````
Step 3
````````
docker-compose up -d
````````

# Drupal Setup


Step 1 (Open a container terminal)
````````
docker exec -it PROJECT_NAME sh
````````
Step 2 (Install Drupal dependencies)
``````
composer install
``````
Step 3 (Complete site installation by browsing url http://PROJECT_NAME.localhost or by executing below command)
``````
drush si --account-name=YOUR_NAME  --account-pass=YOUR_PASS 
``````
Step 4 (Import configuration)
``````
drush cim --partial
``````
Step 5 (Import Content)
``````
drush dcdi
``````
Step 6 (Clear cache)
``````
drush cr
``````

# NOTE 
This project uses [Config_Split](https://www.drupal.org/project/config_split) for configuration management and [default_content_deploy](https://github.com/HBFCrew/default_content_deploy) for content management. Go to 
their respective project page to know more in case you want export your configuration and contents.

If you are a developer you may import and export some extra config by executing `drush csim dev_config` and `drush csex dev_config` respectively.
If you are a live site administrator you should execute `drush csim live_config` and `drush csex live_config`.
