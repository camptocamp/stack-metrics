FROM debian:jessie

MAINTAINER Marc Fournier <marc.fournier@camptocamp.com>
ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://pkg.camptocamp.net/apt jessie/staging sysadmin" > /etc/apt/sources.list.d/collectd-c2c.list
RUN apt-key adv --keyserver hkps.pool.sks-keyservers.net --recv-keys 0xE2DCB07F5C662D02
COPY /50collectd /etc/apt/preferences.d/

RUN apt-get update \
 && apt-get -y upgrade \
 && apt-get -y --no-install-suggests --no-install-recommends install \
    collectd-core \
    libjemalloc1 \
    libcurl3-gnutls \
    libgcrypt20 \
    libprotobuf-c1 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

#COPY /docker-entrypoint.sh /
#COPY /docker-entrypoint.d/* /docker-entrypoint.d/
#ENTRYPOINT ["/docker-entrypoint.sh"]

COPY /collectd.conf /etc/collectd.conf
ENV LD_PRELOAD "/usr/lib/x86_64-linux-gnu/libjemalloc.so.1"
CMD ["/usr/sbin/collectd", "-f", "-C", "/etc/collectd.conf"]

EXPOSE 8125/udp
