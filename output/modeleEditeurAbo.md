# Modèle Editeur Abonnement - Guide D'implementation Bridge v1.1.0

* [**Table of Contents**](toc.md)
* **Modèle Editeur Abonnement**

## Modèle Editeur Abonnement

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

