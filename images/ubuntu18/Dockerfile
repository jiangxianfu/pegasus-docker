FROM jiangxianfu/pegasus-docker:ubuntu18-package

MAINTAINER steven

RUN apt-get -y install byacc flex bison

RUN cd /pegasus && git checkout -b v2.1 remotes/origin/v2.1 && \
    ./run.sh build