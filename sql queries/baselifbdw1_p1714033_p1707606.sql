-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  Dim 28 avr. 2019 à 22:41
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
-- Base de données :  `offset`
--

-- --------------------------------------------------------

--
-- Structure de la table `Adherent`
--

CREATE TABLE `Adherent` (
  `idAdherent` int(11) NOT NULL DEFAULT '0',
  `pseudo` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `dateNaiss` date DEFAULT NULL,
  `sexe` varchar(255) NOT NULL,
  `numVoie` varchar(255) DEFAULT NULL,
  `nomVoie` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `codePostal` varchar(255) DEFAULT NULL,
  `dateConsultationMedicale` date DEFAULT NULL,
  `nomClub` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `Adherent`
--

INSERT INTO `Adherent` (`idAdherent`, `pseudo`, `nom`, `prenom`, `dateNaiss`, `sexe`, `numVoie`, `nomVoie`, `ville`, `codePostal`, `dateConsultationMedicale`, `nomClub`) VALUES
(2016001, 'alice12', 'Dupont', 'Alice', '1995-01-01', 'F', '28', 'rue du boulevard', 'Lyon', '69001', '2019-01-01', 'ClubLyon'),
(2016002, 'bernard19', 'Dupout', 'Bernard', '1950-01-01', 'H', '2', 'rue du avenue ', 'Lyon', '69001', '2018-09-01', 'ClubLyon'),
(2016003, 'olivier23', 'Durand', 'Olivier', '1955-01-01', 'H', '7', 'rue du avenue ', 'Paris', '75001', '2017-09-01', 'ClubParis'),
(2016004, 'mat234', 'Drand', 'Mat', '1975-01-01', 'H', '7', 'rue du avenue ', 'Paris', '75001', '2017-09-10', 'ClubParis'),
(2016005, 'louis11', 'Durad', 'Louis', '1971-01-01', 'H', '7', 'rue du avenue ', 'Paris', '75001', '2017-09-21', 'ClubParis'),
(2016006, 'louise32', 'Drad', 'Louise', '2000-01-01', 'F', '7', 'rue du avenue ', 'Paris', '75001', '2017-08-01', 'ClubParis'),
(2016007, 'nico3', 'Rasde', 'Nico', '1955-01-07', 'H', '7', 'rue du avenue ', 'Paris', '75001', '2017-09-01', 'ClubParis'),
(2016008, 'chris345', 'Polain', 'Chris', '1899-01-01', 'H', '7', 'rue du avenue ', 'Paris', '75001', '2019-09-01', 'ClubParis'),
(2017001, 'bruno67', 'Paso', 'Bruno', '1970-01-01', 'H', '28', 'rue du avenue ', 'Paris', '75001', '2018-09-21', 'ClubParis'),
(2017002, 'celine56', 'Paso', 'Celine', '1970-01-01', 'F', '28', 'rue du avenue ', 'Lyon', '69001', '2018-09-21', 'ClubLyon'),
(2017003, 'celine96', 'Durand', 'Celine', '1975-01-01', 'F', '28', 'rue du avenue ', 'Paris', '75001', '2018-09-21', 'ClubParis'),
(2017004, 'mathilde5', 'Tuile', 'Mathilde', '1999-01-01', 'F', '28', 'rue du avenue ', 'Paris', '75001', '2018-09-21', 'ClubParis'),
(2017005, 'lou19', 'Roli', 'Lou', '2010-01-01', 'F', '28', 'rue du avenue ', 'Paris', '75001', '2018-09-21', 'ClubParis'),
(2017006, 'celine33', 'Roula', 'Celine', '2001-01-01', 'F', '28', 'rue du avenue', 'Paris', '75001', '2018-09-21', 'ClubParis'),
(2018001, 'marie45', 'Laple', 'Marie', '1989-01-01', 'F', '28', 'rue du avenue', 'Lyon', '69001', '2018-09-11', 'ClubLyon'),
(2018002, 'bernard45', 'Laplo', 'Bernard', '2000-01-01', 'H', '15', 'rue du avenue', 'Lyon', '69001', '2018-07-01', 'ClubLyon'),
(2018003, 'blandine35', 'Oplia', 'Blandine', '1899-01-01', 'F', '17', 'rue du rue', 'Lyon', '69001', '2018-12-01', 'ClubLyon'),
(2018004, 'manu67', 'Horil', 'Manu', '1963-01-01', 'H', '28', 'rue du avenue', 'Lyon', '69001', '2018-12-01', 'ClubLyon'),
(2018005, 'caroline43', 'Plios', 'Caroline', '1978-01-01', 'F', '28', 'rue du avenue', 'Lyon', '69001', '2018-09-01', 'ClubLyon');

--
-- Déclencheurs `Adherent`
--
DELIMITER $$
CREATE TRIGGER `genere_idAdherent` BEFORE INSERT ON `Adherent` FOR EACH ROW BEGIN
    -- Nombre adhérents existants cette année
    SELECT COUNT(*)+1 INTO @nbAdherents
    FROM Adherent
    WHERE FLOOR(idAdherent/1000) = YEAR(NOW());
     
    SET NEW.idAdherent = YEAR(NOW())*1000+@nbAdherents;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `APourTarif`
--

CREATE TABLE `APourTarif` (
  `idEpreuve` int(11) NOT NULL,
  `idEdition` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL,
  `idTarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `nomC` varchar(255) NOT NULL,
  `anneeCreation` int(11) NOT NULL,
  `moisCourse` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `planCourse` varchar(255) DEFAULT NULL,
  `adresseDepart` varchar(255) DEFAULT NULL,
  `dateInscription` date DEFAULT NULL,
  `dateDepotCertificats` date DEFAULT NULL,
  `dateRecuperationDossards` date DEFAULT NULL,
  `urlSite` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `type` varchar(255) NOT NULL,
  `distance` decimal(12,4) DEFAULT NULL,
  `denivele` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Structure de la table `Resultat`
--

CREATE TABLE `Resultat` (
  `dossard` int(11) NOT NULL,
  `idEpreuve` int(11) NOT NULL,
  `idEdition` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL,
  `rang` int(11) DEFAULT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `sexe` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `Resultat`
--

INSERT INTO `Resultat` (`dossard`, `idEpreuve`, `idEdition`, `idCourse`, `rang`, `nom`, `prenom`, `sexe`) VALUES
(2017000001, 2, 1, 1, 2, 'Polain', 'Chris', 'H'),
(2017000006, 2, 1, 1, 7, 'Laplo', 'Bernard', 'H'),
(2017000007, 2, 1, 1, 8, 'Dupont', 'Alice', 'F'),
(2017000013, 2, 1, 1, 14, 'Roula', 'Celine', 'F'),
(2017000014, 2, 1, 1, 15, 'Tuile', 'Mathilde', 'F'),
(2017000018, 3, 1, 1, 4, 'Roli', 'Lou', 'F'),
(2017000019, 3, 1, 1, 5, 'Rasde', 'nico', 'H'),
(2017000020, 3, 1, 1, 6, 'Laple', 'Marie', 'F'),
(2017000021, 3, 1, 1, 7, 'Drand', 'Mat', 'H'),
(2017000026, 3, 1, 1, 12, 'Durand', 'Celine', 'F'),
(2017000027, 3, 1, 1, 13, 'Oplia', 'Blandine', 'F'),
(2017000032, 1, 1, 1, 3, 'Durad', 'Louis', 'H'),
(2017000035, 1, 1, 1, 6, 'Paso', 'Celine', 'F'),
(2017000036, 1, 1, 1, 7, 'Dupout', 'Bernard', 'H'),
(2017000038, 1, 1, 1, 9, 'Paso', 'Bruno', 'H'),
(2017000040, 1, 1, 1, 11, 'Durand', 'Olivier', 'H'),
(2018000000, 5, 2, 1, 1, 'Rasde', 'Nico', 'H'),
(2018000000, 8, 3, 2, 1, 'Dupont', 'Alice', 'F'),
(2018000001, 8, 3, 2, 2, 'Durand', 'Celine', 'F'),
(2018000003, 5, 2, 1, 4, 'Dupout', 'Bernard', 'H'),
(2018000004, 8, 3, 2, 5, 'Plios', 'Caroline', 'F'),
(2018000005, 5, 2, 1, 6, 'Laplo', 'Bernard', 'H'),
(2018000008, 5, 2, 1, 9, 'Durand', 'Olivier', 'H'),
(2018000008, 8, 3, 2, 9, 'Durad', 'Louis', 'H'),
(2018000009, 8, 3, 2, 10, 'Durand', 'Olivier', 'H'),
(2018000010, 8, 3, 2, 11, 'Drad', 'Louise', 'F'),
(2018000011, 5, 2, 1, 12, 'Horil', 'Manu', 'H'),
(2018000011, 8, 3, 2, 12, 'Roli', 'Lou', 'F'),
(2018000013, 8, 3, 2, 14, 'Tuile', 'Mathilde', 'F'),
(2018000014, 8, 3, 2, 15, 'Roula', 'Celine', 'F'),
(2018000016, 6, 2, 1, 2, 'Roli', 'Lou', 'F'),
(2018000017, 6, 2, 1, 3, 'Plios', 'Caroline', 'F'),
(2018000019, 9, 3, 2, 5, 'Drand', 'Mat', 'H'),
(2018000020, 9, 3, 2, 6, 'Laple', 'Marie', 'F'),
(2018000021, 6, 2, 1, 7, 'Durand', 'Celine', 'F'),
(2018000023, 6, 2, 1, 9, 'Paso', 'Celine', 'F'),
(2018000024, 6, 2, 1, 10, 'Roula', 'Celine', 'F'),
(2018000027, 6, 2, 1, 13, 'Laple', 'Marie', 'F'),
(2018000031, 4, 2, 1, 2, 'Drad', 'Louise', 'F'),
(2018000032, 4, 2, 1, 3, 'Paso', 'Bruno', 'H'),
(2018000032, 7, 3, 2, 3, 'Laplo', 'Bernard', 'H'),
(2018000033, 7, 3, 2, 4, 'Rasde', 'nico', 'H'),
(2018000036, 7, 3, 2, 7, 'Polain', 'Chris', 'H'),
(2018000038, 4, 2, 1, 9, 'Drand', 'Mat', 'H'),
(2018000039, 7, 3, 2, 10, 'Horil', 'Manu', 'H'),
(2018000041, 4, 2, 1, 12, 'Polain', 'Chris', 'H'),
(2018000044, 4, 2, 1, 15, 'Horil', 'Manu', 'H'),
(2018000045, 8, 3, 2, 0, 'Paso', 'Bruno', 'H'),
(2018000046, 9, 3, 2, 0, 'Paso', 'Celine', 'F');

-- --------------------------------------------------------

--
-- Structure de la table `Tarif`
--

CREATE TABLE `Tarif` (
  `idTarif` int(11) NOT NULL,
  `prix` decimal(4,2) NOT NULL,
  `minAge` int(11) NOT NULL,
  `maxAge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `TempsPassage`
--

INSERT INTO `TempsPassage` (`dossard`, `km`, `idEpreuve`, `idEdition`, `idCourse`, `temps`) VALUES
(2017000001, '5', 2, 1, 1, '00:00:16'),
(2017000001, '10', 2, 1, 1, '00:00:33'),
(2017000001, '15', 2, 1, 1, '00:00:50'),
(2017000001, '20', 2, 1, 1, '00:00:00'),
(2017000001, '25', 2, 1, 1, '00:00:00'),
(2017000001, '30', 2, 1, 1, '00:01:01'),
(2017000001, '35', 2, 1, 1, '00:01:18'),
(2017000001, '40', 2, 1, 1, '00:01:35'),
(2017000001, '41', 2, 1, 1, '00:01:39'),
(2017000006, '5', 2, 1, 1, '00:00:19'),
(2017000006, '10', 2, 1, 1, '00:00:38'),
(2017000006, '15', 2, 1, 1, '00:00:57'),
(2017000006, '20', 2, 1, 1, '00:00:00'),
(2017000006, '25', 2, 1, 1, '00:00:00'),
(2017000006, '30', 2, 1, 1, '00:01:14'),
(2017000006, '35', 2, 1, 1, '00:01:34'),
(2017000006, '40', 2, 1, 1, '00:01:53'),
(2017000006, '41', 2, 1, 1, '00:01:57'),
(2017000007, '5', 2, 1, 1, '00:00:19'),
(2017000007, '10', 2, 1, 1, '00:00:39'),
(2017000007, '15', 2, 1, 1, '00:00:58'),
(2017000007, '20', 2, 1, 1, '00:00:00'),
(2017000007, '25', 2, 1, 1, '00:00:00'),
(2017000007, '30', 2, 1, 1, '00:01:17'),
(2017000007, '35', 2, 1, 1, '00:01:37'),
(2017000007, '40', 2, 1, 1, '00:01:57'),
(2017000007, '41', 2, 1, 1, '00:00:00'),
(2017000013, '5', 2, 1, 1, '00:00:25'),
(2017000013, '10', 2, 1, 1, '00:00:50'),
(2017000013, '15', 2, 1, 1, '00:00:00'),
(2017000013, '20', 2, 1, 1, '00:01:01'),
(2017000013, '25', 2, 1, 1, '00:01:27'),
(2017000013, '30', 2, 1, 1, '00:01:52'),
(2017000013, '35', 2, 1, 1, '00:00:00'),
(2017000013, '40', 2, 1, 1, '00:02:03'),
(2017000013, '41', 2, 1, 1, '00:02:09'),
(2017000014, '5', 2, 1, 1, '00:00:26'),
(2017000014, '10', 2, 1, 1, '00:00:52'),
(2017000014, '15', 2, 1, 1, '00:00:00'),
(2017000014, '20', 2, 1, 1, '00:01:05'),
(2017000014, '25', 2, 1, 1, '00:01:31'),
(2017000014, '30', 2, 1, 1, '00:01:57'),
(2017000014, '35', 2, 1, 1, '00:00:00'),
(2017000014, '40', 2, 1, 1, '00:02:10'),
(2017000014, '41', 2, 1, 1, '00:02:16'),
(2017000018, '5', 3, 1, 1, '00:00:17'),
(2017000018, '10', 3, 1, 1, '00:00:35'),
(2017000018, '15', 3, 1, 1, '00:00:52'),
(2017000018, '20', 3, 1, 1, '00:00:00'),
(2017000018, '21', 3, 1, 1, '00:00:00'),
(2017000019, '5', 3, 1, 1, '00:00:19'),
(2017000019, '10', 3, 1, 1, '00:00:38'),
(2017000019, '15', 3, 1, 1, '00:00:57'),
(2017000019, '20', 3, 1, 1, '00:00:00'),
(2017000019, '21', 3, 1, 1, '00:00:00'),
(2017000020, '5', 3, 1, 1, '00:00:20'),
(2017000020, '10', 3, 1, 1, '00:00:41'),
(2017000020, '15', 3, 1, 1, '00:00:00'),
(2017000020, '20', 3, 1, 1, '00:00:00'),
(2017000020, '21', 3, 1, 1, '00:00:00'),
(2017000021, '5', 3, 1, 1, '00:00:22'),
(2017000021, '10', 3, 1, 1, '00:00:44'),
(2017000021, '15', 3, 1, 1, '00:00:00'),
(2017000021, '20', 3, 1, 1, '00:00:00'),
(2017000021, '21', 3, 1, 1, '00:00:00'),
(2017000026, '5', 3, 1, 1, '00:00:25'),
(2017000026, '10', 3, 1, 1, '00:00:51'),
(2017000026, '15', 3, 1, 1, '00:00:00'),
(2017000026, '20', 3, 1, 1, '00:01:03'),
(2017000026, '21', 3, 1, 1, '00:01:09'),
(2017000027, '5', 3, 1, 1, '00:00:26'),
(2017000027, '10', 3, 1, 1, '00:00:52'),
(2017000027, '15', 3, 1, 1, '00:00:00'),
(2017000027, '20', 3, 1, 1, '00:01:04'),
(2017000027, '21', 3, 1, 1, '00:01:09'),
(2017000032, '5', 1, 1, 1, '00:00:16'),
(2017000032, '10', 1, 1, 1, '00:00:32'),
(2017000035, '5', 1, 1, 1, '00:00:18'),
(2017000035, '10', 1, 1, 1, '00:00:36'),
(2017000036, '5', 1, 1, 1, '00:00:18'),
(2017000036, '10', 1, 1, 1, '00:00:36'),
(2017000038, '5', 1, 1, 1, '00:00:24'),
(2017000038, '10', 1, 1, 1, '00:00:48'),
(2017000040, '5', 1, 1, 1, '00:00:25'),
(2017000040, '10', 1, 1, 1, '00:00:50'),
(2018000000, '5', 5, 2, 1, '00:00:15'),
(2018000000, '5', 8, 3, 2, '00:00:15'),
(2018000000, '10', 5, 2, 1, '00:00:30'),
(2018000000, '10', 8, 3, 2, '00:00:30'),
(2018000000, '15', 5, 2, 1, '00:00:45'),
(2018000000, '15', 8, 3, 2, '00:00:46'),
(2018000000, '20', 5, 2, 1, '00:00:00'),
(2018000000, '20', 8, 3, 2, '00:00:00'),
(2018000000, '25', 5, 2, 1, '00:00:00'),
(2018000000, '25', 8, 3, 2, '00:00:00'),
(2018000000, '30', 5, 2, 1, '00:00:00'),
(2018000000, '30', 8, 3, 2, '00:00:00'),
(2018000000, '35', 5, 2, 1, '00:01:05'),
(2018000000, '35', 8, 3, 2, '00:01:07'),
(2018000000, '40', 5, 2, 1, '00:01:20'),
(2018000000, '40', 8, 3, 2, '00:01:22'),
(2018000000, '41', 5, 2, 1, '00:01:23'),
(2018000000, '41', 8, 3, 2, '00:01:26'),
(2018000001, '5', 8, 3, 2, '00:00:15'),
(2018000001, '10', 8, 3, 2, '00:00:30'),
(2018000001, '15', 8, 3, 2, '00:00:46'),
(2018000001, '20', 8, 3, 2, '00:00:00'),
(2018000001, '25', 8, 3, 2, '00:00:00'),
(2018000001, '30', 8, 3, 2, '00:00:00'),
(2018000001, '35', 8, 3, 2, '00:01:07'),
(2018000001, '40', 8, 3, 2, '00:01:23'),
(2018000001, '41', 8, 3, 2, '00:01:26'),
(2018000003, '5', 5, 2, 1, '00:00:17'),
(2018000003, '10', 5, 2, 1, '00:00:34'),
(2018000003, '15', 5, 2, 1, '00:00:52'),
(2018000003, '20', 5, 2, 1, '00:00:00'),
(2018000003, '25', 5, 2, 1, '00:00:00'),
(2018000003, '30', 5, 2, 1, '00:01:04'),
(2018000003, '35', 5, 2, 1, '00:01:21'),
(2018000003, '40', 5, 2, 1, '00:01:38'),
(2018000003, '41', 5, 2, 1, '00:01:43'),
(2018000004, '5', 8, 3, 2, '00:00:18'),
(2018000004, '10', 8, 3, 2, '00:00:37'),
(2018000004, '15', 8, 3, 2, '00:00:56'),
(2018000004, '20', 8, 3, 2, '00:00:00'),
(2018000004, '25', 8, 3, 2, '00:00:00'),
(2018000004, '30', 8, 3, 2, '00:01:12'),
(2018000004, '35', 8, 3, 2, '00:01:31'),
(2018000004, '40', 8, 3, 2, '00:01:50'),
(2018000004, '41', 8, 3, 2, '00:01:54'),
(2018000005, '5', 5, 2, 1, '00:00:20'),
(2018000005, '10', 5, 2, 1, '00:00:40'),
(2018000005, '15', 5, 2, 1, '00:00:00'),
(2018000005, '20', 5, 2, 1, '00:00:00'),
(2018000005, '25', 5, 2, 1, '00:01:00'),
(2018000005, '30', 5, 2, 1, '00:01:20'),
(2018000005, '35', 5, 2, 1, '00:01:40'),
(2018000005, '40', 5, 2, 1, '00:00:00'),
(2018000005, '41', 5, 2, 1, '00:00:00'),
(2018000008, '5', 5, 2, 1, '00:00:25'),
(2018000008, '5', 8, 3, 2, '00:00:21'),
(2018000008, '10', 5, 2, 1, '00:00:51'),
(2018000008, '10', 8, 3, 2, '00:00:42'),
(2018000008, '15', 5, 2, 1, '00:00:00'),
(2018000008, '15', 8, 3, 2, '00:00:00'),
(2018000008, '20', 5, 2, 1, '00:01:03'),
(2018000008, '20', 8, 3, 2, '00:00:00'),
(2018000008, '25', 5, 2, 1, '00:01:29'),
(2018000008, '25', 8, 3, 2, '00:01:06'),
(2018000008, '30', 5, 2, 1, '00:01:55'),
(2018000008, '30', 8, 3, 2, '00:01:28'),
(2018000008, '35', 5, 2, 1, '00:00:00'),
(2018000008, '35', 8, 3, 2, '00:01:49'),
(2018000008, '40', 5, 2, 1, '00:02:07'),
(2018000008, '40', 8, 3, 2, '00:00:00'),
(2018000008, '41', 5, 2, 1, '00:02:13'),
(2018000008, '41', 8, 3, 2, '00:00:00'),
(2018000009, '5', 8, 3, 2, '00:00:21'),
(2018000009, '10', 8, 3, 2, '00:00:43'),
(2018000009, '15', 8, 3, 2, '00:00:00'),
(2018000009, '20', 8, 3, 2, '00:00:00'),
(2018000009, '25', 8, 3, 2, '00:01:07'),
(2018000009, '30', 8, 3, 2, '00:01:29'),
(2018000009, '35', 8, 3, 2, '00:01:50'),
(2018000009, '40', 8, 3, 2, '00:00:00'),
(2018000009, '41', 8, 3, 2, '00:00:00'),
(2018000010, '5', 8, 3, 2, '00:00:22'),
(2018000010, '10', 8, 3, 2, '00:00:44'),
(2018000010, '15', 8, 3, 2, '00:00:00'),
(2018000010, '20', 8, 3, 2, '00:00:00'),
(2018000010, '25', 8, 3, 2, '00:01:12'),
(2018000010, '30', 8, 3, 2, '00:01:34'),
(2018000010, '35', 8, 3, 2, '00:01:56'),
(2018000010, '40', 8, 3, 2, '00:00:00'),
(2018000010, '41', 8, 3, 2, '00:00:00'),
(2018000011, '5', 5, 2, 1, '00:00:26'),
(2018000011, '5', 8, 3, 2, '00:00:22'),
(2018000011, '10', 5, 2, 1, '00:00:53'),
(2018000011, '10', 8, 3, 2, '00:00:44'),
(2018000011, '15', 5, 2, 1, '00:00:00'),
(2018000011, '15', 8, 3, 2, '00:00:00'),
(2018000011, '20', 5, 2, 1, '00:01:07'),
(2018000011, '20', 8, 3, 2, '00:00:00'),
(2018000011, '25', 5, 2, 1, '00:01:34'),
(2018000011, '25', 8, 3, 2, '00:01:12'),
(2018000011, '30', 5, 2, 1, '00:00:00'),
(2018000011, '30', 8, 3, 2, '00:01:34'),
(2018000011, '35', 5, 2, 1, '00:00:00'),
(2018000011, '35', 8, 3, 2, '00:01:57'),
(2018000011, '40', 5, 2, 1, '00:02:14'),
(2018000011, '40', 8, 3, 2, '00:00:00'),
(2018000011, '41', 5, 2, 1, '00:02:21'),
(2018000011, '41', 8, 3, 2, '00:00:00'),
(2018000013, '5', 8, 3, 2, '00:00:26'),
(2018000013, '10', 8, 3, 2, '00:00:53'),
(2018000013, '15', 8, 3, 2, '00:00:00'),
(2018000013, '20', 8, 3, 2, '00:01:06'),
(2018000013, '25', 8, 3, 2, '00:01:33'),
(2018000013, '30', 8, 3, 2, '00:00:00'),
(2018000013, '35', 8, 3, 2, '00:00:00'),
(2018000013, '40', 8, 3, 2, '00:02:13'),
(2018000013, '41', 8, 3, 2, '00:02:20'),
(2018000014, '5', 8, 3, 2, '00:00:29'),
(2018000014, '10', 8, 3, 2, '00:00:59'),
(2018000014, '15', 8, 3, 2, '00:00:00'),
(2018000014, '20', 8, 3, 2, '00:01:19'),
(2018000014, '25', 8, 3, 2, '00:01:49'),
(2018000014, '30', 8, 3, 2, '00:00:00'),
(2018000014, '35', 8, 3, 2, '00:02:09'),
(2018000014, '40', 8, 3, 2, '00:02:38'),
(2018000014, '41', 8, 3, 2, '00:02:46'),
(2018000016, '5', 6, 2, 1, '00:00:16'),
(2018000016, '10', 6, 2, 1, '00:00:32'),
(2018000016, '15', 6, 2, 1, '00:00:48'),
(2018000016, '20', 6, 2, 1, '00:00:00'),
(2018000016, '21', 6, 2, 1, '00:00:00'),
(2018000017, '5', 6, 2, 1, '00:00:16'),
(2018000017, '10', 6, 2, 1, '00:00:33'),
(2018000017, '15', 6, 2, 1, '00:00:49'),
(2018000017, '20', 6, 2, 1, '00:00:00'),
(2018000017, '21', 6, 2, 1, '00:00:00'),
(2018000019, '5', 9, 3, 2, '00:00:19'),
(2018000019, '10', 9, 3, 2, '00:00:38'),
(2018000019, '15', 9, 3, 2, '00:00:58'),
(2018000019, '20', 9, 3, 2, '00:00:00'),
(2018000019, '21', 9, 3, 2, '00:00:00'),
(2018000020, '5', 9, 3, 2, '00:00:19'),
(2018000020, '10', 9, 3, 2, '00:00:38'),
(2018000020, '15', 9, 3, 2, '00:00:58'),
(2018000020, '20', 9, 3, 2, '00:00:00'),
(2018000020, '21', 9, 3, 2, '00:00:00'),
(2018000021, '5', 6, 2, 1, '00:00:18'),
(2018000021, '10', 6, 2, 1, '00:00:36'),
(2018000021, '15', 6, 2, 1, '00:00:54'),
(2018000021, '20', 6, 2, 1, '00:00:00'),
(2018000021, '21', 6, 2, 1, '00:00:00'),
(2018000023, '5', 6, 2, 1, '00:00:19'),
(2018000023, '10', 6, 2, 1, '00:00:39'),
(2018000023, '15', 6, 2, 1, '00:00:58'),
(2018000023, '20', 6, 2, 1, '00:00:00'),
(2018000023, '21', 6, 2, 1, '00:00:00'),
(2018000024, '5', 6, 2, 1, '00:00:20'),
(2018000024, '10', 6, 2, 1, '00:00:40'),
(2018000024, '15', 6, 2, 1, '00:00:00'),
(2018000024, '20', 6, 2, 1, '00:00:00'),
(2018000024, '21', 6, 2, 1, '00:00:00'),
(2018000027, '5', 6, 2, 1, '00:00:23'),
(2018000027, '10', 6, 2, 1, '00:00:47'),
(2018000027, '15', 6, 2, 1, '00:00:00'),
(2018000027, '20', 6, 2, 1, '00:00:00'),
(2018000027, '21', 6, 2, 1, '00:01:00'),
(2018000031, '5', 4, 2, 1, '00:00:15'),
(2018000031, '10', 4, 2, 1, '00:00:31'),
(2018000032, '5', 4, 2, 1, '00:00:16'),
(2018000032, '5', 7, 3, 2, '00:00:17'),
(2018000032, '10', 4, 2, 1, '00:00:32'),
(2018000032, '10', 7, 3, 2, '00:00:35'),
(2018000033, '5', 7, 3, 2, '00:00:17'),
(2018000033, '10', 7, 3, 2, '00:00:35'),
(2018000036, '5', 7, 3, 2, '00:00:19'),
(2018000036, '10', 7, 3, 2, '00:00:38'),
(2018000038, '5', 4, 2, 1, '00:00:20'),
(2018000038, '10', 4, 2, 1, '00:00:40'),
(2018000039, '5', 7, 3, 2, '00:00:23'),
(2018000039, '10', 7, 3, 2, '00:00:46'),
(2018000041, '5', 4, 2, 1, '00:00:23'),
(2018000041, '10', 4, 2, 1, '00:00:47'),
(2018000044, '5', 4, 2, 1, '00:00:28'),
(2018000044, '10', 4, 2, 1, '00:00:56'),
(2018000045, '5', 8, 3, 2, '00:00:26'),
(2018000045, '10', 8, 3, 2, '00:00:31'),
(2018000045, '15', 8, 3, 2, '00:00:59'),
(2018000045, '20', 8, 3, 2, '00:01:17'),
(2018000045, '25', 8, 3, 2, '00:01:42'),
(2018000045, '30', 8, 3, 2, '00:01:01'),
(2018000045, '35', 8, 3, 2, '00:01:36'),
(2018000045, '40', 8, 3, 2, '00:02:05'),
(2018000046, '5', 9, 3, 2, '00:00:27'),
(2018000046, '10', 9, 3, 2, '00:00:30'),
(2018000046, '15', 9, 3, 2, '00:00:00'),
(2018000046, '20', 9, 3, 2, '00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateur`
--

CREATE TABLE `Utilisateur` (
  `pseudo` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `estAdmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
('olivier23', 'olivier23', 0);

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
-- Index pour la table `Resultat`
--
ALTER TABLE `Resultat`
  ADD PRIMARY KEY (`dossard`,`idEpreuve`,`idEdition`,`idCourse`),
  ADD KEY `resultat_idx` (`nom`,`prenom`,`sexe`),
  ADD KEY `epreuve_resultat_fk` (`idEpreuve`,`idEdition`,`idCourse`);

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
  ADD KEY `resultat_tempspassage_fk` (`dossard`,`idEpreuve`,`idEdition`,`idCourse`);

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
  ADD CONSTRAINT `utilisateur_adherent_fk` FOREIGN KEY (`pseudo`) REFERENCES `Utilisateur` (`pseudo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `APourTarif`
--
ALTER TABLE `APourTarif`
  ADD CONSTRAINT `epreuve_apourtarif_fk` FOREIGN KEY (`idEpreuve`,`idEdition`,`idCourse`) REFERENCES `Epreuve` (`idEpreuve`, `idEdition`, `idCourse`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tarif_apourtarif_fk` FOREIGN KEY (`idTarif`) REFERENCES `Tarif` (`idTarif`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Edition`
--
ALTER TABLE `Edition`
  ADD CONSTRAINT `course_edition_fk` FOREIGN KEY (`idCourse`) REFERENCES `Course` (`idCourse`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Epreuve`
--
ALTER TABLE `Epreuve`
  ADD CONSTRAINT `edition_epreuve_fk` FOREIGN KEY (`idEdition`,`idCourse`) REFERENCES `Edition` (`idEdition`, `idCourse`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Resultat`
--
ALTER TABLE `Resultat`
  ADD CONSTRAINT `adherent_resultat_fk` FOREIGN KEY (`nom`,`prenom`,`sexe`) REFERENCES `Adherent` (`nom`, `prenom`, `sexe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `epreuve_resultat_fk` FOREIGN KEY (`idEpreuve`,`idEdition`,`idCourse`) REFERENCES `Epreuve` (`idEpreuve`, `idEdition`, `idCourse`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `TempsPassage`
--
ALTER TABLE `TempsPassage`
  ADD CONSTRAINT `resultat_tempspassage_fk` FOREIGN KEY (`dossard`,`idEpreuve`,`idEdition`,`idCourse`) REFERENCES `Resultat` (`dossard`, `idEpreuve`, `idEdition`, `idCourse`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
