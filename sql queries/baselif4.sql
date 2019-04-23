
CREATE TABLE Utilisateur (
                pseudo VARCHAR(255) NOT NULL,
                mdp VARCHAR(255) NOT NULL,
                estAdmin BOOLEAN NOT NULL,
                PRIMARY KEY (pseudo)
);


CREATE TABLE Adherent (
                idAdherent INT NOT NULL,
                pseudo VARCHAR(255) NOT NULL,
                nom VARCHAR(255) NOT NULL,
                prenom VARCHAR(255) NOT NULL,
                dateNaiss DATE,
                sexe VARCHAR(255) NOT NULL,
                adresse VARCHAR(255),
                dateConsultation VARCHAR(255),
                nomClub VARCHAR(255),
                PRIMARY KEY (idAdherent)
);


CREATE INDEX adherent_idx
 ON Adherent
 ( nom, prenom, sexe );

CREATE TABLE Tarif (
                idTarif INT AUTO_INCREMENT NOT NULL,
                prix NUMERIC(4,2) NOT NULL,
                minAge INT NOT NULL,
                maxAge INT NOT NULL,
                PRIMARY KEY (idTarif)
);


CREATE TABLE Course (
                idCourse INT AUTO_INCREMENT NOT NULL,
                nomC VARCHAR(255) NOT NULL,
                anneeCreation INT NOT NULL,
                moisCourse VARCHAR(255) NOT NULL,
                PRIMARY KEY (idCourse)
);


CREATE TABLE Edition (
                idEdition INT AUTO_INCREMENT NOT NULL,
                idCourse INT NOT NULL,
                anneeEdition INT NOT NULL,
                nbParticipants INT NOT NULL,
                planCourse VARCHAR(255) NOT NULL,
                adresseDepart VARCHAR(255) NOT NULL,
                dateInscription DATE NOT NULL,
                dateDepotCertificats DATE NOT NULL,
                dateRecuperationDossards DATE NOT NULL,
                urlSite VARCHAR(255) NOT NULL,
                PRIMARY KEY (idEdition, idCourse)
);


CREATE TABLE Epreuve (
                idEpreuve INT AUTO_INCREMENT NOT NULL,
                idEdition INT NOT NULL,
                idCourse INT NOT NULL,
                type VARCHAR(255) NOT NULL,
                distance DECIMAL(4) NOT NULL,
                denivele INT NOT NULL,
                PRIMARY KEY (idEpreuve, idEdition, idCourse)
);


CREATE TABLE Participation (
                dossard INT AUTO_INCREMENT NOT NULL,
                idEpreuve INT NOT NULL,
                idEdition INT NOT NULL,
                idCourse INT NOT NULL,
                idAdherent INT NOT NULL,
                nom VARCHAR(255) NOT NULL,
                prenom VARCHAR(255) NOT NULL,
                sexe VARCHAR(255) NOT NULL,
                PRIMARY KEY (dossard, idEpreuve, idEdition, idCourse)
);


CREATE INDEX participation_idx
 ON Participation
 ( nom, prenom, sexe );

CREATE TABLE Resultat (
                dossard INT NOT NULL,
                idEpreuve INT NOT NULL,
                idEdition INT NOT NULL,
                idCourse INT NOT NULL,
                rang INT NOT NULL,
                nom VARCHAR(255) NOT NULL,
                prenom VARCHAR(255) NOT NULL,
                sexe_1 VARCHAR(255) NOT NULL,
                PRIMARY KEY (dossard, idEpreuve, idEdition, idCourse)
);


CREATE TABLE TempsPassage (
                dossard INT NOT NULL,
                km DECIMAL NOT NULL,
                idEpreuve INT NOT NULL,
                idEdition INT NOT NULL,
                idCourse INT NOT NULL,
                temps TIME NOT NULL,
                PRIMARY KEY (dossard, km, idEpreuve, idEdition, idCourse)
);


CREATE TABLE APourTarif (
                idEpreuve INT NOT NULL,
                idEdition INT NOT NULL,
                idCourse INT NOT NULL,
                idTarif INT NOT NULL,
                PRIMARY KEY (idEpreuve, idEdition, idCourse, idTarif)
);


ALTER TABLE Adherent ADD CONSTRAINT utilisateur_adherent_fk
FOREIGN KEY (pseudo)
REFERENCES Utilisateur (pseudo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Participation ADD CONSTRAINT adherent_participation_fk
FOREIGN KEY (idAdherent)
REFERENCES Adherent (idAdherent)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE APourTarif ADD CONSTRAINT tarif_apourtarif_fk
FOREIGN KEY (idTarif)
REFERENCES Tarif (idTarif)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Edition ADD CONSTRAINT course_edition_fk
FOREIGN KEY (idCourse)
REFERENCES Course (idCourse)
ON DELETE CASCADE
ON UPDATE RESTRICT;

ALTER TABLE Epreuve ADD CONSTRAINT edition_epreuve_fk
FOREIGN KEY (idEdition, idCourse)
REFERENCES Edition (idEdition, idCourse)
ON DELETE CASCADE
ON UPDATE RESTRICT;

ALTER TABLE APourTarif ADD CONSTRAINT epreuve_apourtarif_fk
FOREIGN KEY (idEpreuve, idEdition, idCourse)
REFERENCES Epreuve (idEpreuve, idEdition, idCourse)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Participation ADD CONSTRAINT epreuve_participation_fk
FOREIGN KEY (idEpreuve, idEdition, idCourse)
REFERENCES Epreuve (idEpreuve, idEdition, idCourse)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE TempsPassage ADD CONSTRAINT participation_tempspassage_fk
FOREIGN KEY (dossard, idEpreuve, idEdition, idCourse)
REFERENCES Participation (dossard, idEpreuve, idEdition, idCourse)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Resultat ADD CONSTRAINT participation_resultat_fk
FOREIGN KEY (dossard, idEpreuve, idEdition, idCourse)
REFERENCES Participation (dossard, idEpreuve, idEdition, idCourse)
ON DELETE NO ACTION
ON UPDATE NO ACTION;