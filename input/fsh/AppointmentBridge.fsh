Alias: $fr-core-appointment-operator = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-appointment-operator
Alias: $fr-core-slot = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-slot
Alias: $fr-core-related-person = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-related-person
Alias: $fr-core-healthcare-service = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-healthcare-service
Alias: $fr-core-practitioner = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner
Alias: $fr-core-patient = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient
Alias: $fr-core-location = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-location
Alias: $fr-core-vs-practitioner-specialty = https://hl7.fr/ig/fhir/core/ValueSet/fr-core-vs-practitioner-specialty
Alias: $fr-core-cs-v2-0203 = https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203
Alias: $participationStatus = http://hl7.org/fhir/participationstatus
Alias: $appointment-service-type-{FinessGeo} = https://enovacom.org/ig/fhir/bridge/CodeSystem/enovacom-bridge-appointment-service-type

Profile: AppointmentProfile_ENOVACOM_BRIDGE
Parent: Appointment
Id: appointment-enovacom-bridge
Title: "Enovacom Bridge Appointment Profile"
Description: """Profil de la ressource Appointment pour la France. Ce profil ajoute l'opérateur qui a créé/modifié/annulé le RDV. Il permet de référencer un patient, un professionnel de santé, une salle et éventuellement une offre de soins au RDV."""
* ^url = "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-appointment"
* ^version = "2.0.1"
* ^status = #active
* ^date = "2025-10-16T11:49:14+02:00"
* ^publisher = "Enovacom"
* ^contact[0].name = "Enovacom"
* ^contact[=].telecom.system = #url
* ^contact[=].telecom.value = "http://enovacom.com/"
* ^contact[+].name = "Enovacom"
* ^contact[=].telecom.system = #email
* ^contact[=].telecom.value = "fhir@enovacom.com"
* ^contact[=].telecom.use = #work
* ^jurisdiction = urn:iso:std:iso:3166#FR "France"
* meta.profile ^slicing.discriminator.type = #value
* meta.profile ^slicing.discriminator.path = "$this"
* meta.profile ^slicing.description = "Slice based on the canonical url value"
* meta.profile ^slicing.rules = #open
* meta.profile contains 
    fr-canonical 0..1 and
    bridge-canonical 0..1
* meta.profile[fr-canonical] = "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-appointment"
* meta.profile[bridge-canonical] = "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-appointment"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains $fr-core-appointment-operator named appointmentOperator 0..1
* identifier.use = #usual
* identifier.type 1..
* identifier.type = $fr-core-cs-v2-0203#INTRN "Identifiant interne"
* identifier.system 1..
* identifier.system = "http://EnovacomBridge.com/{FinessGeo}/identifiers/appointment"
* identifier.value 1..
* specialty from $fr-core-vs-practitioner-specialty (required)
* specialty ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* specialty ^binding.extension.valueString = "specialty"
* slot only Reference($fr-core-slot)
* participant.actor only Reference(Device or PractitionerRole or $fr-core-related-person or $fr-core-healthcare-service or $fr-core-practitioner or $fr-core-patient or $fr-core-location)

* participant ^slicing.discriminator.type = #value
* participant ^slicing.discriminator.path = "actor.identifier.system"
* participant ^slicing.description = "slicing du type de participant au rendez-vous"
* participant ^slicing.rules = #open
* participant ^short = "Participants au rendez-vous"
* participant contains
    Patient 0..1 and
    Practitioner 0..1 and
    Location 0..1

* participant[Patient] 0..1
* participant[Patient] only BackboneElement
* participant[Patient] obeys ele-1
* participant[Patient] ^short = "Patient impliqué dans le rendez-vous."
* participant[Patient] ^definition = "Patient impliqué dans le rendez-vous."
* participant[Patient] ^requirements = "Patient reference."
* participant[Patient] ^base.path = "Appointment.participant"
* participant[Patient] ^base.min = 1
* participant[Patient] ^base.max = "*"
* participant[Patient] ^isModifier = false
* participant[Patient] ^isSummary = false
* participant[Patient].status  = $participationStatus#accepted "Accepted"
* participant[Patient].actor only Reference($fr-core-patient)
* participant[Patient].actor ^short = "Patient"
* participant[Patient].actor ^definition = "Patient"
* participant[Patient].actor.identifier.system = "http://EnovacomBridge.com/{FinessGeo}/identifiers/patient"
* participant[Practitioner] 0..1
* participant[Practitioner] only BackboneElement
* participant[Practitioner] obeys ele-1
* participant[Practitioner] ^short = "Professionnel(s) de santé impliqué(s) dans le rendez-vous."
* participant[Practitioner] ^definition = "Professionnel(s) de santé impliqué(s) dans le rendez-vous."
* participant[Practitioner] ^requirements = "Practitioner reference."
* participant[Practitioner] ^base.path = "Appointment.participant"
* participant[Practitioner] ^base.min = 1
* participant[Practitioner] ^base.max = "*"
* participant[Practitioner] ^isModifier = false
* participant[Practitioner] ^isSummary = false
* participant[Practitioner].status  = $participationStatus#accepted "Accepted"
* participant[Practitioner].actor only Reference($fr-core-practitioner)
* participant[Practitioner].actor ^short = "Practitioner"
* participant[Practitioner].actor ^definition = "Practitioner"
* participant[Practitioner].actor.identifier.system = "http://EnovacomBridge.com/{FinessGeo}/identifiers/practitioner"
* participant[Location] 0..1
* participant[Location] only BackboneElement
* participant[Location] obeys ele-1
* participant[Location] ^short = "Salle impliquée dans le rendez-vous."
* participant[Location] ^definition = "Salle impliquée dans le rendez-vous."
* participant[Location] ^requirements = "Location reference."
* participant[Location] ^base.path = "Appointment.participant"
* participant[Location] ^base.min = 1
* participant[Location] ^base.max = "*"
* participant[Location] ^isModifier = false
* participant[Location] ^isSummary = false
* participant[Location].status  = $participationStatus#accepted "Accepted"
* participant[Location].actor only Reference($fr-core-location)
* participant[Location].actor ^short = "Location"
* participant[Location].actor ^definition = "Location"
* participant[Location].actor.identifier.system = "http://EnovacomBridge.com/{FinessGeo}/identifiers/location"


Invariant: ele-1
Description: "All FHIR elements must have a @value or children"
* severity = #error
* expression = "hasValue() or (children().count() > id.count())"
* xpath = "@value|f:*|h:div"
* source = "http://hl7.org/fhir/StructureDefinition/Element"


Instance: AppointmentExample
InstanceOf: AppointmentProfile_ENOVACOM_BRIDGE
Description: "Un exemple de rendez-vous pour un patient"
Usage: #example
* meta.profile[0] = "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-appointment"
* meta.profile[1] = "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-appointment"
* language = #fr-FR
* identifier.use = #usual
* identifier.type = $fr-core-cs-v2-0203#INTRN "Identifiant interne"
* identifier.system = "http://EnovacomBridge.com/{FinessGeo}/identifiers/appointment"
* identifier.value = "45789465"
* status = #booked
* serviceType = $appointment-service-type-{FinessGeo}#BO222 "FRACTURE DU TIBIA"
* serviceType.text = "FRACTURE DU TIBIA"
* description = "FRACTURE DU TIBIA"
* start = "2025-07-24T23:15:00.000Z"
* end = "2025-07-25T02:15:00.000Z"
* minutesDuration = 180
* participant[0].actor.identifier.use = #usual
* participant[=].actor.identifier.system = "http://EnovacomBridge.com/{FinessGeo}/identifiers/location"
* participant[=].actor.identifier.value = "UNKNOWN"
* participant[=].actor.display = "Salle"
* participant[=].status = #accepted
* participant[+].actor = Reference(Patient/99a25f60-d947-4b83-ac27-518f1766b96f)
* participant[=].actor.identifier.use = #usual
* participant[=].actor.identifier.type = $v2-0203#PI "Patient internal identifier"
* participant[=].actor.identifier.system = "http://EnovacomBridge.com/{FinessGeo}/identifiers/patient"
* participant[=].actor.identifier.value = "004211313"
* participant[=].status = #accepted
* participant[+].actor = Reference(Practitioner/86bf354a-5522-485c-8e8c-408f64b025c3)
* participant[=].actor.identifier.use = #usual
* participant[=].actor.identifier.system = "http://EnovacomBridge.com/{FinessGeo}/identifiers/practitioner"
* participant[=].actor.identifier.value = "CHIRAB"
* participant[=].status = #accepted