-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  mar. 30 avr. 2019 à 12:40
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
-- Base de données :  `baselifbdw1_p1714033_p1707606`
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
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Adherent`
--
ALTER TABLE `Adherent`
  ADD CONSTRAINT `utilisateur_adherent_fk` FOREIGN KEY (`pseudo`) REFERENCES `Utilisateur` (`pseudo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
