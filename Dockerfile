FROM lsiobase/alpine:3.11

RUN apk add --no-cache nginx-mod-http-fancyindex nginx gettext

RUN mkdir -p /run/nginx

ENV INDEX off

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

COPY ./default.conf /etc/nginx/default.conf.template

RUN envsubst < /etc/nginx/default.conf.template > /etc/nginx/conf.d/default.conf

CMD ["/docker-entrypoint.sh"]
