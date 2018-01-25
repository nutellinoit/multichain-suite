# Multichain guida ai comandi


## Creiamo la moneta

Trovare un address che può creare un asset (dal master)

```bash

listpermissions issue
listaddresses

```

Quello che ha "ismine" : true. è utilizzabile


Creiamo 50000 PPP (nome arbitrario dato alla moneta)

```bash
issuefrom 1... 1... '{"name":"PPP","open":true}' 50000 0.01 0 '{"origin":"it", "stage":"01", "purpose":"Evento del 26 "}'
```

al posto di ```1...``` andremo a mettere l'address

Vediamo i nostri asset creati

```bash
listassets PPP
```

Vediamo quanti PPP ha l'address che ha creato l'asset

```bash
getaddressbalances 1...
```

## Scambiamo la moneta

Ora, da un altro nodo della rete lanciamo il comando

```bash
getnewaddress
```

Dal master dovremo abilitare questo address, a ricevere e spedire

```bash
grant 2... send,receive
```

Dal master, inviamo dei PPP al secondo address

```bash
sendassetfrom 1... 2... PPP 999
```

Dal nodo, vediamo quanti PPP abbiamo

```bash
getmultibalances
```

## Creiamo un Wallet

Da uno dei nodi, creiamo una coppia chiave pubblica e privata

```bash
createkeypairs
```

L'output sarà simile a questo

```bash
ticketchain: createkeypairs
{"method":"createkeypairs","params":[],"id":1,"chain_name":"ticketchain"}

[
    {
        "address" : "1ashVb5PJQgARkdfkVD8G5nLAMxDnsQfhqdkjx",
        "pubkey" : "02f71f5ba0271084ca800864e7b29a6868c6f9671977458d860008df8fb34d707e",
        "privkey" : "V93fDfWeuivJFv24NHdTHH5sADSTa6krApoqL4aB1XbRC6xFQnbaWkTA"
    }
]

```

Aggiungiamo l'address come "watch only" in modo da poter effettuare delle query

```bash
importaddress 1ashVb5PJQgARkdfkVD8G5nLAMxDnsQfhqdkjx "" false
```

Facciamo la stessa operazione nel primo server

```bash
createkeypairs
```

```bash
ticketchain: createkeypairs
{"method":"createkeypairs","params":[],"id":1,"chain_name":"ticketchain"}

[
    {
        "address" : "1SEgdNPYxGmPe9kLXbqa2rHKGx21LUTGCLtK82",
        "pubkey" : "020721a128a4ebc6d36d73514909a72bee69beaed6d4c9c0acf1e91964b173f991",
        "privkey" : "VDkgMS2uKzY4qpY83r9EejvmeZdQDUYwwDuRsZgsq2C1cAweoF3dasVC"
    }
]

```

Avremo un output simile e importiamo nel primo server l'indirizzo come watch

Dal master ora, dobbiamo abilitare questi address al send e receive

```bash
grant 1ashVb5PJQgARkdfkVD8G5nLAMxDnsQfhqdkjx,1SEgdNPYxGmPe9kLXbqa2rHKGx21LUTGCLtK82 send,receive
```


Dal primo server, inviamo dei PPP nel suo indirizzo in watch only

```bash
sendassetfrom 1AKMGGHfHiKutAAVcYSq36fBd2bLuoxKT3qHNV 1SEgdNPYxGmPe9kLXbqa2rHKGx21LUTGCLtK82 PPP 2000
```

Verifichiamo la transazione 

```bash
getaddressbalances 1SEgdNPYxGmPe9kLXbqa2rHKGx21LUTGCLtK82 0
```


## Creiamo un altra moneta, per scambiarla con la moneta PPP
