Instance: encounter-location-identifier
InstanceOf: SearchParameter
Usage: #definition
* url = "https://enovacom.org/fhir/bridge/SearchParameter/encounter-location-identifier"
* name = "location-identifier"
* status = #active
* publisher = "enovacom"
* description = "Paramètre de recherche pour récupérer une ressource Encounter par l'identifiant métier de la location (Unité d'hébergement ou de responsabilité médicale)."
* code = #location-identifier
* base = #Encounter
* type = #token
* expression = "Encounter.location.location.identifier"
* xpathUsage = #normal