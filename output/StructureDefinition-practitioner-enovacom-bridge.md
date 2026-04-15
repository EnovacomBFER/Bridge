# Enovacom Bridge Practitioner Profile - Guide D'implementation Bridge v1.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts**](artifacts.md)
* **Enovacom Bridge Practitioner Profile**

## Resource Profile: Enovacom Bridge Practitioner Profile 

| | |
| :--- | :--- |
| *Official URL*:https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-practitioner | *Version*:1.1.0 |
| Active as of 2025-09-01 | *Computable Name*:PractitionerProfile_ENOVACOM_BRIDGE |

 
Profil de la ressource Practitionner pour la France. Ce profil contraint les types d'identifiants du professionnel de santé en France. 
Ajout d'une slice sur l'identifier pour le code interne practitioner présent dans les messages HL7v2 (code EI). 

**Utilisations:**

* Exemples pour ce/t/te Profil: [Practitioner/6b70aeba-4024-4cf0-8959-2d1d6cf15597](Practitioner-6b70aeba-4024-4cf0-8959-2d1d6cf15597.md) and [Practitioner/z65g3ad4-4512-4477-biu3-8719haf7d75](Practitioner-z65g3ad4-4512-4477-biu3-8719haf7d75.md)

Vous pouvez également vérifier [les usages dans le FHIR IG Statistics](https://packages2.fhir.org/xig/EnovacomBridge|current/StructureDefinition/practitioner-enovacom-bridge)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-practitioner-enovacom-bridge.csv), [Excel](StructureDefinition-practitioner-enovacom-bridge.xlsx), [Schematron](StructureDefinition-practitioner-enovacom-bridge.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "practitioner-enovacom-bridge",
  "url" : "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-practitioner",
  "version" : "1.1.0",
  "name" : "PractitionerProfile_ENOVACOM_BRIDGE",
  "title" : "Enovacom Bridge Practitioner Profile",
  "status" : "active",
  "date" : "2025-09-01T11:49:14+02:00",
  "publisher" : "Enovacom",
  "contact" : [{
    "name" : "Enovacom",
    "telecom" : [{
      "system" : "url",
      "value" : "http://enovacom.com"
    }]
  }],
  "description" : "Profil de la ressource Practitionner pour la France. Ce profil contraint les types d'identifiants du professionnel de santé en France.\n\nAjout d'une slice sur l'identifier pour le code interne practitioner présent dans les messages HL7v2 (code EI).",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "servd",
    "uri" : "http://www.omg.org/spec/ServD/1.0/",
    "name" : "ServD"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Practitioner",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Practitioner",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Practitioner",
      "path" : "Practitioner",
      "short" : "Prestataire de santé",
      "definition" : "Un professionnel impliqué directement ou indirectement dans la prise en charge d'une personne."
    },
    {
      "id" : "Practitioner.meta.profile",
      "path" : "Practitioner.meta.profile",
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
      "id" : "Practitioner.meta.profile:fr-canonical",
      "path" : "Practitioner.meta.profile",
      "sliceName" : "fr-canonical",
      "min" : 0,
      "max" : "1",
      "patternCanonical" : "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner"
    },
    {
      "id" : "Practitioner.meta.profile:bridge-canonical",
      "path" : "Practitioner.meta.profile",
      "sliceName" : "bridge-canonical",
      "min" : 0,
      "max" : "1",
      "patternCanonical" : "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-practitioner"
    },
    {
      "id" : "Practitioner.extension",
      "path" : "Practitioner.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "Practitioner.extension:specialty",
      "path" : "Practitioner.extension",
      "sliceName" : "specialty",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner-specialty"]
      }]
    },
    {
      "id" : "Practitioner.identifier",
      "path" : "Practitioner.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "system"
        }],
        "description" : "Slice based on the identifier.system pattern",
        "rules" : "open"
      }
    },
    {
      "id" : "Practitioner.identifier.type",
      "path" : "Practitioner.identifier.type",
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "https://hl7.fr/ig/fhir/core/ValueSet/fr-core-vs-practitioner-identifier-type"
      }
    },
    {
      "id" : "Practitioner.identifier.type.coding.system",
      "path" : "Practitioner.identifier.type.coding.system",
      "example" : [{
        "label" : "CodeSystem HL7v2 (PAM) pour un type d'identifiant PS",
        "valueUri" : "http://terminology.hl7.org/CodeSystem/v2-0203"
      },
      {
        "label" : "CodeSystem ASIP pour un type d'identifiant d'un employé dans une structure",
        "valueUri" : "https://mos.esante.gouv.fr/NOS/TRE_G08-TypeIdentifiantPersonne/FHIR/TRE-G08-TypeIdentifiantPersonne"
      }]
    },
    {
      "id" : "Practitioner.identifier.system",
      "path" : "Practitioner.identifier.system",
      "definition" : "Pour un PS identifié à partir de sa carte CPS, OID = 1.2.250.1.71.4.2.1\r\nPour un employé identifié au sein de sa structure, OID de l'établissement, branche de gestion des employés ou http://hopitalTest.fr/fhir/namingsystem/employes",
      "min" : 1
    },
    {
      "id" : "Practitioner.identifier.value",
      "path" : "Practitioner.identifier.value",
      "min" : 1
    },
    {
      "id" : "Practitioner.identifier:idInterne",
      "path" : "Practitioner.identifier",
      "sliceName" : "idInterne",
      "short" : "Identifiant du PS dans l'établissement.",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Practitioner.identifier:idInterne.type",
      "path" : "Practitioner.identifier.type",
      "short" : "Type d’identifiant interne du professionel de santé.",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
          "code" : "INTRN"
        }]
      }
    },
    {
      "id" : "Practitioner.identifier:idInterne.system",
      "path" : "Practitioner.identifier.system",
      "patternUri" : "http://EnovacomBridge.com/{FinessGeo}/identifiers/practitioner"
    },
    {
      "id" : "Practitioner.identifier:idInterne.value",
      "path" : "Practitioner.identifier.value",
      "short" : "Identifiant interne du PS."
    },
    {
      "id" : "Practitioner.identifier:idNatPs",
      "path" : "Practitioner.identifier",
      "sliceName" : "idNatPs",
      "short" : "Identifiant national des PS. Cet identifiant est notamment utilisé dans le cadre du DMP et de la CPS. Cet identifiant est préfixé selon source de provenance de l'identifiant (cf Annexe Transverse – Source des données métier pour les professionnels et les structures du CI-SIS.)",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Practitioner.identifier:idNatPs.type",
      "path" : "Practitioner.identifier.type",
      "short" : "Type d’identifiant national de la personne physique (typeIdNat_PP),\r\nLes codes ADELI, RPPS et IDNPS proviennent du system  https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203 ; Les codes 1, 3, 4, 5, 6 proviennent du system : https://mos.esante.gouv.fr/NOS/TRE_G08-TypeIdentifiantPersonne/FHIR/TRE-G08-TypeIdentifiantPersonne",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
          "code" : "IDNPS"
        }]
      }
    },
    {
      "id" : "Practitioner.identifier:idNatPs.system",
      "path" : "Practitioner.identifier.system",
      "patternUri" : "urn:oid:1.2.250.1.71.4.2.1"
    },
    {
      "id" : "Practitioner.identifier:idNatPs.value",
      "path" : "Practitioner.identifier.value",
      "short" : "Identifiant national de la personne physique. 0 + ADELI ou 8 + RPPSidPP,\r\n Personne/Identifiant PP si l’instance correspond à un identifiant RPPS ou ADELI, sinon Personne/identification nationale PP."
    },
    {
      "id" : "Practitioner.identifier:rpps",
      "path" : "Practitioner.identifier",
      "sliceName" : "rpps",
      "short" : "Numéro RPPS (11 chiffres)",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Practitioner.identifier:rpps.type",
      "path" : "Practitioner.identifier.type",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
          "code" : "RPPS"
        }]
      }
    },
    {
      "id" : "Practitioner.identifier:rpps.system",
      "path" : "Practitioner.identifier.system",
      "patternUri" : "https://rpps.esante.gouv.fr"
    },
    {
      "id" : "Practitioner.identifier:adeli",
      "path" : "Practitioner.identifier",
      "sliceName" : "adeli",
      "short" : "Numéro ADELI (9 chiffres)",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Practitioner.identifier:adeli.type",
      "path" : "Practitioner.identifier.type",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
          "code" : "ADELI"
        }]
      }
    },
    {
      "id" : "Practitioner.identifier:adeli.system",
      "path" : "Practitioner.identifier.system",
      "patternUri" : "https://adeli.esante.gouv.fr"
    },
    {
      "id" : "Practitioner.name",
      "path" : "Practitioner.name",
      "type" : [{
        "code" : "HumanName",
        "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-human-name"]
      }]
    },
    {
      "id" : "Practitioner.telecom",
      "path" : "Practitioner.telecom",
      "type" : [{
        "code" : "ContactPoint",
        "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-contact-point"]
      }]
    },
    {
      "id" : "Practitioner.address",
      "path" : "Practitioner.address",
      "type" : [{
        "code" : "Address",
        "profile" : ["https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-address"]
      }]
    },
    {
      "id" : "Practitioner.qualification",
      "path" : "Practitioner.qualification",
      "short" : "Qualifications obtained by training and certification | Diplômes. Les différents diplômes sont : les diplômes d'état français, les commissions de qualification, les diplômes d'études spécialisées, les DESC groupe 1 et 2, les capacités, les diplômes d'un pays de l'EEE, les diplômes d'université (DU) ou Inter-Universitaire, les certificats d'étude spéciale, les attestations, les diplômes européens d'études spécialisées, les diplômes de 2ème cycle non qualifiant et les autres types de diplômes. Pour plus d'informations, consulter le jeu de valeurs associé."
    },
    {
      "id" : "Practitioner.qualification.code",
      "path" : "Practitioner.qualification.code",
      "binding" : {
        "strength" : "preferred",
        "valueSet" : "https://mos.esante.gouv.fr/NOS/JDV_J105-EnsembleDiplome-RASS/FHIR/JDV-J105-EnsembleDiplome-RASS"
      }
    }]
  }
}

```
