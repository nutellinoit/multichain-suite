#!/bin/bash -x

sleep 30

ip=`getent hosts masternode | awk -F' ' '{print $1}'`
multichaind busnetchain@$ip:7447 -daemon

sleep 30

echo "rpcport=8000" >> /root/.multichain/busnetchain/multichain.conf
cp /root/.multichain/busnetchain/multichain.conf /root/.multichain/multichain.conf

python -m Mce.abe --config /root/explorer.conf --commit-bytes 100000 --no-serve
python -m Mce.abe --config /root/explorer.conf
