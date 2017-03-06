FROM ubuntu:16.04
MAINTAINER Leo Laksmana <beol@laksmana.com>

RUN apt-get update \
    && \
    apt-get install -y \
            build-essential \
            make \
            git \
            libsqlite3-dev \
            sqlite3 \
    && \
    apt-get clean
    
WORKDIR /opt

RUN git clone https://github.com/schoolofdevops/facebooc.git \
    && \
    cd facebooc \
    && \
    make all
    
WORKDIR /opt/facebooc
EXPOSE 16000

ENTRYPOINT [ "./bin/facebooc" ]
