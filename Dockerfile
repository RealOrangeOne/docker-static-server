FROM lsiobase/alpine:3.11

RUN apk add --no-cache nginx-mod-http-fancyindex nginx
