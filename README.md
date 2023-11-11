# D_local_environment
A Docker compose structure to setup a customisable default local persistent environment containing PHP stack, Nginx Webserver, MariaDB and PhpMyAdmin dashboard.

## Installation
- Make sure you have docker AND docker compose installed (easiest way to do this is to install docker desktop - [Download Docker Desktop](https://www.docker.com/products/docker-desktop) )
- Use a text editor (for example: Visual Studio Code) to open the file `.env.docker` file (this is a hidden file - enable "view hidden files" in your file explorer) and edit the variable lines like `WWW_ROOT_FOLDER` AND `MYSQL_SAVE_FOLDER` to represent your wishes for storage. Make sure both folders exist and use the full path. In this file you can also change ports for the services. 
- Run the following command in the folder you cloned the repo to: `docker compose --env-file=.env.docker up -d`
- Let the process finish setting up your environment
- Start coding!

## Services
- PHP stack
- Nginx Webserver
- Node stack
- MariaDB - username = root password = mysql (default)
- PHPMyAdmin - username = root password = mysql (same as Mariadb)
- Mailhog service

Your webserver is accessed through [http://localhost](http://localhost) (unless you changed ports in the `.env.docker` file)
Your php processes (for example a laravel serve command) is accessed through [http://localhost:8000](http://localhost:8000) (unless you changed ports in the `.env.docker` file)
Your PHPMyAdmin dashboard is accessed through [http://localhost:8080](http://localhost:8080) (unless you changed ports in the `.env.docker` file)
Your Mailhog WebUI is accessed through [http://localhost:8025](http://localhost:8025)(unless you changed ports in the `.env.docker` file)
Your Nginx automatically uses the PHP stack for running your scripts. Just place them in your webserver root folder. 

## Important!
For docker to work you need to have enabled Virtualization in your BIOS (Windows users only).
This installation uses the following ports for it's services. these ports cannot be used by any other program. If you are experiencing troubles setting this up, you should check if these ports are unused. 

| Portnumber | used by? |
|---|---|
| 3306 | MariaDB |
| 80 | Nginx (HTTP) |
| 443 | Nginx (HTTPS) |
| 8000 | PHP |
| 8025 | Mailhog WebUI |
| 1025 | Mailhog (SMTP) |
| 8080 | PHPMyAdmin |


## Useful commands for setting up or managing your docker environment
Make sure to run these commands in the folder where you cloned this repo!!!

|  Title | Description  | When to run?  |  Command |
|---|---|---|---|
| Up Command  | Run this command to pull & setup and run/start the containers/services/networks mentioned in the docker-compose.yml. | Run this when you want to start using this environment (you need to have docker & docker compose installed - install docker desktop for the easiest setup. | `docker compose --env-file=.env.docker up -d` |
| Down command | Stops and removes the containers started with the "up" command (previous command). | Run this when you want to stop using the containers and services (your data will be persisted still) OR when you want to setup a new/different environment. | `docker compose --env-file=.env.docker down` |
| Cleanup command | Removes stopped containers, unused networks, dangling images, and dangling build cache. && also removes all images not used by a container. | Run this when you have recently used a down command and you want to prevent docker from using stored cache to build new images. | `docker system prune && docker image prune -a && docker system prune` |
| Attach command | Attaches your current terminal to a container running in docker. This allows you to run view the process that is running in the container (For example to view print statements). | Run this when you want to view the process running in a container. {container_name} Should be changed to the name of the container you are trying to run the command in. | `docker attach {container_name}` |
| Run command in container | Starts an interactive Terminal (tty) to a container running in docker. This allows you to run commands in the container. | Run this when you want to run commands in a container. For example composer commands in the php container, node commands in the node container or mysqlcommands in the mysql container. {container_name} Should be changed to the name of the container you are trying to run the command in. 'sh' means shell command, you can also use 'bash' to use bash (bash might not work in all containers) | `docker exec -it {container_name} sh` |
