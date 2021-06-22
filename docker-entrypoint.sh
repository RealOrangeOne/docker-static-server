#!/usr/bin/env sh

set -e

# Update nginx user id
deluser nginx
adduser -u "$PUID" -D nginx

envsubst < /etc/nginx/default.conf.template > /etc/nginx/http.d/default.conf

exec nginx -g "daemon off;"
