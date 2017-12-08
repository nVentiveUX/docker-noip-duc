FROM arm32v6/alpine:latest

MAINTAINER nVentiveUX

RUN set -x \
  && apk add --no-cache --update wget tar build-base;

RUN set -x \
  && mkdir -p /opt/noip \
  && wget -q "http://www.noip.com/client/linux/noip-duc-linux.tar.gz" -O /opt/noip/noip.tar.gz \
  && tar -C /opt/noip --strip-components=1 -xvf /opt/noip/noip.tar.gz \
  && sed -i '/no-ip2.conf/d' /opt/noip/Makefile \
  && make -C /opt/noip install \
  && rm /opt/noip/noip.tar.gz;
  
CMD noip2; while pgrep noip > -; do echo "Process is running"; sleep 5; done; echo "No-ip has died"; exit 1

