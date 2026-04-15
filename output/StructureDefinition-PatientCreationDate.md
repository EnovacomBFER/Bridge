# Extension Enovacom Patient Creation Date - Guide D'implementation Bridge v1.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts**](artifacts.md)
* **Extension Enovacom Patient Creation Date**

## Extension: Extension Enovacom Patient Creation Date 

| | |
| :--- | :--- |
| *Official URL*:https://enovacom.org/fhir/bridge/StructureDefinition/enovacom-patient-creation-date | *Version*:1.1.0 |
| Draft as of 2026-04-15 | *Computable Name*:PatientCreationDate |

This extension allowos to know the patient's resource creation date .Extension permettant de connaître la date de création de la ressource Patient.

**Context of Use**

**Usage info**

**Utilisations:**

* Utilise ce/t/te Extension: [Enovacom Bridge Patient Profile](StructureDefinition-patient-enovacom-bridge.md)
* Exemples pour ce/t/te Extension: [Patient/1c783afa-9981-4977-be63-8859f0a8fde5](Patient-1c783afa-9981-4977-be63-8859f0a8fde5.md)
* Paramètres de recherche utilisant ce Extension: [creation-date](SearchParameter-patient-creation-date.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/EnovacomBridge|current/StructureDefinition/PatientCreationDate)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-PatientCreationDate.csv), [Excel](StructureDefinition-PatientCreationDate.xlsx), [Schematron](StructureDefinition-PatientCreationDate.sch) 

#### Contraintes



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "PatientCreationDate",
  "url" : "https://enovacom.org/fhir/bridge/StructureDefinition/enovacom-patient-creation-date",
  "version" : "1.1.0",
  "name" : "PatientCreationDate",
  "title" : "Extension Enovacom Patient Creation Date",
  "status" : "draft",
  "date" : "2026-04-15T14:29:25+02:00",
  "publisher" : "Enovacom",
  "contact" : [{
    "name" : "Enovacom",
    "telecom" : [{
      "system" : "url",
      "value" : "http://enovacom.com"
    }]
  }],
  "description" : "This extension allowos to know the patient's resource creation date .Extension permettant de connaître la date de création de la ressource Patient.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "Patient"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Extension Enovacom Patient Creation Date",
      "definition" : "This extension allowos to know the patient's resource creation date .Extension permettant de connaître la date de création de la ressource Patient."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://enovacom.org/fhir/bridge/StructureDefinition/enovacom-patient-creation-date"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "dateTime"
      }]
    }]
  }
}

```
