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


RUN multichain-util create busnetchain
ADD ./params.dat /root/.multichain/busnetchain/params.dat
ADD ./multichain.conf /root/.multichain/busnetchain/multichain.conf

EXPOSE 7447
EXPOSE 8000

CMD ["multichaind", "busnetchain", "-shrinkdebugfilesize", "-printtoconsole"]
