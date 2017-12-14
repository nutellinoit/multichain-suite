#!/usr/bin/env bash

echo "Siamo nella magica chain:"
echo ${NOMECHAIN}

multichain-util create ${NOMECHAIN}

cp /root/.multichain/${NOMECHAIN}/params2.dat /root/.multichain/${NOMECHAIN}/params.dat
cp /root/.multichain/${NOMECHAIN}/multichain2.conf /root/.multichain/${NOMECHAIN}/multichain.conf

sed -i -e "s/REPLACE_CHAIN_NAME/${NOMECHAIN}/g" /root/.multichain/${NOMECHAIN}/params.dat

multichaind ${NOMECHAIN} -shrinkdebugfilesize -printtoconsole