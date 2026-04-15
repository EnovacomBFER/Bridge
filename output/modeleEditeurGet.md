# Modèle Editeur Requête FHIR - Guide D'implementation Bridge v1.1.0

* [**Table of Contents**](toc.md)
* **Modèle Editeur Requête FHIR**

## Modèle Editeur Requête FHIR

La section suivante décrit le fonctionnement du mode éditeur en utilisant des requêtes FHIR GET. Deux principes principaux sont possibles :

**Requête à partir des traits d'indentité d’un patient :** cette approche permet d’interroger les ressources liées à un patient précis en utilisant son identifiant ou d’autres critères d’identification.

**Requête pour l’ensemble des patients à partir d’une date donnée :** cette méthode permet de récupérer toutes les ressources ou événements liés aux patients, en filtrant par une date spécifique ou une période, afin d’obtenir une vision globale des données depuis un moment précis.

Ces deux principes offrent une flexibilité pour accéder aux données selon les besoins, que ce soit pour cibler un patient particulier ou pour analyser l’ensemble des données à une date donnée.

## Requête pour l’ensemble des patients à partir d’une date donnée

### Etape 1: Requête permettant de récupérer les patients modifiés depuis la dernière interrogation.

**Endpoint :** GET /Patient

**URL :** https://eie-bridge-recette.nd.care/eai/request/fhir/Patient/$everything?_type=Encounter,Appointment&_lastUpdated=ge2025-10-28T00:00:00Z

**Paramètres :**

| | | | |
| :--- | :--- | :--- | :--- |
| /Patient/$everything | Opération pour récupérer toutes les ressources liées à un patient spécifique, y compris les séjours, rendez-vous, etc. | Texte |   |
| _type=Encounter,Appointment | Filtre pour inclure uniquement les ressources de type Encounter (consultations, visites) et Appointment (rendez-vous). | Texte |   |
| _lastUpdated=ge2025-10-28T00:00:00Z | Filtre pour récupérer uniquement les ressources qui ont été modifiées ou créées à partir du 28 octobre 2025 (date de début). | Texte |   |

## Recherche des informations du patient à partir de ses traits d'identité

### Etape 1 : Recherche du patient

**Endpoint :** GET /Patient

**URL :** https://eie-bridge-recette.nd.care/eai/request/fhir/Patient

**Paramètres de recherche :**

| | | | |
| :--- | :--- | :--- | :--- |
| active | Indicateur de validité du patient (patient maître) | Booléen | ✅ |
| family | Nom de famille | Texte |   |
| given | Prénom | Texte |   |
| birthdate | Date de naissance | Date (YYYY-MM-DD) |   |
| identifier (INS) | urn:oid:1.2.250.1.213.1.4.8 | Token |   |
| organization.identifier | Finess géographique de l'établissement | Texte | ✅ |

**Exemple de requête :**

```
GET https://eie-bridge-recette.nd.care/eai/request/fhir/Patient?organization.identifier=130000000&active=true&family=SKYWALKER&given=ANAKIN&birthdate=1999-12-24&identifier=urn:oid:1.2.250.1.213.1.4.8|120034804500400

```

**Exemple de retour (format JSON) :**

```
{
  "resourceType": "Bundle",
  "total": 1,
  "entry": [
    {
      "resource": {
        "resourceType": "Patient",
        "id": "3e495837-75f1-4de5-9c88-20f69cbe2108",
        "identifier": [
          {
            "system": "http://EnovacomBridge.com/130000000/identifiers/patient",
            "value": "000060559227"
          }
        ],
        "active": true,
        "name": [
          {
            "use": "official",
            "family": "BROWN",
            "given": ["HEMET"]
          }
        ],
        "gender": "male",
        "birthDate": "1940-03-08",
        // ... autres champs disponibles
      }
    }
  ]
}


```

### Etape 2 : Récupération de l'ID de la ressource Patient

**JSON Path :** $.entry[0].resource.id

### Etape 3 : Récupération des séjours

**Endpoint :** GET /Encounter

**URL :** https://eie-bridge-recette.nd.care/eai/request/fhir/Encounter

**Paramètres :**

| | | | |
| :--- | :--- | :--- | :--- |
| patient | ID de la ressource patient | UUID | ✅ |
| location-identifier | identifiant métier de l'unité | string | ✅ |

**Exemple de requête :**

```
GET https://eie-bridge-recette.nd.care/eai/request/fhir/Encounter?patient=3e495837-75f1-4de5-9c88-20f69cbe2108

```

**Exemple de retour (format JSON) :**

```
{
  "resourceType": "Bundle",
  "total": 1,
  "entry": [
    {
      "resource": {
        "resourceType": "Encounter",
        "id": "a12b5c75-a26d-484b-a41b-266983778934",
        "identifier": [
          {
            "type": {
              "coding": [
                {
                  "code": "VN",
                  "display": "Visit Number"
                }
              ]
            },
            "system": "http://EnovacomBridge.com/130000000/identifiers/encounter",
            "value": "3088909"
          }
        ],
        "status": "in-progress",
        "class": {
          "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode",
          "code": "IMP",
          "display": "inpatient encounter"
        },
        "type": [
          {
            "coding": [
              {
                "code": "U",
                "display": "Caractère d'urgence aigue du problème"
              }
            ]
          }
        ],
        "serviceType": {
          "coding": [
            {
              "code": "03",
              "display": "Hospitalisation Complète"
            }
          ]
        },
        "subject": {
          "reference": "Patient/ccd80be6-a26e-4a94-aa15-a666d4b62d6c"
        },
        "participant": [
          {
            "individual": {
              "display": "BOUGHANEM"
            }
          }
        ],
        "period": {
          "start": "2024-09-26T11:47:00Z"
        },
        "hospitalization": {
          "admitSource": {
            "coding": [
              {
                "code": "emd",
                "display": "From accident/emergency department"
              }
            ]
          }
        }
        // ... autres champs disponibles (location, serviceProvider, etc.)
      }
    }
  ]
}


```

### Etape 3 : Récupération des rendez-vous

**Endpoint :** GET /Appointment

**URL :** https://eie-bridge-recette.nd.care/eai/request/fhir/Appointment

**Paramètres :**

| | | | |
| :--- | :--- | :--- | :--- |
| patient | ID de la ressource patient | UUID |   |
| actor-identifier | Identifiant métier de la ressource location (salle du rendez-vous) | String |   |

**Exemple de requête :**

```
GET https://eie-bridge-recette.nd.care/eai/request/fhir/Appointment?patient=3e495837-75f1-4de5-9c88-20f69cbe2108 **Exemple de retour :**

```

```
{
  "resourceType": "Bundle",
  "total": 1,
  "entry": [
    {
      "resource":{
        "resourceType": "Appointment",
        "id": "be7394b7-09bb-4071-a8ee-dbcd23a20044",
        "identifier": [
          {
            "use": "usual",
            "type": {
              "coding": [
                {
                  "system": "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
                  "code": "INTRN",
                  "display": "Identifiant interne"
                }
              ]
            },
            "system": "http://EnovacomBridge.com/130000000/identifiers/appointment",
            "value": "45789465"
          }
        ],
        "status": "booked",
        "serviceType": [
          {
            "coding": [
              {
                "system": "https://enovacom.org/fhir/CodeSystem/appointment-service-type-830000000",
                "code": "BO222",
                "display": "FRACTURE DU TIBIA"
              }
            ],
            "text": "FRACTURE DU TIBIA"
          }
        ],
        "description": "FRACTURE DU TIBIA",
        "start": "2025-07-24T23:15:00.000Z",
        "end": "2025-07-25T02:15:00.000Z",
        "minutesDuration": 180,
        "participant": [
          {
            "actor": {
              "identifier": {
                "use": "usual",
                "system": "http://EnovacomBridge.com/130000000/identifiers/location",
                "value": "0039"
              },
              "display": "Salle"
            },
            "status": "accepted"
          },
          {
            "actor": {
              "reference": "Patient/99a25f60-d947-4b83-ac27-518f1766b96f",
              "identifier": {
                "use": "usual",
                "type": {
                  "coding": [
                    {
                      "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
                      "code": "PI",
                      "display": "Patient internal identifier"
                    }
                  ]
                },
                "system": "http://EnovacomBridge.com/130000000/identifiers/patient",
                "value": "004211313"
              }
            },
            "status": "accepted"
          },
          {
            "actor": {
              "reference": "Practitioner/86bf354a-5522-485c-8e8c-408f64b025c3",
              "identifier": {
                "use": "usual",
                "system": "http://EnovacomBridge.com/130000000/identifiers/practitioner",
                "value": "XXXXX"
              }
            },
            "status": "accepted"
          }
        ]
      }
    }
  ]
}

```

## Codes d'erreur de retour courants

| | | |
| :--- | :--- | :--- |
| 200 | Succès | - |
| 404 | Ressource non trouvée | Vérifier les paramètres |
| 400 | Paramètres invalides | Corriger la syntaxe |
| 500 | Erreur serveur | Contacter l'équipe technique |

# Notes importantes

* 🏥 **Serveur unique :** Toutes les requêtes passent par le serveur EIE
* 🔍 **Format de l'identifier :** Le FINESS doit être intégré dans l'OID
* 📋 **Workflow séquentiel :** L'ID patient de l'étape 1 est requis pour les étapes 2 et 3

