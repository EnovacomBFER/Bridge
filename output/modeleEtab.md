# Modèle Etablissement - Guide D'implementation Bridge v1.1.0

* [**Table of Contents**](toc.md)
* **Modèle Etablissement**

## Modèle Etablissement

La section ci-dessous explique comment un établissement peut envoyer un message ADT ou SIU HL7 2.5 via l'API Bridge. Vous y trouverez les étapes et les modalités pour transmettre ces messages conformément aux standards HL7, afin d'assurer une communication efficace et conforme avec le système cible.

## Envoi d'un message

**Endpoint :** POST /eai/request/BRIDGE/ETABLISSEMENT/

**URL :** https://eie-bridge-recette.nd.care/eai/request/BRIDGE/ETABLISSEMENT/

**Paramètres :**

| | | | |
| :--- | :--- | :--- | :--- |
| finess | Finess géographique de l'établissement émetteur | Texte | ✅ |

| | | | |
| :--- | :--- | :--- | :--- |
| Fichier HL7 | fichier de l'établissement | HL7 2.5 | ✅ |

**Exemple de requête :**

```
    curl -X POST https://eie-bridge-recette.nd.care/eai/request/BRIDGE/ETABLISSEMENT/ \
  -H "Content-Type: application/hl7-v2" \
  -H "finess: 830000000" \
  --cert /chemin/vers/certificat.pem \
  --key /chemin/vers/cle_privee.pem \
  --cacert /chemin/vers/ca_certificat.pem \
  --data-binary @message.hl7

```

**Exemple de retour (format XML) :**

```
<enovacomMessage>
   <status>
      <code>200</code>
      <libelle></libelle>
   </status>
   <responseHeader>
      <Cache-Control>no-cache, no-store, max-age=0, must-revalidate</Cache-Control>
      <Date>Tue, 03 Mar 2026 11:23:03 GMT</Date>
      <Pragma>no-cache</Pragma>
      <Transfer-Encoding>chunked</Transfer-Encoding>
      <Location></Location>
      <Server>nginx</Server>
      <Vary>Access-Control-Request-Headers</Vary>
      <Vary>Access-Control-Request-Method</Vary>
      <Vary>Origin</Vary>
      <Content-Location></Content-Location>
      <Content-Type>application/fhir+json;charset=UTF-8</Content-Type>
      <Expires>0</Expires>
   </responseHeader>
   <content>Retour de l'intégation dans la base patient en B64 ( format JSON ) </content>
</enovacomMessage>


```

