#!/bin/bash -e
# Create config for nginx
j2 /templates/nginx.conf.j2 > /etc/nginx/nginx.conf
exec "$@"
