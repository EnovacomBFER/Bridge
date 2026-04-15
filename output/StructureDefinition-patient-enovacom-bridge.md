# Enovacom Bridge Patient Profile - Guide D'implementation Bridge v1.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts**](artifacts.md)
* **Enovacom Bridge Patient Profile**

## Resource Profile: Enovacom Bridge Patient Profile 

| | |
| :--- | :--- |
| *Official URL*:https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-patient | *Version*:1.1.0 |
| Draft as of 2025-09-01 | *Computable Name*:PatientProfile_ENOVACOM_BRIDGE |

 
Ce profil spécifie les identifiants de patient utilisés par la solution Bridge d'Enovacom. Il utilise des extensions internationales (birthplace et nationalité) et ajoute des extensions propres au contexte d'utilisation de Bridge comme la date de création de l'identité. 

**Utilisations:**

* Exemples pour ce/t/te Profil: [Patient/1c783afa-9981-4977-be63-8859f0a8fde5](Patient-1c783afa-9981-4977-be63-8859f0a8fde5.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/EnovacomBridge|current/StructureDefinition/patient-enovacom-bridge)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-patient-enovacom-bridge.csv), [Excel](StructureDefinition-patient-enovacom-bridge.xlsx), [Schematron](StructureDefinition-patient-enovacom-bridge.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "patient-enovacom-bridge",
  "url" : "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-patient",
  "version" : "1.1.0",
  "name" : "PatientProfile_ENOVACOM_BRIDGE",
  "title" : "Enovacom Bridge Patient Profile",
  "status" : "draft",
  "date" : "2025-09-01T10:06:33+02:00",
  "publisher" : "Enovacom",
  "contact" : [{
    "name" : "Enovacom",
    "telecom" : [{
      "system" : "url",
      "value" : "http://enovacom.com"
    }]
  }],
  "description" : "Ce profil spécifie les identifiants de patient utilisés par la solution Bridge d'Enovacom. Il utilise des extensions internationales (birthplace et nationalité) et ajoute des extensions propres au contexte d'utilisation de Bridge comme la date de création de l'identité.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "enovacom-v2",
    "uri" : "HL7v2",
    "name" : "Mapping from FHIR Patient to HL7v2 PID segment",
    "comment" : "Mapping from FHIR Patient to HL7v2 PID segment"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "cda",
    "uri" : "http://hl7.org/v3/cda",
    "name" : "CDA (R2)"
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
  },
  {
    "identity" : "loinc",
    "uri" : "http://loinc.org",
    "name" : "LOINC code for the element"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Patient",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Patient",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Patient",
      "path" : "Patient"
    },
    {
      "id" : "Patient.meta.profile",
      "path" : "Patient.meta.profile",
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
      "id" : "Patient.meta.profile:fr-canonical",
      "path" : "Patient.meta.profile",
      "sliceName" : "fr-canonical",
      "min" : 0,
      "max" : "1",
      "patternCanonical" : "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient"
    },
    {
      "id" : "Patient.meta.profile:bridge-canonical",
      "path" : "Patient.meta.profile",
      "sliceName" : "bridge-canonical",
      "min" : 0,
      "max" : "1",
      "patternCanonical" : "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-patient"
    },
    {
      "id" : "Patient.extension",
      "path" : "Patient.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Patient.extension:creationDate",
      "path" : "Patient.extension",
      "sliceName" : "creationDate",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://enovacom.org/fhir/bridge/StructureDefinition/enovacom-patient-creation-date"]
      }]
    },
    {
      "id" : "Patient.extension:nationality",
      "path" : "Patient.extension",
      "sliceName" : "nationality",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient-nationality"]
      }]
    },
    {
      "id" : "Patient.extension:identityReliability",
      "path" : "Patient.extension",
      "sliceName" : "identityReliability",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-identity-reliability"]
      }]
    },
    {
      "id" : "Patient.extension:deathPlace",
      "path" : "Patient.extension",
      "sliceName" : "deathPlace",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient-death-place"]
      }]
    },
    {
      "id" : "Patient.extension:birthdateUpdateIndicator",
      "path" : "Patient.extension",
      "sliceName" : "birthdateUpdateIndicator",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient-birthdate-update-indicator"]
      }]
    },
    {
      "id" : "Patient.extension:birthPlace",
      "path" : "Patient.extension",
      "sliceName" : "birthPlace",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.org/fhir/StructureDefinition/patient-birthPlace"]
      }]
    },
    {
      "id" : "Patient.extension:birthPlace.value[x]",
      "path" : "Patient.extension.value[x]",
      "type" : [{
        "code" : "Address",
        "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-address"]
      }]
    },
    {
      "id" : "Patient.identifier",
      "path" : "Patient.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "type"
        }],
        "description" : "slicing de l'identifiant Patient sur le type d'identifiant (IPP, INS-NIR, INS-NIA, etc.)",
        "rules" : "open"
      },
      "short" : "Identifiant patient. Pour modéliser un patient avec une INS validée, il est nécessaire de respecter la conformité au profil FrCorePatientINS. Les identifiants NIR et NIA ne sont définis uniquement dans le cas du FRCorePatientINS.",
      "min" : 1
    },
    {
      "id" : "Patient.identifier.type",
      "path" : "Patient.identifier.type",
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "https://hl7.fr/ig/fhir/core/ValueSet/fr-core-vs-patient-identifier-type"
      }
    },
    {
      "id" : "Patient.identifier:NSS",
      "path" : "Patient.identifier",
      "sliceName" : "NSS",
      "short" : "Le Numéro d'Inscription au Répertoire (NIR) de facturation permet de faire transiter le numéro de sécurité social de l’ayant droit ou du bénéfiaire (patient) / le numéro de sécurité sociale de l’ouvrant droit (assuré).",
      "min" : 0,
      "max" : "1",
      "mapping" : [{
        "identity" : "enovacom-v2",
        "map" : "PID-3 si PID-3.5 = NH"
      }]
    },
    {
      "id" : "Patient.identifier:NSS.use",
      "path" : "Patient.identifier.use",
      "patternCode" : "official"
    },
    {
      "id" : "Patient.identifier:NSS.type",
      "path" : "Patient.identifier.type",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
          "code" : "NH"
        }]
      }
    },
    {
      "id" : "Patient.identifier:NSS.type.coding.code",
      "path" : "Patient.identifier.type.coding.code",
      "mapping" : [{
        "identity" : "enovacom-v2",
        "map" : "CX.5"
      }]
    },
    {
      "id" : "Patient.identifier:NSS.system",
      "path" : "Patient.identifier.system",
      "patternUri" : "urn:oid:1.2.250.1.213.1.4.8"
    },
    {
      "id" : "Patient.identifier:NSS.value",
      "path" : "Patient.identifier.value",
      "min" : 1,
      "mapping" : [{
        "identity" : "enovacom-v2",
        "map" : "CX.1"
      }]
    },
    {
      "id" : "Patient.identifier:INS-C",
      "path" : "Patient.identifier",
      "sliceName" : "INS-C",
      "short" : "Identifiant National de Santé Calculé à partir des éléments de la carte vitale",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Patient.identifier:INS-C.use",
      "path" : "Patient.identifier.use",
      "patternCode" : "secondary"
    },
    {
      "id" : "Patient.identifier:INS-C.type",
      "path" : "Patient.identifier.type",
      "definition" : "Identifiant National de Santé Calculé à partir des éléments de la carte vitale",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
          "code" : "INS-C",
          "display" : "Identifiant National de Santé Calculé"
        }]
      }
    },
    {
      "id" : "Patient.identifier:INS-C.system",
      "path" : "Patient.identifier.system",
      "patternUri" : "urn:oid:1.2.250.1.213.1.4.2"
    },
    {
      "id" : "Patient.identifier:INS-C.value",
      "path" : "Patient.identifier.value",
      "min" : 1
    },
    {
      "id" : "Patient.identifier:INS-NIR",
      "path" : "Patient.identifier",
      "sliceName" : "INS-NIR",
      "short" : "INS-NIR = Identifiant national de santé (NIR) du patient INS provenant du téléservice INSi (service national d'identification des patients (CNAM))",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Patient.identifier:INS-NIR.use",
      "path" : "Patient.identifier.use",
      "patternCode" : "official"
    },
    {
      "id" : "Patient.identifier:INS-NIR.type",
      "path" : "Patient.identifier.type",
      "definition" : "INS-NIR - Identifiant national de santé (NIR) du patient INS provenant du téléservice INSi (service national d'identification des patients (CNAM))",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
          "code" : "INS-NIR",
          "display" : "NIR définitif"
        }]
      }
    },
    {
      "id" : "Patient.identifier:INS-NIR.system",
      "path" : "Patient.identifier.system",
      "patternUri" : "urn:oid:1.2.250.1.213.1.4.8"
    },
    {
      "id" : "Patient.identifier:INS-NIR.value",
      "path" : "Patient.identifier.value",
      "min" : 1
    },
    {
      "id" : "Patient.identifier:INS-NIR-TEST",
      "path" : "Patient.identifier",
      "sliceName" : "INS-NIR-TEST",
      "short" : "Identifiant INS-NIR du patient fictif de test",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Patient.identifier:INS-NIR-TEST.use",
      "path" : "Patient.identifier.use",
      "patternCode" : "official"
    },
    {
      "id" : "Patient.identifier:INS-NIR-TEST.type",
      "path" : "Patient.identifier.type",
      "definition" : "Identifiant INS-NIR du patient fictif de test",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
          "code" : "INS-NIR-TEST",
          "display" : "NIR TEST"
        }]
      }
    },
    {
      "id" : "Patient.identifier:INS-NIR-TEST.system",
      "path" : "Patient.identifier.system",
      "patternUri" : "urn:oid:1.2.250.1.213.1.4.10"
    },
    {
      "id" : "Patient.identifier:INS-NIR-TEST.value",
      "path" : "Patient.identifier.value",
      "min" : 1
    },
    {
      "id" : "Patient.identifier:INS-NIR-DEMO",
      "path" : "Patient.identifier",
      "sliceName" : "INS-NIR-DEMO",
      "short" : "Identifiant INS-NIR du patient fictif de démonstration",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Patient.identifier:INS-NIR-DEMO.use",
      "path" : "Patient.identifier.use",
      "patternCode" : "official"
    },
    {
      "id" : "Patient.identifier:INS-NIR-DEMO.type",
      "path" : "Patient.identifier.type",
      "definition" : "Identifiant INS-NIR du patient fictif de démonstration",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
          "code" : "INS-NIR-DEMO",
          "display" : "NIR DEMO"
        }]
      }
    },
    {
      "id" : "Patient.identifier:INS-NIR-DEMO.system",
      "path" : "Patient.identifier.system",
      "patternUri" : "urn:oid:1.2.250.1.213.1.4.11"
    },
    {
      "id" : "Patient.identifier:INS-NIR-DEMO.value",
      "path" : "Patient.identifier.value",
      "min" : 1
    },
    {
      "id" : "Patient.identifier:INS-NIA",
      "path" : "Patient.identifier",
      "sliceName" : "INS-NIA",
      "short" : "INS-NIA - Identifiant national temporaire de santé du patient obtenu par interrogation du téléservice INSi de la CNAM",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Patient.identifier:INS-NIA.use",
      "path" : "Patient.identifier.use",
      "patternCode" : "temp"
    },
    {
      "id" : "Patient.identifier:INS-NIA.type",
      "path" : "Patient.identifier.type",
      "definition" : "INS-NIA - Identifiant national temporaire de santé du patient obtenu par interrogation du téléservice INSi de la CNAM",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
          "code" : "INS-NIA",
          "display" : "NIR temporaire"
        }]
      }
    },
    {
      "id" : "Patient.identifier:INS-NIA.system",
      "path" : "Patient.identifier.system",
      "patternUri" : "urn:oid:1.2.250.1.213.1.4.9"
    },
    {
      "id" : "Patient.identifier:INS-NIA.value",
      "path" : "Patient.identifier.value",
      "min" : 1
    },
    {
      "id" : "Patient.identifier:NDP",
      "path" : "Patient.identifier",
      "sliceName" : "NDP",
      "short" : "Numéro de Dossier Pharmaceutique français. Celui-ci est unique.",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Patient.identifier:NDP.use",
      "path" : "Patient.identifier.use",
      "patternCode" : "secondary"
    },
    {
      "id" : "Patient.identifier:NDP.type",
      "path" : "Patient.identifier.type",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
          "code" : "NDP",
          "display" : "Identifiant du patient au Dossier Pharmaceutique"
        }]
      }
    },
    {
      "id" : "Patient.identifier:NDP.system",
      "path" : "Patient.identifier.system",
      "min" : 1,
      "patternUri" : "urn:oid:1.2.250.1.176.1.2"
    },
    {
      "id" : "Patient.identifier:NDP.value",
      "path" : "Patient.identifier.value",
      "min" : 1
    },
    {
      "id" : "Patient.identifier:PI",
      "path" : "Patient.identifier",
      "sliceName" : "PI",
      "short" : "IPP - identifiant patient interne à la structure",
      "min" : 1,
      "max" : "*",
      "mapping" : [{
        "identity" : "enovacom-v2",
        "map" : "PID-3 si PID-3.5 = PI"
      }]
    },
    {
      "id" : "Patient.identifier:PI.use",
      "path" : "Patient.identifier.use",
      "patternCode" : "usual"
    },
    {
      "id" : "Patient.identifier:PI.type",
      "path" : "Patient.identifier.type",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
          "code" : "PI",
          "display" : "Patient internal identifier"
        }]
      }
    },
    {
      "id" : "Patient.identifier:PI.type.coding.code",
      "path" : "Patient.identifier.type.coding.code",
      "mapping" : [{
        "identity" : "enovacom-v2",
        "map" : "CX.5"
      }]
    },
    {
      "id" : "Patient.identifier:PI.system",
      "path" : "Patient.identifier.system",
      "min" : 1,
      "patternUri" : "http://EnovacomBridge.com/{FinessGeo}/identifiers/patient"
    },
    {
      "id" : "Patient.identifier:PI.value",
      "path" : "Patient.identifier.value",
      "min" : 1,
      "mapping" : [{
        "identity" : "enovacom-v2",
        "map" : "CX.1"
      }]
    },
    {
      "id" : "Patient.identifier:RRI",
      "path" : "Patient.identifier",
      "sliceName" : "RRI",
      "short" : "Identifiant régional",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Patient.identifier:RRI.use",
      "path" : "Patient.identifier.use",
      "patternCode" : "secondary"
    },
    {
      "id" : "Patient.identifier:RRI.type",
      "path" : "Patient.identifier.type",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
          "code" : "RRI",
          "display" : "Regional registry ID"
        }]
      }
    },
    {
      "id" : "Patient.identifier:RRI.system",
      "path" : "Patient.identifier.system",
      "min" : 1
    },
    {
      "id" : "Patient.identifier:RRI.value",
      "path" : "Patient.identifier.value",
      "min" : 1
    },
    {
      "id" : "Patient.name",
      "path" : "Patient.name",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "use"
        }],
        "rules" : "open"
      },
      "type" : [{
        "code" : "HumanName",
        "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-human-name"]
      }]
    },
    {
      "id" : "Patient.name:usualName",
      "path" : "Patient.name",
      "sliceName" : "usualName",
      "short" : "Nom utilisé",
      "definition" : "Le nom utilisé (usual) n’est transmis que s’il est défini (par exemple nom marital du conjoint).",
      "min" : 0,
      "max" : "*",
      "mapping" : [{
        "identity" : "enovacom-v2",
        "map" : "PID-5 si PID-5.7 = D"
      }]
    },
    {
      "id" : "Patient.name:usualName.use",
      "path" : "Patient.name.use",
      "min" : 1,
      "patternCode" : "usual"
    },
    {
      "id" : "Patient.name:usualName.family",
      "path" : "Patient.name.family",
      "mapping" : [{
        "identity" : "enovacom-v2",
        "map" : "XPN.1"
      }]
    },
    {
      "id" : "Patient.name:usualName.given",
      "path" : "Patient.name.given",
      "mapping" : [{
        "identity" : "enovacom-v2",
        "map" : "XPN.2"
      }]
    },
    {
      "id" : "Patient.name:usualName.prefix",
      "path" : "Patient.name.prefix",
      "mapping" : [{
        "identity" : "enovacom-v2",
        "map" : "XPN.5"
      }]
    },
    {
      "id" : "Patient.name:officialName",
      "path" : "Patient.name",
      "sliceName" : "officialName",
      "short" : "Nom de naissance",
      "definition" : "Le nom de naissance (official) est obligatoire dans le cas où l’on véhicule l’INS et que l’identité est qualifiée (celui-ci ne doit pas être altéré).",
      "min" : 0,
      "max" : "*",
      "mapping" : [{
        "identity" : "enovacom-v2",
        "map" : "PID-5 si PID-5.7 = L"
      }]
    },
    {
      "id" : "Patient.name:officialName.extension:birth-list-given-name",
      "path" : "Patient.name.extension",
      "sliceName" : "birth-list-given-name",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient-birth-list-given-name"]
      }]
    },
    {
      "id" : "Patient.name:officialName.use",
      "path" : "Patient.name.use",
      "min" : 1,
      "patternCode" : "official"
    },
    {
      "id" : "Patient.name:officialName.family",
      "path" : "Patient.name.family",
      "min" : 1,
      "mapping" : [{
        "identity" : "enovacom-v2",
        "map" : "XPN.1"
      }]
    },
    {
      "id" : "Patient.name:officialName.given",
      "path" : "Patient.name.given",
      "min" : 1,
      "mapping" : [{
        "identity" : "enovacom-v2",
        "map" : "XPN.2"
      }]
    },
    {
      "id" : "Patient.name:officialName.prefix",
      "path" : "Patient.name.prefix",
      "mapping" : [{
        "identity" : "enovacom-v2",
        "map" : "XPN.5"
      }]
    },
    {
      "id" : "Patient.telecom",
      "path" : "Patient.telecom",
      "type" : [{
        "code" : "ContactPoint",
        "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-contact-point"]
      }]
    },
    {
      "id" : "Patient.gender",
      "path" : "Patient.gender",
      "definition" : "Genre du patient. Dans le cas d'une identité récupérée par le téléservice INSi, les valeurs sont M ou F",
      "mapping" : [{
        "identity" : "enovacom-v2",
        "map" : "PID-8"
      }]
    },
    {
      "id" : "Patient.birthDate",
      "path" : "Patient.birthDate",
      "short" : "Date de naissance du patient. Dans le cas d'une identité récupérée du téléservice INSi, la date de naissance est modifiée selon les règles du RNIV dans le cas de dates exceptionnelles.",
      "mapping" : [{
        "identity" : "enovacom-v2",
        "map" : "PID-7"
      }]
    },
    {
      "id" : "Patient.deceased[x]",
      "path" : "Patient.deceased[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Patient.deceased[x]:deceasedDateTime",
      "path" : "Patient.deceased[x]",
      "sliceName" : "deceasedDateTime",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mapping" : [{
        "identity" : "enovacom-v2",
        "map" : "PID-29 (datetime)"
      }]
    },
    {
      "id" : "Patient.address",
      "path" : "Patient.address",
      "type" : [{
        "code" : "Address",
        "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-address"]
      }]
    },
    {
      "id" : "Patient.maritalStatus",
      "path" : "Patient.maritalStatus",
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "https://hl7.fr/ig/fhir/core/ValueSet/fr-core-vs-marital-status"
      }
    },
    {
      "id" : "Patient.contact.extension",
      "path" : "Patient.contact.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Patient.contact.extension:contactIdentifier",
      "path" : "Patient.contact.extension",
      "sliceName" : "contactIdentifier",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient-contact-identifier"]
      }]
    },
    {
      "id" : "Patient.contact.extension:comment",
      "path" : "Patient.contact.extension",
      "sliceName" : "comment",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-comment"]
      }]
    },
    {
      "id" : "Patient.contact.relationship",
      "path" : "Patient.contact.relationship",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "coding.system"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "Patient.contact.relationship:Role",
      "path" : "Patient.contact.relationship",
      "sliceName" : "Role",
      "short" : "Rôle de la personne. Ex : personne de confiance, aidant ...",
      "min" : 0,
      "max" : "1",
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "https://hl7.fr/ig/fhir/core/ValueSet/fr-core-vs-patient-contact-role"
      }
    },
    {
      "id" : "Patient.contact.relationship:RelationType",
      "path" : "Patient.contact.relationship",
      "sliceName" : "RelationType",
      "short" : "Relation de la personne. Ex : Mère, époux, enfant ...",
      "min" : 0,
      "max" : "1",
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "https://hl7.fr/ig/fhir/core/ValueSet/fr-core-vs-relation-type"
      }
    },
    {
      "id" : "Patient.contact.name",
      "path" : "Patient.contact.name",
      "type" : [{
        "code" : "HumanName",
        "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-human-name"]
      }]
    },
    {
      "id" : "Patient.contact.telecom",
      "path" : "Patient.contact.telecom",
      "type" : [{
        "code" : "ContactPoint",
        "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-contact-point"]
      }]
    },
    {
      "id" : "Patient.generalPractitioner",
      "path" : "Patient.generalPractitioner",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner",
        "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-organization",
        "http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }]
    },
    {
      "id" : "Patient.managingOrganization",
      "path" : "Patient.managingOrganization",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-organization"]
      }]
    }]
  }
}

```
