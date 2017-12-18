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
     -mining-diversity=${SETUP_mining_diversity} \
     -anyone-can-activate=${SETUP_anyone_can_activate}

fi


if [ ${SET_MULTICHAIN} = "yes" ]; then
    if [ -f /root/.multichain/${NOMECHAIN}/multichain.conf ]; then
        #Sostituisco il file con l'esempio
        cp /root/examplemultichain.conf /root/.multichain/${NOMECHAIN}/multichain.conf
        sed -i -e "s/RPCUSERVAR/${RPCUSERVAR}/g" /root/.multichain/${NOMECHAIN}/multichain.conf
        sed -i -e "s/RPCPASSWORDVAR/${RPCPASSWORDVAR}/g" /root/.multichain/${NOMECHAIN}/multichain.conf
        sed -i -e "s/DEFAULTRPCPORT/${SETUP_default_rpc_port}/g" /root/.multichain/${NOMECHAIN}/multichain.conf
    fi
else
  echo "Non risetto il multichain.conf, skippo"
fi



multichaind ${NOMECHAIN} -shrinkdebugfilesize -printtoconsole