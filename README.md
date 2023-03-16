# D_local_environment
A Docker compose structure to setup a customisable default local persistent environment containing PHP stack, Nginx Webserver, MariaDB and PhpMyAdmin dashboard.

## Installation
- Make sure you have docker AND docker compose installe (easiest way to do this is to install docker desktop - [https://www.docker.com/products/docker-desktop/]("Download Docker Desktop") )
- Open the file .end.docker file and edit "WWW_ROOT_FOLDER" AND "MYSQL_SAVE_FOLDER" lines to represent your wishes for storage
- Run the following command: docker compose --env-file=.env.docker up -d
- Let the process finish setting up your environment
- Start coding!

## Services
- PHP stack
- Nginx Webserver
- MariaDB - username = root password = mysql (default)
- PHPMyAdmin - username = root password = mysql (same as Mariadb)

Your webserver is accessed through [http://localhost](http://localhost)
Your PHPMyAdmin dashboard is accessed through [http://localhost:8080](http://localhost:8080)
Your Nginx automatically uses the PHP stack for running your scripts. Just place them in your webserver root folder. 

## Important!
For docker to work you need to have enabled Virtualization in your BIOS (Windows users only).
This installation uses the following ports for it's services. these ports cannot be used by any other program. If you are experiencing troubles setting this up, you should check if these ports are unused. 

| Portnumber | used by? |
|---|---|
| 3306 | MariaDB |
| 80 | Nginx (HTTPS) |
| 443 | Nginx (HTTPS |
| 8001 | Nginx (TCP) |
| 8080 | PHPMyAdmin |


## Useful commands for setting up or managing your docker environment the environment

|  Title | Description  | When to run?  |  Command |
|---|---|---|---|
| Up Command  | Run this command to pull & setup and run/start the containers/services/networks mentioned in the docker-compose.yml. | Run this when you want to start using this environment (you need to have docker & docker compose installed - install docker desktop for the easiest setup. | docker compose --env-file=.env.docker up -d |
| Down command | Stops and removes the containers started with the "up" command (previous command). | Run this when you want to stop using the containers and services (your data will be persisted still) OR when you want to setup a new/different environment. | docker compose --env-file=.env.docker down |
| Cleanup command | Removes stopped containers, unused networks, dangling images, and dangling build cache. && also removes all images not used by a container. | Run this when you have recently used a down command and you want to prevent docker from using stored cache to build new images. | docker system prune && docker image prune -a && docker system prune |
