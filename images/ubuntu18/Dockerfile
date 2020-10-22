FROM ubuntu:18.04

MAINTAINER steven

RUN mkdir /pegasus

WORKDIR /pegasus

RUN apt-get update -y; \
    apt-get -y install build-essential cmake libboost-system-dev libboost-filesystem-dev libboost-regex-dev \
                       libaio-dev libsnappy-dev libbz2-dev libtool \
                       zlib1g zlib1g.dev patch git curl zip automake libssl-dev;

RUN git clone --recursive https://github.com/XiaoMi/pegasus.git /tmp/pegasus; \
    cd /tmp/pegasus; \
    ./run.sh build -c; \
    ./run.sh pack_tools; \
    ./run.sh pack_server; \
    ./run.sh pack_client; \
	tar xvf pegasus-tools-*.tar.gz;cp -r pegasus-tools-* /pegasus;\
	tar xvf pegasus-client-*.tar.gz;cp -r pegasus-client-* /pegasus;\
	tar xvf pegasus-server-*.tar.gz;cp -r pegasus-server-* /pegasus;

ENV LD_LIBRARY_PATH=/pegasus/bin

RUN apt-get -y install default-jre nmap netcat
