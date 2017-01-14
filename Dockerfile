FROM alpine:3.3

ENV version=2.2.2

RUN apk --update add curl && \
    curl -L http://sourceforge.net/projects/leanote-bin/files/${version}/leanote-linux-amd64-v${version}.bin.tar.gz/download >> \
    /usr/local/leanote-linux-amd64-v${version}.bin.tar.gz && \
    apk del --purge curl && \
    rm -rf /var/cache/apk/*

RUN tar -xzvf /usr/local/leanote-linux-amd64-v${version}.bin.tar.gz -C /usr/local

EXPOSE 9000
WORKDIR  /usr/local/leanote/bin
ENTRYPOINT ["sh","run.sh"]
