# patient-creation-date - Guide D'implementation Bridge v1.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts**](artifacts.md)
* **patient-creation-date**

## SearchParameter: patient-creation-date 

| | |
| :--- | :--- |
| *Official URL*:https://enovacom.org/fhir/SearchParameter/patient-creation-date | *Version*:1.1.0 |
| Active as of 2026-04-15 | *Computable Name*:creation-date |

 
Paramètre de recherche pour récupérer une ressource Patient par sa date de création. 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "patient-creation-date",
  "meta" : {
    "versionId" : "1",
    "lastUpdated" : "2025-11-26T15:30:54.210+01:00",
    "source" : "#rXoDTkKE488QKJ8H"
  },
  "url" : "https://enovacom.org/fhir/SearchParameter/patient-creation-date",
  "version" : "1.1.0",
  "name" : "creation-date",
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
  "description" : "Paramètre de recherche pour récupérer une ressource Patient par sa date de création.",
  "code" : "creation-date",
  "base" : ["Patient"],
  "type" : "date",
  "expression" : "Patient.extension('https://enovacom.org/fhir/bridge/StructureDefinition/enovacom-patient-creation-date')",
  "xpathUsage" : "normal"
}

```
