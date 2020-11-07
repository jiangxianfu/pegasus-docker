FROM centos:7

MAINTAINER steven

RUN yum -y install centos-release-scl scl-utils epel-release; \
    yum -y install python3 automake autoconf make libtool \
                   git file wget ccache zip \
                   unzip which openssl-devel libaio-devel \
                   snappy-devel bzip2-devel zlib zlib-devel \
                   libzstd-devel lz4-devel bison flex patch \
                   java-1.8.0-openjdk nmap-ncat \
    yum clean all; rm -rf /var/cache/yum

ENV BUILD_VERSION=2.1.SNAPSHOT-27e9eef-glibc2.17-release

COPY ./pegasus-client-$BUILD_VERSION.tar.gz /
RUN tar xvf /pegasus-client-$BUILD_VERSION.tar.gz; \
    mv pegasus-client-$BUILD_VERSION pegasus; \
    rm pegasus-client-$BUILD_VERSION.tar.gz

COPY ./pegasus-tools-$BUILD_VERSION.tar.gz /
RUN tar xvf /pegasus-tools-$BUILD_VERSION.tar.gz; \
    mv -f pegasus-tools-$BUILD_VERSION/* pegasus; \
    rm -rf pegasus-tools-$BUILD_VERSION; \
    rm pegasus-tools-$BUILD_VERSION.tar.gz

COPY ./pegasus-server-$BUILD_VERSION.tar.gz /
RUN tar xvf /pegasus-server-$BUILD_VERSION.tar.gz; \
    mv -f pegasus-server-$BUILD_VERSION/* pegasus; \
    rm -rf pegasus-server-$BUILD_VERSION; \
    rm pegasus-server-$BUILD_VERSION.tar.gz

ENV LD_LIBRARY_PATH=/pegasus/bin

WORKDIR /pegasus

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]