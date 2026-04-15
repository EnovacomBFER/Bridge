# Enovacom Bridge EpisodeOfCare Profile - Guide D'implementation Bridge v1.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts**](artifacts.md)
* **Enovacom Bridge EpisodeOfCare Profile**

## Resource Profile: Enovacom Bridge EpisodeOfCare Profile 

| | |
| :--- | :--- |
| *Official URL*:https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-episodeofcare | *Version*:1.1.0 |
| Active as of 2024-04-16 | *Computable Name*:EpisodeOfCareProfile_ENOVACOM_BRIDGE |

 
Ce profil de la ressource Encounter sert à définir le dossier administratif du patient en lien avec ces différentes venues. This profil constrains the Encounter resource to represent the patients administrative file in relation to these different visits. 

**Utilisations:**

* Exemples pour ce/t/te Profil: [EpisodeOfCare/EpisodeOfCareExample](EpisodeOfCare-EpisodeOfCareExample.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/EnovacomBridge|current/StructureDefinition/episodeOfCare-enovacom-bridge)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-episodeOfCare-enovacom-bridge.csv), [Excel](StructureDefinition-episodeOfCare-enovacom-bridge.xlsx), [Schematron](StructureDefinition-episodeOfCare-enovacom-bridge.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "episodeOfCare-enovacom-bridge",
  "url" : "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-episodeofcare",
  "version" : "1.1.0",
  "name" : "EpisodeOfCareProfile_ENOVACOM_BRIDGE",
  "title" : "Enovacom Bridge EpisodeOfCare Profile",
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
  "description" : "Ce profil de la ressource Encounter sert à définir le dossier administratif du patient en lien avec ces différentes venues.\nThis profil constrains the Encounter resource to represent the patients administrative file in relation to these different visits.",
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
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "EpisodeOfCare",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/EpisodeOfCare",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "EpisodeOfCare",
      "path" : "EpisodeOfCare"
    },
    {
      "id" : "EpisodeOfCare.meta.profile",
      "path" : "EpisodeOfCare.meta.profile",
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
      "id" : "EpisodeOfCare.meta.profile:fr-canonical",
      "path" : "EpisodeOfCare.meta.profile",
      "sliceName" : "fr-canonical",
      "min" : 0,
      "max" : "1",
      "patternCanonical" : "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-episodeofcare"
    },
    {
      "id" : "EpisodeOfCare.extension",
      "path" : "EpisodeOfCare.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "EpisodeOfCare.extension:estimatedDischargeDate",
      "path" : "EpisodeOfCare.extension",
      "sliceName" : "estimatedDischargeDate",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-estimated-discharge-date"]
      }]
    },
    {
      "id" : "EpisodeOfCare.identifier",
      "path" : "EpisodeOfCare.identifier",
      "short" : "identifiant métier du dossier administratif (NDA)",
      "min" : 1
    },
    {
      "id" : "EpisodeOfCare.identifier.type",
      "path" : "EpisodeOfCare.identifier.type",
      "definition" : "Type d'identifiant du dossier administratif",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
          "code" : "AN",
          "display" : "Account number"
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
        "valueSet" : "http://hl7.org/fhir/ValueSet/namingsystem-identifier-system-type"
      }
    },
    {
      "id" : "EpisodeOfCare.identifier.system",
      "path" : "EpisodeOfCare.identifier.system",
      "definition" : "Le namespace doit être unique pour faciliter la recherche.",
      "min" : 1,
      "example" : [{
        "label" : "L'intégration du FINESS géographique dans ce system permet de distinguer les établissements",
        "valueUri" : "urn:oid:1.2.250.1.71.4.2.2.$FinessGeo;.episodeOfCare"
      }]
    },
    {
      "id" : "EpisodeOfCare.identifier.value",
      "path" : "EpisodeOfCare.identifier.value",
      "min" : 1
    },
    {
      "id" : "EpisodeOfCare.identifier.assigner",
      "path" : "EpisodeOfCare.identifier.assigner",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-organization"]
      }]
    },
    {
      "id" : "EpisodeOfCare.patient",
      "path" : "EpisodeOfCare.patient",
      "short" : "Patient concerné par le dossier",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient"]
      }]
    },
    {
      "id" : "EpisodeOfCare.managingOrganization",
      "path" : "EpisodeOfCare.managingOrganization",
      "short" : "Etablissement en charge du dossier",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-organization"]
      }]
    },
    {
      "id" : "EpisodeOfCare.managingOrganization.display",
      "path" : "EpisodeOfCare.managingOrganization.display",
      "patternString" : "Etablissement"
    }]
  }
}

```
