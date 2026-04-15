Alias: $identifier-system-type = http://hl7.org/fhir/ValueSet/namingsystem-identifier-system-type
Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203
Alias: $fr-core-cs-v2-0203 = https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203

Profile: EpisodeOfCareProfile_ENOVACOM_BRIDGE
Parent: EpisodeOfCare
Id: episodeOfCare-enovacom-bridge
Title: "Enovacom Bridge EpisodeOfCare Profile"
Description: """Ce profil de la ressource Encounter sert à définir le dossier administratif du patient en lien avec ces différentes venues.
This profil constrains the Encounter resource to represent the patients administrative file in relation to these different visits."""

* ^url = "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-episodeofcare"
* ^version = "2.0.1"
* ^status = #active
* ^date = "2024-04-16T11:49:14+02:00"
* ^publisher = "Enovacom"
* ^contact.name = "Enovacom"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.enovacom.com/"
* ^jurisdiction = urn:iso:std:iso:3166#FR "France"
* meta.profile ^slicing.discriminator.type = #value
* meta.profile ^slicing.discriminator.path = "$this"
* meta.profile ^slicing.description = "Slice based on the canonical url value"
* meta.profile ^slicing.rules = #open
* meta.profile contains fr-canonical 0..1
* meta.profile[fr-canonical] = "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-episodeofcare"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains $fr-core-estimated-discharge-date named estimatedDischargeDate 0..1
* identifier 1..
* identifier ^short = "identifiant métier du dossier administratif (NDA)"
* identifier.type 1..
* identifier.type from $identifier-system-type (extensible)
* identifier.type = $v2-0203#AN "Account number"
* identifier.type ^definition = "Type d'identifiant du dossier administratif"
* identifier.type ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* identifier.type ^binding.extension[=].valueString = "IdentifierType"
* identifier.type ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-isCommonBinding"
* identifier.type ^binding.extension[=].valueBoolean = true
* identifier.system 1..
* identifier.system ^definition = "Le namespace doit être unique pour faciliter la recherche."
* identifier.system ^example[0].label = "L'intégration du FINESS géographique dans ce system permet de distinguer les établissements"
* identifier.system ^example[=].valueUri = "urn:oid:1.2.250.1.71.4.2.2.$FinessGeo;.episodeOfCare"
* identifier.value 1..
* identifier.assigner only Reference($fr-core-organization)
* patient ^short = "Patient concerné par le dossier"
* patient only Reference($fr-core-patient)
* managingOrganization ^short = "Etablissement en charge du dossier"
* managingOrganization only Reference($fr-core-organization)
* managingOrganization.display = "Etablissement"



Instance: EpisodeOfCareExample
InstanceOf: EpisodeOfCareProfile_ENOVACOM_BRIDGE
Description: "Un exemple de représentation du dossier administratif"
Usage: #example
* meta.profile = "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-episodeofcare"
* language = #fr-FR
* identifier.use = #usual
* identifier.type = $v2-0203#AN "Account number"
* identifier.system = "http://EnovacomBridge.com/{FinessGeo}/identifiers/episodeofcare"
* identifier.value = "018714588"
* status = #active
* patient = Reference(Patient/$id_Patient)
* patient.type = "Patient"
* patient.identifier.use = #usual
* patient.identifier.type = $v2-0203#PI "Patient internal identifier"
* patient.identifier.system = "http://EnovacomBridge.com/{FinessGeo}/identifiers/patient"
* patient.identifier.value = "010208662441"
* managingOrganization = Reference(Organization/$id_OrganizationEtab)
* managingOrganization.type = "Organization"
* managingOrganization.identifier.use = #official
* managingOrganization.identifier.type = $fr-core-cs-v2-0203#FINEG "FINESS d'entité géographique"
* managingOrganization.identifier.system = "https://finess.esante.gouv.fr"