FROM ubuntu:18.04

RUN apt-get update &&\
    apt-get -y --no-install-recommends install \
      git gnupg wget curl ca-certificates tar && \
      gcc \
      autoconf make cmake \
      splint \
      doxygen graphviz && \
      \
      git clone https://github.com/google/cmockery.git && \
      cd cmockery && ./configure && make && make install && ldconfig && cd .. && \
      rm -rf cmockery.git && \
      \
    rm -rfv /var/lib/apt/lists/*
