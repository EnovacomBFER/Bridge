# AppointmentExample - Guide D'implementation Bridge v1.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts**](artifacts.md)
* **AppointmentExample**

## Example Appointment: AppointmentExample

Langue : fr-FR

Profils: [FR Core Appointment Profile](https://hl7.fr/ig/fhir/core/2.1.0/StructureDefinition-fr-core-appointment.html), [Enovacom Bridge Appointment Profile](StructureDefinition-appointment-enovacom-bridge.md)

**identifier**: Identifiant interne/45789465 (utilisation : usual, )

**status**: Booked

**serviceType**: FRACTURE DU TIBIA

**description**: FRACTURE DU TIBIA

**start**: 2025-07-24 23:15:00+0000

**end**: 2025-07-25 02:15:00+0000

**minutesDuration**: 180

> **participant****actor**: Salle (Identifier: `http://EnovacomBridge.com/{FinessGeo}/identifiers/location`/UNKNOWN (utilisation : usual, ))**status**: Accepted

> **participant****actor**: [Patient/99a25f60-d947-4b83-ac27-518f1766b96f](Patient/99a25f60-d947-4b83-ac27-518f1766b96f)**status**: Accepted

> **participant****actor**: [Practitioner/86bf354a-5522-485c-8e8c-408f64b025c3](Practitioner/86bf354a-5522-485c-8e8c-408f64b025c3)**status**: Accepted



## Resource Content

```json
{
  "resourceType" : "Appointment",
  "id" : "AppointmentExample",
  "meta" : {
    "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-appointment",
    "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-appointment"]
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
    "system" : "http://EnovacomBridge.com/{FinessGeo}/identifiers/appointment",
    "value" : "45789465"
  }],
  "status" : "booked",
  "serviceType" : [{
    "coding" : [{
      "system" : "https://enovacom.org/ig/fhir/bridge/CodeSystem/enovacom-bridge-appointment-service-type",
      "code" : "BO222",
      "display" : "FRACTURE DU TIBIA"
    }],
    "text" : "FRACTURE DU TIBIA"
  }],
  "description" : "FRACTURE DU TIBIA",
  "start" : "2025-07-24T23:15:00.000Z",
  "end" : "2025-07-25T02:15:00.000Z",
  "minutesDuration" : 180,
  "participant" : [{
    "actor" : {
      "identifier" : {
        "use" : "usual",
        "system" : "http://EnovacomBridge.com/{FinessGeo}/identifiers/location",
        "value" : "UNKNOWN"
      },
      "display" : "Salle"
    },
    "status" : "accepted"
  },
  {
    "actor" : {
      "reference" : "Patient/99a25f60-d947-4b83-ac27-518f1766b96f",
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
        "value" : "004211313"
      }
    },
    "status" : "accepted"
  },
  {
    "actor" : {
      "reference" : "Practitioner/86bf354a-5522-485c-8e8c-408f64b025c3",
      "identifier" : {
        "use" : "usual",
        "system" : "http://EnovacomBridge.com/{FinessGeo}/identifiers/practitioner",
        "value" : "CHIRAB"
      }
    },
    "status" : "accepted"
  }]
}

```
