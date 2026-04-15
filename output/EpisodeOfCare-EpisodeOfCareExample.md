# EpisodeOfCareExample - Guide D'implementation Bridge v1.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts**](artifacts.md)
* **EpisodeOfCareExample**

## Example EpisodeOfCare: EpisodeOfCareExample

Langue : fr-FR

Profil: [Enovacom Bridge EpisodeOfCare Profile](StructureDefinition-episodeOfCare-enovacom-bridge.md)

**identifier**: Account number/018714588 (utilisation : usual, )

**status**: Active

**patient**: `Patient/$id_Patient`

**managingOrganization**: `Organization/$id_OrganizationEtab`



## Resource Content

```json
{
  "resourceType" : "EpisodeOfCare",
  "id" : "EpisodeOfCareExample",
  "meta" : {
    "profile" : ["https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-episodeofcare"]
  },
  "language" : "fr-FR",
  "identifier" : [{
    "use" : "usual",
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code" : "AN",
        "display" : "Account number"
      }]
    },
    "system" : "http://EnovacomBridge.com/{FinessGeo}/identifiers/episodeofcare",
    "value" : "018714588"
  }],
  "status" : "active",
  "patient" : {
    "reference" : "Patient/$id_Patient",
    "type" : "Patient",
    "identifier" : {
      "use" : "usual",
      "type" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
          "code" : "PI",
          "display" : "Patient internal identifier"
        }]
      },
      "system" : "http://EnovacomBridge.com/{FinessGeo}/identifiers/patient",
      "value" : "010208662441"
    }
  },
  "managingOrganization" : {
    "reference" : "Organization/$id_OrganizationEtab",
    "type" : "Organization",
    "identifier" : {
      "use" : "official",
      "type" : {
        "coding" : [{
          "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
          "code" : "FINEG",
          "display" : "FINESS d'entité géographique"
        }]
      },
      "system" : "https://finess.esante.gouv.fr"
    }
  }
}

```
