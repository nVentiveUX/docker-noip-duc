# hadolint ignore=DL3007
FROM arm32v6/alpine:latest
LABEL maintainer="nVentiveUX"

COPY qemu-arm-static /usr/bin/qemu-arm-static

# hadolint ignore=DL3018
RUN set -eux; \
  apk update && apk add --no-cache --update rsyslog wget tar \
  && apk add --no-cache --update --virtual .builddeps build-base;

RUN set -eux; \
  mkdir -pv /opt/noip \
  && wget -q "http://www.noip.com/client/linux/noip-duc-linux.tar.gz" -O /opt/noip/noip.tar.gz \
  && tar -C /opt/noip --strip-components=1 -xvf /opt/noip/noip.tar.gz \
  && sed -i '/no-ip2.conf/d' /opt/noip/Makefile \
  && make -C /opt/noip install \
  && rm /opt/noip/noip.tar.gz \
  && apk del .builddeps;

CMD syslogd; noip2; tail -f /var/log/messages;
