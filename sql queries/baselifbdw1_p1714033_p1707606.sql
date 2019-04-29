-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  lun. 29 avr. 2019 à 09:32
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
-- Base de données :  `baselifbdw1_p1714033_p1707606_v3`
--

-- --------------------------------------------------------

--
-- Structure de la table `Adherent`
--

CREATE TABLE `Adherent` (
  `idAdherent` int(11) NOT NULL DEFAULT '0',
  `pseudo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateNaiss` date DEFAULT NULL,
  `sexe` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numVoie` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nomVoie` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ville` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codePostal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateConsultationMedicale` date DEFAULT NULL,
  `nomClub` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Structure de la table `Resultat`
--

CREATE TABLE `Resultat` (
  `dossard` int(11) NOT NULL,
  `rang` int(11) DEFAULT NULL,
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
(2018000005, 6, 'Laplo', 'Bernard', 'H', 5, 2, 1),
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
(2018000023, 9, 'Paso', 'Celine', 'F', 6, 2, 1),
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
  `km` decimal(10,4) NOT NULL,
  `temps` double DEFAULT NULL,
  `idEpreuve` int(11) NOT NULL,
  `idEdition` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `TempsPassage`
--

INSERT INTO `TempsPassage` (`dossard`, `km`, `temps`, `idEpreuve`, `idEdition`, `idCourse`) VALUES
(2017000001, '5.0000', 16.900102710984445, 2, 1, 1),
(2017000001, '10.0000', 33.80020542196889, 2, 1, 1),
(2017000001, '15.0000', 50.70030813295334, 2, 1, 1),
(2017000001, '20.0000', 67.60041084393778, 2, 1, 1),
(2017000001, '25.0000', 84.50051355492222, 2, 1, 1),
(2017000001, '30.0000', 101.40061626590668, 2, 1, 1),
(2017000001, '35.0000', 118.30071897689112, 2, 1, 1),
(2017000001, '40.0000', 135.20082168787556, 2, 1, 1),
(2017000001, '41.1950', 139.23994623580083, 2, 1, 1),
(2017000006, '5.0000', 19.164546843036334, 2, 1, 1),
(2017000006, '10.0000', 38.32909368607267, 2, 1, 1),
(2017000006, '15.0000', 57.493640529109, 2, 1, 1),
(2017000006, '20.0000', 76.65818737214533, 2, 1, 1),
(2017000006, '25.0000', 95.82273421518167, 2, 1, 1),
(2017000006, '30.0000', 114.987281058218, 2, 1, 1),
(2017000006, '35.0000', 134.15182790125434, 2, 1, 1),
(2017000006, '40.0000', 153.31637474429067, 2, 1, 1),
(2017000006, '41.1950', 157.89670143977636, 2, 1, 1),
(2017000007, '5.0000', 19.63855930386148, 2, 1, 1),
(2017000007, '10.0000', 39.27711860772296, 2, 1, 1),
(2017000007, '15.0000', 58.91567791158444, 2, 1, 1),
(2017000007, '20.0000', 78.55423721544592, 2, 1, 1),
(2017000007, '25.0000', 98.19279651930741, 2, 1, 1),
(2017000007, '30.0000', 117.83135582316888, 2, 1, 1),
(2017000007, '35.0000', 137.46991512703036, 2, 1, 1),
(2017000007, '40.0000', 157.10847443089185, 2, 1, 1),
(2017000007, '41.1950', 161.80209010451475, 2, 1, 1),
(2017000013, '5.0000', 25.481527137881663, 2, 1, 1),
(2017000013, '10.0000', 50.96305427576333, 2, 1, 1),
(2017000013, '15.0000', 76.44458141364498, 2, 1, 1),
(2017000013, '20.0000', 101.92610855152665, 2, 1, 1),
(2017000013, '25.0000', 127.40763568940832, 2, 1, 1),
(2017000013, '30.0000', 152.88916282728997, 2, 1, 1),
(2017000013, '35.0000', 178.37068996517164, 2, 1, 1),
(2017000013, '40.0000', 203.8522171030533, 2, 1, 1),
(2017000013, '41.1950', 209.94230208900703, 2, 1, 1),
(2017000014, '5.0000', 26.276325548907298, 2, 1, 1),
(2017000014, '10.0000', 52.552651097814596, 2, 1, 1),
(2017000014, '15.0000', 78.8289766467219, 2, 1, 1),
(2017000014, '20.0000', 105.10530219562919, 2, 1, 1),
(2017000014, '25.0000', 131.3816277445365, 2, 1, 1),
(2017000014, '30.0000', 157.6579532934438, 2, 1, 1),
(2017000014, '35.0000', 183.93427884235112, 2, 1, 1),
(2017000014, '40.0000', 210.21060439125839, 2, 1, 1),
(2017000014, '41.1950', 216.49064619744726, 2, 1, 1),
(2017000018, '5.0000', 17.565680633418175, 3, 1, 1),
(2017000018, '10.0000', 35.13136126683635, 3, 1, 1),
(2017000018, '15.0000', 52.69704190025453, 3, 1, 1),
(2017000018, '20.0000', 70.2627225336727, 3, 1, 1),
(2017000018, '21.1000', 74.12717227302471, 3, 1, 1),
(2017000019, '5.0000', 19.149197876519015, 3, 1, 1),
(2017000019, '10.0000', 38.29839575303803, 3, 1, 1),
(2017000019, '15.0000', 57.44759362955705, 3, 1, 1),
(2017000019, '20.0000', 76.59679150607606, 3, 1, 1),
(2017000019, '21.1000', 80.80961503891025, 3, 1, 1),
(2017000020, '5.0000', 20.50559271936219, 3, 1, 1),
(2017000020, '10.0000', 41.01118543872438, 3, 1, 1),
(2017000020, '15.0000', 61.516778158086574, 3, 1, 1),
(2017000020, '20.0000', 82.02237087744876, 3, 1, 1),
(2017000020, '21.1000', 86.53360127570846, 3, 1, 1),
(2017000021, '5.0000', 22.417952684989757, 3, 1, 1),
(2017000021, '10.0000', 44.835905369979514, 3, 1, 1),
(2017000021, '15.0000', 67.25385805496926, 3, 1, 1),
(2017000021, '20.0000', 89.67181073995903, 3, 1, 1),
(2017000021, '21.1000', 94.60376033065677, 3, 1, 1),
(2017000026, '5.0000', 25.962727794066723, 3, 1, 1),
(2017000026, '10.0000', 51.925455588133445, 3, 1, 1),
(2017000026, '15.0000', 77.88818338220017, 3, 1, 1),
(2017000026, '20.0000', 103.85091117626689, 3, 1, 1),
(2017000026, '21.1000', 109.56271129096159, 3, 1, 1),
(2017000027, '5.0000', 26.030852718913522, 3, 1, 1),
(2017000027, '10.0000', 52.061705437827044, 3, 1, 1),
(2017000027, '15.0000', 78.09255815674055, 3, 1, 1),
(2017000027, '20.0000', 104.12341087565409, 3, 1, 1),
(2017000027, '21.1000', 109.85019847381506, 3, 1, 1),
(2017000032, '5.0000', 16.035771065582527, 1, 1, 1),
(2017000032, '10.0000', 32.07154213116505, 1, 1, 1),
(2017000035, '5.0000', 18.03207909269125, 1, 1, 1),
(2017000035, '10.0000', 36.0641581853825, 1, 1, 1),
(2017000036, '5.0000', 18.055901112556356, 1, 1, 1),
(2017000036, '10.0000', 36.11180222511271, 1, 1, 1),
(2017000038, '5.0000', 24.38916085757272, 1, 1, 1),
(2017000038, '10.0000', 48.77832171514544, 1, 1, 1),
(2017000040, '5.0000', 25.308482650272335, 1, 1, 1),
(2017000040, '10.0000', 50.61696530054467, 1, 1, 1),
(2018000000, '5.0000', 15.008810912691844, 5, 2, 1),
(2018000000, '5.0000', 15.333952467778735, 8, 3, 2),
(2018000000, '10.0000', 30.01762182538369, 5, 2, 1),
(2018000000, '10.0000', 30.66790493555747, 8, 3, 2),
(2018000000, '15.0000', 45.026432738075535, 5, 2, 1),
(2018000000, '15.0000', 46.0018574033362, 8, 3, 2),
(2018000000, '20.0000', 60.03524365076738, 5, 2, 1),
(2018000000, '20.0000', 61.33580987111494, 8, 3, 2),
(2018000000, '25.0000', 75.04405456345923, 5, 2, 1),
(2018000000, '25.0000', 76.66976233889368, 8, 3, 2),
(2018000000, '30.0000', 90.05286547615107, 5, 2, 1),
(2018000000, '30.0000', 92.0037148066724, 8, 3, 2),
(2018000000, '35.0000', 105.06167638884293, 5, 2, 1),
(2018000000, '35.0000', 107.33766727445114, 8, 3, 2),
(2018000000, '40.0000', 120.07048730153475, 5, 2, 1),
(2018000000, '40.0000', 122.67161974222988, 8, 3, 2),
(2018000000, '41.1950', 123.6575931096681, 5, 2, 1),
(2018000000, '41.1950', 126.33643438202898, 8, 3, 2),
(2018000001, '5.0000', 15.403568567056546, 8, 3, 2),
(2018000001, '10.0000', 30.80713713411309, 8, 3, 2),
(2018000001, '15.0000', 46.21070570116964, 8, 3, 2),
(2018000001, '20.0000', 61.61427426822618, 8, 3, 2),
(2018000001, '25.0000', 77.01784283528272, 8, 3, 2),
(2018000001, '30.0000', 92.42141140233927, 8, 3, 2),
(2018000001, '35.0000', 107.82497996939581, 8, 3, 2),
(2018000001, '40.0000', 123.22854853645237, 8, 3, 2),
(2018000001, '41.1950', 126.91000142397888, 8, 3, 2),
(2018000003, '5.0000', 17.374040548060616, 5, 2, 1),
(2018000003, '10.0000', 34.74808109612123, 5, 2, 1),
(2018000003, '15.0000', 52.12212164418185, 5, 2, 1),
(2018000003, '20.0000', 69.49616219224247, 5, 2, 1),
(2018000003, '25.0000', 86.87020274030309, 5, 2, 1),
(2018000003, '30.0000', 104.2442432883637, 5, 2, 1),
(2018000003, '35.0000', 121.61828383642433, 5, 2, 1),
(2018000003, '40.0000', 138.99232438448493, 5, 2, 1),
(2018000003, '41.1950', 143.14472007547144, 5, 2, 1),
(2018000004, '5.0000', 18.809172933490167, 8, 3, 2),
(2018000004, '10.0000', 37.618345866980334, 8, 3, 2),
(2018000004, '15.0000', 56.427518800470494, 8, 3, 2),
(2018000004, '20.0000', 75.23669173396067, 8, 3, 2),
(2018000004, '25.0000', 94.04586466745084, 8, 3, 2),
(2018000004, '30.0000', 112.85503760094099, 8, 3, 2),
(2018000004, '35.0000', 131.66421053443116, 8, 3, 2),
(2018000004, '40.0000', 150.47338346792134, 8, 3, 2),
(2018000004, '41.1950', 154.96877579902548, 8, 3, 2),
(2018000005, '5.0000', 20.099750556693266, 5, 2, 1),
(2018000005, '10.0000', 40.19950111338653, 5, 2, 1),
(2018000005, '15.0000', 60.29925167007979, 5, 2, 1),
(2018000005, '20.0000', 80.39900222677306, 5, 2, 1),
(2018000005, '25.0000', 100.49875278346633, 5, 2, 1),
(2018000005, '30.0000', 120.59850334015958, 5, 2, 1),
(2018000005, '35.0000', 140.69825389685286, 5, 2, 1),
(2018000005, '40.0000', 160.79800445354613, 5, 2, 1),
(2018000005, '41.1950', 165.6018448365958, 5, 2, 1),
(2018000008, '5.0000', 25.945128871487753, 5, 2, 1),
(2018000008, '5.0000', 21.333556643227304, 8, 3, 2),
(2018000008, '10.0000', 51.89025774297551, 5, 2, 1),
(2018000008, '10.0000', 42.66711328645461, 8, 3, 2),
(2018000008, '15.0000', 77.83538661446327, 5, 2, 1),
(2018000008, '15.0000', 64.00066992968192, 8, 3, 2),
(2018000008, '20.0000', 103.78051548595101, 5, 2, 1),
(2018000008, '20.0000', 85.33422657290922, 8, 3, 2),
(2018000008, '25.0000', 129.72564435743877, 5, 2, 1),
(2018000008, '25.0000', 106.66778321613651, 8, 3, 2),
(2018000008, '30.0000', 155.67077322892655, 5, 2, 1),
(2018000008, '30.0000', 128.00133985936384, 8, 3, 2),
(2018000008, '35.0000', 181.6159021004143, 5, 2, 1),
(2018000008, '35.0000', 149.33489650259114, 8, 3, 2),
(2018000008, '40.0000', 207.56103097190203, 5, 2, 1),
(2018000008, '40.0000', 170.66845314581843, 8, 3, 2),
(2018000008, '41.1950', 213.76191677218762, 5, 2, 1),
(2018000008, '41.1950', 175.76717318354974, 8, 3, 2),
(2018000009, '5.0000', 21.507110474589552, 8, 3, 2),
(2018000009, '10.0000', 43.014220949179105, 8, 3, 2),
(2018000009, '15.0000', 64.52133142376866, 8, 3, 2),
(2018000009, '20.0000', 86.02844189835821, 8, 3, 2),
(2018000009, '25.0000', 107.53555237294776, 8, 3, 2),
(2018000009, '30.0000', 129.04266284753731, 8, 3, 2),
(2018000009, '35.0000', 150.54977332212687, 8, 3, 2),
(2018000009, '40.0000', 172.05688379671642, 8, 3, 2),
(2018000009, '41.1950', 177.1970832001433, 8, 3, 2),
(2018000010, '5.0000', 22.411523627798854, 8, 3, 2),
(2018000010, '10.0000', 44.82304725559771, 8, 3, 2),
(2018000010, '15.0000', 67.23457088339656, 8, 3, 2),
(2018000010, '20.0000', 89.64609451119541, 8, 3, 2),
(2018000010, '25.0000', 112.05761813899426, 8, 3, 2),
(2018000010, '30.0000', 134.46914176679311, 8, 3, 2),
(2018000010, '35.0000', 156.88066539459197, 8, 3, 2),
(2018000010, '40.0000', 179.29218902239083, 8, 3, 2),
(2018000010, '41.1950', 184.64854316943476, 8, 3, 2),
(2018000011, '5.0000', 26.8623027744819, 5, 2, 1),
(2018000011, '5.0000', 22.485684009459252, 8, 3, 2),
(2018000011, '10.0000', 53.7246055489638, 5, 2, 1),
(2018000011, '10.0000', 44.971368018918504, 8, 3, 2),
(2018000011, '15.0000', 80.58690832344571, 5, 2, 1),
(2018000011, '15.0000', 67.45705202837775, 8, 3, 2),
(2018000011, '20.0000', 107.4492110979276, 5, 2, 1),
(2018000011, '20.0000', 89.94273603783701, 8, 3, 2),
(2018000011, '25.0000', 134.31151387240953, 5, 2, 1),
(2018000011, '25.0000', 112.42842004729626, 8, 3, 2),
(2018000011, '30.0000', 161.17381664689142, 5, 2, 1),
(2018000011, '30.0000', 134.9141040567555, 8, 3, 2),
(2018000011, '35.0000', 188.03611942137331, 5, 2, 1),
(2018000011, '35.0000', 157.39978806621477, 8, 3, 2),
(2018000011, '40.0000', 214.8984221958552, 5, 2, 1),
(2018000011, '40.0000', 179.88547207567402, 8, 3, 2),
(2018000011, '41.1950', 221.3185125589564, 5, 2, 1),
(2018000011, '41.1950', 185.25955055393476, 8, 3, 2),
(2018000013, '5.0000', 26.736957696499875, 8, 3, 2),
(2018000013, '10.0000', 53.47391539299975, 8, 3, 2),
(2018000013, '15.0000', 80.21087308949961, 8, 3, 2),
(2018000013, '20.0000', 106.9478307859995, 8, 3, 2),
(2018000013, '25.0000', 133.68478848249936, 8, 3, 2),
(2018000013, '30.0000', 160.42174617899923, 8, 3, 2),
(2018000013, '35.0000', 187.1587038754991, 8, 3, 2),
(2018000013, '40.0000', 213.895661571999, 8, 3, 2),
(2018000013, '41.1950', 220.28579446146244, 8, 3, 2),
(2018000014, '5.0000', 29.86561702469044, 8, 3, 2),
(2018000014, '10.0000', 59.73123404938088, 8, 3, 2),
(2018000014, '15.0000', 89.59685107407131, 8, 3, 2),
(2018000014, '20.0000', 119.46246809876176, 8, 3, 2),
(2018000014, '25.0000', 149.3280851234522, 8, 3, 2),
(2018000014, '30.0000', 179.19370214814262, 8, 3, 2),
(2018000014, '35.0000', 209.05931917283306, 8, 3, 2),
(2018000014, '40.0000', 238.92493619752352, 8, 3, 2),
(2018000014, '41.1950', 246.06281866642453, 8, 3, 2),
(2018000016, '5.0000', 16.19306107404607, 6, 2, 1),
(2018000016, '10.0000', 32.38612214809214, 6, 2, 1),
(2018000016, '15.0000', 48.57918322213821, 6, 2, 1),
(2018000016, '20.0000', 64.77224429618428, 6, 2, 1),
(2018000016, '21.1000', 68.33471773247443, 6, 2, 1),
(2018000017, '5.0000', 16.571612412212662, 6, 2, 1),
(2018000017, '10.0000', 33.143224824425324, 6, 2, 1),
(2018000017, '15.0000', 49.71483723663798, 6, 2, 1),
(2018000017, '20.0000', 66.28644964885065, 6, 2, 1),
(2018000017, '21.1000', 69.93220437953744, 6, 2, 1),
(2018000019, '5.0000', 19.40625673255173, 9, 3, 2),
(2018000019, '10.0000', 38.81251346510346, 9, 3, 2),
(2018000019, '15.0000', 58.21877019765518, 9, 3, 2),
(2018000019, '20.0000', 77.62502693020691, 9, 3, 2),
(2018000019, '21.1000', 81.8944034113683, 9, 3, 2),
(2018000020, '5.0000', 19.464097591171694, 9, 3, 2),
(2018000020, '10.0000', 38.92819518234339, 9, 3, 2),
(2018000020, '15.0000', 58.39229277351509, 9, 3, 2),
(2018000020, '20.0000', 77.85639036468677, 9, 3, 2),
(2018000020, '21.1000', 82.13849183474456, 9, 3, 2),
(2018000021, '5.0000', 18.154212519431457, 6, 2, 1),
(2018000021, '10.0000', 36.308425038862914, 6, 2, 1),
(2018000021, '15.0000', 54.462637558294375, 6, 2, 1),
(2018000021, '20.0000', 72.61685007772583, 6, 2, 1),
(2018000021, '21.1000', 76.61077683200077, 6, 2, 1),
(2018000023, '5.0000', 19.624656575689926, 6, 2, 1),
(2018000023, '10.0000', 39.24931315137985, 6, 2, 1),
(2018000023, '15.0000', 58.873969727069785, 6, 2, 1),
(2018000023, '20.0000', 78.4986263027597, 6, 2, 1),
(2018000023, '21.1000', 82.8160507494115, 6, 2, 1),
(2018000024, '5.0000', 20.07421936159934, 6, 2, 1),
(2018000024, '10.0000', 40.14843872319868, 6, 2, 1),
(2018000024, '15.0000', 60.22265808479802, 6, 2, 1),
(2018000024, '20.0000', 80.29687744639736, 6, 2, 1),
(2018000024, '21.1000', 84.71320570594922, 6, 2, 1),
(2018000027, '5.0000', 23.742633283075023, 6, 2, 1),
(2018000027, '10.0000', 47.485266566150045, 6, 2, 1),
(2018000027, '15.0000', 71.22789984922508, 6, 2, 1),
(2018000027, '20.0000', 94.97053313230009, 6, 2, 1),
(2018000027, '21.1000', 100.1939124545766, 6, 2, 1),
(2018000031, '5.0000', 15.835017763728846, 4, 2, 1),
(2018000031, '10.0000', 31.670035527457692, 4, 2, 1),
(2018000032, '5.0000', 16.381664341191993, 4, 2, 1),
(2018000032, '5.0000', 17.7252944300901, 7, 3, 2),
(2018000032, '10.0000', 32.763328682383985, 4, 2, 1),
(2018000032, '10.0000', 35.4505888601801, 7, 3, 2),
(2018000033, '5.0000', 17.9767213416548, 7, 3, 2),
(2018000033, '10.0000', 35.9534426833095, 7, 3, 2),
(2018000036, '5.0000', 19.2776846355693, 7, 3, 2),
(2018000036, '10.0000', 38.5553692711386, 7, 3, 2),
(2018000038, '5.0000', 20.315741406941214, 4, 2, 1),
(2018000038, '10.0000', 40.63148281388243, 4, 2, 1),
(2018000039, '5.0000', 23.2942684406164, 7, 3, 2),
(2018000039, '10.0000', 46.5885368812328, 7, 3, 2),
(2018000041, '5.0000', 23.61831472538076, 4, 2, 1),
(2018000041, '10.0000', 47.23662945076152, 4, 2, 1),
(2018000044, '5.0000', 28.499110612782744, 4, 2, 1),
(2018000044, '10.0000', 56.99822122556549, 4, 2, 1),
(2018000045, '5.0000', 26.406065397104378, 8, 3, 2),
(2018000045, '10.0000', 31.556041020830715, 8, 3, 2),
(2018000045, '15.0000', 59.01497836090411, 8, 3, 2),
(2018000045, '20.0000', 117.27171633753761, 8, 3, 2),
(2018000045, '25.0000', 142.0041684980146, 8, 3, 2),
(2018000045, '30.0000', 101.1842301273944, 8, 3, 2),
(2018000045, '35.0000', 136.95042628369154, 8, 3, 2),
(2018000045, '40.0000', 205.3763307453714, 8, 3, 2),
(2018000046, '5.0000', 27.424047084666906, 9, 3, 2),
(2018000046, '10.0000', 30.05557953462614, 9, 3, 2),
(2018000046, '15.0000', 79.72541102473862, 9, 3, 2),
(2018000046, '20.0000', 87.33477249739705, 9, 3, 2);

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
