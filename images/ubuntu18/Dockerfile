FROM jiangxianfu/pegasus-docker:ubuntu18-package

MAINTAINER steven

RUN git clone --recursive https://github.com/xiaomi/pegasus.git /pegasus

WORKDIR /pegasus

RUN cd /pegasus && ./run.sh build
