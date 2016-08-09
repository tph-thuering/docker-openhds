## OpenHDS Docker setup ##

We want to be able to setup OpenHDS fast and easy.

This prototype is meant to make that process as easy as possible with docker.

### Current status: ###
* [X] Apache Setup script
* [X] Mysql Setup scripts
  * [X] user setup (from environment vars) (one user for all tables)
  * [X] database schemas
    * [X] openhds
    * [X] odk_prod
    * [X] mirthdb
* [ ] Tomcat6 Setup scripts (issue: Tomcat init script prints fail, but works)
  * [X] Installation script
  * [ ] deploy openhds WAR-file through a deployment script
* [X] Mirth Setup scripts
  * [X] Installation script
  * [ ] Channel import script
* [ ] OpenHDS Setup scripts
  * [ ] ODKAggregate
  * [ ] HDSS Core XLSFORMS
  * [ ] Data Management SQL setup
  * [ ] Custom location hierarchy
* [ ] Setup docker "forever" script and make sure services keep running
* [ ] Functional Testing

### How to build this: ###

Build the docker container with the provided Dockerfile:

1. `docker build git://github.com/tph-thuering/docker-openhds`

> You need a .env file with credentials vars in your local folder, for example [.env](https://raw.githubusercontent.com/tph-thuering/docker-openhds/master/.env.example)

> Also give the container you want to build a label for easier handling with the flag `-t`

### How to develop this: ###

Build it locally:

1. `git clone git@github.com:tph-thuering/docker-openhds.git docker-openhds`
2. `cd docker-openhds`
3. `docker build -t openhds-base .`

> You need a .env file with credentials vars in your local folder, for example [.env](https://raw.githubusercontent.com/tph-thuering/docker-openhds/master/.env.example). You can copy .env.example from the local repo to .env

Snoop around whats inside the container:

1. `docker run -it openhds-base /bin/bash`

Once inside, execute the initial setup script:

`/opt/openhds/install/setup.sh`

This runs all other setup.sh scripts with parameters from the environment.

There are currently the following variables (with defaults from `.env.example`):

```bash
MYSQL_USER=test
MYSQL_PW=pw
TOMCAT_USER=test
TOMCAT_PW=pw
MIRTH_USER=test
MIRTH_PW=pw
MIRTH_PORT=8082
MIRTH_ADM_PORT=8443
```

Default port of tomcat is 8080 and apache 80.

Using docker-specific environment variables for initial setup (credentials) is recommended to enable deployment portability.

By convention you load them from `.env` in a development setup. `. .env` or `source .env`

This sets all parameters from `.env`.

### How to run: ###

In the future a user pulls directly from dockerhub without using this git-repo:

```bash
docker pull swisstph/openhds
docker run -e "var=value" -p 80:80 -p 8080:8080 -p 8082:8082 -p 8443:8443 -d -t swisstph/openhds
```

