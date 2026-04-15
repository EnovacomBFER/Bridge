### Workflow d'utilisation 

<div style="text-align: center;" class="mermaid">
sequenceDiagram
    participant User
    participant Server as EIE Bridge Server
 
    User->>Server: Étape 1: Recherche patient (GET /fhir/Patient)
    activate Server
    Server-->>User: Retourne PATIENT_ID
    deactivate Server
 
    User->>Server: Étape 2: Récupération des séjours (GET /fhir/Encounter?patient=PATIENT_ID)
    activate Server
    Server-->>User: Retourne les séjours
    deactivate Server
 
    User->>Server: Étape 3: Récupération des RDV (GET /fhir/Appointment?patient=PATIENT_ID)
    activate Server
    Server-->>User: Retourne les RDV
    deactivate Server
</div>

### Requête HTTP 

**Construction d'une requête de recherche de base :**

<style>
    .my-ig-table {
    border-collapse: collapse;
    border-spacing: 0;
    border-radius: 10px;
    overflow: hidden;
    width: 100%;
    margin: 1em 0;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  }
  .my-ig-table td:last-child, 
  .my-ig-table th:last-child {
        border-right: none;
  }
  .my-ig-table thead {
    background-color: #D1E0D7;
  }
  .my-ig-table tbody tr:nth-child(even) {
    background-color: #f5f5f5;
  }
</style>


<table class="my-ig-table">
    <thead>
    </thead>
    <tbody>
        <tr>
            <td><strong>Interaction</strong></td>
            <td><a href="https://hl7.org/fhir/R4/search.html">Search</a></td>
        </tr>
        <tr>
            <td><strong>Méthode HTTP</strong></td>
            <td>GET</td>
        </tr>
        <tr>
            <td><strong>Type de ressource recherchée</strong></td>
            <td>ex : Patient</td>
        </tr>
        <tr>
            <td><strong>Requête</strong></td>
            <td><code>GET [URL]/Patient?[paramètre de recherche]</code></td>
        </tr>
    </tbody>
</table>


#### Etape 1 : Recherche du patient 

**Endpoint :** GET /Patient

**URL :** https://eie-bridge-recette.nd.care/eai/request/fhir/Patient

**Paramètres de recherche :**

| Paramètre | Description | Format | Obligatoire |
| :--- | :--- | :--- | :---: |
| active | Indicateur de validité du patient (patient maître) | Booléen | ✅ |
| family | Nom de famille | Texte | ❌ |
| given | Prénom | Texte | ❌ |
| birthdate | Date de naissance | Date (YYYY-MM-DD) | ❌ |
| identifier (IPP avec FINESS) | http://EnovacomBridge.com/{FinessGeo}/identifiers/patient | Token | ❌ |
| creation-date | date de création de la ressource Patient | Date | ❌ |
{: .my-ig-table}

**Exemple de requête :**
```
GET https://eie-bridge-recette.nd.care/eai/request/fhir/Patient?active=true&family=BROWN&given=HEMET&birthdate=1940-03-08&identifier=http://EnovacomBridge.com/130000000/identifiers/patient|000060559227    
```

**Exemple de retour (format JSON) :**

<!-- {% json JSON/retour.json %} -->

```json
{
  "resourceType": "Bundle",
  "total": 1,
  "entry": [
    {
      "resource": {
        "resourceType": "Patient",
        "id": "ccd80be6-a26e-4a94-aa15-a666d4b62d6c",
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

#### Etape 2 : Récupération de l'ID de la ressource Patient

**JSON Path :** $.entry[0].resource.id

#### Etape 3 : Récupération des séjours

**Endpoint :** GET /Encounter

**URL :** https://eie-bridge-recette.nd.care/eai/request/fhir/Encounter

**Paramètres :**

| Paramètre | Description | Format | Obligatoire |
| :--- | :--- | :--- | :---: |
| patient | ID de la ressource patient | UUID | ❌ |
| location-identifier | identifiant métier de l'unité | string | ❌ |
{: .my-ig-table}

**Exemple de requête :**
```
GET https://eie-bridge-recette.nd.care/eai/request/fhir/Encounter?patient=ccd80be6-a26e-4a94-aa15-a666d4b62d6c   
GET https://eie-bridge-recette.nd.care/eai/request/fhir/Encounter?location-identifier=http://EnovacomBridge.com/130000000/identifiers/encounter|0100   
```

**Exemple de retour (format JSON) :**

```json
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

#### Etape 3 : Récupération des rendez-vous

**Endpoint :** GET /Appointment

**URL :** https://eie-bridge-recette.nd.care/eai/request/fhir/Appointment

**Paramètres :**

| Paramètre | Description | Format | Obligatoire |
| :--- | :--- | :--- | :---: |
| patient | ID de la ressource patient | UUID | ❌ |
| actor-identifier | Identifiant métier de la ressource location (salle du rendez-vous) | String | ❌ |
{: .my-ig-table}

**Exemple de requête :**

    GET https://eie-bridge-recette.nd.care/eai/request/fhir/Appointment?patient=ccd80be6-a26e-4a94-aa15-a666d4b62d6c    
    GET https://eie-bridge-recette.nd.care/eai/request/fhir/Appointment?actor-identifier=http://EnovacomBridge.com/130000000/identifiers/location|0039


**Exemple de retour :**

```json
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

### Headers recommandés

Accept: application/fhir+json

Content-Type: application/fhir+json


### Codes d'erreur de retour courants

| Code | Description | Action |
| :--- | :--- | :--- |
| 200 | Succès | - |
| 404 | Ressource non trouvée | Vérifier les paramètres |
| 400 | Paramètres invalides | Corriger la syntaxe |
| 500 | Erreur serveur | Contacter l'équipe technique |
{: .my-ig-table}

### Notes importantes

- 🏥 **Serveur unique :** Toutes les requêtes passent par le serveur EIE

- 🔍 **Format de l'identifier :** Le FINESS doit être intégré dans l'OID

- 📋 **Workflow séquentiel :** L'ID patient de l'étape 1 est requis pour les étapes 2 et 3


