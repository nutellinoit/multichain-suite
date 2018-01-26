# multichain example client

Cartella di test per un nodo client alla multichain


## Prerequisiti

* Avere docker installato
    * Mac https://docs.docker.com/docker-for-mac/install/
    * Windows https://docs.docker.com/docker-for-windows/install/
    * Linux

```bash
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
```
* Avere docker-compose installato
    * Su windows e Mac dovrebbe installarsi automaticamente, altrimenti seguire la guida qui: https://docs.docker.com/compose/install/
    * Linux

```bash
 # esempio su debian
 apt-get install python-pip
 pip install docker-compose
```

## Immagini dei container

* [nutellinoit/node-multichain](https://hub.docker.com/r/nutellinoit/node-multichain/): Nodo Slave che si connette al master.

## Configurazione

L'indirizzo di connessione alla chain è all'interno del file ```.env``` ovvero:

```bash
CONNECT_TO=ticketchain@192.168.3.186:7447
```

## Avviare il client

Avviare con il ```docker-compose.yml``` (bisogna essere posizionati nel terminale nella cartella contenente il file docker-compose.yml):

```
sudo docker-compose up -d && sudo sleep 40 && sudo docker-compose stop && sudo docker-compose up
```


## Accedere al proprio nodo

Quando si avvia il client si verrà solamente aggiunti in modalità connect alla chain. Per effettuare transazioni bisogna avere il permesso di send,receive. Per trovare i propri indirizzi basta accedere a http://localhost:8082 sotto la voce *My Addresses*

