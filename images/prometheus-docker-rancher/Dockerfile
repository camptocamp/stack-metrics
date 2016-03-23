FROM prom/prometheus:0.16.2
MAINTAINER Marc Fournier <marc.fournier@camptocamp.com>

COPY prometheus.conf /etc/prometheus/prometheus.yml
COPY run-prometheus.sh /bin/run-prometheus.sh
COPY configure-prometheus.sh /bin/configure-prometheus.sh
ENTRYPOINT [ "/bin/run-prometheus.sh" ]
