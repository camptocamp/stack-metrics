FROM camptocamp/confd:v0.12.0-alpha3

ADD ./conf.d /etc/confd/conf.d
ADD ./templates /etc/confd/templates
#ADD ./run.sh /opt/rancher/bin/

ADD /prometheus.yml /etc/prometheus-confd/

ENTRYPOINT ["/confd"]
CMD ["--backend", "rancher", "--prefix", "/2015-12-19", "-log-level", "debug"]
