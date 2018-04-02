FROM alpine:latest

ENV version=2.6.1

RUN apk --update add curl && \
    curl -L http://sourceforge.net/projects/leanote-bin/files/${version}/leanote-linux-amd64-v${version}.bin.tar.gz/download >> \
    /usr/local/leanote-linux-amd64-v${version}.bin.tar.gz && \
    apk del --purge curl && \
    rm -rf /var/cache/apk/*

RUN tar -xzvf /usr/local/leanote-linux-amd64-v${version}.bin.tar.gz -C /usr/local

## wkhtmltopdf support
## source: https://github.com/madnight/docker-alpine-wkhtmltopdf/blob/master/Dockerfile
## author: Fabian Beuke <mail@beuke.org>

RUN apk add --update --no-cache \
    libgcc libstdc++ libx11 glib libxrender libxext libintl \
    libcrypto1.0 libssl1.0 \
    ttf-dejavu ttf-droid ttf-freefont ttf-liberation ttf-ubuntu-font-family

COPY wkhtmltopdf /usr/bin

EXPOSE 9000
WORKDIR  /usr/local/leanote/bin
ENTRYPOINT ["sh","run.sh"]
