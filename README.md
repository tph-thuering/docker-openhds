## OpenHDS Docker setup ##

We want to be able to setup OpenHDS fast and easy.

This prototype is meant to make that process as easy as possible with docker.

Current status:
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
* [ ] Functional Testing

Description of how development of this currently works:

You build the docker container with the provided Dockerfile:

1. `docker build git://github.com/tph-thuering/docker-openhds`

> You need a .env file with credentials vars, for example [.env](https://raw.githubusercontent.com/tph-thuering/docker-openhds/master/.env.example)

> Also give the container you want to build a label for easier handling with the flag `-t`

Or if you want to build it locally:

1. `git clone git@github.com:tph-thuering/docker-openhds.git docker-openhds`
2. `cd docker-openhds`
3. `docker build -t openhds-base .`

To snoop around whats inside the container:

1. `docker run -it openhds-base /bin/bash`

Once inside, execute the initial setup script:
`/opt/openhds/install/setup.sh`

In the future we pull directly from dockerhub without using this repo:

```bash
docker pull swisstph/openhds
docker run -p 8080:8080 -p 8082:8082 -p 8443:8443 -d -t swisstph/openhds
```


Using docker-specific environment variables for initial setup (credentials) is recommended to enable portability.

Usually you load them from .env in a development setup. `. .env` or `source .env` (linux)

For production we might need to discuss on how to do this on all needed platforms.
