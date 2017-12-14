#!/bin/bash -x

sleep 30

ip=${CONNECT_TO}
multichaind $ip -daemon

sleep 30

echo "rpcport=8000" >> /root/.multichain/${NOMECHAIN}/multichain.conf
cp /root/.multichain/${NOMECHAIN}/multichain.conf /root/.multichain/multichain.conf

sed -i -e "s/REPLACE_CHAIN_NAME/${NOMECHAIN}/g" /root/explorer.conf

python -m Mce.abe --config /root/explorer.conf --commit-bytes 100000 --no-serve
python -m Mce.abe --config /root/explorer.conf
