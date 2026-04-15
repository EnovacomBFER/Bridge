Instance: patient-creation-date
InstanceOf: SearchParameter
Usage: #definition
* meta.versionId = "1"
* meta.lastUpdated = "2025-11-26T15:30:54.210+01:00"
* meta.source = "#rXoDTkKE488QKJ8H"
* url = "https://enovacom.org/fhir/SearchParameter/patient-creation-date"
* name = "creation-date"
* status = #active
* publisher = "enovacom"
* description = "Paramètre de recherche pour récupérer une ressource Patient par sa date de création."
* code = #creation-date
* base = #Patient
* type = #date
* expression = "Patient.extension('https://enovacom.org/fhir/bridge/StructureDefinition/enovacom-patient-creation-date')"
* xpathUsage = #normal