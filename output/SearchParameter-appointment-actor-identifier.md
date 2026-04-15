# appointment-actor-identifier - Guide D'implementation Bridge v1.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts**](artifacts.md)
* **appointment-actor-identifier**

## SearchParameter: appointment-actor-identifier 

| | |
| :--- | :--- |
| *Official URL*:https://enovacom.org/fhir/SearchParameter/appointment-actor-identifier | *Version*:1.1.0 |
| Active as of 2026-04-15 | *Computable Name*:actor-identifier |

 
Paramètre de recherche pour récupérer une ressource Appointment par la salle de réalisation de l'acte du rendez-vous. 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "appointment-actor-identifier",
  "url" : "https://enovacom.org/fhir/SearchParameter/appointment-actor-identifier",
  "version" : "1.1.0",
  "name" : "actor-identifier",
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
  "description" : "Paramètre de recherche pour récupérer une ressource Appointment par la salle de réalisation de l'acte du rendez-vous.",
  "code" : "actor-identifier",
  "base" : ["Appointment"],
  "type" : "token",
  "expression" : "Appointment.participant.actor.identifier",
  "xpathUsage" : "normal"
}

```
