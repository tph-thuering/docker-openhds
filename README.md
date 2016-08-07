## OpenHDS Docker setup ##

We want to be able to setup OpenHDS fast and easy.

This prototype is meant to make that process as easy as possible with docker.

Current status:
* [X] Mysql Setup scripts
* [ ] Tomcat6 Setup scripts
* [ ] OpenHDS Setup scripts
* [ ] Functional Testing

Description of how development of this currently works:

You build the docker container with the provided Dockerfile:

1. `cd docker-openhds`
2. `docker build -t openhds-base`

To snoop around whats inside the container:

1. `docker run -it openhds-base /bin/bash`

Once inside, execute the initial setup script:
`/opt/openhds/install/setup.sh`

In the future we pull directly from dockerhub without using this repo:

```
docker pull SwissTPH/openhds
docker run -t SwissTPH/openhds $opts
```


Using docker-specific environment variables for initial setup (credentials) is recommended to enable portability.
Usually you load them from .env in a development setup. `. .env` or `source .env` (linux)
For production we might need to discuss on how to do this on all needed platforms.
