FROM centos:8

MAINTAINER steven

RUN yum -y install gcc gcc-c++ automake autoconf libtool make cmake git file wget unzip python-devel which && \
    yum -y install openssl-devel boost-devel libaio-devel snappy-devel bzip2-devel zlib zlib-devel patch

RUN git clone --recursive https://github.com/XiaoMi/pegasus.git /pegasus

RUN cd /pegasus && \
    ./run.sh build -c && \
    ./run.sh pack_tools && \
    ./run.sh pack_server && \
    ./run.sh pack_client && \
    tar xvf pegasus-tools-*.tar.gz && cp -r pegasus-tools-* /pegasus && \
    tar xvf pegasus-client-*.tar.gz && cp -r pegasus-client-* /pegasus && \
    tar xvf pegasus-server-*.tar.gz && cp -r pegasus-server-* /pegasus

RUN yum -y install jre nmap-ncat.x86_64

