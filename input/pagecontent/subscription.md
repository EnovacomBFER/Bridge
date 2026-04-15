
Plusieurs abonnements peuvent être mises en place dans le cadre de Bridge.

Le mécanisme de Subscription FHIR permet de notifier le client HTTP d'un évènement.

👉 Bridge notifie le client en envoyant le contenu de la ressource créée sur un endpoint dédié à la récupération de cette notification.

🔥 Ce système d'abonnement est permis grâce à des subscriptions de type REST Hook qui permet de pousser l'information au client.

Le client peut être automatiquement prévenu des évènements suivants : 


#### 🙍‍♂️Abonnements sur les patients

Création d'une nouvelle identité (élément FHIR *'active = true'*)

#### 🏥 Abonnements sur les venues/séjours

Création d'un nouveau séjour de type admission ou préadmission (statut FHIR *'in-progress'* ou *'planned'*)

#### 📆 Abonnements sur les rendez-vous

Création d'un nouveau rendez-vous (statut FHIR *'pending'* ou *'booked'*)




