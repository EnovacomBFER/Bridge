# EncounterVisitExample - Guide D'implementation Bridge v1.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts**](artifacts.md)
* **EncounterVisitExample**

## Example Encounter: EncounterVisitExample

Langue : fr-FR

Profils: [Enovacom Bridge Encounter Visit Profile](StructureDefinition-encounter-visit-enovacom-bridge.md), `https://enovacom.com/ig/fhir/StructureDefinition/fr-core-encounter-visit`

**identifier**: Visit Number/3091281 (utilisation : usual, )

**status**: Finished

**class**: [ActCode: AMB](http://terminology.hl7.org/7.1.0/CodeSystem-v3-ActCode.html#v3-ActCode-AMB) (ambulatory)

**type**: Routine

**subject**: [Patient/ay747r1d-y7p9-35o9-p7b1-3j42d3586cp7](Patient/ay747r1d-y7p9-35o9-p7b1-3j42d3586cp7)

**episodeOfCare**: [EpisodeOfCare/j4a58iy1-b3p7-42o9-9bd8-3j42d3586cp7](EpisodeOfCare/j4a58iy1-b3p7-42o9-9bd8-3j42d3586cp7)

### Participants

| | | |
| :--- | :--- | :--- |
| - | **Type** | **Individual** |
| * | Médecin assumant la responsabilité médicale | [IVANESCU CHASTANG](Practitioner/3ba92191-b334-4749-9bd8-1a85d3556ca6) |

**period**: 2024-10-03 08:00:00+0000 --> 2024-10-04 00:00:00+0000

### Hospitalizations

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Origin** | **AdmitSource** | **Destination** |
| * | Etablissement de provenance (Identifier:`https://finess.esante.gouv.fr`/770000446) | General Practitioner referral | Identifier: FINESS d'entité géographique/123456 |

> **location****location**: [Unité d'hébergement](Location/2ea92154-b334-4812-9ae7-1a85d3456er4)

> **location****location**: [Unité de responsabilité médicale](Location/i5a89154-p264-4812-1ak7-1a85d344785p)

**serviceProvider**: [Etablissement de rattachement](Organization/2jg92146-b642-4ae2-71m7-4l8m2345ed4j)



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "EncounterVisitExample",
  "meta" : {
    "profile" : ["https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-encounter-visit",
    "https://enovacom.com/ig/fhir/StructureDefinition/fr-core-encounter-visit"]
  },
  "language" : "fr-FR",
  "identifier" : [{
    "use" : "usual",
    "type" : {
      "coding" : [{
        "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-identifier-type",
        "code" : "VN",
        "display" : "Visit Number"
      }]
    },
    "system" : "http://EnovacomBridge.com/{FinessGeo}/identifiers/encounter",
    "value" : "3091281"
  }],
  "status" : "finished",
  "class" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code" : "AMB",
    "display" : "ambulatory"
  },
  "type" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v2-0007",
      "code" : "R",
      "display" : "Routine"
    }]
  }],
  "subject" : {
    "reference" : "Patient/ay747r1d-y7p9-35o9-p7b1-3j42d3586cp7",
    "identifier" : {
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
  "episodeOfCare" : [{
    "reference" : "EpisodeOfCare/j4a58iy1-b3p7-42o9-9bd8-3j42d3586cp7",
    "identifier" : {
      "type" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
          "code" : "AN",
          "display" : "Account number"
        }]
      },
      "system" : "http://EnovacomBridge.com/{FinessGeo}/identifiers/episodeofcare",
      "value" : "018714588"
    }
  }],
  "participant" : [{
    "type" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v3-ParticipationType",
        "code" : "ATND",
        "display" : "attender"
      }],
      "text" : "Médecin assumant la responsabilité médicale"
    }],
    "individual" : {
      "reference" : "Practitioner/3ba92191-b334-4749-9bd8-1a85d3556ca6",
      "identifier" : {
        "type" : {
          "coding" : [{
            "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
            "code" : "RPPS",
            "display" : "N° RPPS"
          }]
        },
        "system" : "https://rpps.esante.gouv.fr",
        "value" : "10100473148"
      },
      "display" : "IVANESCU CHASTANG"
    }
  }],
  "period" : {
    "start" : "2024-10-03T08:00:00Z",
    "end" : "2024-10-04T00:00:00Z"
  },
  "hospitalization" : {
    "origin" : {
      "identifier" : {
        "system" : "https://finess.esante.gouv.fr",
        "value" : "770000446"
      },
      "display" : "Etablissement de provenance"
    },
    "admitSource" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/admit-source",
        "code" : "gp",
        "display" : "General Practitioner referral"
      }]
    },
    "destination" : {
      "identifier" : {
        "type" : {
          "coding" : [{
            "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
            "code" : "FINEG",
            "display" : "FINESS d'entité géographique"
          }]
        },
        "system" : "https://finess.esante.gouv.fr",
        "value" : "123456"
      }
    }
  },
  "location" : [{
    "location" : {
      "reference" : "Location/2ea92154-b334-4812-9ae7-1a85d3456er4",
      "identifier" : {
        "use" : "usual",
        "type" : {
          "coding" : [{
            "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-location-identifier-type",
            "code" : "INTRN",
            "display" : "Identifiant interne"
          }]
        },
        "system" : "http://EnovacomBridge.com/{FinessGeo}/identifiers/locationUFH",
        "value" : "1412"
      },
      "display" : "Unité d'hébergement"
    }
  },
  {
    "location" : {
      "reference" : "Location/i5a89154-p264-4812-1ak7-1a85d344785p",
      "identifier" : {
        "use" : "usual",
        "type" : {
          "coding" : [{
            "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-location-identifier-type",
            "code" : "INTRN",
            "display" : "Identifiant interne"
          }]
        },
        "system" : "http://EnovacomBridge.com/{FinessGeo}/identifiers/locationUM",
        "value" : "1412"
      },
      "display" : "Unité de responsabilité médicale"
    }
  }],
  "serviceProvider" : {
    "reference" : "Organization/2jg92146-b642-4ae2-71m7-4l8m2345ed4j",
    "identifier" : {
      "use" : "official",
      "type" : {
        "coding" : [{
          "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
          "code" : "FINEG",
          "display" : "FINESS d'entité géographique"
        }]
      },
      "system" : "https://finess.esante.gouv.fr",
      "value" : "750700015"
    },
    "display" : "Etablissement de rattachement"
  }
}

```
