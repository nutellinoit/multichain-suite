#!/usr/bin/env bash


# Change

if [ ${SET_MULTICHAIN} = "yes" ]; then
    if [ ! -f /code/config.txt ]; then
        #Sostituisco il file con l'esempio
        cp /config.txt /code/config.txt
        sed -i -e "s/CONNECT_TO/${CONNECT_TO}/g" /code/config.txt
        sed -i -e "s/RPCUSERVAR/${RPCUSERVAR}/g" /code/config.txt
        sed -i -e "s/RPCPASSWORDVAR/${RPCPASSWORDVAR}/g" /code/config.txt
    fi
else
  echo "Non risetto il config.txt, skippo"
fi


# Start php server
php-fpm