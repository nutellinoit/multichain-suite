#!/usr/bin/env bash

echo "Siamo nella magica chain:"
echo ${NOMECHAIN}

multichain-util create ${NOMECHAIN}

cp /root/params.dat /root/.multichain/${NOMECHAIN}/params.dat
cp /root/multichain.conf /root/.multichain/${NOMECHAIN}/multichain.conf

sed -i -e "s/REPLACE_CHAIN_NAME/${NOMECHAIN}/g" /root/.multichain/${NOMECHAIN}/params.dat

multichaind ${NOMECHAIN} -shrinkdebugfilesize -printtoconsole