#!/bin/bash -x

sleep 30

ip=${CONNECT_TO}
multichaind $ip -printtoconsole -shrinkdebugfilesize
