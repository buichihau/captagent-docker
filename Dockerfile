FROM debian:10

MAINTAINER Hau Bui <buichihau98@gmail.com>

RUN apt-get update -y && apt-get install git vim wget make m4 autoconf libexpat-dev libpcap-dev libjson-c-dev libtool automake flex bison libgcrypt-dev libuv1-dev libpcre3-dev libfl-dev -y

WORKDIR /usr/src

RUN cd /usr/src

RUN git clone https://github.com/sipcapture/captagent.git captagent && cd captagent 
RUN  cd /usr/src/captagent && ./build.sh 
RUN  cd /usr/src/captagent && ./configure
RUN  cd /usr/src/captagent && make && make install

WORKDIR /

COPY run.sh /

ENTRYPOINT [ "/run.sh" ]