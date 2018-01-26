#!/bin/bash -x

sleep 15


if [ ${SET_MULTICHAIN} = "yes" ]; then
    if [ -f /root/.multichain/${NOMECHAIN}/multichain.conf ]; then
        #Sostituisco il file con l'esempio
        echo "Copio il file template"
        cp /root/examplemultichain.conf /root/.multichain/${NOMECHAIN}/multichain.conf
        echo "SED 1"
        sed -i -e "s/RPCUSERVAR/${RPCUSERVAR}/g" /root/.multichain/${NOMECHAIN}/multichain.conf
        echo "SED 2"
        sed -i -e "s/RPCPASSWORDVAR/${RPCPASSWORDVAR}/g" /root/.multichain/${NOMECHAIN}/multichain.conf
    fi
else
  echo "Non risetto il multichain.conf, skippo"
fi




ip=${CONNECT_TO}
multichaind $ip -printtoconsole -shrinkdebugfilesize
