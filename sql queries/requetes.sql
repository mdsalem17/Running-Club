/**
Course(idCourse, nomC, anneeCreation, moisCourse);
Edition(idEdition, #idCourse, anneeEdition, nbParticipants, planCourse, adresseDepart, dateInscription, dateDepotCertificats, dateRecuperationDossards, urlSite);
Epreuve(idEpreuve, #idEdition, #idCourse, type, distance, denivele);
Participation(dossard, #idEpreuve, #idEdition, #idCourse, nom, prenom, sexe, rang, #idAdherent);
Resultat(#dossard, rang, nom, prenom, sexe, #idEpreuve, #idEdition, #idCourse,);
TempsPassage(#dossard, km, temps, #idEpreuve, #idEdition, #idCourse);
Tarif (idTarif, prix, minAge, maxAge);
APourTarif(idEpreuve, idEdition, idCourse, idTarif)
Utilisateur(pseudo, mdp, estAdmin);
Adherent(idAdherent, #pseudo, nom, prenom, sexe, dateDeNaissance, numVoie, nomVoie, ville, codePostal, dateConsultationMedicale, nomClub);
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
INSERT INTO Edition(idEdition, idCourse, anneeEdition, nbParticipants, planCourse, numRue, nomRue,villeDepart, codePostal, dateInscription,dateDepotCertificats, dateRecuperationDossards, urlSite)
    VALUES(NULL, '', '', '', '', '', '', '');

-- de supprimer une édition de course
DELETE FROM Edition
    WHERE idEdition='';

-- de modifier une edition
UPDATE Edition
    SET nbParticipants='',
    planCourse='',
    numRue='',
    nomRue='',
    villeDepart='',
    codePostal='',
    dateInscription='',
    dateDepotCertificats='',
    dateRecuperationDossards='',
    urlSite='';

-- d'fficher les informations d'une edition d'une course
SELECT * From Edition WHERE idEdition='';

-- le nombre total d’adhérents ayant couru l’édition.
SELECT COUNT(*) AS nbAdherentsParticipants
    FROM Resultat WHERE (nom, prenom) in (SELECT nom, prenom 
                                            FROM Adherent);

-- le nombre d’adhérents ayant couru l’édition en tant que licencié dans un club d’athlétisme
SELECT COUNT(*) AS nbAdherentsLicencié
    FROM Resultat WHERE (nom, prenom) in (SELECT nom, prenom 
                                            FROM Adherent WHERE nomClubAthletisme IS NOT NULL);
                                            
-- le nombre de clubs d’athlétisme représentés durant l’édition de la course
SELECT DISTINCT COUNT(*) AS nbClubAthlétisme
    FROM Resultat R JOIN Adherent A ON R.nom=A.nom AND R.prenom=A.prenom
    WHERE A.nomClubAthletisme IS NOT NULL
    GROUP BY A.nomClubAthletisme;

-- le temps du vainqueur de l’édition
SELECT temps FROM TempsPassage WHERE dossard IN (SELECT dossard FROM Resultat WHERE rang=1);

-- le meilleur rang/temps obtenu par un adhérent de l’association
SELECT MIN(temps) FROM TempsPassage WHERE dossard IN (SELECT dossard FROM Resultat
WHERE (nom, prenom) in (SELECT nom, prenom 
                                            FROM Adherent WHERE nomClubAthletisme IS NOT NULL);

-- le pire rang/temps obtenu par un adhérent de l’association
SELECT MAX(temps) FROM TempsPassage WHERE dossard IN (SELECT dossard FROM Resultat
                                                        WHERE (nom, prenom) in (SELECT nom, prenom 
                                                                                    FROM Adherent
                                                                                    WHERE nomClubAthletisme IS NOT NULL
                                                                                )
                                                        );

-- la moyenne des temps réalisés par les adhérents de l’association
SELECT AVG(temps) FROM TempsPassage WHERE dossard IN (SELECT dossard FROM Resultat
                                                        WHERE (nom, prenom) in (SELECT nom, prenom 
                                                                                    FROM Adherent
                                                                                    WHERE nomClubAthletisme IS NOT NULL
                                                                                )
                                                        );
    -- o La moyenne des temps réalisés par sexe feminin pourra être affichée si les deux catégories sont représentées dans l’édition de la course
    SELECT AVG(temps) FROM TempsPassage WHERE dossard IN (SELECT dossard FROM Resultat
                                                        WHERE sexe='feminin' AND (nom, prenom) in (SELECT nom, prenom 
                                                                                    FROM Adherent
                                                                                    WHERE nomClubAthletisme IS NOT NULL
                                                                                )
                                                        );

    -- o La moyenne des temps réalisés par sexe masculin pourra être affichée si les deux catégories sont représentées dans l’édition de la course
    SELECT AVG(temps) FROM TempsPassage WHERE dossard IN (SELECT dossard FROM Resultat
                                                        WHERE sexe='masculin' AND (nom, prenom) in (SELECT nom, prenom 
                                                                                    FROM Adherent
                                                                                    WHERE nomClubAthletisme IS NOT NULL
                                                                                )
                                                        );

-- le nombre d’abandons d’adhérents de l’association
SELECT COUNT(*) AS nbAbandons
    FROM Resultat WHERE rang IS NULL AND (nom, prenom) in (SELECT nom, prenom 
                                            FROM Adherent);

-- La liste des adhérents ayant participé à l’édition de la course sélectionnée est triée par ordre lexicographique sur le nom et le prénom
SELECT nom, prenom
    FROM Resultat WHERE (nom, prenom) in (SELECT nom, prenom 
                                            FROM Adherent)
    ORDER BY nom, prenom;

-- La liste des adhérents ayant participé à l’édition de la course sélectionnée est triée par rang
SELECT nom, prenom
    FROM Adherent WHERE (nom, prenom) in (SELECT nom, prenom 
                                            FROM Resultat ORDER BY rang);

-- ajouter un adherent
INSERT INTO Utilisateur(pseudo, mdp, estAdmin)
    VALUES('', '', 0);

INSERT INTO Adherent(idAdherent, pseudo, nom, prenom, sexe, dateDeNaissance, numRue, nomRue, ville, codePostal, dateConsultationMedicale, nomClubAthletisme)
    VALUES(NULL, '', '', '', '', '', '', '', '');

-- supprimer un adherent
DELETE FROM Adherent WHERE idAdherent='';
DELETE FROM Utilisateurs WHERE pseudo='';


/**************************************************************************************************/
/************************************ -- Profil Adherent -- ***************************************/
/**************************************************************************************************/
