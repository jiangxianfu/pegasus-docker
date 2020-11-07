FROM centos:7

MAINTAINER steven

RUN yum -y install centos-release-scl scl-utils epel-release; \
    yum -y install devtoolset-7-gcc devtoolset-7-gcc-c++ python3 \
                   automake autoconf make libtool git file wget \
                   unzip which openssl-devel libaio-devel \
                   snappy-devel bzip2-devel zlib zlib-devel \
                   libzstd-devel lz4-devel bison flex patch \
                   ccache zip java-1.8.0-openjdk nmap-ncat \
    yum -y remove gcc g++; \
    yum clean all; rm -rf /var/cache/yum

RUN pip3 install --no-cache-dir cmake

ENV PATH="/opt/rh/devtoolset-7/root/bin/:${PATH}"

RUN git clone --recursive https://github.com/xiaomi/pegasus.git /pegasus

WORKDIR /pegasus

RUN cd /pegasus && ./run.sh build