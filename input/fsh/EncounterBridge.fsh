Alias: $fr-core-cs-identifier-type = https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-identifier-type
Alias: $fr-core-estimated-discharge-date = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-estimated-discharge-date
Alias: $fr-core-organization = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-organization
Alias: $fr-core-patient = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient
Alias: $fr-core-practitioner = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner
Alias: $fr-core-appointment = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-appointment
Alias: $fr-core-location = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-location
Alias: $fr-core-encounter = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-encounter
Alias: $fr-core-vs-encounter-identifier-type = https://hl7.fr/ig/fhir/core/ValueSet/fr-core-vs-encounter-identifier-type
Alias: $fr-core-vs-encounter-type = https://hl7.fr/ig/fhir/core/ValueSet/fr-core-vs-encounter-type
Alias: $fr-core-vs-encounter-discharge-disposition = https://hl7.fr/ig/fhir/core/ValueSet/fr-core-vs-encounter-discharge-disposition
Alias: $fr-core-vs-location-physical-type = https://hl7.fr/ig/fhir/core/ValueSet/fr-core-vs-location-physical-type
Alias: $jdv-type-activite = https://mos.esante.gouv.fr/NOS/JDV_J138-TypeActivite-RASS

Alias: $v3-ActCode = http://terminology.hl7.org/CodeSystem/v3-ActCode
Alias: $v2-0007 = http://terminology.hl7.org/CodeSystem/v2-0007
Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203
Alias: $v3-ParticipationType = http://terminology.hl7.org/CodeSystem/v3-ParticipationType
Alias: $fr-core-cs-v2-0203 = https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203
Alias: $admit-source = http://terminology.hl7.org/CodeSystem/admit-source
Alias: $fr-core-cs-location-identifier-type = https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-location-identifier-type

Profile: EncounterVisitProfile_ENOVACOM_BRIDGE
Parent: Encounter
Id: encounter-visit-enovacom-bridge
Title: "Enovacom Bridge Encounter Visit Profile"
Description: """Ce profil de la ressource Encounter sert à définir la venue dans l'établissement du patient. 

L'élément Encounter.location est slicé pour permettre de renseigner l'unité fonctionnelle de responsabilité médicale (UFM) et l'unité fonctionnelle d'hébergement du patient (UFH)"""

* ^url = "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-encounter-visit"
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
* meta.profile contains 
    fr-canonical 0..1 and
    bridge-canonical 0..1
* meta.profile[fr-canonical] = "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-encounter"
* meta.profile[bridge-canonical] = "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-encounter-visit"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains $fr-core-estimated-discharge-date named estimatedDischargeDate 0..1
* identifier 1..
* identifier ^short = "Identifiant de la visite/venue"
* identifier ^definition = "Cet élément est multiévalué (pour ne pas bloquer les implémentations, car il arrive sur le terrain qu'il y ait plusieurs id pour une même admission, mais cette situation est considérée comme une anomalie"
* identifier.type 1..
* identifier.type = $fr-core-cs-identifier-type#VN "Visit Number"
* identifier.type from $fr-core-vs-encounter-identifier-type (extensible)
* identifier.type ^definition = "Type d'identifiant (admission ou de mouvement lors d'une hospitalisation)"
* identifier.type ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* identifier.type ^binding.extension[=].valueString = "IdentifierType"
* identifier.type ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-isCommonBinding"
* identifier.type ^binding.extension[=].valueBoolean = true
* identifier.system 1..
* identifier.system ^definition = "Système d'identification des venues dans Bridge incluant le FINESS géographique de l'établissement à l'origine de la création."
* identifier.system = "http://EnovacomBridge.com/{FinessGeo}/identifiers/encounter"
* identifier.value 1..
* identifier.assigner only Reference($fr-core-organization)
* class.system 1..
* class.code 1..
* type ..1
* type from $fr-core-vs-encounter-type (example)
* type ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* type ^binding.extension[=].valueString = "EncounterType"
* serviceType from $jdv-type-activite (preferred)
* serviceType ^binding.extension[0].url = "https://mos.esante.gouv.fr/NOS/JDV_J138-TypeActivite-RASS"
* serviceType ^binding.extension[=].valueString = "EncounterServiceType"
* subject only Reference($fr-core-patient)
* participant ^short = "Liste des personnes impliquées dans la rencontre"
* participant.individual only Reference(RelatedPerson or $fr-core-practitioner or PractitionerRole)
* appointment ^short = "Liste des rendez-vous en lien avec la venue"
* appointment only Reference($fr-core-appointment)
* period 1..
* account ..1
* hospitalization.preAdmissionIdentifier ^short = "Identifiant de pré-admission"
* hospitalization.preAdmissionIdentifier.type 1..
* hospitalization.preAdmissionIdentifier.type from $fr-core-vs-encounter-identifier-type (extensible)
* hospitalization.preAdmissionIdentifier.type ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* hospitalization.preAdmissionIdentifier.type ^binding.extension[=].valueString = "IdentifierType"
* hospitalization.preAdmissionIdentifier.type ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-isCommonBinding"
* hospitalization.preAdmissionIdentifier.type ^binding.extension[=].valueBoolean = true
* hospitalization.preAdmissionIdentifier.system 1..
* hospitalization.preAdmissionIdentifier.system = "1.2.250.1.71.4.2.2+.n°FINESS" (exactly)
* hospitalization.preAdmissionIdentifier.value 1..
* hospitalization.preAdmissionIdentifier.assigner only Reference($fr-core-organization)
* hospitalization.origin only Reference($fr-core-location or $fr-core-organization)
* hospitalization.reAdmission ^short = "Raison de la ré-admission du patient."
* hospitalization.destination only Reference($fr-core-location or $fr-core-organization)
* hospitalization.dischargeDisposition from $fr-core-vs-encounter-discharge-disposition (example)
* location ^slicing.discriminator.type = #value
* location ^slicing.discriminator.path = "location.identifier.system"
* location ^slicing.description = "slicing de l'objet location (UFH, UFM, Chambre, Lit)"
* location ^slicing.rules = #open
* location ^short = "Liste des localisation du patient"
* location contains
    locationUFM 0..1 and
    locationUFH 0..1
* location[locationUFM] ^short = "Unité de responsabilité médicale rattachée au séjour"
* location[locationUFM].location.identifier.system ^short = "FINESS_GEO normalement transporté en PV1.3.4"
* location[locationUFM].location.identifier.system = "http://EnovacomBridge.com/{FinessGeo}/identifiers/locationUFM"
* location[locationUFH] ^short = "Unité d'hébergement"
* location[locationUFH].location.identifier.system ^short = "FINESS_GEO normalement transporté en PV1.3.4"
* location[locationUFH].location.identifier.system = "http://EnovacomBridge.com/{FinessGeo}/identifiers/locationUFH"
* location.location only Reference($fr-core-location)
* location.physicalType from $fr-core-vs-location-physical-type (example)
* serviceProvider only Reference($fr-core-organization)
* partOf only Reference($fr-core-encounter)
* partOf ^type.extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-hierarchy"
* partOf ^type.extension.valueBoolean = true



Instance: EncounterVisitExample
InstanceOf: EncounterVisitProfile_ENOVACOM_BRIDGE
Description: "Un exemple de venue ambulatoire pour un patient"
Usage: #example
* meta.profile = "https://enovacom.com/ig/fhir/StructureDefinition/fr-core-encounter-visit"
* language = #fr-FR
* identifier.use = #usual
* identifier.type = $fr-core-cs-identifier-type#VN "Visit Number"
* identifier.system = "http://EnovacomBridge.com/{FinessGeo}/identifiers/encounter"
* identifier.value = "3091281"
* status = #finished
* class = $v3-ActCode#AMB "ambulatory"
* type = $v2-0007#R "Routine"
* subject = Reference(Patient/ay747r1d-y7p9-35o9-p7b1-3j42d3586cp7)
* subject.identifier.type = $v2-0203#PI "Patient internal identifier"
* subject.identifier.system = "http://EnovacomBridge.com/{FinessGeo}/identifiers/patient"
* subject.identifier.value = "010208662441"
* episodeOfCare = Reference(EpisodeOfCare/j4a58iy1-b3p7-42o9-9bd8-3j42d3586cp7)
* episodeOfCare.identifier.type = $v2-0203#AN "Account number"
* episodeOfCare.identifier.system = "http://EnovacomBridge.com/{FinessGeo}/identifiers/episodeofcare"
* episodeOfCare.identifier.value = "018714588"
* participant.type = $v3-ParticipationType#ATND "attender"
* participant.type.text = "Médecin assumant la responsabilité médicale"
* participant.individual = Reference(Practitioner/3ba92191-b334-4749-9bd8-1a85d3556ca6) "IVANESCU CHASTANG"
* participant.individual.identifier.type = $fr-core-cs-v2-0203#RPPS "N° RPPS"
* participant.individual.identifier.system = "https://rpps.esante.gouv.fr"
* participant.individual.identifier.value = "10100473148"
* period.start = "2024-10-03T08:00:00Z"
* period.end = "2024-10-04T00:00:00Z"
* hospitalization.origin.identifier.system = "https://finess.esante.gouv.fr"
* hospitalization.origin.identifier.value = "770000446"
* hospitalization.origin.display = "Etablissement de provenance"
* hospitalization.admitSource = $admit-source#gp "General Practitioner referral"
* hospitalization.destination.identifier.type = $fr-core-cs-v2-0203#FINEG "FINESS d'entité géographique"
* hospitalization.destination.identifier.system = "https://finess.esante.gouv.fr"
* hospitalization.destination.identifier.value = "123456"
* location[+].location = Reference(Location/2ea92154-b334-4812-9ae7-1a85d3456er4) "Unité d'hébergement"
* location[=].location.identifier.use = #usual
* location[=].location.identifier.type = $fr-core-cs-location-identifier-type#INTRN "Identifiant interne"
* location[=].location.identifier.system = "http://EnovacomBridge.com/{FinessGeo}/identifiers/locationUFH"
* location[=].location.identifier.value = "1412"
* location[+].location = Reference(Location/i5a89154-p264-4812-1ak7-1a85d344785p) "Unité de responsabilité médicale"
* location[=].location.identifier.use = #usual
* location[=].location.identifier.type = $fr-core-cs-location-identifier-type#INTRN "Identifiant interne"
* location[=].location.identifier.system = "http://EnovacomBridge.com/{FinessGeo}/identifiers/locationUM"
* location[=].location.identifier.value = "1412"
* serviceProvider = Reference(Organization/2jg92146-b642-4ae2-71m7-4l8m2345ed4j) "Etablissement de rattachement"
* serviceProvider.identifier.use = #official
* serviceProvider.identifier.type = $fr-core-cs-v2-0203#FINEG "FINESS d'entité géographique"
* serviceProvider.identifier.system = "https://finess.esante.gouv.fr"
* serviceProvider.identifier.value = "750700015"