# Docker Static Server

![CI](https://github.com/RealOrangeOne/docker-static-server/workflows/CI/badge.svg)

Customizable and performant static file server - powered by Nginx.

__Note__: This container is designed for hosting static files, rather than for serving a static site.

## _"Why not just use `nginx:alpine`?"_

If you're not really bothered, the default `nginx` container will work just fine for you, however this container has a few modifications which make it more suited to serving static files:

- Use environment variables for [customization](#customization)
- Healthcheck endpoint
- GZIP all files
- Use `X-Forwarded-For` header when getting client IP

Nginx makes a brilliant file server regardless of how you use it.

## Usage

```yml
version: "2.3"

services:
  static:
    image: theorangeone/static-server:latest
    volumes:
      - ".:/srv:ro"
    ports:
      - "80:80"
```

The server will serve files in the `/srv` directory. This directory can be mounted read-only.

## Customization

This image supports some customizations:

- `$INDEX` (`on` / `off`): Enable file listing, powered by [`fancy_index`](https://www.nginx.com/resources/wiki/modules/fancy_index/)
