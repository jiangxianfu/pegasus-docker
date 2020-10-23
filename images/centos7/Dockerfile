FROM jiangxianfu/pegasus-docker:centos7-package

MAINTAINER steven

RUN mkdir /pegasus

WORKDIR /pegasus


RUN cd /tmp && tar zxvf cmake-3.10.2.tar.gz && cd cmake-3.10.2 && \
    ./bootstrap && gmake && gmake install

RUN cd /tmp/gcc-7.5.0 && \
    ./configure && make && make install

RUN cd /tmp && tar xvf boost_1_74_0.tar.gz && cd boost_1_74_0 && \
    ./bootstrap.sh && ./b2 install

RUN cd /tmp/pegasus && \
    ./run.sh build -c --clear_thirdparty && \
    ./run.sh pack_tools && \
    ./run.sh pack_server && \
    ./run.sh pack_client && \
    tar xvf pegasus-tools-*.tar.gz && cp -r pegasus-tools-*/* /pegasus && \
    tar xvf pegasus-client-*.tar.gz && cp -r pegasus-client-*/* /pegasus && \
    tar xvf pegasus-server-*.tar.gz && cp -r pegasus-server-*/* /pegasus

ENV LD_LIBRARY_PATH=/pegasus/bin

RUN yum -y install jre nmap-ncat.x86_64
