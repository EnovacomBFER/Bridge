# Enovacom Bridge Appointment Profile - Guide D'implementation Bridge v1.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts**](artifacts.md)
* **Enovacom Bridge Appointment Profile**

## Resource Profile: Enovacom Bridge Appointment Profile 

| | |
| :--- | :--- |
| *Official URL*:https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-appointment | *Version*:1.1.0 |
| Active as of 2025-10-16 | *Computable Name*:AppointmentProfile_ENOVACOM_BRIDGE |

 
Profil de la ressource Appointment pour la France. Ce profil ajoute l'opérateur qui a créé/modifié/annulé le RDV. Il permet de référencer un patient, un professionnel de santé, une salle et éventuellement une offre de soins au RDV. 

**Utilisations:**

* Exemples pour ce/t/te Profil: [Appointment/AppointmentExample](Appointment-AppointmentExample.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/EnovacomBridge|current/StructureDefinition/appointment-enovacom-bridge)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-appointment-enovacom-bridge.csv), [Excel](StructureDefinition-appointment-enovacom-bridge.xlsx), [Schematron](StructureDefinition-appointment-enovacom-bridge.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "appointment-enovacom-bridge",
  "url" : "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-appointment",
  "version" : "1.1.0",
  "name" : "AppointmentProfile_ENOVACOM_BRIDGE",
  "title" : "Enovacom Bridge Appointment Profile",
  "status" : "active",
  "date" : "2025-10-16T11:49:14+02:00",
  "publisher" : "Enovacom",
  "contact" : [{
    "name" : "Enovacom",
    "telecom" : [{
      "system" : "url",
      "value" : "http://enovacom.com"
    }]
  }],
  "description" : "Profil de la ressource Appointment pour la France. Ce profil ajoute l'opérateur qui a créé/modifié/annulé le RDV. Il permet de référencer un patient, un professionnel de santé, une salle et éventuellement une offre de soins au RDV.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "ical",
    "uri" : "http://ietf.org/rfc/2445",
    "name" : "iCalendar"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Appointment",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Appointment",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Appointment",
      "path" : "Appointment"
    },
    {
      "id" : "Appointment.meta.profile",
      "path" : "Appointment.meta.profile",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "$this"
        }],
        "description" : "Slice based on the canonical url value",
        "rules" : "open"
      }
    },
    {
      "id" : "Appointment.meta.profile:fr-canonical",
      "path" : "Appointment.meta.profile",
      "sliceName" : "fr-canonical",
      "min" : 0,
      "max" : "1",
      "patternCanonical" : "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-appointment"
    },
    {
      "id" : "Appointment.meta.profile:bridge-canonical",
      "path" : "Appointment.meta.profile",
      "sliceName" : "bridge-canonical",
      "min" : 0,
      "max" : "1",
      "patternCanonical" : "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-appointment"
    },
    {
      "id" : "Appointment.extension",
      "path" : "Appointment.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "Appointment.extension:appointmentOperator",
      "path" : "Appointment.extension",
      "sliceName" : "appointmentOperator",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-appointment-operator"]
      }]
    },
    {
      "id" : "Appointment.identifier.use",
      "path" : "Appointment.identifier.use",
      "patternCode" : "usual"
    },
    {
      "id" : "Appointment.identifier.type",
      "path" : "Appointment.identifier.type",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
          "code" : "INTRN",
          "display" : "Identifiant interne"
        }]
      }
    },
    {
      "id" : "Appointment.identifier.system",
      "path" : "Appointment.identifier.system",
      "min" : 1,
      "patternUri" : "http://EnovacomBridge.com/{FinessGeo}/identifiers/appointment"
    },
    {
      "id" : "Appointment.identifier.value",
      "path" : "Appointment.identifier.value",
      "min" : 1
    },
    {
      "id" : "Appointment.specialty",
      "path" : "Appointment.specialty",
      "binding" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName",
          "valueString" : "specialty"
        }],
        "strength" : "required",
        "valueSet" : "https://hl7.fr/ig/fhir/core/ValueSet/fr-core-vs-practitioner-specialty"
      }
    },
    {
      "id" : "Appointment.slot",
      "path" : "Appointment.slot",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-slot"]
      }]
    },
    {
      "id" : "Appointment.participant",
      "path" : "Appointment.participant",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "actor.identifier.system"
        }],
        "description" : "slicing du type de participant au rendez-vous",
        "rules" : "open"
      },
      "short" : "Participants au rendez-vous"
    },
    {
      "id" : "Appointment.participant.actor",
      "path" : "Appointment.participant.actor",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Device",
        "http://hl7.org/fhir/StructureDefinition/PractitionerRole",
        "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-related-person",
        "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-healthcare-service",
        "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner",
        "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient",
        "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-location"]
      }]
    },
    {
      "id" : "Appointment.participant:Patient",
      "path" : "Appointment.participant",
      "sliceName" : "Patient",
      "short" : "Patient impliqué dans le rendez-vous.",
      "definition" : "Patient impliqué dans le rendez-vous.",
      "requirements" : "Patient reference.",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Appointment.participant:Patient.actor",
      "path" : "Appointment.participant.actor",
      "short" : "Patient",
      "definition" : "Patient",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient"]
      }]
    },
    {
      "id" : "Appointment.participant:Patient.actor.identifier.system",
      "path" : "Appointment.participant.actor.identifier.system",
      "min" : 1,
      "patternUri" : "http://EnovacomBridge.com/{FinessGeo}/identifiers/patient"
    },
    {
      "id" : "Appointment.participant:Patient.status",
      "path" : "Appointment.participant.status",
      "patternCode" : "accepted"
    },
    {
      "id" : "Appointment.participant:Practitioner",
      "path" : "Appointment.participant",
      "sliceName" : "Practitioner",
      "short" : "Professionnel(s) de santé impliqué(s) dans le rendez-vous.",
      "definition" : "Professionnel(s) de santé impliqué(s) dans le rendez-vous.",
      "requirements" : "Practitioner reference.",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Appointment.participant:Practitioner.actor",
      "path" : "Appointment.participant.actor",
      "short" : "Practitioner",
      "definition" : "Practitioner",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner"]
      }]
    },
    {
      "id" : "Appointment.participant:Practitioner.actor.identifier.system",
      "path" : "Appointment.participant.actor.identifier.system",
      "min" : 1,
      "patternUri" : "http://EnovacomBridge.com/{FinessGeo}/identifiers/practitioner"
    },
    {
      "id" : "Appointment.participant:Practitioner.status",
      "path" : "Appointment.participant.status",
      "patternCode" : "accepted"
    },
    {
      "id" : "Appointment.participant:Location",
      "path" : "Appointment.participant",
      "sliceName" : "Location",
      "short" : "Salle impliquée dans le rendez-vous.",
      "definition" : "Salle impliquée dans le rendez-vous.",
      "requirements" : "Location reference.",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Appointment.participant:Location.actor",
      "path" : "Appointment.participant.actor",
      "short" : "Location",
      "definition" : "Location",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-location"]
      }]
    },
    {
      "id" : "Appointment.participant:Location.actor.identifier.system",
      "path" : "Appointment.participant.actor.identifier.system",
      "min" : 1,
      "patternUri" : "http://EnovacomBridge.com/{FinessGeo}/identifiers/location"
    },
    {
      "id" : "Appointment.participant:Location.status",
      "path" : "Appointment.participant.status",
      "patternCode" : "accepted"
    }]
  }
}

```
