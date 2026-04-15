# Authentification mutuelle TLS - Guide D'implementation Bridge v1.1.0

* [**Table of Contents**](toc.md)
* **Authentification mutuelle TLS**

## Authentification mutuelle TLS

L'accès à l'API nécessite une **authentification mutuelle TLS** (mTLS) sur l'ensemble des endpoints HTTPS.

### Principe

Les échanges utilisent le protocole **TLS avec authentification mutuelle** :

* Le **serveur** présente son certificat au client
* Le **client** présente son certificat au serveur
* Les deux certificats sont validés avant l'établissement de la connexion

### Certificats

Les certificats X.509 nécessaires à l'authentification mutuelle sont **fournis par Enovacom**.

**Caractéristiques** :

* Format : X.509 (PEM ou DER)
* Algorithme : RSA 2048 bits minimum ou ECDSA
* Autorité de certification : Enovacom PKI

### Implémentation côté client

#### Prérequis

Pour se connecter à l'API, le client doit disposer de :

1. **Certificat client**(fourni par Enovacom)
1. **Clé privée**associée au certificat
1. **Certificat de l'autorité de certification**(CA) Enovacom

#### Exemples de configuration

```
curl --cert client-cert.pem \
     --key client-key.pem \
     --cacert ca-cert.pem \
     https://api.example.com/fhir/Patient

```

