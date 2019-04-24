-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  mer. 24 avr. 2019 à 13:05
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
-- Base de données :  `baselifbdw1`
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

--
-- Déchargement des données de la table `APourTarif`
--

INSERT INTO `APourTarif` (`idEpreuve`, `idEdition`, `idCourse`, `idTarif`) VALUES
(1, 1, 1, 9),
(2, 1, 1, 5),
(3, 1, 1, 8),
(4, 2, 1, 4),
(5, 2, 1, 2),
(6, 2, 1, 7),
(7, 3, 2, 6),
(8, 3, 2, 3),
(9, 3, 2, 1);

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
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sexe` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `idEpreuve` int(11) NOT NULL,
  `idEdition` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL,
  `idAdherent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `Participation`
--

INSERT INTO `Participation` (`dossard`, `nom`, `prenom`, `sexe`, `idEpreuve`, `idEdition`, `idCourse`, `idAdherent`) VALUES
(2017000001, 'Polain', 'Chris', 'H', 2, 1, 1, 2016008),
(2017000006, 'Laplo', 'Bernard', 'H', 2, 1, 1, 2018002),
(2017000007, 'Dupont', 'Alice', 'F', 2, 1, 1, 2016001),
(2017000013, 'Roula', 'Celine', 'F', 2, 1, 1, 2017006),
(2017000014, 'Tuile', 'Mathilde', 'F', 2, 1, 1, 2017004),
(2017000018, 'Roli', 'Lou', 'F', 3, 1, 1, 2017005),
(2017000019, 'Rasde', 'Nico', 'H', 3, 1, 1, 2016007),
(2017000020, 'Laple', 'Marie', 'F', 3, 1, 1, 2018001),
(2017000021, 'Drand', 'Mat', 'H', 3, 1, 1, 2016004),
(2017000026, 'Durand', 'Celine', 'F', 3, 1, 1, 2017003),
(2017000027, 'Oplia', 'Blandine', 'F', 3, 1, 1, 2018003),
(2017000032, 'Durad', 'Louis', 'H', 1, 1, 1, 2016005),
(2017000035, 'Paso', 'Celine', 'F', 1, 1, 1, 2017002),
(2017000036, 'Dupout', 'Bernard', 'H', 1, 1, 1, 2016002),
(2017000038, 'Paso', 'Bruno', 'H', 1, 1, 1, 2017001),
(2017000040, 'Durand', 'Olivier', 'H', 1, 1, 1, 2016003),
(2018000000, 'Rasde', 'Nico', 'H', 5, 2, 1, 2016007),
(2018000000, 'Dupont', 'Alice', 'F', 8, 3, 2, 2016001),
(2018000001, 'Durand', 'Celine', 'F', 8, 3, 2, 2017003),
(2018000003, 'Dupout', 'Bernard', 'H', 5, 2, 1, 2016002),
(2018000004, 'Plios', 'Caroline', 'F', 8, 3, 2, 2018005),
(2018000005, 'Laplo', 'Bernard', 'F', 5, 2, 1, 2018002),
(2018000008, 'Durand', 'Olivier', 'H', 5, 2, 1, 2016003),
(2018000008, 'Durad', 'Louis', 'H', 8, 3, 2, 2016005),
(2018000009, 'Durand', 'Olivier', 'H', 8, 3, 2, 2016003),
(2018000010, 'Drad', 'Louise', 'F', 8, 3, 2, 2016006),
(2018000011, 'Horil', 'Manu', 'H', 5, 2, 1, 2018004),
(2018000011, 'Roli', 'Lou', 'F', 8, 3, 2, 2017005),
(2018000013, 'Tuile', 'Mathilde', 'F', 8, 3, 2, 2017004),
(2018000014, 'Roula', 'Celine', 'F', 8, 3, 2, 2017006),
(2018000016, 'Roli', 'Lou', 'F', 6, 2, 1, 2017005),
(2018000017, 'Plios', 'Caroline', 'F', 6, 2, 1, 2018005),
(2018000019, 'Drand', 'Mat', 'H', 9, 3, 2, 2016004),
(2018000020, 'Laple', 'Marie', 'F', 9, 3, 2, 2018001),
(2018000021, 'Durand', 'Celine', 'F', 6, 2, 1, 2017003),
(2018000023, 'Paso', 'Celine', 'H', 6, 2, 1, 2017002),
(2018000024, 'Roula', 'Celine', 'F', 6, 2, 1, 2017006),
(2018000027, 'Laple', 'Marie', 'F', 6, 2, 1, 2018001),
(2018000031, 'Drad', 'Louise', 'F', 4, 2, 1, 2016006),
(2018000032, 'Paso', 'Bruno', 'H', 4, 2, 1, 2017001),
(2018000032, 'Laplo', 'Bernard', 'H', 7, 3, 2, 2018002),
(2018000033, 'Rasde', 'Nico', 'H', 7, 3, 2, 2016007),
(2018000036, 'Polain', 'Chris', 'H', 7, 3, 2, 2016008),
(2018000038, 'Drand', 'Mat', 'H', 4, 2, 1, 2016004),
(2018000039, 'Horil', 'Manu', 'H', 7, 3, 2, 2018004),
(2018000041, 'Polain', 'Chris', 'H', 4, 2, 1, 2016008),
(2018000044, 'Horil', 'Manu', 'H', 4, 2, 1, 2018004),
(2018000045, 'Paso', 'Bruno', 'H', 8, 3, 2, 2017001),
(2018000046, 'Paso', 'Celine', 'F', 9, 3, 2, 2017002);

-- --------------------------------------------------------

--
-- Structure de la table `Resultat`
--

CREATE TABLE `Resultat` (
  `dossard` int(11) NOT NULL,
  `rang` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sexe` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `idEpreuve` int(11) NOT NULL,
  `idEdition` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `Resultat`
--

INSERT INTO `Resultat` (`dossard`, `rang`, `nom`, `prenom`, `sexe`, `idEpreuve`, `idEdition`, `idCourse`) VALUES
(2017000001, 2, 'Polain', 'Chris', 'H', 2, 1, 1),
(2017000006, 7, 'Laplo', 'Bernard', 'H', 2, 1, 1),
(2017000007, 8, 'Dupont', 'Alice', 'F', 2, 1, 1),
(2017000013, 14, 'Roula', 'Celine', 'F', 2, 1, 1),
(2017000014, 15, 'Tuile', 'Mathilde', 'F', 2, 1, 1),
(2017000018, 4, 'Roli', 'Lou', 'F', 3, 1, 1),
(2017000019, 5, 'Rasde', 'nico', 'H', 3, 1, 1),
(2017000020, 6, 'Laple', 'Marie', 'F', 3, 1, 1),
(2017000021, 7, 'Drand', 'Mat', 'H', 3, 1, 1),
(2017000026, 12, 'Durand', 'Celine', 'F', 3, 1, 1),
(2017000027, 13, 'Oplia', 'Blandine', 'F', 3, 1, 1),
(2017000032, 3, 'Durad', 'Louis', 'H', 1, 1, 1),
(2017000035, 6, 'Paso', 'Celine', 'F', 1, 1, 1),
(2017000036, 7, 'Dupout', 'Bernard', 'H', 1, 1, 1),
(2017000038, 9, 'Paso', 'Bruno', 'H', 1, 1, 1),
(2017000040, 11, 'Durand', 'Olivier', 'H', 1, 1, 1),
(2018000000, 1, 'Rasde', 'Nico', 'H', 5, 2, 1),
(2018000000, 1, 'Dupont', 'Alice', 'F', 8, 3, 2),
(2018000001, 2, 'Durand', 'Celine', 'F', 8, 3, 2),
(2018000003, 4, 'Dupout', 'Bernard', 'H', 5, 2, 1),
(2018000004, 5, 'Plios', 'Caroline', 'F', 8, 3, 2),
(2018000005, 6, 'Laplo', 'Bernard', 'F', 5, 2, 1),
(2018000008, 9, 'Durand', 'Olivier', 'H', 5, 2, 1),
(2018000008, 9, 'Durad', 'Louis', 'H', 8, 3, 2),
(2018000009, 10, 'Durand', 'Olivier', 'H', 8, 3, 2),
(2018000010, 11, 'Drad', 'Louise', 'F', 8, 3, 2),
(2018000011, 12, 'Horil', 'Manu', 'H', 5, 2, 1),
(2018000011, 12, 'Roli', 'Lou', 'F', 8, 3, 2),
(2018000013, 14, 'Tuile', 'Mathilde', 'F', 8, 3, 2),
(2018000014, 15, 'Roula', 'Celine', 'F', 8, 3, 2),
(2018000016, 2, 'Roli', 'Lou', 'F', 6, 2, 1),
(2018000017, 3, 'Plios', 'Caroline', 'F', 6, 2, 1),
(2018000019, 5, 'Drand', 'Mat', 'H', 9, 3, 2),
(2018000020, 6, 'Laple', 'Marie', 'F', 9, 3, 2),
(2018000021, 7, 'Durand', 'Celine', 'F', 6, 2, 1),
(2018000023, 9, 'Paso', 'Celine', 'H', 6, 2, 1),
(2018000024, 10, 'Roula', 'Celine', 'F', 6, 2, 1),
(2018000027, 13, 'Laple', 'Marie', 'F', 6, 2, 1),
(2018000031, 2, 'Drad', 'Louise', 'F', 4, 2, 1),
(2018000032, 3, 'Paso', 'Bruno', 'H', 4, 2, 1),
(2018000032, 3, 'Laplo', 'Bernard', 'H', 7, 3, 2),
(2018000033, 4, 'Rasde', 'nico', 'H', 7, 3, 2),
(2018000036, 7, 'Polain', 'Chris', 'H', 7, 3, 2),
(2018000038, 9, 'Drand', 'Mat', 'H', 4, 2, 1),
(2018000039, 10, 'Horil', 'Manu', 'H', 7, 3, 2),
(2018000041, 12, 'Polain', 'Chris', 'H', 4, 2, 1),
(2018000044, 15, 'Horil', 'Manu', 'H', 4, 2, 1),
(2018000045, 0, 'Paso', 'Bruno', 'H', 8, 3, 2),
(2018000046, 0, 'Paso', 'Celine', 'F', 9, 3, 2);

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
  `temps` time DEFAULT NULL,
  `idEpreuve` int(11) NOT NULL,
  `idEdition` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `TempsPassage`
--

INSERT INTO `TempsPassage` (`dossard`, `km`, `temps`, `idEpreuve`, `idEdition`, `idCourse`) VALUES
(2017000001, '5', '00:00:16', 2, 1, 1),
(2017000001, '10', '00:00:33', 2, 1, 1),
(2017000001, '15', '00:00:50', 2, 1, 1),
(2017000001, '20', '00:00:00', 2, 1, 1),
(2017000001, '25', '00:00:00', 2, 1, 1),
(2017000001, '30', '00:01:01', 2, 1, 1),
(2017000001, '35', '00:01:18', 2, 1, 1),
(2017000001, '40', '00:01:35', 2, 1, 1),
(2017000001, '41', '00:01:39', 2, 1, 1),
(2017000006, '5', '00:00:19', 2, 1, 1),
(2017000006, '10', '00:00:38', 2, 1, 1),
(2017000006, '15', '00:00:57', 2, 1, 1),
(2017000006, '20', '00:00:00', 2, 1, 1),
(2017000006, '25', '00:00:00', 2, 1, 1),
(2017000006, '30', '00:01:14', 2, 1, 1),
(2017000006, '35', '00:01:34', 2, 1, 1),
(2017000006, '40', '00:01:53', 2, 1, 1),
(2017000006, '41', '00:01:57', 2, 1, 1),
(2017000007, '5', '00:00:19', 2, 1, 1),
(2017000007, '10', '00:00:39', 2, 1, 1),
(2017000007, '15', '00:00:58', 2, 1, 1),
(2017000007, '20', '00:00:00', 2, 1, 1),
(2017000007, '25', '00:00:00', 2, 1, 1),
(2017000007, '30', '00:01:17', 2, 1, 1),
(2017000007, '35', '00:01:37', 2, 1, 1),
(2017000007, '40', '00:01:57', 2, 1, 1),
(2017000007, '41', '00:00:00', 2, 1, 1),
(2017000013, '5', '00:00:25', 2, 1, 1),
(2017000013, '10', '00:00:50', 2, 1, 1),
(2017000013, '15', '00:00:00', 2, 1, 1),
(2017000013, '20', '00:01:01', 2, 1, 1),
(2017000013, '25', '00:01:27', 2, 1, 1),
(2017000013, '30', '00:01:52', 2, 1, 1),
(2017000013, '35', '00:00:00', 2, 1, 1),
(2017000013, '40', '00:02:03', 2, 1, 1),
(2017000013, '41', '00:02:09', 2, 1, 1),
(2017000014, '5', '00:00:26', 2, 1, 1),
(2017000014, '10', '00:00:52', 2, 1, 1),
(2017000014, '15', '00:00:00', 2, 1, 1),
(2017000014, '20', '00:01:05', 2, 1, 1),
(2017000014, '25', '00:01:31', 2, 1, 1),
(2017000014, '30', '00:01:57', 2, 1, 1),
(2017000014, '35', '00:00:00', 2, 1, 1),
(2017000014, '40', '00:02:10', 2, 1, 1),
(2017000014, '41', '00:02:16', 2, 1, 1),
(2017000018, '5', '00:00:17', 3, 1, 1),
(2017000018, '10', '00:00:35', 3, 1, 1),
(2017000018, '15', '00:00:52', 3, 1, 1),
(2017000018, '20', '00:00:00', 3, 1, 1),
(2017000018, '21', '00:00:00', 3, 1, 1),
(2017000019, '5', '00:00:19', 3, 1, 1),
(2017000019, '10', '00:00:38', 3, 1, 1),
(2017000019, '15', '00:00:57', 3, 1, 1),
(2017000019, '20', '00:00:00', 3, 1, 1),
(2017000019, '21', '00:00:00', 3, 1, 1),
(2017000020, '5', '00:00:20', 3, 1, 1),
(2017000020, '10', '00:00:41', 3, 1, 1),
(2017000020, '15', '00:00:00', 3, 1, 1),
(2017000020, '20', '00:00:00', 3, 1, 1),
(2017000020, '21', '00:00:00', 3, 1, 1),
(2017000021, '5', '00:00:22', 3, 1, 1),
(2017000021, '10', '00:00:44', 3, 1, 1),
(2017000021, '15', '00:00:00', 3, 1, 1),
(2017000021, '20', '00:00:00', 3, 1, 1),
(2017000021, '21', '00:00:00', 3, 1, 1),
(2017000026, '5', '00:00:25', 3, 1, 1),
(2017000026, '10', '00:00:51', 3, 1, 1),
(2017000026, '15', '00:00:00', 3, 1, 1),
(2017000026, '20', '00:01:03', 3, 1, 1),
(2017000026, '21', '00:01:09', 3, 1, 1),
(2017000027, '5', '00:00:26', 3, 1, 1),
(2017000027, '10', '00:00:52', 3, 1, 1),
(2017000027, '15', '00:00:00', 3, 1, 1),
(2017000027, '20', '00:01:04', 3, 1, 1),
(2017000027, '21', '00:01:09', 3, 1, 1),
(2017000032, '5', '00:00:16', 1, 1, 1),
(2017000032, '10', '00:00:32', 1, 1, 1),
(2017000035, '5', '00:00:18', 1, 1, 1),
(2017000035, '10', '00:00:36', 1, 1, 1),
(2017000036, '5', '00:00:18', 1, 1, 1),
(2017000036, '10', '00:00:36', 1, 1, 1),
(2017000038, '5', '00:00:24', 1, 1, 1),
(2017000038, '10', '00:00:48', 1, 1, 1),
(2017000040, '5', '00:00:25', 1, 1, 1),
(2017000040, '10', '00:00:50', 1, 1, 1),
(2018000000, '5', '00:00:15', 5, 2, 1),
(2018000000, '5', '00:00:15', 8, 3, 2),
(2018000000, '10', '00:00:30', 5, 2, 1),
(2018000000, '10', '00:00:30', 8, 3, 2),
(2018000000, '15', '00:00:45', 5, 2, 1),
(2018000000, '15', '00:00:46', 8, 3, 2),
(2018000000, '20', '00:00:00', 5, 2, 1),
(2018000000, '20', '00:00:00', 8, 3, 2),
(2018000000, '25', '00:00:00', 5, 2, 1),
(2018000000, '25', '00:00:00', 8, 3, 2),
(2018000000, '30', '00:00:00', 5, 2, 1),
(2018000000, '30', '00:00:00', 8, 3, 2),
(2018000000, '35', '00:01:05', 5, 2, 1),
(2018000000, '35', '00:01:07', 8, 3, 2),
(2018000000, '40', '00:01:20', 5, 2, 1),
(2018000000, '40', '00:01:22', 8, 3, 2),
(2018000000, '41', '00:01:23', 5, 2, 1),
(2018000000, '41', '00:01:26', 8, 3, 2),
(2018000001, '5', '00:00:15', 8, 3, 2),
(2018000001, '10', '00:00:30', 8, 3, 2),
(2018000001, '15', '00:00:46', 8, 3, 2),
(2018000001, '20', '00:00:00', 8, 3, 2),
(2018000001, '25', '00:00:00', 8, 3, 2),
(2018000001, '30', '00:00:00', 8, 3, 2),
(2018000001, '35', '00:01:07', 8, 3, 2),
(2018000001, '40', '00:01:23', 8, 3, 2),
(2018000001, '41', '00:01:26', 8, 3, 2),
(2018000003, '5', '00:00:17', 5, 2, 1),
(2018000003, '10', '00:00:34', 5, 2, 1),
(2018000003, '15', '00:00:52', 5, 2, 1),
(2018000003, '20', '00:00:00', 5, 2, 1),
(2018000003, '25', '00:00:00', 5, 2, 1),
(2018000003, '30', '00:01:04', 5, 2, 1),
(2018000003, '35', '00:01:21', 5, 2, 1),
(2018000003, '40', '00:01:38', 5, 2, 1),
(2018000003, '41', '00:01:43', 5, 2, 1),
(2018000004, '5', '00:00:18', 8, 3, 2),
(2018000004, '10', '00:00:37', 8, 3, 2),
(2018000004, '15', '00:00:56', 8, 3, 2),
(2018000004, '20', '00:00:00', 8, 3, 2),
(2018000004, '25', '00:00:00', 8, 3, 2),
(2018000004, '30', '00:01:12', 8, 3, 2),
(2018000004, '35', '00:01:31', 8, 3, 2),
(2018000004, '40', '00:01:50', 8, 3, 2),
(2018000004, '41', '00:01:54', 8, 3, 2),
(2018000005, '5', '00:00:20', 5, 2, 1),
(2018000005, '10', '00:00:40', 5, 2, 1),
(2018000005, '15', '00:00:00', 5, 2, 1),
(2018000005, '20', '00:00:00', 5, 2, 1),
(2018000005, '25', '00:01:00', 5, 2, 1),
(2018000005, '30', '00:01:20', 5, 2, 1),
(2018000005, '35', '00:01:40', 5, 2, 1),
(2018000005, '40', '00:00:00', 5, 2, 1),
(2018000005, '41', '00:00:00', 5, 2, 1),
(2018000008, '5', '00:00:25', 5, 2, 1),
(2018000008, '5', '00:00:21', 8, 3, 2),
(2018000008, '10', '00:00:51', 5, 2, 1),
(2018000008, '10', '00:00:42', 8, 3, 2),
(2018000008, '15', '00:00:00', 5, 2, 1),
(2018000008, '15', '00:00:00', 8, 3, 2),
(2018000008, '20', '00:01:03', 5, 2, 1),
(2018000008, '20', '00:00:00', 8, 3, 2),
(2018000008, '25', '00:01:29', 5, 2, 1),
(2018000008, '25', '00:01:06', 8, 3, 2),
(2018000008, '30', '00:01:55', 5, 2, 1),
(2018000008, '30', '00:01:28', 8, 3, 2),
(2018000008, '35', '00:00:00', 5, 2, 1),
(2018000008, '35', '00:01:49', 8, 3, 2),
(2018000008, '40', '00:02:07', 5, 2, 1),
(2018000008, '40', '00:00:00', 8, 3, 2),
(2018000008, '41', '00:02:13', 5, 2, 1),
(2018000008, '41', '00:00:00', 8, 3, 2),
(2018000009, '5', '00:00:21', 8, 3, 2),
(2018000009, '10', '00:00:43', 8, 3, 2),
(2018000009, '15', '00:00:00', 8, 3, 2),
(2018000009, '20', '00:00:00', 8, 3, 2),
(2018000009, '25', '00:01:07', 8, 3, 2),
(2018000009, '30', '00:01:29', 8, 3, 2),
(2018000009, '35', '00:01:50', 8, 3, 2),
(2018000009, '40', '00:00:00', 8, 3, 2),
(2018000009, '41', '00:00:00', 8, 3, 2),
(2018000010, '5', '00:00:22', 8, 3, 2),
(2018000010, '10', '00:00:44', 8, 3, 2),
(2018000010, '15', '00:00:00', 8, 3, 2),
(2018000010, '20', '00:00:00', 8, 3, 2),
(2018000010, '25', '00:01:12', 8, 3, 2),
(2018000010, '30', '00:01:34', 8, 3, 2),
(2018000010, '35', '00:01:56', 8, 3, 2),
(2018000010, '40', '00:00:00', 8, 3, 2),
(2018000010, '41', '00:00:00', 8, 3, 2),
(2018000011, '5', '00:00:26', 5, 2, 1),
(2018000011, '5', '00:00:22', 8, 3, 2),
(2018000011, '10', '00:00:53', 5, 2, 1),
(2018000011, '10', '00:00:44', 8, 3, 2),
(2018000011, '15', '00:00:00', 5, 2, 1),
(2018000011, '15', '00:00:00', 8, 3, 2),
(2018000011, '20', '00:01:07', 5, 2, 1),
(2018000011, '20', '00:00:00', 8, 3, 2),
(2018000011, '25', '00:01:34', 5, 2, 1),
(2018000011, '25', '00:01:12', 8, 3, 2),
(2018000011, '30', '00:00:00', 5, 2, 1),
(2018000011, '30', '00:01:34', 8, 3, 2),
(2018000011, '35', '00:00:00', 5, 2, 1),
(2018000011, '35', '00:01:57', 8, 3, 2),
(2018000011, '40', '00:02:14', 5, 2, 1),
(2018000011, '40', '00:00:00', 8, 3, 2),
(2018000011, '41', '00:02:21', 5, 2, 1),
(2018000011, '41', '00:00:00', 8, 3, 2),
(2018000013, '5', '00:00:26', 8, 3, 2),
(2018000013, '10', '00:00:53', 8, 3, 2),
(2018000013, '15', '00:00:00', 8, 3, 2),
(2018000013, '20', '00:01:06', 8, 3, 2),
(2018000013, '25', '00:01:33', 8, 3, 2),
(2018000013, '30', '00:00:00', 8, 3, 2),
(2018000013, '35', '00:00:00', 8, 3, 2),
(2018000013, '40', '00:02:13', 8, 3, 2),
(2018000013, '41', '00:02:20', 8, 3, 2),
(2018000014, '5', '00:00:29', 8, 3, 2),
(2018000014, '10', '00:00:59', 8, 3, 2),
(2018000014, '15', '00:00:00', 8, 3, 2),
(2018000014, '20', '00:01:19', 8, 3, 2),
(2018000014, '25', '00:01:49', 8, 3, 2),
(2018000014, '30', '00:00:00', 8, 3, 2),
(2018000014, '35', '00:02:09', 8, 3, 2),
(2018000014, '40', '00:02:38', 8, 3, 2),
(2018000014, '41', '00:02:46', 8, 3, 2),
(2018000016, '5', '00:00:16', 6, 2, 1),
(2018000016, '10', '00:00:32', 6, 2, 1),
(2018000016, '15', '00:00:48', 6, 2, 1),
(2018000016, '20', '00:00:00', 6, 2, 1),
(2018000016, '21', '00:00:00', 6, 2, 1),
(2018000017, '5', '00:00:16', 6, 2, 1),
(2018000017, '10', '00:00:33', 6, 2, 1),
(2018000017, '15', '00:00:49', 6, 2, 1),
(2018000017, '20', '00:00:00', 6, 2, 1),
(2018000017, '21', '00:00:00', 6, 2, 1),
(2018000019, '5', '00:00:19', 9, 3, 2),
(2018000019, '10', '00:00:38', 9, 3, 2),
(2018000019, '15', '00:00:58', 9, 3, 2),
(2018000019, '20', '00:00:00', 9, 3, 2),
(2018000019, '21', '00:00:00', 9, 3, 2),
(2018000020, '5', '00:00:19', 9, 3, 2),
(2018000020, '10', '00:00:38', 9, 3, 2),
(2018000020, '15', '00:00:58', 9, 3, 2),
(2018000020, '20', '00:00:00', 9, 3, 2),
(2018000020, '21', '00:00:00', 9, 3, 2),
(2018000021, '5', '00:00:18', 6, 2, 1),
(2018000021, '10', '00:00:36', 6, 2, 1),
(2018000021, '15', '00:00:54', 6, 2, 1),
(2018000021, '20', '00:00:00', 6, 2, 1),
(2018000021, '21', '00:00:00', 6, 2, 1),
(2018000023, '5', '00:00:19', 6, 2, 1),
(2018000023, '10', '00:00:39', 6, 2, 1),
(2018000023, '15', '00:00:58', 6, 2, 1),
(2018000023, '20', '00:00:00', 6, 2, 1),
(2018000023, '21', '00:00:00', 6, 2, 1),
(2018000024, '5', '00:00:20', 6, 2, 1),
(2018000024, '10', '00:00:40', 6, 2, 1),
(2018000024, '15', '00:00:00', 6, 2, 1),
(2018000024, '20', '00:00:00', 6, 2, 1),
(2018000024, '21', '00:00:00', 6, 2, 1),
(2018000027, '5', '00:00:23', 6, 2, 1),
(2018000027, '10', '00:00:47', 6, 2, 1),
(2018000027, '15', '00:00:00', 6, 2, 1),
(2018000027, '20', '00:00:00', 6, 2, 1),
(2018000027, '21', '00:01:00', 6, 2, 1),
(2018000031, '5', '00:00:15', 4, 2, 1),
(2018000031, '10', '00:00:31', 4, 2, 1),
(2018000032, '5', '00:00:16', 4, 2, 1),
(2018000032, '5', '00:00:17', 7, 3, 2),
(2018000032, '10', '00:00:32', 4, 2, 1),
(2018000032, '10', '00:00:35', 7, 3, 2),
(2018000033, '5', '00:00:17', 7, 3, 2),
(2018000033, '10', '00:00:35', 7, 3, 2),
(2018000036, '5', '00:00:19', 7, 3, 2),
(2018000036, '10', '00:00:38', 7, 3, 2),
(2018000038, '5', '00:00:20', 4, 2, 1),
(2018000038, '10', '00:00:40', 4, 2, 1),
(2018000039, '5', '00:00:23', 7, 3, 2),
(2018000039, '10', '00:00:46', 7, 3, 2),
(2018000041, '5', '00:00:23', 4, 2, 1),
(2018000041, '10', '00:00:47', 4, 2, 1),
(2018000044, '5', '00:00:28', 4, 2, 1),
(2018000044, '10', '00:00:56', 4, 2, 1),
(2018000045, '5', '00:00:26', 8, 3, 2),
(2018000045, '10', '00:00:31', 8, 3, 2),
(2018000045, '15', '00:00:59', 8, 3, 2),
(2018000045, '20', '00:01:17', 8, 3, 2),
(2018000045, '25', '00:01:42', 8, 3, 2),
(2018000045, '30', '00:01:01', 8, 3, 2),
(2018000045, '35', '00:01:36', 8, 3, 2),
(2018000045, '40', '00:02:05', 8, 3, 2),
(2018000046, '5', '00:00:27', 9, 3, 2),
(2018000046, '10', '00:00:30', 9, 3, 2),
(2018000046, '15', '00:00:00', 9, 3, 2),
(2018000046, '20', '00:00:00', 9, 3, 2);

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
  MODIFY `dossard` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2018000053;

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
