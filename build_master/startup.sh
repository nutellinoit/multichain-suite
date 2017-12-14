#!/usr/bin/env bash

echo "Siamo nella magica chain:"
echo ${NOMECHAIN}

if [ ! -f /root/.multichain/${NOMECHAIN}/params.dat ]; then
    echo "La chain non esiste ancora, la creo"
    multichain-util create ${NOMECHAIN} -maximum-block-size=1000000 -default-network-port=7447 -default-rpc-port=8000
fi

multichaind ${NOMECHAIN} -shrinkdebugfilesize -printtoconsole