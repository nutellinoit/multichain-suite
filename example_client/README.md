# multichain example client

Cartella di test per un nodo client alla multichain

## Immagini dei container

* [nutellinoit/node-multichain](https://hub.docker.com/r/nutellinoit/node-multichain/): Nodo Slave che si connette al master.

## Configurazione

Aprire il file ```docker-compose.yml``` e modificare la variabile di ambiente

```yml
CONNECT_TO: nomechain@IP:7447
```

## Avviare il client

Avviare con il ```docker-compose.yml```:

```
sudo docker-compose up
```


## Accedere alla chain

Quando si avvia il client, non si verrà accettati automaticamente alla chain, si dovrà inviare il seguente messaggio ad assistenza@busnet.it per avere il client operativo e collegato alla chain.

```bash

# esempio

multichain-cli ChainBusnet grant TOKENDELNODO connect,send,receive
```