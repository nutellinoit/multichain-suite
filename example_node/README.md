# multichain example client

Cartella di test per un nodo client alla multichain


## Prerequisiti

* Avere docker installato
    * Mac https://docs.docker.com/docker-for-mac/install/
    * Windows https://docs.docker.com/docker-for-windows/install/
    * Linux
        * ```bash
           curl -fsSL get.docker.com -o get-docker.sh
           sh get-docker.sh
          ```
* Avere docker-compose installato
    * Su windows e Mac dovrebbe installarsi automaticamente, altrimenti seguire la guida qui: https://docs.docker.com/compose/install/
    * Linux
      * ```bash
         # esempio su debian
         apt-get install python-pip
         pip install docker-compose
        ```

## Immagini dei container

* [nutellinoit/node-multichain](https://hub.docker.com/r/nutellinoit/node-multichain/): Nodo Slave che si connette al master.

## Configurazione

Aprire il file ```docker-compose.yml``` e modificare la variabile di ambiente

```yml
CONNECT_TO: ticketchain@IP:7447
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

multichain-cli ticketchain grant IDNODO connect,send,receive
```