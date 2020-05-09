#!/usr/bin/env sh

cat /etc/nginx/default.conf.template | envsubst > /etc/nginx/conf.d/default.conf

cat /etc/nginx/conf.d/default.conf

exec nginx -g "daemon off;"
