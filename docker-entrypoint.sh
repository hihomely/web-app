#!/bin/bash -e
# Create config for nginx
j2 /templates/nginx.conf.j2 > /etc/nginx/nginx.conf
# Create javascript web app config
[ -z "$OAUTH_GOOGLE_ID" ] && echo "Need to set OAUTH_GOOGLE_ID" && exit 1;
[ -z "$OAUTH_WINDOWS_ID" ] && echo "Need to set OAUTH_WINDOWS_ID" && exit 1;
j2 /templates/js.config.j2 > /usr/share/nginx/html/js/config.js
exec "$@"
