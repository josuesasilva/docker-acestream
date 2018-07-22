FROM ubuntu:14.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install wget python-minimal python-setuptools python-m2crypto python-apsw libpython2.7 -y && \
    apt-get clean

WORKDIR /tmp

RUN wget "http://dl.acestream.org/linux/acestream_3.1.16_ubuntu_14.04_x86_64.tar.gz"
RUN tar zxvf acestream_3.1.16_ubuntu_14.04_x86_64.tar.gz
RUN mv acestream_3.1.16_ubuntu_14.04_x86_64 /opt/acestream

EXPOSE 62062 6878 8621

ENTRYPOINT ["/opt/acestream/start-engine", "--client-console"]
