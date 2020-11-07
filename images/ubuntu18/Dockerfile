FROM ubuntu:18.04

MAINTAINER steven

RUN apt-get update -y; \
    apt-get -y install build-essential python3-pip libaio-dev \
                       libsnappy-dev libbz2-dev libzstd-dev \
                       liblz4-dev zlib1g zlib1g.dev \
                       patch git curl zip automake \
                       libtool libssl-dev bison flex \
                       ccache openjdk-8-jdk nmap netcat; \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir cmake

RUN git clone --recursive https://github.com/xiaomi/pegasus.git /pegasus

WORKDIR /pegasus

RUN cd /pegasus && ./run.sh build
