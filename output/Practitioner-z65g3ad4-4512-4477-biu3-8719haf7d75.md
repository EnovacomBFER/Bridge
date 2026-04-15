# PractitionerBridgeExample01 - Guide D'implementation Bridge v1.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts**](artifacts.md)
* **PractitionerBridgeExample01**

## Example Practitioner: PractitionerBridgeExample01

Langue : fr-FR

Profils: [FR Core Practitioner Profile](https://hl7.fr/ig/fhir/core/2.1.0/StructureDefinition-fr-core-practitioner.html), [Enovacom Bridge Practitioner Profile](StructureDefinition-practitioner-enovacom-bridge.md)

**identifier**: Identifiant interne/UNK (utilisation : usual, )

**active**: true

**name**: Practitioner UNKNOWN 



## Resource Content

```json
{
  "resourceType" : "Practitioner",
  "id" : "z65g3ad4-4512-4477-biu3-8719haf7d75",
  "meta" : {
    "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner",
    "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-practitioner"]
  },
  "language" : "fr-FR",
  "identifier" : [{
    "use" : "usual",
    "type" : {
      "coding" : [{
        "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
        "code" : "INTRN",
        "display" : "Identifiant interne"
      }]
    },
    "system" : "http://EnovacomBridge.com/{FinessGeo}/identifiers/practitioner",
    "value" : "UNK"
  }],
  "active" : true,
  "name" : [{
    "family" : "UNKNOWN",
    "given" : ["Practitioner"]
  }]
}

```
