# Réception quotidienne des actes en JSON

## Présentation

L’interface permet de transmettre quotidiennement des actes au format JSON via HTTPS.


**Endpoint :** POST /eai/request/BRIDGE/JSON_ACTE

**URL :** https://eie-bridge-recette.nd.care/eai/request/BRIDGE/JSON_ACTE

**Paramètres :**

| Header      | Description                      | Format | obligatoire |
|-------------|----------------------------------|--------|-------------|
| finess | Finess géographique de l'établissement émetteur      | Texte  | ✅   


| Paramètre | Valeur |
|---|---|
| Méthode | `POST` |
| Endpoint | `/eai/request/BRIDGE/JSON_ACTE` |
| URL de recette | `https://eie-bridge-recette.nd.care |
| Format | `application/json` |
| Authentification | Certificat client TLS |
| Identification de l’établissement | En-tête `finess` |


## En-têtes HTTP

La requête doit être envoyée avec un certificat client valide et les en-têtes suivants :

```http
Content-Type: application/json
Accept: application/json
finess: <code FINESS de l'établissement>
```

Le nom exact de l’en-tête FINESS est à confirmer si l’environnement utilise une autre convention.

## Exemple de requête avec certificat

Exemple avec `curl` et des fichiers de certificat PEM :

**Exemple de requête :**

```bash
curl --request POST \
  --url "https://eie-bridge-recette.nd.care/eai/request//BRIDGE/JSON_ACTE`" \
  --cert client.crt \
  --key client.key \
  --header "Content-Type: application/json" \
  --header "Accept: application/json" \
  --header "finess: 123456789" \
  --data @acte.json
```

Si le certificat est fourni dans un fichier PKCS#12 (`.p12` ou `.pfx`), les options `curl` correspondantes peuvent varier selon la version et la configuration TLS.

## Champs obligatoires

Les champs suivants sont obligatoires dans le JSON transmis :

- `keyLetter`
- `type`
- `label`
- `examTypeList`
- `validityStartDate`

Ces champs décrivent la lettre clé et les examens associés. Les autres propriétés nécessaires à la création d’un acte sont détaillées ci-dessous.

## Détail des paramètres

### Acte et examen

| Champ | Description |
|---|---|
| `examType` | Examen type, référencé par son code. Exemples : `TLC`, `TLE`. |
| `actRef` | Lettre clé de codification de l’acte selon la NGAP. Exemples : `RQD`, `TE2`. |
| `examName` | Libellé ou nom de l’examen, par exemple le type de télédossier. |
| `realisationDate` | Date et heure de réalisation de l’acte, en UTC. |
| `quantity` | Nombre de kilomètres parcourus par le praticien. Si la valeur n’est pas renseignée, la valeur par défaut est `1`. |
| `encounterId` | Numéro de séjour du patient dans l’établissement où l’acte est réalisé. |
| `encounterClass` | Classification du mode de prise en charge. |
| `status` | Statut de l’acte. |
| `source` | Identifiant contextuel permettant de retrouver la source à l’origine de l’acte, par exemple le numéro de rendez-vous. |

### Patient

| Champ | Description |
|---|---|
| `patient.birthname` | Nom de naissance. |
| `patient.usual_name` | Nom d’usage. |
| `patient.given_name_list` | Liste des prénoms de naissance. |
| `patient.firstname` | Premier prénom de naissance. |
| `patient.usual_firstname` | Prénom d’usage. |
| `patient.birthdate` | Date de naissance. |
| `patient.birthplace` | Code INSEE du lieu de naissance, sur 5 caractères. |
| `patient.sex` | Sexe codé `F`, `M` ou `O`. |
| `patient.multiple_birth_order` | Ordre de naissance en cas de naissance multiple. |
| `patient.identifiers` | Liste d’identifiants contextuels, par exemple IPP, INS, RRI, numéro de sécurité sociale ou identifiant patient. |

Un identifiant contextuel peut comporter les propriétés suivantes :

| Champ | Description |
|---|---|
| `identifier` | Valeur de l’identifiant. |
| `domain` | Domaine de l’identifiant. |
| `assigner` | Organisme émetteur. |
| `assignerURI` | URI de l’organisme émetteur. |

### Professionnel réalisant l’acte

`performingPhysician` désigne le professionnel de santé réalisant l’acte. Pour un acte TLE, il s’agit du requis.

| Champ | Description |
|---|---|
| `performingPhysician.firstname` | Prénom du professionnel. |
| `performingPhysician.lastname` | Nom du professionnel. |
| `performingPhysician.identifiers` | Identifiants contextuels : RPPS, ADELI ou identifiant du Practice de l’utilisateur. |
| `performingPhysician.healthcareProvider` | Établissement d’appartenance du professionnel. |
| `performingPhysician.healthcareService` | Service du professionnel ; pour un acte TLE, il s’agit de la communauté. |

L’établissement (`healthcareProvider`) comprend :

- `name` : nom de l’établissement ;
- `identifiers` : identifiants contextuels, par exemple FINESS ou identifiant de l’annuaire.

Le service (`healthcareService`) comprend :

- `name` : nom du service ;
- `identifiers` : identifiants contextuels de l’annuaire.

## Exemple de structure de données

L’exemple ci-dessous reprend la structure des objets attendus. Il s’agit d’un modèle à adapter : les valeurs `string` et `0` sont des exemples de types, pas nécessairement des valeurs métier valides.

```json
{
  "examType": {
    "code": "TLC",
    "label": "Téléconsultation"
  },
  "actRef": {
    "keyLetter": "RQD",
    "type": "string",
    "factor": 0,
    "label": "Libellé de l'acte",
    "description": "Description de l'acte",
    "validityStartDate": "2026-08-06",
    "validityEndDate": "2026-08-06"
  },
  "examName": "Type du télédossier",
  "realisationDate": "2026-08-06T10:30:00Z",
  "quantity": 1,
  "patient": {
    "birthname": "DURAND",
    "usual_name": "DURAND",
    "given_name_list": ["Camille", "Alex"],
    "firstname": "Camille",
    "usual_firstname": "Camille",
    "birthdate": "1980-01-15",
    "birthplace": "75056",
    "sex": "F",
    "multiple_birth_order": 0,
    "identifiers": [
      {
        "identifier": "123456789",
        "domain": "IPP",
        "assigner": "Établissement",
        "assignerURI": "urn:example:etablissement"
      }
    ]
  },
  "encounterId": "SEJOUR-12345",
  "encounterClass": "ambulatoire",
  "status": "in_progress",
  "performingPhysician": {
    "firstname": "Alex",
    "lastname": "MARTIN",
    "identifiers": [
      {
        "identifier": "12345678901",
        "domain": "RPPS",
        "assigner": "ANS",
        "assignerURI": "urn:example:ans"
      }
    ],
    "healthcareProvider": {
      "name": "Établissement de santé",
      "identifiers": [
        {
          "identifier": "123456789",
          "domain": "FINESS",
          "assigner": "FINESS",
          "assignerURI": "urn:example:finess"
        }
      ]
    },
    "healthcareService": {
      "name": "Service",
      "identifiers": [
        {
          "identifier": "SERVICE-01",
          "domain": "Runtime",
          "assigner": "Annuaire Runtime",
          "assignerURI": "urn:example:runtime"
        }
      ]
    }
  },
  "source": {
    "identifier": "CASE-12345",
    "domain": "Nexus",
    "assigner": "Nexus",
    "assignerURI": "urn:example:nexus"
  }
}
```

## Exemple de structure de réponse

L’exemple suivant correspond à une structure de liste paginée. Il ne constitue pas un exemple de corps de requête à envoyer en `POST`.

```json
{
  "total": 0,
  "page": 0,
  "perPage": 0,
  "hasNext": true,
  "hasPrevious": true,
  "results": [
    {
      "id": "string",
      "examType": {
        "id": "string",
        "code": "string",
        "label": "string"
      },
      "actRef": {
        "id": "string",
        "keyLetter": "string",
        "type": "string",
        "factor": 0,
        "label": "string",
        "description": "string",
        "validityStartDate": "2026-08-06",
        "validityEndDate": "2026-08-06"
      },
      "examName": "string",
      "realisationDate": "2026-08-06",
      "quantity": 0,
      "patient": {
        "id": "string",
        "birthname": "string",
        "usual_name": "string",
        "given_name_list": "string",
        "firstname": "string",
        "usual_firstname": "string",
        "birthdate": "2026-08-06",
        "birthplace": "string",
        "sex": "string",
        "multiple_birth_order": 0,
        "identifiers": [
          {
            "id": "string",
            "identifier": "string",
            "domain": "string",
            "assigner": "string",
            "assignerURI": "string"
          }
        ]
      },
      "encounterId": "string",
      "encounterClass": "string",
      "status": "in_progress",
      "performingPhysician": {
        "id": "string",
        "firstname": "string",
        "lastname": "string",
        "healthcareProvider": {
          "id": "string",
          "name": "string",
          "identifiers": [
            {
              "id": "string",
              "identifier": "string",
              "domain": "string",
              "assigner": "string",
              "assignerURI": "string"
            }
          ]
        },
        "healthcareService": {
          "id": "string",
          "name": "string",
          "identifiers": [
            {
              "id": "string",
              "identifier": "string",
              "domain": "string",
              "assigner": "string",
              "assignerURI": "string"
            }
          ]
        },
        "identifiers": [
          {
            "id": "string",
            "identifier": "string",
            "domain": "string",
            "assigner": "string",
            "assignerURI": "string"
          }
        ]
      },
      "source": {
        "id": "string",
        "identifier": "string",
        "domain": "string",
        "assigner": "string",
        "assignerURI": "string"
      }
    }
  ]
}
```