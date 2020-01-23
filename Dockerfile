FROM ubuntu:18.04

RUN apt-get update && \
    apt-get -y install \
      git gnupg wget curl ca-certificates tar \
      gcc \
      autoconf automake make cmake \
      splint \
      doxygen graphviz && \
    rm -rfv /var/lib/apt/lists/*

ENV CMOCKERY_VERSION 0.1.2
RUN wget "https://github.com/google/cmockery/archive/v${CMOCKERY_VERSION}.tar.gz" \
    && tar -zxf v${CMOCKERY_VERSION}.tar.gz -C /usr/src \
    && cd /usr/src/cmockery-${CMOCKERY_VERSION} \
    && ./configure \
    && make \
    && make install \
    && ldconfig \
    && cd / \
    && rm -f v${CMOCKERY_VERSION}.tar.gz \
    && rm -rf /usr/src/cmockery-${CMOCKERY_VERSION}
