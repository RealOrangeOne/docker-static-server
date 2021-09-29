FROM alpine:latest

RUN apk add --no-cache nginx-mod-http-fancyindex nginx gettext

RUN mkdir -p /run/nginx

ENV INDEX off
ENV FANCY_INDEX off

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

COPY ./default.conf /etc/nginx/default.conf.template

ENV PUID 1000

RUN envsubst < /etc/nginx/default.conf.template > /etc/nginx/http.d/default.conf

RUN touch /etc/nginx/extra.conf

EXPOSE 80

CMD ["/docker-entrypoint.sh"]
