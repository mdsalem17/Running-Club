-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  mar. 23 avr. 2019 à 10:06
-- Version du serveur :  10.1.38-MariaDB
-- Version de PHP :  7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `baselifbdw1_p1714033`
--

-- --------------------------------------------------------

--
-- Structure de la table `Adherent`
--

CREATE TABLE `Adherent` (
  `idAdherent` int(11) NOT NULL,
  `pseudo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateNaiss` date DEFAULT NULL,
  `sexe` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numVoie` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nomVoie` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ville` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codePostal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateConsultationMedicale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nomClub` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `Adherent`
--

INSERT INTO `Adherent` (`idAdherent`, `pseudo`, `nom`, `prenom`, `dateNaiss`, `sexe`, `numVoie`, `nomVoie`, `ville`, `codePostal`, `dateConsultationMedicale`, `nomClub`) VALUES
(0, 'pseudo', 'nom', 'prenom', '0000-00-00', 'sexe', 'numVoie', 'nomVoie', 'ville', 'CodePostal', 'dateConsultationMedicale', 'nomClub'),
(2016001, 'alice12', 'Dupont', 'Alice', '0000-00-00', 'F', '28', 'rue du boulevard', 'Lyon', '69001', ' 01/01/2019', 'ClubLyon'),
(2016002, 'bernard19', 'Dupout', 'Bernard', '0000-00-00', 'H', '2', 'rue du avenue ', 'Lyon', '69001', ' 01/09/2018', 'ClubLyon'),
(2016003, 'olivier23', 'Durand', 'Olivier', '0000-00-00', 'H', '7', 'rue du avenue ', 'Paris', '75001', ' 01/09/2017', 'ClubParis'),
(2016004, 'mat234', 'Drand', 'Mat', '0000-00-00', 'H', '7', 'rue du avenue ', 'Paris', '75001', ' 10/09/2017', 'ClubParis'),
(2016005, 'louis11', 'Durad', 'Louis', '0000-00-00', 'H', '7', 'rue du avenue ', 'Paris', '75001', ' 21/09/2017', 'ClubParis'),
(2016006, 'louise32', 'Drad', 'Louise', '0000-00-00', 'F', '7', 'rue du avenue ', 'Paris', '75001', ' 01/08/2017', 'ClubParis'),
(2016007, 'nico3', 'Rasde', 'Nico', '0000-00-00', 'H', '7', 'rue du avenue ', 'Paris', '75001', ' 01/09/2017', 'ClubParis'),
(2016008, 'chris345', 'Polain', 'Chris', '0000-00-00', 'H', '7', 'rue du avenue ', 'Paris', '75001', ' 01/09/2019', 'ClubParis'),
(2017001, 'bruno67', 'Paso', 'Bruno', '0000-00-00', 'H', '28', 'rue du avenue ', 'Paris', '75001', ' 21/09/2018', 'ClubParis'),
(2017002, 'celine56', 'Paso', 'Celine', '0000-00-00', 'F', '28', 'rue du avenue ', 'Lyon', '69001', ' 21/09/2018', 'ClubLyon'),
(2017003, 'celine96', 'Durand', 'Celine', '0000-00-00', 'F', '28', 'rue du avenue ', 'Paris', '75001', ' 21/09/2018', 'ClubParis'),
(2017004, 'mathilde5', 'Tuile', 'Mathilde', '0000-00-00', 'F', '28', 'rue du avenue ', 'Paris', '75001', ' 21/09/2018', 'ClubParis'),
(2017005, 'lou19', 'Roli', 'Lou', '0000-00-00', 'F', '28', 'rue du avenue ', 'Paris', '75001', ' 21/09/2018', 'ClubParis'),
(2017006, 'celine33', 'Roula', 'Celine', '0000-00-00', 'F', '28', 'rue du avenue', 'Paris', '75001', ' 21/09/2018', 'ClubParis'),
(2018001, 'marie45', 'Laple', 'Marie', '0000-00-00', 'F', '28', 'rue du avenue', 'Lyon', '69001', ' 11/09/2018', 'ClubLyon'),
(2018002, 'bernard45', 'Laplo', 'Bernard', '0000-00-00', 'H', '15', 'rue du avenue', 'Lyon', '69001', ' 01/07/2018', 'ClubLyon'),
(2018003, 'blandine35', 'Oplia', 'Blandine', '0000-00-00', 'F', '17', 'rue du rue', 'Lyon', '69001', ' 01/12/2018', 'ClubLyon'),
(2018004, 'manu67', 'Horil', 'Manu', '0000-00-00', 'H', '28', 'rue du avenue', 'Lyon', '69001', ' 01/12/2018', 'ClubLyon'),
(2018005, 'caroline43', 'Plios', 'Caroline', '0000-00-00', 'F', '28', 'rue du avenue', 'Lyon', '69001', ' 01/09/2018', 'ClubLyon');

-- --------------------------------------------------------

--
-- Structure de la table `APourTarif`
--

CREATE TABLE `APourTarif` (
  `idEpreuve` int(11) NOT NULL,
  `idEdition` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL,
  `idTarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Course`
--

CREATE TABLE `Course` (
  `idCourse` int(11) NOT NULL,
  `nomC` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `anneeCreation` int(11) NOT NULL,
  `moisCourse` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `Course`
--

INSERT INTO `Course` (`idCourse`, `nomC`, `anneeCreation`, `moisCourse`) VALUES
(1, 'Marathon de Paris', 1976, 'Avril'),
(2, 'Run in Lyon', 2013, 'Octobre');

-- --------------------------------------------------------

--
-- Structure de la table `Edition`
--

CREATE TABLE `Edition` (
  `idEdition` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL,
  `anneeEdition` int(11) NOT NULL,
  `nbParticipants` int(11) DEFAULT NULL,
  `planCourse` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adresseDepart` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateInscription` date DEFAULT NULL,
  `dateDepotCertificats` date DEFAULT NULL,
  `dateRecuperationDossards` date DEFAULT NULL,
  `urlSite` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `Edition`
--

INSERT INTO `Edition` (`idEdition`, `idCourse`, `anneeEdition`, `nbParticipants`, `planCourse`, `adresseDepart`, `dateInscription`, `dateDepotCertificats`, `dateRecuperationDossards`, `urlSite`) VALUES
(1, 1, 2017, 57000, 'http://netstorage.lequipe.fr/ASO/egp/marathon-de-paris/mdp19-plan-zone-depart-fr-bd.pdf', 'Avenue des Champs Elysées', '2017-01-16', '2017-01-26', '2017-01-26', 'https://www.schneiderelectricparismarathon.com/fr'),
(2, 1, 2018, 72000, 'http://netstorage.lequipe.fr/ASO/egp/marathon-de-paris/mdp19-plan-zone-depart-fr-bd.pdf', 'Avenue des Champs Elysées', '2018-01-22', '2018-01-31', '2018-01-31', 'https://www.schneiderelectricparismarathon.com/fr'),
(3, 2, 2018, 28493, 'http://netstorage.lequipe.fr/ASO/egp/run-in-lyon/ril18-parcours-semi-hd2.jpg', 'Place Bellecour', '2018-04-22', '2018-04-22', '2018-04-27', 'https://www.runinlyon.com/fr');

-- --------------------------------------------------------

--
-- Structure de la table `Epreuve`
--

CREATE TABLE `Epreuve` (
  `idEpreuve` int(11) NOT NULL,
  `idEdition` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `distance` decimal(12,4) DEFAULT NULL,
  `denivele` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `Epreuve`
--

INSERT INTO `Epreuve` (`idEpreuve`, `idEdition`, `idCourse`, `type`, `distance`, `denivele`) VALUES
(1, 1, 1, '10km', NULL, NULL),
(2, 1, 1, 'Marathon', NULL, NULL),
(3, 1, 1, 'Semi Marathon', NULL, NULL),
(4, 2, 1, '10km', NULL, NULL),
(5, 2, 1, 'Marathon', NULL, NULL),
(6, 2, 1, 'Semi Marathon', NULL, NULL),
(7, 3, 2, '10km', NULL, NULL),
(8, 3, 2, 'Marathon', NULL, NULL),
(9, 3, 2, 'Semi Marathon', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `Participation`
--

CREATE TABLE `Participation` (
  `dossard` int(11) NOT NULL,
  `idEpreuve` int(11) NOT NULL,
  `idEdition` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL,
  `idAdherent` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sexe` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Resultat`
--

CREATE TABLE `Resultat` (
  `dossard` int(11) NOT NULL,
  `idEpreuve` int(11) NOT NULL,
  `idEdition` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL,
  `rang` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sexe_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Tarif`
--

CREATE TABLE `Tarif` (
  `idTarif` int(11) NOT NULL,
  `prix` decimal(4,2) NOT NULL,
  `minAge` int(11) NOT NULL,
  `maxAge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `Tarif`
--

INSERT INTO `Tarif` (`idTarif`, `prix`, `minAge`, `maxAge`) VALUES
(1, '20.00', 8, 17),
(2, '25.00', 18, 26),
(3, '27.00', 27, 64),
(4, '29.00', 8, 17),
(5, '32.00', 27, 64),
(6, '17.00', 8, 17),
(7, '29.00', 18, 26),
(8, '25.00', 27, 64),
(9, '38.00', 8, 17),
(10, '29.00', 18, 26),
(11, '44.00', 27, 64);

-- --------------------------------------------------------

--
-- Structure de la table `TempsPassage`
--

CREATE TABLE `TempsPassage` (
  `dossard` int(11) NOT NULL,
  `km` decimal(10,0) NOT NULL,
  `idEpreuve` int(11) NOT NULL,
  `idEdition` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL,
  `temps` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateur`
--

CREATE TABLE `Utilisateur` (
  `pseudo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mdp` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estAdmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `Utilisateur`
--

INSERT INTO `Utilisateur` (`pseudo`, `mdp`, `estAdmin`) VALUES
('admin', 'admin', 1),
('alice12', 'alice12', 0),
('bernard19', 'bernard19', 0),
('bernard45', 'bernard45', 0),
('blandine35', 'blandine35', 0),
('bruno67', 'bruno67', 0),
('caroline43', 'caroline43', 0),
('celine33', 'celine33', 0),
('celine56', 'celine56', 0),
('celine96', 'celine96', 0),
('chris345', 'chris345', 0),
('lou19', 'lou19', 0),
('louis11', 'louis11', 0),
('louise32', 'louise32', 0),
('manu67', 'manu67', 0),
('marie45', 'marie45', 0),
('mat234', 'mat234', 0),
('mathilde5', 'mathilde5', 0),
('nico3', 'nico3', 0),
('olivier23', 'olivier23', 0),
('pseudo', 'mdp', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Adherent`
--
ALTER TABLE `Adherent`
  ADD PRIMARY KEY (`idAdherent`),
  ADD KEY `adherent_idx` (`nom`,`prenom`,`sexe`),
  ADD KEY `utilisateur_adherent_fk` (`pseudo`);

--
-- Index pour la table `APourTarif`
--
ALTER TABLE `APourTarif`
  ADD PRIMARY KEY (`idEpreuve`,`idEdition`,`idCourse`,`idTarif`),
  ADD KEY `tarif_apourtarif_fk` (`idTarif`);

--
-- Index pour la table `Course`
--
ALTER TABLE `Course`
  ADD PRIMARY KEY (`idCourse`);

--
-- Index pour la table `Edition`
--
ALTER TABLE `Edition`
  ADD PRIMARY KEY (`idEdition`,`idCourse`),
  ADD KEY `course_edition_fk` (`idCourse`);

--
-- Index pour la table `Epreuve`
--
ALTER TABLE `Epreuve`
  ADD PRIMARY KEY (`idEpreuve`,`idEdition`,`idCourse`),
  ADD KEY `edition_epreuve_fk` (`idEdition`,`idCourse`);

--
-- Index pour la table `Participation`
--
ALTER TABLE `Participation`
  ADD PRIMARY KEY (`dossard`,`idEpreuve`,`idEdition`,`idCourse`),
  ADD KEY `participation_idx` (`nom`,`prenom`,`sexe`),
  ADD KEY `adherent_participation_fk` (`idAdherent`),
  ADD KEY `epreuve_participation_fk` (`idEpreuve`,`idEdition`,`idCourse`);

--
-- Index pour la table `Resultat`
--
ALTER TABLE `Resultat`
  ADD PRIMARY KEY (`dossard`,`idEpreuve`,`idEdition`,`idCourse`);

--
-- Index pour la table `Tarif`
--
ALTER TABLE `Tarif`
  ADD PRIMARY KEY (`idTarif`);

--
-- Index pour la table `TempsPassage`
--
ALTER TABLE `TempsPassage`
  ADD PRIMARY KEY (`dossard`,`km`,`idEpreuve`,`idEdition`,`idCourse`),
  ADD KEY `participation_tempspassage_fk` (`dossard`,`idEpreuve`,`idEdition`,`idCourse`);

--
-- Index pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  ADD PRIMARY KEY (`pseudo`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Course`
--
ALTER TABLE `Course`
  MODIFY `idCourse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Edition`
--
ALTER TABLE `Edition`
  MODIFY `idEdition` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Epreuve`
--
ALTER TABLE `Epreuve`
  MODIFY `idEpreuve` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `Participation`
--
ALTER TABLE `Participation`
  MODIFY `dossard` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Tarif`
--
ALTER TABLE `Tarif`
  MODIFY `idTarif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Adherent`
--
ALTER TABLE `Adherent`
  ADD CONSTRAINT `utilisateur_adherent_fk` FOREIGN KEY (`pseudo`) REFERENCES `Utilisateur` (`pseudo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `APourTarif`
--
ALTER TABLE `APourTarif`
  ADD CONSTRAINT `epreuve_apourtarif_fk` FOREIGN KEY (`idEpreuve`,`idEdition`,`idCourse`) REFERENCES `Epreuve` (`idEpreuve`, `idEdition`, `idCourse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tarif_apourtarif_fk` FOREIGN KEY (`idTarif`) REFERENCES `Tarif` (`idTarif`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `Edition`
--
ALTER TABLE `Edition`
  ADD CONSTRAINT `course_edition_fk` FOREIGN KEY (`idCourse`) REFERENCES `Course` (`idCourse`) ON DELETE CASCADE;

--
-- Contraintes pour la table `Epreuve`
--
ALTER TABLE `Epreuve`
  ADD CONSTRAINT `edition_epreuve_fk` FOREIGN KEY (`idEdition`,`idCourse`) REFERENCES `Edition` (`idEdition`, `idCourse`) ON DELETE CASCADE;

--
-- Contraintes pour la table `Participation`
--
ALTER TABLE `Participation`
  ADD CONSTRAINT `adherent_participation_fk` FOREIGN KEY (`idAdherent`) REFERENCES `Adherent` (`idAdherent`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `epreuve_participation_fk` FOREIGN KEY (`idEpreuve`,`idEdition`,`idCourse`) REFERENCES `Epreuve` (`idEpreuve`, `idEdition`, `idCourse`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `Resultat`
--
ALTER TABLE `Resultat`
  ADD CONSTRAINT `participation_resultat_fk` FOREIGN KEY (`dossard`,`idEpreuve`,`idEdition`,`idCourse`) REFERENCES `Participation` (`dossard`, `idEpreuve`, `idEdition`, `idCourse`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `TempsPassage`
--
ALTER TABLE `TempsPassage`
  ADD CONSTRAINT `participation_tempspassage_fk` FOREIGN KEY (`dossard`,`idEpreuve`,`idEdition`,`idCourse`) REFERENCES `Participation` (`dossard`, `idEpreuve`, `idEdition`, `idCourse`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
