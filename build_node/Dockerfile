FROM ubuntu:xenial
MAINTAINER Samuele Chiocca

ENV DEBIAN_FRONTEND noninteractive



RUN apt-get update \
        && apt-get upgrade -q -y \
        && apt-get dist-upgrade -q -y \
        && apt-get install -q -y wget \
        && apt-get install -q -y software-properties-common \
        && apt-get clean

RUN add-apt-repository main
RUN add-apt-repository universe
RUN add-apt-repository restricted
RUN add-apt-repository multiverse

RUN rm -rf /var/lib/apt/lists/* \
        && cd /tmp \
        && wget https://www.multichain.com/download/multichain-1.0.2.tar.gz \
        && tar -xvzf multichain-1.0.2.tar.gz \
        && cd multichain-1.0.2 \
        && mv multichaind multichain-cli multichain-util /usr/local/bin \
        && cd /tmp \
        && rm -Rf multichain*

ADD ./connect-node.sh /root/connect-node.sh

ADD ./multichain.conf /root/examplemultichain.conf

RUN chmod 777 /root/examplemultichain.conf
RUN chmod 777 /root/connect-node.sh

EXPOSE 7447
EXPOSE 8000

CMD ["/bin/bash", "-x", "/root/connect-node.sh"]
