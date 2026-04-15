# PractitionerBridgeExample02 - Guide D'implementation Bridge v1.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts**](artifacts.md)
* **PractitionerBridgeExample02**

## Example Practitioner: PractitionerBridgeExample02

Langue : fr-FR

Profils: [FR Core Practitioner Profile](https://hl7.fr/ig/fhir/core/2.1.0/StructureDefinition-fr-core-practitioner.html), [Enovacom Bridge Practitioner Profile](StructureDefinition-practitioner-enovacom-bridge.md)

**identifier**: N° ADELI/000000000 (utilisation : official, ), Identifiant interne/XXXXXX (utilisation : usual, ), N° RPPS/10100000000 (utilisation : official, )

**active**: true

**name**: Practitioner UNKNOWN 

**address**: [2 rue des tests MARSEILLE 13008 100](work)



## Resource Content

```json
{
  "resourceType" : "Practitioner",
  "id" : "6b70aeba-4024-4cf0-8959-2d1d6cf15597",
  "meta" : {
    "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner",
    "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-practitioner"]
  },
  "language" : "fr-FR",
  "identifier" : [{
    "use" : "official",
    "type" : {
      "coding" : [{
        "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
        "code" : "ADELI",
        "display" : "N° ADELI"
      }]
    },
    "system" : "https://adeli.esante.gouv.fr",
    "value" : "000000000"
  },
  {
    "use" : "usual",
    "type" : {
      "coding" : [{
        "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
        "code" : "INTRN",
        "display" : "Identifiant interne"
      }]
    },
    "system" : "http://EnovacomBridge.com/130000000/identifiers/practitioner",
    "value" : "XXXXXX"
  },
  {
    "use" : "official",
    "type" : {
      "coding" : [{
        "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
        "code" : "RPPS",
        "display" : "N° RPPS"
      }]
    },
    "system" : "https://rpps.esante.gouv.fr",
    "value" : "10100000000"
  }],
  "active" : true,
  "name" : [{
    "use" : "usual",
    "family" : "UNKNOWN",
    "given" : ["Practitioner"]
  }],
  "address" : [{
    "use" : "work",
    "text" : "[2 rue des tests  MARSEILLE 13008 100]",
    "line" : ["2 rue des tests"],
    "city" : "MARSEILLE",
    "postalCode" : "13008",
    "country" : "100"
  }]
}

```
