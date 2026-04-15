

### Introduction

Ce guide est fourni par Enovacom pour aider les éditeurs à comprendre :
- comment les données sont modélisées en FHIR dans la solution BRIDGE.
- comment utiliser l'API FHIR Bridge (récupération patient, séjour, rendez-vous)

### Champ d'application

Ce document vise à expliciter la modélisation FHIR définie par Enovacom concernant les objets en relation avec :
- le patient
- la venue du patient
- les rendez-vous du patient

**Modélisation Métier :**

<div style="text-align: center;">
    <img src="../input/images-source/ModelisationMetierBridge.png"  alt="Logo" width="450">
</div>

### Construction du guide

- L'onglet **Documentation** donne du détail sur les ressources FHIR utilisées et le modèle FHIR adopter dans la solution Bridge.

- L'onglet **API** détaille les principales requêtes à utiliser pour échanger les données. 
Les différents codes retours HTTP y sont également détaillés.

- L'onglet **Ressources de conformité** décrit les différents profils/extensions utilisés.

- L'onglet **Autres ressources** donne accès à la spécification FHIR R4 et à une page de téléchargement donnant accès au package tgz des profils décrits dans ce guide.


### Standards utilisés

Ce Guide d’implémentation est basé sur la version Release 4 de HL7 FHIR. Il dérive de l'[IG FrCore](https://hl7.fr/ig/fhir/core/) v2.1.0 publié par Interop'Santé dont Enovacom est membre actif. 

Le mapping HL7v2 FHIR s'appuie sur les travaux réalisés par IHE France concernant le [profil PAM](https://www.interopsante.org/f/0684e0c5ee4f9e19c61fc1bffc7c133e38e3e975/Publication-IHE_FRANCE_PAM_National_Extension_v2.11.1.pdf) dans sa version 2.11.1.

Les syntaxes retenue sont le JSON et le XML pour la représentation des ressources FHIR.

### Auteurs et contributeurs 

|**Role**	|**Nom**	|**Organisation**
|Auteur	|Georges-Alexandre CHASTIN	|Enovacom
|Auteur |Benjamin FERNANDEZ|Enovacom