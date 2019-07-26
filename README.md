# docker-noip-duc
[![Build Status](https://travis-ci.org/nVentiveUX/docker-noip-duc.svg?branch=master)](https://travis-ci.org/nVentiveUX/docker-noip-duc)

Docker image for no-ip.com Linux Dynamic Update Client installation. Think for RaspberryPi. 
Check tags at https://hub.docker.com/r/nventiveux/docker-noip-duc

## Quick start

Clone this repository and build the Docker image.

```shell
$ git clone git@ssh.github.com:nVentiveUX/docker-noip-duc.git
$ cd docker-noip-duc
$ docker build -rm -t nventiveux/docker-noip-duc -t nventiveux/docker-noip-duc:latest .
```

Configure noip

```shell
$ docker run --rm -it -v "noip:/usr/local/etc/" nventiveux/docker-noip-duc:latest noip2 -C
```

Run as a service

```shell
$ docker service create \
  --name noip \
  --replicas 1 \
  --mount 'type=volume,src=noip,dst=/usr/local/etc/' \
  --no-resolve-image \
  nventiveux/docker-noip-duc:latest
```

Run as a daemon

```shell
$ docker run -d \
  --name noip \
  --volume "noip:/usr/local/etc/" \
  --restart=always \
  nventiveux/docker-noip-duc:latest
```
