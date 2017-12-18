#!/usr/bin/env bash

echo "Siamo nella magica chain:"
echo ${NOMECHAIN}

if [ ! -f /root/.multichain/${NOMECHAIN}/params.dat ]; then
    echo "La chain non esiste ancora, la creo"
    multichain-util create ${NOMECHAIN} \
     -maximum-block-size=${SETUP_maximum_block_size} \
     -default-network-port=${SETUP_default_network_port} \
     -default-rpc-port=${SETUP_default_rpc_port} \
     -anyone-can-connect=${SETUP_anyone_can_connect} \
     -anyone-can-send=${SETUP_anyone_can_send} \
     -anyone-can-receive=${SETUP_anyone_can_receive} \
     -anyone-can-mine=${SETUP_anyone_can_mine} \
     -mining-diversity=${SETUP_mining_diversity}

fi

multichaind ${NOMECHAIN} -shrinkdebugfilesize -printtoconsole