# multichain suite

Repository principale di sviluppo di blockchain basate sul servizio multichain

## Immagini dei container

* [nutellinoit/master-multichain](https://hub.docker.com/r/nutellinoit/master-multichain/): master node, creates a blockchain and runs it. *Important: only for development since any node can connect, anyone can administer and the RPC interface is open to all.*
* [nutellinoit/node-multichain](https://hub.docker.com/r/nutellinoit/node-multichain/): Based on the same "base" image and connects to the master node
* [nutellinoit/explorer-multichain](https://hub.docker.com/r/nutellinoit/explorer-multichain/): A node with the Multichain explorer installed

## Avviare il cluster

Avviare con il ```docker-compose.yml```:

```
sudo docker-compose up
```


## Accettazione dei peer

Quando si avvia la soluzione, l'unico nodo che sarà in grado di connettersi sarà il master, gli altri bisogna accettarli.

```bash
docker-compose exec masternode multichain-cli ChainBusnet grant TOKENDELNODO connect,send,receive
```