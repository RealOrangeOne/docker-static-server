FROM lsiobase/alpine:3.12

RUN apk add --no-cache nginx-mod-http-fancyindex nginx gettext curl

RUN mkdir -p /run/nginx

ENV INDEX off
ENV FANCY_INDEX off

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

COPY ./default.conf /etc/nginx/default.conf.template

RUN envsubst < /etc/nginx/default.conf.template > /etc/nginx/conf.d/default.conf

HEALTHCHECK --interval=1m --timeout=3s CMD curl -f http://localhost/.ping || exit 1

EXPOSE 80

CMD ["/docker-entrypoint.sh"]
