# docker-noip-duc
[![Build Status](https://travis-ci.org/nVentiveUX/docker-noip-duc.svg?branch=master)](https://travis-ci.org/nVentiveUX/docker-noip-duc)

Docker image for no-ip.com Linux Dynamic Update Client installation. Think for RaspberryPi. 

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

Run the service

```shell
$ docker service create \
  --name noip \
  --replicas 1 \
  --mount 'type=volume,src=noip,dst=/usr/local/etc/' \
  --no-resolve-image \
  nventiveux/docker-noip-duc:latest
```

Check

```shell
$ docker logs noip.1.<ID>
```
