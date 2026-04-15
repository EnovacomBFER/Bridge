# Documentation - Guide D'implementation Bridge v1.1.0

* [**Table of Contents**](toc.md)
* **Documentation**

## Documentation

Lers informations d'identité et de séjours transites en milieu hospitalier via des messages de type HL7v2.

Nous proposons dans ce guide des profils, basés sur Fr Core v2.1.0, permettant de modéliser la partie Identité, Mouvement, Séjour et Rendez-vous et de se rapprocher des éléments transportés en HL7v2 (profil PAM) dans les messages de type ADT.

Le mapping HL7v2 vers FHIR a été entièrement revu pour s'adapter au plus proche des messages tels qu'ils sont définis dans les extensions française du profil IHE PAM v2.11.1.

### Détail des ressources

Voici la liste des ressources utilisées :

*  **Encounter** : ressource modélisant la venue/visite.
*  **EpisodeOfCare** : ressource utilisée pour relier les venues du patient. Il arrive souvent que l'identifiant du dossier administratif soit le même que l'identifiant de la venue. Ces 2 élements sont parfois même confondus. Mais il peut arriver que ces notions soient différentes. L'identifiant métier du dossier administratif est typé NDA alors que l'identifiant métier de la venue est typé IEP.
*  **Practitioner** : ressource utilisée pour représenter le médecin responsable de la venue du patient (médecin identifié comme **Attending Doctor** **AT** dans le messages ADT HL7v2). Cette ressource est également utilisée pour représenter le médecin en charge de la réalisation d'un acte associé à un rendez-vous.
*  **Patient** : ressource utilisée pour représenter le patient lié à la venue.
*  **Appointment** : ressource utilisée pour représenter le rendez-vous du patient.
*  **Location** : les ressources de types Location permettent de modéliser les entités suivantes : Unité de responsabilité médicale, unité d'hébergement, chambre et lit. Ces informations sont transportées en HL7v2 aux positions suivantes (voir profil IHE PAM). Ce type de ressource ne sera cependant pas implémenté. Des [**références logiques**](https://www.hl7.org/fhir/R4/references.html#Reference) sont utilisées et un paramètre de recherche spécifique permettra de retrouver les séjours en lien avec ces éléments.

| | |
| :--- | :--- |
| ZBE-7 | Unité de responsabilité médicale |
| PV1-3.1 | Unité d'hébergement |
| PV1-3.2 | Chambre |
| PV1-3.3 | Lit |

* 🏥 **Organization** : ressource utilisée pour représenter l'établissement. On y retrouve les information des FINESS, type d'établissement etc… Les ressources de type Patient, Encounter, EpisodeOfCare possèdent un lien de type référence vers la ressource de type Organization.

### Modélisation FHIR venue/mouvements générale

Cette modélisation globale indique liens réalisés entre les différentes ressources retenues (référence).

La correspondance est la suivante :

| | |
| :--- | :--- |
| Visite/venue | [Enovacom Bridge Encounter Profile](../output/StructureDefinition-encounter-visit-enovacom-bridge.md) |
| Dossier administratif | [Enovacom Bridge EpisodeOfCare Profile](../output/StructureDefinition-episodeOfCare-enovacom-bridge.md) |
| Patient | [Enovacom Bridge Patient Profile](../output/StructureDefinition-patient-enovacom-bridge.md) |
| Médecin | [Enovacom Bridge Practitioner Profile](../output/StructureDefinition-practitioner-enovacom-bridge.md) |
| Rendez-vous | [Enovacom Bridge Appointment Profile](../output/StructureDefinition-appointment-enovacom-bridge.md) |

