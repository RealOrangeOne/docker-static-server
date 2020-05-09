#!/usr/bin/env sh

envsubst < /etc/nginx/default.conf.template > /etc/nginx/conf.d/default.conf

exec nginx -g "daemon off;"
