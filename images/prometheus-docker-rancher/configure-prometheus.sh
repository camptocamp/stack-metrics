#!/bin/sh

BASEURL='http://rancher-metadata/latest/services/'
mkdir -p /var/monitors/

for service in $(wget -qO - $BASEURL | cut -f2 -d=); do

  PORT=$(wget -qO - "${BASEURL}/${service}/labels/prometheus_port")
  if [ $? -eq 0 ]; then

    for container in $(wget -qO - "${BASEURL}/${service}/containers/" | cut -f2 -d=); do

      IP=$(wget -qO - "${BASEURL}/${service}/containers/${container}/primary_ip")
      if [ $? -eq 0 ]; then
        echo "- targets:" > /var/monitors/${container}.yaml
        echo "  - ${IP}:${PORT}" >> /var/monitors/${container}.yaml
      fi
    done
  fi
done

find /var/monitors/ -type f -mmin +1 -delete
