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

Les abonnements (subscriptions) en FHIR sont une fonctionnalité essentielle pour permettre une communication en temps réel entre les systèmes de santé. Ils permettent à un système de s'abonner à des événements spécifiques, tels que la création, la mise à jour ou la suppression de ressources (par exemple, un patient). Lorsqu'un événement correspondant à l'abonnement se produit, une notification est automatiquement envoyée au système abonné, facilitant ainsi une réaction immédiate et une synchronisation efficace des données.

### Abonnement Patient :

Cette souscription permet d'être alerté en temps réel lorsqu'un nouveau patient actif est créé dans le système, en envoyant une requête HTTP à l'endpoint spécifié. Cela facilite la gestion proactive des nouveaux patients.

```
{
    "resourceType": "Patient",
    "id": "c8168579-f4f5-499f-8e2a-399638080544",
    "meta": {
        "versionId": "2",
        "lastUpdated": "2026-03-03T10:37:26.975+01:00",
        "source": "#9cMzjJjtM5C2863R"
    },
    "language": "fr-FR",
    "extension": [
        {
            "url": "http://hl7.org/fhir/StructureDefinition/patient-birthPlace",
            "valueAddress": {
                "extension": [
                    {
                        "url": "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-address-insee-code",
                        "valueCoding": {
                            "system": "https://mos.esante.gouv.fr/NOS/TRE_R13-CommuneOM/FHIR/TRE-R13-CommuneOM",
                            "code": "22278",
                            "display": "SAINT-BRIEUC"
                        }
                    }
                ],
                "city": "SAINT-BRIEUC",
                "postalCode": "22000",
                "country": "FRA"
            }
        },
        {
            "url": "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-identity-reliability",
            "extension": [
                {
                    "url": "identityStatus",
                    "valueCoding": {
                        "system": "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0445",
                        "code": "VALI",
                        "display": "Identité validée"
                    }
                }
            ]
        },
        {
            "url": "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient-nationality",
            "extension": [
                {
                    "url": "code",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "system": "urn:iso:std:iso:3166",
                                "code": "FRA"
                            }
                        ]
                    }
                }
            ]
        }
    ],
    "identifier": [
        {
            "use": "secondary",
            "type": {
                "coding": [
                    {
                        "system": "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
                        "code": "INS-C",
                        "display": "Identifiant National de Santé Calculé"
                    }
                ]
            },
            "system": "urn:oid:1.2.250.1.213.1.4.2",
            "value": "2250575256189"
        },
        {
            "use": "official",
            "type": {
                "coding": [
                    {
                        "system": "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
                        "code": "INS-NIR",
                        "display": "NIR définitif"
                    }
                ]
            },
            "system": "urn:oid:1.2.250.1.213.1.4.8",
            "value": "2250575256189"
        },
        {
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
            "system": "urn:oid:1.2.250.1.71.4.2.2.130000000.patient",
            "value": "545434415"
        }
    ],
    "active": true,
    "name": [
        {
            "extension": [
                {
                    "url": "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient-birth-list-given-name",
                    "valueString": "MARGUERITE JEANNE YVETTE"
                }
            ],
            "use": "official",
            "text": "MME CONNAN MARGUERITE",
            "family": "CONNAN",
            "given": [
                "MARGUERITE"
            ],
            "prefix": [
                "MME"
            ]
        },
        {
            "use": "usual",
            "text": "MME LEGRAND JEANNE",
            "family": "LEGRAND",
            "given": [
                "JEANNE"
            ],
            "prefix": [
                "MME"
            ]
        }
    ],
    "telecom": [
        {
            "system": "phone",
            "value": "0102030405",
            "use": "home"
        }
    ],
    "gender": "female",
    "birthDate": "1918-05-16",
    "maritalStatus": {
        "coding": [
            {
                "system": "http://terminology.hl7.org/CodeSystem/v3-MaritalStatus",
                "code": "MME",
                "display": "Married"
            }
        ]
    },
    "managingOrganization": {
        "reference": "Organization/346f3566-1693-43d7-a1d1-1bc13d3675df",
        "identifier": {
            "use": "official",
            "type": {
                "coding": [
                    {
                        "system": "https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203",
                        "code": "FINEG",
                        "display": "FINESS d'entité géographique"
                    }
                ]
            },
            "system": "https://finess.esante.gouv.fr",
            "value": "130000000"
        },
        "display": "Etablissement"
    }
}

```

### Abonnement Séjour :

Cette souscription permet d'être alerté en temps réel lorsqu'un séjour est créé ou modifié avec un statut en cours ou planifié, en envoyant une requête HTTP à l'endpoint spécifié. Cela facilite la gestion proactive des séjours.

Pour simplifier l'intégration dans les solutions logiciels tiers, le choix a été fait d'enrichir cette subscriptions avec les informations du patient.

### Abonnement Rendez-vous :

Cette souscription permet d'être alerté en temps réel lorsqu'un rendez-vous est créé (**booked**) ou avec un statut en attente (**pending**), en envoyant une requête HTTP à l'endpoint spécifié. Cela facilite la gestion proactive des rendez-vous.

Pour simplifier l'intégration dans les solutions logiciels tiers, le choix a été fait d'enrichir cette subscriptions avec les informations du séjour et du patient.

```

{
    "resourceType": "Appointment",
    "id": "02f078c7-edc3-4384-a756-a6b61d45d2b3",
    "meta": {
        "versionId": "1",
        "lastUpdated": "2026-02-16T14:34:05.619+01:00",
        "source": "#AOucJhu6LeiUSYrm",
        "profile": [
            "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-appointment"
        ]
    },
    "language": "fr-FR",
    "text": {
        "status": "generated",
        "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\">Rendez-vous de TC ANESTHESIE TELECONSULTATION PROCTO CASTAGNARY prevu le 2026/03/05 a 10:40 pour le patient d'IPP 111351155</div>"
    },
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
            "system": "http://EnovacomBridge.com/830000000/identifiers/appointment",
            "value": "6923320"
        }
    ],
    "status": "booked",
    "serviceType": [
        {
            "coding": [
                {
                    "system": "https://enovacom.org/fhir/CodeSystem/appointment-service-type-830000000",
                    "code": "TCANEPROCTC",
                    "display": "TC ANESTHESIE TELECONSULTATION PROCTO CASTAGNARY"
                }
            ],
            "text": "TC ANESTHESIE TELECONSULTATION PROCTO CASTAGNARY"
        }
    ],
    "description": "TC ANESTHESIE TELECONSULTATION PROCTO CASTAGNARY",
    "start": "2026-03-05T10:40:00.000Z",
    "minutesDuration": 15,
    "comment": "FILAC Dr PROTHE C.12H15 LE 18/03 EN UCA",
    "patientInstruction": "FILAC Dr PROTHE C.12H15 LE 18/03 EN UCA",
    "participant": [
        {
            "actor": {
                "identifier": {
                    "use": "usual",
                    "system": "http://EnovacomBridge.com/830000000/identifiers/location",
                    "value": "UNKNOWN"
                },
                "display": "Salle"
            },
            "status": "accepted"
        },
        {
            "actor": {
                "reference": "Patient/7f724278-8e95-4210-8840-54192a101cf2",
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
                    "system": "http://EnovacomBridge.com/830000000/identifiers/patient",
                    "value": "111351155"
                },
                "display": "Patient"
            },
            "status": "accepted"
        }
    ]
}


```

