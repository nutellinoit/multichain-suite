FROM ubuntu:wily
MAINTAINER Samuele Chiocca

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
        && apt-get upgrade -q -y \
        && apt-get dist-upgrade -q -y \
        && apt-get install -q -y wget \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/* \
        && cd /tmp \
        && wget https://www.multichain.com/download/multichain-1.0.2.tar.gz \
        && tar -xvzf multichain-1.0.2.tar.gz \
        && cd multichain-1.0.2 \
        && mv multichaind multichain-cli multichain-util /usr/local/bin \
        && cd /tmp \
        && rm -Rf multichain*

RUN apt-get update \
        && apt-get install -q -y python python-dev python-pip sqlite3 libsqlite3-dev \
        && pip install pycrypto \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

RUN cd /root \
    && wget https://github.com/MultiChain/multichain-explorer/archive/master.tar.gz \
    && tar -xvzf master.tar.gz \
    && rm -Rf master.tar.gz

ADD ./explorer.conf /root/explorer.conf

RUN cd /root/multichain-explorer-master \
    && python setup.py install --user

ADD ./runservices.sh /root/runservices.sh

EXPOSE 2750

CMD ["/bin/bash", "-x", "/root/runservices.sh"]
