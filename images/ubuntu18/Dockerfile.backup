FROM ubuntu:18.04

MAINTAINER steven

RUN mkdir /pegasus

WORKDIR /pegasus

RUN apt-get update -y && \
    apt-get -y install build-essential wget cmake libboost-all-dev \
                       libaio-dev libsnappy-dev libbz2-dev libtool \
                       zlib1g zlib1g.dev patch git curl zip unzip automake \
                       libssl-dev libgflags-dev liblz4-dev libzstd-dev

RUN cd /tmp && wget https://dl.bintray.com/boostorg/release/1.74.0/source/boost_1_74_0.tar.gz && \
    tar xvf boost_1_74_0.tar.gz && cd boost_1_74_0 && \
    ./bootstrap.sh && ./b2 install

RUN git clone --recursive https://github.com/apache/incubator-pegasus.git /tmp/pegasus
RUN cd /tmp/pegasus && \
    ./run.sh build -c --clear_thirdparty && \
    ./run.sh pack_tools && \
    ./run.sh pack_server && \
    ./run.sh pack_client && \
    tar xvf pegasus-tools-*.tar.gz && cp -r pegasus-tools-*/* /pegasus && \
    tar xvf pegasus-client-*.tar.gz && cp -r pegasus-client-*/* /pegasus && \
    tar xvf pegasus-server-*.tar.gz && cp -r pegasus-server-*/* /pegasus

ENV LD_LIBRARY_PATH=/pegasus/bin

RUN apt-get -y install default-jre nmap netcat
