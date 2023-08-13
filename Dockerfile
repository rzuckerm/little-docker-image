FROM alpine:3.18.2

COPY LITTLE_* /tmp/
RUN apk add git make gcc musl-dev bison libxft-dev && \
    mkdir -p /opt && \
    cd /opt && \
    git clone --recursive https://github.com/bitkeeper-scm/little-lang.git && \
    cd little-lang && \
    git reset --hard $(cat /tmp/LITTLE_COMMIT) && \
    make && \
    make install PREFIX=/usr/local && \
    cd / && \
    rm -rf /opt/little-lang && \
    apk del git make gcc musl-dev bison libxft-dev
