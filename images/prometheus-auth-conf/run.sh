#!/bin/sh -e

FILE="/etc/haproxy/haproxy.cfg"

mkdir -p $(dirname $FILE)
mkdir -p /var/lib/haproxy
chown nobody.nobody /var/lib/haproxy

while [ ! -f "${FILE}" ]; do
  echo "waiting for ${FILE}"
  sleep 1
done

exec /docker-entrypoint.sh haproxy -f $FILE
