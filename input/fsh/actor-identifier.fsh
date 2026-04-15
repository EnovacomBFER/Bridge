Instance: appointment-actor-identifier
InstanceOf: SearchParameter
Usage: #definition
* url = "https://enovacom.org/fhir/SearchParameter/appointment-actor-identifier"
* name = "actor-identifier"
* status = #active
* publisher = "enovacom"
* description = "Paramètre de recherche pour récupérer une ressource Appointment par la salle de réalisation de l'acte du rendez-vous."
* code = #actor-identifier
* base = #Appointment
* type = #token
* expression = "Appointment.participant.actor.identifier"
* xpathUsage = #normal