#!/bin/sh

# Regenerate configuration every 30s from rancher-metadata
watch -n 30 timeout -t 15 /bin/configure-prometheus.sh &> /dev/null &

/bin/prometheus \
	-config.file=/etc/prometheus/prometheus.yml \
	-storage.local.path=/prometheus \
	-web.console.libraries=/etc/prometheus/console_libraries \
	-web.console.templates=/etc/prometheus/consoles
