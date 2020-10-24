FROM jiangxianfu/pegasus-docker:ubuntu18-package

MAINTAINER steven

RUN apt-get -y install byacc flex bison

RUN cd /tmp && wget https://cmake.org/files/v3.18/cmake-3.18.4.tar.gz && \
	tar zxvf cmake-3.18.4.tar.gz && cd cmake-3.18.4 && \
    ./bootstrap && gmake && gmake install

RUN cd /pegasus && git checkout -b v2.1 remotes/origin/v2.1 && \
    ./run.sh build