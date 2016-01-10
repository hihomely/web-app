#!/bin/bash -e
# Create config for nginx
j2 /templates/nginx.conf.j2 > /etc/nginx/nginx.conf
# Create javascript web app config
:${OAUTH_GOOGLE_ID:?"OAUTH_GOOGLE_ID is required and must be non-empty"}
:${OAUTH_WINDOWS_ID:?"OAUTH_WINDOWS_ID is required and must be non-empty"}
j2 /templates/js.config.j2 > /usr/share/nginx/html/js/config.js
exec "$@"
