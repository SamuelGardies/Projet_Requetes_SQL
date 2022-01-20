/****** Donner pour les filières « bien » adaptées aux spécialités (Mathématiques, SES), le nom et le résumé des métiers ainsi que le salaire d’un débutant. Une filière est dite bien adaptée si le taux de réussite est supérieur à 50%.  ******/

SELECT DISTINCT nomMetier, resumeMetier, salaireDebutantMetier
FROM dbo.metiers, dbo.approprier, dbo.specialites AS spe1, dbo.specialites AS spe2, dbo.adapter
WHERE spe1.nomSpecialite='Mathématiques' AND spe2.nomSpecialite='SES' AND dbo.adapter.txReussite>50
	AND dbo.adapter.codSpe1=spe1.codSpecialite AND dbo.metiers.codMetier=dbo.approprier.codMetier
	AND dbo.adapter.codSpe2=spe2.codSpecialite
	AND dbo.adapter.codFiliere=dbo.approprier.codFiliere

/****** Liste des réorientations possibles (nom et durée des études) pour la licence Economie et Gestion pour lesquelles l’admission n’est pas sur concours et qui sont dans le domaine Médical/Para-Médical.  ******/

SELECT filieres2.nomFiliere, filieres2.dureeEtudes
	FROM dbo.filieres AS filieres1, dbo.filieres AS filieres2, dbo.reorienter
	WHERE filieres1.nomFiliere='Licence Economie et Gestion' AND codFiliereNouvelle IN (SELECT codFiliere
									      FROM dbo.domaines, dbo.filieres 
								                       WHERE nomDomaine='Médical/Para-Médical' AND modalitesRecrutement!='Sur concours' 
									      	AND dbo.domaines.codDomaine=dbo.filieres.codDomaine)
		AND filieres1.codFiliere=dbo.reorienter.codFiliereActuelle
		AND filieres2.codFiliere=dbo.reorienter.codFiliereNouvelle

/****** Quels sont les établissements (nom et département) offrant des filières à la fois dans les domaines Médical/Para-Médical et Biologie.  ******/ 

(SELECT DISTINCT nomEtab, dptEtab
FROM dbo.filieres, dbo.etablissements,dbo.domaines, dbo.offrir
WHERE nomDomaine='Médical/Para-Médical'
	AND domaines.codDomaine=filieres.codDomaine AND etablissements.codEtab=offrir.codEtab
	AND filieres.codFiliere=offrir.codFiliere)
INTERSECT
(SELECT nomEtab, dptEtab
FROM dbo.filieres, dbo.etablissements,dbo.domaines, dbo.offrir
WHERE nomDomaine='Biologie'
	AND domaines.codDomaine=filieres.codDomaine AND etablissements.codEtab=offrir.codEtab
	AND filieres.codFiliere=offrir.codFiliere)

/****** Nom et résumé du métier qui offre le plus grand salaire de débutant.  ******/ 

SELECT nomMetier, resumeMetier
FROM dbo.metiers
WHERE salaireDebutantMetier IN (SELECT MAX (salaireDebutantMetier)
			     FROM metiers)

/****** En déduire la requête permettant de connaître les filières conduisant à ce métier.  ******/ 

SELECT nomFiliere
FROM approprier, filieres
WHERE codMetier IN (SELECT codMetier
		  FROM dbo.metiers
		  WHERE salaireDebutantMetier IN (SELECT MAX (salaireDebutantMetier)
					       FROM metiers))
	AND filieres.codFiliere=approprier.codFiliere

/****** Donner pour chaque filière, le nombre d’établissements préparant celui-ci.  ******/ 

SELECT nomFiliere, COUNT(etablissements.codEtab) AS NombreDetablissementsProposantCetteFilière
FROM filieres, etablissements, offrir
WHERE etablissements.codEtab=offrir.codEtab 
	AND filieres.codFiliere=offrir.codFiliere
GROUP BY nomFiliere


/****** Quels sont les établissements (nom et adresse) qui proposent des filières d’au moins deux domaines différents ?  ******/

SELECT nomEtab,adrEtab
FROM filieres, etablissements, offrir, domaines
WHERE domaines.codDomaine=filieres.codDomaine AND etablissements.codEtab=offrir.codEtab
	AND filieres.codFiliere=offrir.codFiliere
GROUP BY nomEtab,adrEtab
HAVING (COUNT(DISTINCT domaines.nomDomaine))>=2

/****** Quels sont les taux de réussite par couple de spécialité et pour toutes les filières sur dossier ? Donner les noms des deux spécialités du couple ainsi que le nom de la filière.  ******/ 

SELECT spe1.nomSpecialite AS nomSpecialite1, spe2.nomSpecialite AS nomSpecialite2, nomFiliere, txReussite
FROM adapter, filieres, specialites AS spe1, specialites AS spe2
WHERE filieres.modalitesRecrutement='Sur dossier'
	AND filieres.codFiliere=adapter.codFiliere 
	AND spe1.codSpecialite=adapter.codSpe1
	AND spe2.codSpecialite=adapter.codSpe2

/****** Noms et département des établissements qui proposent une filière mais qui n’organisent pas de concours.  ******/

(SELECT etablissements.nomEtab, etablissements.dptEtab
FROM etablissements, offrir, filieres
WHERE filieres.codFiliere=offrir.codFiliere
	AND etablissements.codEtab=offrir.codEtab)
EXCEPT
(SELECT etablissements.nomEtab, etablissements.dptEtab
FROM etablissements, organisation
WHERE etablissements.codEtab=organisation.codEtab)

/****** Quelles sont les dates des étapes du ou des concours organisés par l’école vétérinaire de Haute-Garonne pour le métier d’assistant vétérinaire.  ******/

SELECT nomEtape, dtDebutEtape, dtFinEtape
FROM filieres, approprier, metiers, filieres_concours, etablissements, organisation, etapes
WHERE nomEtab='Ecole Nationale Vétérinaire de Toulouse' AND nomMetier='Assistant vétérinaire'
	AND filieres.codFiliere=approprier.codFiliere AND etablissements.codEtab=organisation.codEtab
	AND metiers.codMetier=approprier.codMetier
	AND filieres.codFiliere=filieres_concours.codFiliere
	AND filieres_concours.codFiliereConcours=organisation.codFiliereConcours
	AND etapes.codEtape=organisation.codEtape

/****** Quel est le nom du métier accessible par le plus grand nombre de filières ?  ******/

Select nomMetier
FROM (SELECT nomMetier, COUNT(filieres.codFiliere) AS Filiere
            FROM metiers, filieres, approprier
            WHERE metiers.codMetier=approprier.codMetier
            	AND filieres.codFiliere=approprier.codFiliere
            GROUP BY nomMetier) filiereMetier
WHERE Filiere IN (SELECT MAX(Filiere) 
	             FROM (SELECT COUNT(filieres.codFiliere) AS Filiere
		        FROM metiers, filieres, approprier
		        WHERE metiers.codMetier=approprier.codMetier
		        AND filieres.codFiliere=approprier.codFiliere
		        GROUP BY nomMetier) filiereMetier)