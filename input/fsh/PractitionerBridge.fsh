Alias: $fr-core-cs-v2-0203 = https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203
Alias: $fr-core-practitioner-specialty = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner-specialty
Alias: $fr-core-human-name = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-human-name
Alias: $fr-core-contact-point = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-contact-point
Alias: $fr-core-address = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-address
Alias: $fr-core-vs-practitioner-identifier-type = https://hl7.fr/ig/fhir/core/ValueSet/fr-core-vs-practitioner-identifier-type
Alias: $JDV-J105-EnsembleDiplome-RASS = https://mos.esante.gouv.fr/NOS/JDV_J105-EnsembleDiplome-RASS/FHIR/JDV-J105-EnsembleDiplome-RASS

Profile: PractitionerProfile_ENOVACOM_BRIDGE
Parent: Practitioner
Id: practitioner-enovacom-bridge
Title: "Enovacom Bridge Practitioner Profile"
Description: """Profil de la ressource Practitionner pour la France. Ce profil contraint les types d'identifiants du professionnel de santé en France.

Ajout d'une slice sur l'identifier pour le code interne practitioner présent dans les messages HL7v2 (code EI).
"""
* ^url = "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-practitioner"
* ^version = "2.1.0"
* ^status = #active
* ^date = "2025-09-01T11:49:14+02:00"
* ^publisher = "Enovacom"
* ^contact[0].name = "Enovacom"
* ^contact[=].telecom.system = #url
* ^contact[=].telecom.value = "http://enovacom.com/"
* ^contact[+].name = "Enovacom"
* ^contact[=].telecom.system = #email
* ^contact[=].telecom.value = "fhir@enovacom.com"
* ^contact[=].telecom.use = #work
* ^jurisdiction = urn:iso:std:iso:3166#FR "France"
* . ^short = "Prestataire de santé"
* . ^definition = "Un professionnel impliqué directement ou indirectement dans la prise en charge d'une personne."
* meta.profile ^slicing.discriminator.type = #value
* meta.profile ^slicing.discriminator.path = "$this"
* meta.profile ^slicing.description = "Slice based on the canonical url value"
* meta.profile ^slicing.rules = #open
* meta.profile contains 
    fr-canonical 0..1 and
    bridge-canonical 0..1
* meta.profile[fr-canonical] = "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner"
* meta.profile[bridge-canonical] = "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-practitioner"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains $fr-core-practitioner-specialty named specialty 0..1
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.description = "Slice based on the identifier.system pattern"
* identifier ^slicing.rules = #open
* identifier.type from $fr-core-vs-practitioner-identifier-type (extensible)
* identifier.type.coding.system ^example[0].label = "CodeSystem HL7v2 (PAM) pour un type d'identifiant PS"
* identifier.type.coding.system ^example[=].valueUri = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier.type.coding.system ^example[+].label = "CodeSystem ASIP pour un type d'identifiant d'un employé dans une structure"
* identifier.type.coding.system ^example[=].valueUri = "https://mos.esante.gouv.fr/NOS/TRE_G08-TypeIdentifiantPersonne/FHIR/TRE-G08-TypeIdentifiantPersonne"
* identifier.system 1..
* identifier.system ^definition = "Pour un PS identifié à partir de sa carte CPS, OID = 1.2.250.1.71.4.2.1\r\nPour un employé identifié au sein de sa structure, OID de l'établissement, branche de gestion des employés ou http://hopitalTest.fr/fhir/namingsystem/employes"
* identifier.value 1..
* identifier contains
    idInterne 0..1 and
    idNatPs 0..1 and
    rpps 0..* and
    adeli 0..*
* identifier[idInterne] ^short = "Identifiant du PS dans l'établissement."
* identifier[idInterne].type = $fr-core-cs-v2-0203#INTRN
* identifier[idInterne].type ^short = "Type d’identifiant interne du professionel de santé."
* identifier[idInterne].system = "http://EnovacomBridge.com/{FinessGeo}/identifiers/practitioner"
* identifier[idInterne].value ^short = "Identifiant interne du PS."
* identifier[idNatPs] ^short = "Identifiant national des PS. Cet identifiant est notamment utilisé dans le cadre du DMP et de la CPS. Cet identifiant est préfixé selon source de provenance de l'identifiant (cf Annexe Transverse – Source des données métier pour les professionnels et les structures du CI-SIS.)"
* identifier[idNatPs].type = $fr-core-cs-v2-0203#IDNPS
* identifier[idNatPs].type ^short = "Type d’identifiant national de la personne physique (typeIdNat_PP),\r\nLes codes ADELI, RPPS et IDNPS proviennent du system  https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203 ; Les codes 1, 3, 4, 5, 6 proviennent du system : https://mos.esante.gouv.fr/NOS/TRE_G08-TypeIdentifiantPersonne/FHIR/TRE-G08-TypeIdentifiantPersonne"
* identifier[idNatPs].system = "urn:oid:1.2.250.1.71.4.2.1"
* identifier[idNatPs].value ^short = "Identifiant national de la personne physique. 0 + ADELI ou 8 + RPPSidPP,\r\n Personne/Identifiant PP si l’instance correspond à un identifiant RPPS ou ADELI, sinon Personne/identification nationale PP."
* identifier[rpps] ^short = "Numéro RPPS (11 chiffres)"
* identifier[rpps].type = $fr-core-cs-v2-0203#RPPS
* identifier[rpps].system = "https://rpps.esante.gouv.fr"
* identifier[adeli] ^short = "Numéro ADELI (9 chiffres)"
* identifier[adeli].type = $fr-core-cs-v2-0203#ADELI
* identifier[adeli].system = "https://adeli.esante.gouv.fr"
* name only $fr-core-human-name
* telecom only $fr-core-contact-point
* address only $fr-core-address
* qualification ^short = "Qualifications obtained by training and certification | Diplômes. Les différents diplômes sont : les diplômes d'état français, les commissions de qualification, les diplômes d'études spécialisées, les DESC groupe 1 et 2, les capacités, les diplômes d'un pays de l'EEE, les diplômes d'université (DU) ou Inter-Universitaire, les certificats d'étude spéciale, les attestations, les diplômes européens d'études spécialisées, les diplômes de 2ème cycle non qualifiant et les autres types de diplômes. Pour plus d'informations, consulter le jeu de valeurs associé."
* qualification.code from $JDV-J105-EnsembleDiplome-RASS (preferred)

Instance: PractitionerBridgeExample01
InstanceOf: PractitionerProfile_ENOVACOM_BRIDGE
Description: "Un exemple de ressource pour un professionnel de santé"
Usage: #example
* id = "z65g3ad4-4512-4477-biu3-8719haf7d75"
* meta.profile[0] = "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner"
* meta.profile[1] = "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-practitioner"
* language = #fr-FR
* identifier.use = #usual
* identifier.type = $fr-core-cs-v2-0203#INTRN "Identifiant interne"
* identifier.system = "http://EnovacomBridge.com/{FinessGeo}/identifiers/practitioner"
* identifier.value = "UNK"
* active = true
* name.family = "UNKNOWN"
* name.given = "Practitioner"

Instance: PractitionerBridgeExample02
InstanceOf: PractitionerProfile_ENOVACOM_BRIDGE
Description: "Un exemple de ressource pour un professionnel de santé"
Usage: #example
* id = "6b70aeba-4024-4cf0-8959-2d1d6cf15597"
* meta.profile[0] = "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner"
* meta.profile[1] = "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-practitioner"
* language = #fr-FR

* identifier[0].type = $fr-core-cs-v2-0203#ADELI "N° ADELI"
* identifier[0].use = #official
* identifier[0].system = "https://adeli.esante.gouv.fr"
* identifier[0].value = "000000000"

* identifier[1].use = #usual
* identifier[1].type = $fr-core-cs-v2-0203#INTRN "Identifiant interne"
* identifier[1].system = "http://EnovacomBridge.com/130000000/identifiers/practitioner"
* identifier[1].value = "XXXXXX"

* identifier[2].use = #official
* identifier[2].type = $fr-core-cs-v2-0203#RPPS "N° RPPS"
* identifier[2].system = "https://rpps.esante.gouv.fr"
* identifier[2].value = "10100000000"

* active = true
* name.use = #usual
* name.family = "UNKNOWN"
* name.given = "Practitioner"

* address.use = #work
* address.text = "[2 rue des tests  MARSEILLE 13008 100]"
* address.line = "2 rue des tests"
* address.city = "MARSEILLE"
* address.postalCode = "13008"
* address.country = "100"