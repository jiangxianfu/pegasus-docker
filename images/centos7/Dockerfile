FROM jiangxianfu/pegasus-docker:centos7-package

MAINTAINER steven

RUN cd /pegasus && \
    ./run.sh build -c --clear_thirdparty && \
    ./run.sh pack_tools && \
    ./run.sh pack_server && \
    ./run.sh pack_client && \
    tar xvf pegasus-tools-*.tar.gz && cp -r pegasus-tools-*/* /pegasus && \
    tar xvf pegasus-client-*.tar.gz && cp -r pegasus-client-*/* /pegasus && \
    tar xvf pegasus-server-*.tar.gz && cp -r pegasus-server-*/* /pegasus