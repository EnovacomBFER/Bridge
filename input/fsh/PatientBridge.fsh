Alias: $fr-core-patient-nationality = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient-nationality
Alias: $fr-core-identity-reliability = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-identity-reliability
Alias: $fr-core-patient-death-place = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient-death-place
Alias: $fr-core-patient-birthdate-update-indicator = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient-birthdate-update-indicator
Alias: $patient-birthPlace = http://hl7.org/fhir/StructureDefinition/patient-birthPlace
Alias: $fr-core-address = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-address
Alias: $fr-core-human-name = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-human-name
Alias: $fr-core-patient-birth-list-given-name = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient-birth-list-given-name
Alias: $fr-core-contact-point = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-contact-point
Alias: $fr-core-patient-contact-identifier = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient-contact-identifier
Alias: $fr-core-comment = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-comment
Alias: $fr-core-practitioner = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-practitioner
Alias: $fr-core-organization = https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-organization
Alias: $fr-core-vs-patient-identifier-type = https://hl7.fr/ig/fhir/core/ValueSet/fr-core-vs-patient-identifier-type
Alias: $fr-core-vs-marital-status = https://hl7.fr/ig/fhir/core/ValueSet/fr-core-vs-marital-status
Alias: $fr-core-vs-patient-contact-role = https://hl7.fr/ig/fhir/core/ValueSet/fr-core-vs-patient-contact-role
Alias: $fr-core-vs-relation-type = https://hl7.fr/ig/fhir/core/ValueSet/fr-core-vs-relation-type
Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203
Alias: $fr-core-cs-v2-0203 = https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0203
Alias: $fr-core-cs-v2-0445 = https://hl7.fr/ig/fhir/core/CodeSystem/fr-core-cs-v2-0445
Alias: $enovacom-patient-creation-date = https://enovacom.org/fhir/bridge/StructureDefinition/enovacom-patient-creation-date
Alias: $v3-MaritalStatus = http://terminology.hl7.org/CodeSystem/v3-MaritalStatus

Profile: PatientProfile_ENOVACOM_BRIDGE
Parent: Patient
Id: patient-enovacom-bridge
Title: "Enovacom Bridge Patient Profile"
Description: """Ce profil spécifie les identifiants de patient utilisés par la solution Bridge d'Enovacom. Il utilise des extensions internationales (birthplace et nationalité) et ajoute des extensions propres au contexte d'utilisation de Bridge comme la date de création de l'identité."""
* ^url = "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-patient"
* ^version = "2.1.0"
* ^date = "2025-09-01T10:06:33+02:00"
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
* meta.profile[fr-canonical] = "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient"
* meta.profile[bridge-canonical] = "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-patient"
* extension contains
    $enovacom-patient-creation-date named creationDate 0..1 and
    $fr-core-patient-nationality named nationality 0..1 and
    $fr-core-identity-reliability named identityReliability 0..* and
    $fr-core-patient-death-place named deathPlace 0..1 and
    $fr-core-patient-birthdate-update-indicator named birthdateUpdateIndicator 0..1 and
    $patient-birthPlace named birthPlace 0..1
* extension[birthPlace].value[x] only $fr-core-address
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.description = "slicing de l'identifiant Patient sur le type d'identifiant (IPP, INS-NIR, INS-NIA, etc.)"
* identifier ^slicing.rules = #open
* identifier ^short = "Identifiant patient. Pour modéliser un patient avec une INS validée, il est nécessaire de respecter la conformité au profil FrCorePatientINS. Les identifiants NIR et NIA ne sont définis uniquement dans le cas du FRCorePatientINS."
* identifier.type from $fr-core-vs-patient-identifier-type (extensible)
* identifier contains
    NSS 0..1 and
    INS-C 0..* and
    INS-NIR 0..* and
    INS-NIR-TEST 0..* and
    INS-NIR-DEMO 0..* and
    INS-NIA 0..* and
    NDP 0..1 and
    PI 1..* and
    RRI 0..*
* identifier[NSS] ^short = "Le Numéro d'Inscription au Répertoire (NIR) de facturation permet de faire transiter le numéro de sécurité social de l’ayant droit ou du bénéfiaire (patient) / le numéro de sécurité sociale de l’ouvrant droit (assuré)."
* identifier[NSS].use = #official
* identifier[NSS].type 1..
* identifier[NSS].type = $v2-0203#NH
* identifier[NSS].system = "urn:oid:1.2.250.1.213.1.4.8"
* identifier[NSS].value 1..
* identifier[INS-C] ^short = "Identifiant National de Santé Calculé à partir des éléments de la carte vitale"
* identifier[INS-C].use = #secondary
* identifier[INS-C].type 1..
* identifier[INS-C].type = $fr-core-cs-v2-0203#INS-C "Identifiant National de Santé Calculé"
* identifier[INS-C].type ^definition = "Identifiant National de Santé Calculé à partir des éléments de la carte vitale"
* identifier[INS-C].system = "urn:oid:1.2.250.1.213.1.4.2"
* identifier[INS-C].value 1..
* identifier[INS-NIR] ^short = "INS-NIR = Identifiant national de santé (NIR) du patient INS provenant du téléservice INSi (service national d'identification des patients (CNAM))"
* identifier[INS-NIR].use = #official
* identifier[INS-NIR].type 1..
* identifier[INS-NIR].type = $fr-core-cs-v2-0203#INS-NIR "NIR définitif"
* identifier[INS-NIR].type ^definition = "INS-NIR - Identifiant national de santé (NIR) du patient INS provenant du téléservice INSi (service national d'identification des patients (CNAM))"
* identifier[INS-NIR].system = "urn:oid:1.2.250.1.213.1.4.8"
* identifier[INS-NIR].value 1..
* identifier[INS-NIR-TEST] ^short = "Identifiant INS-NIR du patient fictif de test"
* identifier[INS-NIR-TEST].use = #official
* identifier[INS-NIR-TEST].type 1..
* identifier[INS-NIR-TEST].type = $fr-core-cs-v2-0203#INS-NIR-TEST "NIR TEST"
* identifier[INS-NIR-TEST].type ^definition = "Identifiant INS-NIR du patient fictif de test"
* identifier[INS-NIR-TEST].system = "urn:oid:1.2.250.1.213.1.4.10"
* identifier[INS-NIR-TEST].value 1..
* identifier[INS-NIR-DEMO] ^short = "Identifiant INS-NIR du patient fictif de démonstration"
* identifier[INS-NIR-DEMO].use = #official
* identifier[INS-NIR-DEMO].type 1..
* identifier[INS-NIR-DEMO].type = $fr-core-cs-v2-0203#INS-NIR-DEMO "NIR DEMO"
* identifier[INS-NIR-DEMO].type ^definition = "Identifiant INS-NIR du patient fictif de démonstration"
* identifier[INS-NIR-DEMO].system = "urn:oid:1.2.250.1.213.1.4.11"
* identifier[INS-NIR-DEMO].value 1..
* identifier[INS-NIA] ^short = "INS-NIA - Identifiant national temporaire de santé du patient obtenu par interrogation du téléservice INSi de la CNAM"
* identifier[INS-NIA].use = #temp
* identifier[INS-NIA].type 1..
* identifier[INS-NIA].type = $fr-core-cs-v2-0203#INS-NIA "NIR temporaire"
* identifier[INS-NIA].type ^definition = "INS-NIA - Identifiant national temporaire de santé du patient obtenu par interrogation du téléservice INSi de la CNAM"
* identifier[INS-NIA].system = "urn:oid:1.2.250.1.213.1.4.9"
* identifier[INS-NIA].value 1..
* identifier[NDP] ^short = "Numéro de Dossier Pharmaceutique français. Celui-ci est unique."
* identifier[NDP].use = #secondary
* identifier[NDP].type 1..
* identifier[NDP].type = $fr-core-cs-v2-0203#NDP "Identifiant du patient au Dossier Pharmaceutique"
* identifier[NDP].system 1..
* identifier[NDP].system = "urn:oid:1.2.250.1.176.1.2"
* identifier[NDP].value 1..
* identifier[PI] ^short = "IPP - identifiant patient interne à la structure"
* identifier[PI].use = #usual
* identifier[PI].type 1..
* identifier[PI].type = $v2-0203#PI "Patient internal identifier"
* identifier[PI].system 1..
* identifier[PI].system = "http://EnovacomBridge.com/{FinessGeo}/identifiers/patient"
* identifier[PI].value 1..
* identifier[RRI] ^short = "Identifiant régional"
* identifier[RRI].use = #secondary
* identifier[RRI].type 1..
* identifier[RRI].type = $v2-0203#RRI "Regional registry ID"
* identifier[RRI].system 1..
* identifier[RRI].value 1..
* name only $fr-core-human-name
* name ^slicing.discriminator.type = #value
* name ^slicing.discriminator.path = "use"
* name ^slicing.rules = #open
* name contains
    usualName 0..* and
    officialName 0..*
* name[usualName] ^short = "Nom utilisé"
* name[usualName] ^definition = "Le nom utilisé (usual) n’est transmis que s’il est défini (par exemple nom marital du conjoint)."
* name[usualName].use 1..
* name[usualName].use = #usual
* name[officialName] ^short = "Nom de naissance"
* name[officialName] ^definition = "Le nom de naissance (official) est obligatoire dans le cas où l’on véhicule l’INS et que l’identité est qualifiée (celui-ci ne doit pas être altéré)."
* name[officialName].extension contains $fr-core-patient-birth-list-given-name named birth-list-given-name 0..1
* name[officialName].use 1..
* name[officialName].use = #official
* name[officialName].family 1..
* name[officialName].given 1..
* telecom only $fr-core-contact-point
* gender ^definition = "Genre du patient. Dans le cas d'une identité récupérée par le téléservice INSi, les valeurs sont M ou F"
* birthDate ^short = "Date de naissance du patient. Dans le cas d'une identité récupérée du téléservice INSi, la date de naissance est modifiée selon les règles du RNIV dans le cas de dates exceptionnelles."
* address only $fr-core-address
* maritalStatus from $fr-core-vs-marital-status (extensible)
* contact.extension contains
    $fr-core-patient-contact-identifier named contactIdentifier 0..1 and
    $fr-core-comment named comment 0..1
* contact.relationship ^slicing.discriminator.type = #value
* contact.relationship ^slicing.discriminator.path = "coding.system"
* contact.relationship ^slicing.rules = #open
* contact.relationship contains
    Role 0..1 and
    RelationType 0..1
* contact.relationship[Role] from $fr-core-vs-patient-contact-role (extensible)
* contact.relationship[Role] ^short = "Rôle de la personne. Ex : personne de confiance, aidant ..."
* contact.relationship[RelationType] from $fr-core-vs-relation-type (extensible)
* contact.relationship[RelationType] ^short = "Relation de la personne. Ex : Mère, époux, enfant ..."
* contact.name only $fr-core-human-name
* contact.telecom only $fr-core-contact-point
* generalPractitioner only Reference($fr-core-practitioner or $fr-core-organization or PractitionerRole)
* managingOrganization only Reference($fr-core-organization)

Mapping: enovacom-v2
Id: enovacom-v2
Title: "Mapping from FHIR Patient to HL7v2 PID segment"
Description: "Mapping from FHIR Patient to HL7v2 PID segment"
Source: https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-patient
Target: "HL7v2"
* identifier[PI] -> "PID-3 si PID-3.5 = PI"
* identifier[PI].type.coding.code -> "CX.5"
* identifier[PI].value -> "CX.1" 
* identifier[NSS] -> "PID-3 si PID-3.5 = NH"
* identifier[NSS].type.coding.code -> "CX.5"
* identifier[NSS].value -> "CX.1" 
* name[usualName] -> "PID-5 si PID-5.7 = D"
* name[usualName].family -> "XPN.1"
* name[usualName].given -> "XPN.2"
* name[usualName].prefix -> "XPN.5"
* name[officialName] -> "PID-5 si PID-5.7 = L"
* name[officialName].family -> "XPN.1"
* name[officialName].given -> "XPN.2"
* name[officialName].prefix -> "XPN.5"
* gender -> "PID-8"
* birthDate -> "PID-7"
* deceasedDateTime -> "PID-29 (datetime)"

Instance: PatientBridgeExample
InstanceOf: PatientProfile_ENOVACOM_BRIDGE
Description: "Un exemple de ressource pour un patient"
Usage: #example
* id = "1c783afa-9981-4977-be63-8859f0a8fde5"
* meta.profile[0] = "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-patient"
* meta.profile[1] = "https://enovacom.org/ig/fhir/bridge/StructureDefinition/enovacom-bridge-patient"
* language = #fr-FR

* extension[0].url = "https://enovacom.org/fhir/bridge/StructureDefinition/enovacom-patient-creation-date"
* extension[0].valueDateTime = "2025-11-27"

* extension[1].url = "https://hl7.fr/ig/fhir/core/StructureDefinition/fr-core-identity-reliability"
* extension[1].extension[0].url = "identityStatus"
* extension[1].extension[0].valueCoding.system = $fr-core-cs-v2-0445
* extension[1].extension[0].valueCoding.code = #PROV
* extension[1].extension[0].valueCoding.display = "Identité provisoire"

* extension[2].url = "http://hl7.org/fhir/StructureDefinition/patient-birthPlace"
* extension[2].valueAddress.country = "FRA"

* identifier[PI].use = #usual
* identifier[PI].type = $v2-0203#PI "Patient internal identifier"
* identifier[PI].system = "http://EnovacomBridge.com/{FinessGeo}/identifiers/patient"
* identifier[PI].value = "05560"

* active = true

* name[0].use = #official
* name[0].text = " SOLO Yan PEDRO "
* name[0].family = "SOLO Yan"
* name[0].given[0] = "PEDRO"
* name[0].prefix = "M"

* name[1].use = #usual
* name[1].text = " SOLO Yan PEDRO "
* name[1].family = "SOLO Yan"
* name[1].given[0] = "PEDRO"
* name[1].prefix = "M"

* telecom[0].system = #phone
* telecom[0].value = "04 60 00 02 00"
* telecom[0].use = #home

* gender = #male

* birthDate = "1975-04-19"

* address[0].use = #home
* address[0].text = "[483 RUE DES CARCASSES  CORRELIA 34570 FRA]"
* address[0].line[0] = "483 RUE DES CARCASSES"
* address[0].city = "CORRELIA"
* address[0].postalCode = "34570"
* address[0].country = "FRA"

* maritalStatus = $v3-MaritalStatus#M "Married"

* managingOrganization.reference = "Organization/2862b0fc-a188-4b64-b950-7cdd8b3814f8"
* managingOrganization.type = "Organization"
