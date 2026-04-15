# Artifacts - Guide D'implementation Bridge v1.1.0

* [**Table of Contents**](toc.md)
* **Artifacts**

## Artifacts

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Behavior: Search Parameters 

These define the properties by which a RESTful server can be searched. They can also be used for sorting and including related resources.

| | |
| :--- | :--- |
| [appointment-actor-identifier](SearchParameter-appointment-actor-identifier.md) | Paramètre de recherche pour récupérer une ressource Appointment par la salle de réalisation de l'acte du rendez-vous. |
| [encounter-location-identifier](SearchParameter-encounter-location-identifier.md) | Paramètre de recherche pour récupérer une ressource Encounter par l'identifiant métier de la location (Unité d'hébergement ou de responsabilité médicale). |
| [patient-creation-date](SearchParameter-patient-creation-date.md) | Paramètre de recherche pour récupérer une ressource Patient par sa date de création. |

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Enovacom Bridge Appointment Profile](StructureDefinition-appointment-enovacom-bridge.md) | Profil de la ressource Appointment pour la France. Ce profil ajoute l'opérateur qui a créé/modifié/annulé le RDV. Il permet de référencer un patient, un professionnel de santé, une salle et éventuellement une offre de soins au RDV. |
| [Enovacom Bridge Encounter Visit Profile](StructureDefinition-encounter-visit-enovacom-bridge.md) | Ce profil de la ressource Encounter sert à définir la venue dans l'établissement du patient.L'élément Encounter.location est slicé pour permettre de renseigner l'unité fonctionnelle de responsabilité médicale (UFM) et l'unité fonctionnelle d'hébergement du patient (UFH) |
| [Enovacom Bridge EpisodeOfCare Profile](StructureDefinition-episodeOfCare-enovacom-bridge.md) | Ce profil de la ressource Encounter sert à définir le dossier administratif du patient en lien avec ces différentes venues. This profil constrains the Encounter resource to represent the patients administrative file in relation to these different visits. |
| [Enovacom Bridge Patient Profile](StructureDefinition-patient-enovacom-bridge.md) | Ce profil spécifie les identifiants de patient utilisés par la solution Bridge d'Enovacom. Il utilise des extensions internationales (birthplace et nationalité) et ajoute des extensions propres au contexte d'utilisation de Bridge comme la date de création de l'identité. |
| [Enovacom Bridge Practitioner Profile](StructureDefinition-practitioner-enovacom-bridge.md) | Profil de la ressource Practitionner pour la France. Ce profil contraint les types d'identifiants du professionnel de santé en France.Ajout d'une slice sur l'identifier pour le code interne practitioner présent dans les messages HL7v2 (code EI). |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Extension Enovacom Patient Creation Date](StructureDefinition-PatientCreationDate.md) | This extension allowos to know the patient's resource creation date .Extension permettant de connaître la date de création de la ressource Patient. |

### Example: Example Instances 

These are example instances that show what data produced and consumed by systems conforming with this implementation guide might look like.

| | |
| :--- | :--- |
| [AppointmentExample](Appointment-AppointmentExample.md) | Un exemple de rendez-vous pour un patient |
| [EncounterVisitExample](Encounter-EncounterVisitExample.md) | Un exemple de venue ambulatoire pour un patient |
| [EpisodeOfCareExample](EpisodeOfCare-EpisodeOfCareExample.md) | Un exemple de représentation du dossier administratif |
| [PatientBridgeExample](Patient-1c783afa-9981-4977-be63-8859f0a8fde5.md) | Un exemple de ressource pour un patient |
| [PractitionerBridgeExample01](Practitioner-z65g3ad4-4512-4477-biu3-8719haf7d75.md) | Un exemple de ressource pour un professionnel de santé |
| [PractitionerBridgeExample02](Practitioner-6b70aeba-4024-4cf0-8959-2d1d6cf15597.md) | Un exemple de ressource pour un professionnel de santé |

