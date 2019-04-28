/**
1.	Course(idCourse, nomC, anneeCreation, moisCourse);
2.	Edition(idEdition, #idCourse, anneeEdition, nbParticipants, planCourse, adresseDepart, dateInscription, dateDepotCertificats, dateRecuperationDossards, urlSite);
3.	Epreuve(idEpreuve, #idEdition, #idCourse, type, distance, denivele);
4.	Participation(dossard, #idEpreuve, #idEdition, #idCourse, nom, prenom, sexe, rang, #idAdherent);
5.	Resultat(#dossard, rang, nom, prenom, sexe, #idEpreuve, #idEdition, #idCourse,);
6.	TempsPassage(#dossard, km, temps, #idEpreuve, #idEdition, #idCourse);
7.	Tarif (idTarif, prix, minAge, maxAge);
8.	APourTarif(idEpreuve, idEdition, idCourse, idTarif)
9.	Utilisateur(pseudo, mdp, estAdmin);
10.	Adherent(idAdherent, #pseudo, nom, prenom, sexe, dateDeNaissance, numVoie, nomVoie, ville, codePostal, dateConsultationMedicale, nomClub);
*/

/**************************************************************************************************/
/********************************** -- Profil Administrateur -- ***********************************/
/**************************************************************************************************/

                                        /** Gestion de Course **/
-- ajouter une course
INSERT INTO Course(idCourse, anneeCreation, nomC, moisCourse)
    VALUES(NULL, '', '', '');

-- de supprimer une course
DELETE FROM Course
    WHERE idCourse='';


-- de supprimer une course
DELETE FROM Course
    WHERE idCourse='';

-- modifier une course 
UPDATE Course
    SET anneeCreation='', moisCourse='';

-- Afficher les informations d'une course
SELECT nomC, anneeCreation, moisCourse From Course WHERE idCourse='';

                                            /** Gestion d'une edition **/
-- ajouter une edition
INSERT INTO Edition(idEdition, idCourse, anneeEdition, nbParticipants, planCourse, adresseDepart, dateInscription, dateDepotCertificats, dateRecuperationDossards, urlSite)
    VALUES(NULL, '', '', '', '', '', '', '');

-- de supprimer une édition de course
DELETE FROM Edition
    WHERE idEdition='';

-- de modifier une edition
UPDATE Edition
    SET nbParticipants='',
    planCourse='',
    adresseDepart='',
    dateInscription='',
    dateDepotCertificats='',
    dateRecuperationDossards='',
    urlSite='';

-- d'fficher les informations d'une edition d'une course
SELECT * From Edition WHERE idEdition='';

-- le nombre total d’adhérents ayant couru l’édition.
SELECT COUNT(*) AS nbTotalAdherents FROM Resultat WHERE idEdition='';

-- le nombre d’adhérents ayant couru l’édition en tant que licencié dans un club d’athlétisme
SELECT COUNT(*) AS nbAdherentsLicencié
    FROM Resultat WHERE (nom, prenom) in (SELECT nom, prenom 
                                            FROM Adherent WHERE nomClub IS NOT NULL)
	AND idEdition='1'; -- Il faut mettre le nomClub à null pour visualiser
                                            
-- le nombre de clubs d’athlétisme représentés durant l’édition de la course
SELECT COUNT(DISTINCT nomClub) AS nbClubPresent
    FROM Adherent WHERE (nom, prenom) IN (SELECT nom, prenom FROM Resultat
                                        WHERE idEdition=1);

-- le temps du vainqueur de l’édition
SELECT temps FROM TempsPassage WHERE dossard IN (SELECT dossard FROM Resultat WHERE rang=1 AND idEdition=''); -- à modifier elle n'est pas bone

-- le meilleur rang/temps obtenu par un adhérent de l’association
SELECT MIN(temps) FROM TempsPassage WHERE idEpreuve='' AND idEdition='';
SELECT MIN(rang) FROM Resultat WHERE idEpreuven='' AND idEdition='';

-- le pire rang/temps obtenu par un adhérent de l’association
SELECT MAX(temps) FROM TempsPassage WHERE idEpreuve='' AND idEdition='';
SELECT MAX(rang) FROM Resultat WHERE idEpreuven='' AND idEdition='';

-- la moyenne des temps réalisés par les adhérents de l’association
SELECT AVG(temps) FROM TempsPassage WHERE idEdition='' AND idEpreuve='';
    -- o La moyenne des temps réalisés par sexe feminin pourra être affichée si les deux catégories sont représentées dans l’édition de la course
        SELECT AVG(temps) FROM TempsPassage WHERE dossard IN (SELECT dossard
                            FROM Resultat WHERE sexe='F' AND idEdition='' AND idEpreuve='');

    -- o La moyenne des temps réalisés par sexe masculin pourra être affichée si les deux catégories sont représentées dans l’édition de la course
        SELECT AVG(temps) FROM TempsPassage WHERE dossard IN (SELECT dossard
                            FROM Resultat WHERE sexe='H' AND idEdition='' AND idEpreuve='');

-- le nombre d’abandons d’adhérents de l’association
SELECT COUNT(*) AS nbAbandons
    FROM Resultat WHERE rang =0 AND idEpreuve='';

-- La liste des adhérents ayant participé à l’édition de la course sélectionnée est triée par rang
SELECT nom, prenom
    FROM Resultat WHERE idEpreuve=3 AND idEdition=1
	ORDER BY rang ASC;

-- ajouter un adherent
INSERT INTO Utilisateur(pseudo, mdp, estAdmin)
    VALUES('', '', 0);

INSERT INTO Adherent(idAdherent, pseudo, nom, prenom, sexe, dateDeNaissance, numVoie, nomVoie, ville, codePostal, dateConsultationMedicale, nomClub)
    VALUES(NULL, '', '', '', '', '', '', '', '', '', '', '');


-- supprimer un adherent
DELETE FROM Utilisateurs WHERE pseudo='';


/**************************************************************************************************/
/************************************ -- Profil Adherent -- ***************************************/
/**************************************************************************************************/
