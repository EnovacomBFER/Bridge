# encounter-location-identifier - Guide D'implementation Bridge v1.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts**](artifacts.md)
* **encounter-location-identifier**

## SearchParameter: encounter-location-identifier 

| | |
| :--- | :--- |
| *Official URL*:https://enovacom.org/fhir/bridge/SearchParameter/encounter-location-identifier | *Version*:1.1.0 |
| Active as of 2026-04-15 | *Computable Name*:location-identifier |

 
Paramètre de recherche pour récupérer une ressource Encounter par l'identifiant métier de la location (Unité d'hébergement ou de responsabilité médicale). 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "encounter-location-identifier",
  "url" : "https://enovacom.org/fhir/bridge/SearchParameter/encounter-location-identifier",
  "version" : "1.1.0",
  "name" : "location-identifier",
  "status" : "active",
  "date" : "2026-04-15T14:29:25+02:00",
  "publisher" : "Enovacom",
  "contact" : [{
    "name" : "Enovacom",
    "telecom" : [{
      "system" : "url",
      "value" : "http://enovacom.com"
    }]
  }],
  "description" : "Paramètre de recherche pour récupérer une ressource Encounter par l'identifiant métier de la location (Unité d'hébergement ou de responsabilité médicale).",
  "code" : "location-identifier",
  "base" : ["Encounter"],
  "type" : "token",
  "expression" : "Encounter.location.location.identifier",
  "xpathUsage" : "normal"
}

```
