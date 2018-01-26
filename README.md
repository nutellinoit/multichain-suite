# multichain suite

Repository principale di sviluppo di blockchain basate sul servizio multichain

Link per client di esempio : [example_node](example_node)
Link per client di esempio su kubernetes : [example_node_kubernetes](example_node_kubernetes) (senza storage)


## Immagini dei container

* [nutellinoit/master-multichain](https://hub.docker.com/r/nutellinoit/master-multichain/): Nodo Master.
* [nutellinoit/node-multichain](https://hub.docker.com/r/nutellinoit/node-multichain/): Nodo Slave che si connette al master.
* [nutellinoit/explorer-multichain](https://hub.docker.com/r/nutellinoit/explorer-multichain/): Nodo con multichain explorer installato.

## Avviare il cluster

Avviare con il ```docker-compose.yml```:

```
sudo docker-compose up
```


## Accettazione dei peer

NB: nell'evento del 26 non servirà

Quando si avvia la soluzione, l'unico nodo che sarà in grado di connettersi sarà il master, gli altri bisogna accettarli.

```bash
docker-compose exec masternode multichain-cli ticketchain grant IDNODO connect,send,receive
```





