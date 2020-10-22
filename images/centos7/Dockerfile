FROM centos:7

MAINTAINER steven

RUN mkdir /pegasus

WORKDIR /pegasus

RUN yum -y install gcc-c++ automake autoconf libtool make python-devel git file wget unzip which && \
    yum -y install openssl-devel boost-devel libaio-devel snappy-devel bzip2-devel zlib zlib-devel patch

RUN cd /tmp && wget https://cmake.org/files/v3.10/cmake-3.10.2-Linux-x86_64.tar.gz && \
    tar zxvf cmake-3.10.2-Linux-x86_64.tar.gz && \
    cd cmake-3.10.2-Linux-x86_64 && ./bootstrap && gmake && gmake install

RUN cd /tmp && wget http://ftp.gnu.org/gnu/gcc/gcc-7.5.0/gcc-7.5.0.tar.gz && \
    tar -zvxf gcc-7.5.0.tar.gz --remove-files && cd gcc-7.5.0 && \
    sed -i 's/ftp:\/\/gcc.gnu.org\/pub\/gcc\/infrastructure/http:\/\/mirror.linux-ia64.org\/gnu\/gcc\/infrastructure/g' contrib/download_prerequisites && \
    ./contrib/download_prerequisites && \
    ./configure --disable-multilib && \
    make -j`nproc` && \
    make install -j`nproc`

    
RUN git clone --recursive https://github.com/XiaoMi/pegasus.git /tmp/pegasus

RUN cd /tmp/pegasus && \
    ./run.sh build -c && \
    ./run.sh pack_tools && \
    ./run.sh pack_server && \
    ./run.sh pack_client && \
    tar xvf pegasus-tools-*.tar.gz && cp -r pegasus-tools-*/* /pegasus && \
    tar xvf pegasus-client-*.tar.gz && cp -r pegasus-client-*/* /pegasus && \
    tar xvf pegasus-server-*.tar.gz && cp -r pegasus-server-*/* /pegasus

ENV LD_LIBRARY_PATH=/pegasus/bin

RUN yum -y install jre nmap-ncat.x86_64
