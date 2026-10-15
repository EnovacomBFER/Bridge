La section ci-dessous explique comment un établissement peut récupérer la facturation d'acte en format HPRIM XML via l'API Bridge. Vous y trouverez les étapes et les modalités pour récupérer ces messages conformément aux standards HL7, afin d'assurer une communication efficace et conforme avec le système cible.

La récupération d'un message HPRIM XML et sa suppression libère l'accès au message suivant. Ce processus est à répéter jusqu'à obtention de la totalité des factures.

## Récupération d'un message HPRIM XML

**Endpoint :** GET /eai/request/BRIDGE/ETABLISSEMENT/ACTE

**URL :** https://eie-bridge-recette.nd.care/eai/request/BRIDGE/ETABLISSEMENT/ACTE

**Paramètres :**

| Header      | Description                      | Format | obligatoire |
|-------------|----------------------------------|--------|-------------|
| finess | Finess géographique de l'établissement émetteur      | Texte  | ✅          |


**Exemple de requête :**

``` bash
    curl -X GET https://eie-bridge-recette.nd.care/eai/request/BRIDGE/ETABLISSEMENT/ACTE \
  -H "finess: 830000000" \
  --cert /chemin/vers/certificat.pem \
  --key /chemin/vers/cle_privee.pem \
  --cacert /chemin/vers/ca_certificat.pem

```

**Exemple de retour si un fichier est présent (format XML) :**
``` xml
<?xml version="1.0" encoding="UTF-8"?>
<enovacomMessage>
	<rows>
		<responseInformation>
			<contentType>application/octet-stream</contentType>
			<statusCode>200</statusCode>
		</responseInformation>
		<responseHeader>
			<User-Agent>BRIDGE</User-Agent>
			<Content-disposition>attachment;filename=NomDuFichier</Content-disposition>
			<otherHeaders>
				<otherHeader>
					<name>Link</name>
					<value>&lt;https://HostRequestURINomDuFichier;&gt;; rel="acte"; method="DELETE"</value>
				</otherHeader>
			</otherHeaders>
		</responseHeader>
		<content>ContenuFichierHPRIM-XML</content>
	</rows>
</enovacomMessage>

```


**Exemple de retour si plus aucun fichier présent (format XML) :**
``` xml
<?xml version="1.0" encoding="UTF-8"?>
<enovacomMessage>
	<rows>
		<responseInformation>
			<statusCode>204</statusCode>
		</responseInformation>
		<responseHeader>
			<otherHeaders>
 </otherHeaders>
		</responseHeader>
	</rows>
</enovacomMessage>

```

## Suppression d'un message HPRIM XML

**Endpoint :** DELETE /eai/request/BRIDGE/ETABLISSEMENT/ACTE/NomDuFichier

**URL :** https://eie-bridge-recette.nd.care/eai/request/BRIDGE/ETABLISSEMENT/ACTE/NomDuFichier

**Paramètres :**

| Header      | Description                      | Format | obligatoire |
|-------------|----------------------------------|--------|-------------|
| finess | Finess géographique de l'établissement émetteur      | Texte  | ✅          |




**Exemple de requête :**

``` bash
    curl -X DELETE https://eie-bridge-recette.nd.care/eai/request/BRIDGE/ETABLISSEMENT/ACTE/NomDuFichier \
  -H "finess: 830000000" \
  --cert /chemin/vers/certificat.pem \
  --key /chemin/vers/cle_privee.pem \
  --cacert /chemin/vers/ca_certificat.pem

```

**Exemple de retour si fichier supprimé (format XML) :**
``` xml
<?xml version="1.0" encoding="UTF-8"?>
<enovacomMessage>
	<rows>
		<responseInformation>
			<contentType>text/plain;charset="utf-8"</contentType>
			<statusCode>200</statusCode>
		</responseInformation>
		<responseHeader>
			<User-Agent>BRIDGE</User-Agent>
		</responseHeader>
		<content>Fichier NomDuFichier supprimé</content>
	</rows>
</enovacomMessage>

```

**Exemple de retour si fichier déjà supprimé (format XML) :**
``` xml
<?xml version="1.0" encoding="UTF-8"?>
<enovacomMessage>
	<rows>
		<responseInformation>
			<statusCode>204</statusCode>
		</responseInformation>
		<responseHeader>
			<otherHeaders>
 </otherHeaders>
		</responseHeader>
	</rows>
</enovacomMessage>

```