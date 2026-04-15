# Enovacom Bridge Encounter Visit Profile - Guide D'implementation Bridge v1.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts**](artifacts.md)
* **Enovacom Bridge Encounter Visit Profile**

## Resource Profile: Enovacom Bridge Encounter Visit Profile 

| | |
| :--- | :--- |
| *Official URL*:https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-encounter-visit | *Version*:1.1.0 |
| Active as of 2024-04-16 | *Computable Name*:EncounterVisitProfile_ENOVACOM_BRIDGE |

 
Ce profil de la ressource Encounter sert à définir la venue dans l'établissement du patient. 
L'élément Encounter.location est slicé pour permettre de renseigner l'unité fonctionnelle de responsabilité médicale (UFM) et l'unité fonctionnelle d'hébergement du patient (UFH) 

**Utilisations:**

* Exemples pour ce/t/te Profil: [Encounter/EncounterVisitExample](Encounter-EncounterVisitExample.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/EnovacomBridge|current/StructureDefinition/encounter-visit-enovacom-bridge)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-encounter-visit-enovacom-bridge.csv), [Excel](StructureDefinition-encounter-visit-enovacom-bridge.xlsx), [Schematron](StructureDefinition-encounter-visit-enovacom-bridge.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "encounter-visit-enovacom-bridge",
  "url" : "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-encounter-visit",
  "version" : "1.1.0",
  "name" : "EncounterVisitProfile_ENOVACOM_BRIDGE",
  "title" : "Enovacom Bridge Encounter Visit Profile",
  "status" : "active",
  "date" : "2024-04-16T11:49:14+02:00",
  "publisher" : "Enovacom",
  "contact" : [{
    "name" : "Enovacom",
    "telecom" : [{
      "system" : "url",
      "value" : "http://enovacom.com"
    }]
  }],
  "description" : "Ce profil de la ressource Encounter sert à définir la venue dans l'établissement du patient. \n\nL'élément Encounter.location est slicé pour permettre de renseigner l'unité fonctionnelle de responsabilité médicale (UFM) et l'unité fonctionnelle d'hébergement du patient (UFH)",
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
  "type" : "Encounter",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Encounter",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Encounter",
      "path" : "Encounter"
    },
    {
      "id" : "Encounter.meta.profile",
      "path" : "Encounter.meta.profile",
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
      "id" : "Encounter.meta.profile:fr-canonical",
      "path" : "Encounter.meta.profile",
      "sliceName" : "fr-canonical",
      "min" : 0,
      "max" : "1",
      "patternCanonical" : "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-encounter"
    },
    {
      "id" : "Encounter.meta.profile:bridge-canonical",
      "path" : "Encounter.meta.profile",
      "sliceName" : "bridge-canonical",
      "min" : 0,
      "max" : "1",
      "patternCanonical" : "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-encounter-visit"
    },
    {
      "id" : "Encounter.extension",
      "path" : "Encounter.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "Encounter.extension:estimatedDischargeDate",
      "path" : "Encounter.extension",
      "sliceName" : "estimatedDischargeDate",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-estimated-discharge-date"]
      }]
    },
    {
      "id" : "Encounter.identifier",
      "path" : "Encounter.identifier",
      "short" : "Identifiant de la visite/venue",
      "definition" : "Cet élément est multiévalué (pour ne pas bloquer les implémentations, car il arrive sur le terrain qu'il y ait plusieurs id pour une même admission, mais cette situation est considérée comme une anomalie",
      "min" : 1
    },
    {
      "id" : "Encounter.identifier.type",
      "path" : "Encounter.identifier.type",
      "definition" : "Type d'identifiant (admission ou de mouvement lors d'une hospitalisation)",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-identifier-type",
          "code" : "VN",
          "display" : "Visit Number"
        }]
      },
      "binding" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName",
          "valueString" : "IdentifierType"
        },
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/elementdefinition-isCommonBinding",
          "valueBoolean" : true
        }],
        "strength" : "extensible",
        "valueSet" : "https://hl7.fr/ig/fhir/core/ValueSet/fr-core-vs-encounter-identifier-type"
      }
    },
    {
      "id" : "Encounter.identifier.system",
      "path" : "Encounter.identifier.system",
      "definition" : "Système d'identification des venues dans Bridge incluant le FINESS géographique de l'établissement à l'origine de la création.",
      "min" : 1,
      "patternUri" : "http://EnovacomBridge.com/{FinessGeo}/identifiers/encounter"
    },
    {
      "id" : "Encounter.identifier.value",
      "path" : "Encounter.identifier.value",
      "min" : 1
    },
    {
      "id" : "Encounter.identifier.assigner",
      "path" : "Encounter.identifier.assigner",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-organization"]
      }]
    },
    {
      "id" : "Encounter.class.system",
      "path" : "Encounter.class.system",
      "min" : 1
    },
    {
      "id" : "Encounter.class.code",
      "path" : "Encounter.class.code",
      "min" : 1
    },
    {
      "id" : "Encounter.type",
      "path" : "Encounter.type",
      "max" : "1",
      "binding" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName",
          "valueString" : "EncounterType"
        }],
        "strength" : "example",
        "valueSet" : "https://hl7.fr/ig/fhir/core/ValueSet/fr-core-vs-encounter-type"
      }
    },
    {
      "id" : "Encounter.serviceType",
      "path" : "Encounter.serviceType",
      "binding" : {
        "extension" : [{
          "url" : "https://mos.esante.gouv.fr/NOS/JDV_J138-TypeActivite-RASS",
          "valueString" : "EncounterServiceType"
        }],
        "strength" : "preferred",
        "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J138-TypeActivite-RASS"
      }
    },
    {
      "id" : "Encounter.subject",
      "path" : "Encounter.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient"]
      }]
    },
    {
      "id" : "Encounter.participant",
      "path" : "Encounter.participant",
      "short" : "Liste des personnes impliquées dans la rencontre"
    },
    {
      "id" : "Encounter.participant.individual",
      "path" : "Encounter.participant.individual",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/RelatedPerson",
        "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner",
        "http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }]
    },
    {
      "id" : "Encounter.appointment",
      "path" : "Encounter.appointment",
      "short" : "Liste des rendez-vous en lien avec la venue",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-appointment"]
      }]
    },
    {
      "id" : "Encounter.period",
      "path" : "Encounter.period",
      "min" : 1
    },
    {
      "id" : "Encounter.account",
      "path" : "Encounter.account",
      "max" : "1"
    },
    {
      "id" : "Encounter.hospitalization.preAdmissionIdentifier",
      "path" : "Encounter.hospitalization.preAdmissionIdentifier",
      "short" : "Identifiant de pré-admission"
    },
    {
      "id" : "Encounter.hospitalization.preAdmissionIdentifier.type",
      "path" : "Encounter.hospitalization.preAdmissionIdentifier.type",
      "min" : 1,
      "binding" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName",
          "valueString" : "IdentifierType"
        },
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/elementdefinition-isCommonBinding",
          "valueBoolean" : true
        }],
        "strength" : "extensible",
        "valueSet" : "https://hl7.fr/ig/fhir/core/ValueSet/fr-core-vs-encounter-identifier-type"
      }
    },
    {
      "id" : "Encounter.hospitalization.preAdmissionIdentifier.system",
      "path" : "Encounter.hospitalization.preAdmissionIdentifier.system",
      "min" : 1,
      "fixedUri" : "1.2.250.1.71.4.2.2+.n°FINESS"
    },
    {
      "id" : "Encounter.hospitalization.preAdmissionIdentifier.value",
      "path" : "Encounter.hospitalization.preAdmissionIdentifier.value",
      "min" : 1
    },
    {
      "id" : "Encounter.hospitalization.preAdmissionIdentifier.assigner",
      "path" : "Encounter.hospitalization.preAdmissionIdentifier.assigner",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-organization"]
      }]
    },
    {
      "id" : "Encounter.hospitalization.origin",
      "path" : "Encounter.hospitalization.origin",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-location",
        "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-organization"]
      }]
    },
    {
      "id" : "Encounter.hospitalization.reAdmission",
      "path" : "Encounter.hospitalization.reAdmission",
      "short" : "Raison de la ré-admission du patient."
    },
    {
      "id" : "Encounter.hospitalization.destination",
      "path" : "Encounter.hospitalization.destination",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-location",
        "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-organization"]
      }]
    },
    {
      "id" : "Encounter.hospitalization.dischargeDisposition",
      "path" : "Encounter.hospitalization.dischargeDisposition",
      "binding" : {
        "strength" : "example",
        "valueSet" : "https://hl7.fr/ig/fhir/core/ValueSet/fr-core-vs-encounter-discharge-disposition"
      }
    },
    {
      "id" : "Encounter.location",
      "path" : "Encounter.location",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "location.identifier.system"
        }],
        "description" : "slicing de l'objet location (UFH, UFM, Chambre, Lit)",
        "rules" : "open"
      },
      "short" : "Liste des localisation du patient"
    },
    {
      "id" : "Encounter.location.location",
      "path" : "Encounter.location.location",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-location"]
      }]
    },
    {
      "id" : "Encounter.location.physicalType",
      "path" : "Encounter.location.physicalType",
      "binding" : {
        "strength" : "example",
        "valueSet" : "https://hl7.fr/ig/fhir/core/ValueSet/fr-core-vs-location-physical-type"
      }
    },
    {
      "id" : "Encounter.location:locationUFM",
      "path" : "Encounter.location",
      "sliceName" : "locationUFM",
      "short" : "Unité de responsabilité médicale rattachée au séjour",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Encounter.location:locationUFM.location",
      "path" : "Encounter.location.location",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-location"]
      }]
    },
    {
      "id" : "Encounter.location:locationUFM.location.identifier.system",
      "path" : "Encounter.location.location.identifier.system",
      "short" : "FINESS_GEO normalement transporté en PV1.3.4",
      "min" : 1,
      "patternUri" : "http://EnovacomBridge.com/{FinessGeo}/identifiers/locationUFM"
    },
    {
      "id" : "Encounter.location:locationUFH",
      "path" : "Encounter.location",
      "sliceName" : "locationUFH",
      "short" : "Unité d'hébergement",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Encounter.location:locationUFH.location",
      "path" : "Encounter.location.location",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-location"]
      }]
    },
    {
      "id" : "Encounter.location:locationUFH.location.identifier.system",
      "path" : "Encounter.location.location.identifier.system",
      "short" : "FINESS_GEO normalement transporté en PV1.3.4",
      "min" : 1,
      "patternUri" : "http://EnovacomBridge.com/{FinessGeo}/identifiers/locationUFH"
    },
    {
      "id" : "Encounter.serviceProvider",
      "path" : "Encounter.serviceProvider",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-organization"]
      }]
    },
    {
      "id" : "Encounter.partOf",
      "path" : "Encounter.partOf",
      "type" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-hierarchy",
          "valueBoolean" : true
        }],
        "code" : "Reference",
        "targetProfile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-encounter"]
      }]
    }]
  }
}

```
