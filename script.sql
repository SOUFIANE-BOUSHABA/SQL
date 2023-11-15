-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 15 nov. 2023 à 19:22
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `connectevent`
--

-- --------------------------------------------------------

--
-- Structure de la table `billets`
--

DROP TABLE IF EXISTS `billets`;
CREATE TABLE IF NOT EXISTS `billets` (
  `id_billet` int NOT NULL,
  `id_participant` int DEFAULT NULL,
  `id_evenement` int DEFAULT NULL,
  `id_retour` int DEFAULT NULL,
  `TypeBillet` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_billet`),
  KEY `id_participant` (`id_participant`),
  KEY `id_evenement` (`id_evenement`),
  KEY `id_retour` (`id_retour`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `evenements`
--

DROP TABLE IF EXISTS `evenements`;
CREATE TABLE IF NOT EXISTS `evenements` (
  `id_evenement` int NOT NULL,
  `id_lieu` int DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `dateEvenement` date DEFAULT NULL,
  PRIMARY KEY (`id_evenement`),
  KEY `id_lieu` (`id_lieu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lieux`
--

DROP TABLE IF EXISTS `lieux`;
CREATE TABLE IF NOT EXISTS `lieux` (
  `id_lieu` int NOT NULL,
  `placenom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_lieu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `organisateurs`
--

DROP TABLE IF EXISTS `organisateurs`;
CREATE TABLE IF NOT EXISTS `organisateurs` (
  `id_organisateur` int NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_organisateur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `organisé`
--

DROP TABLE IF EXISTS `organisé`;
CREATE TABLE IF NOT EXISTS `organisé` (
  `id_organisateur` int NOT NULL,
  `id_evenement` int NOT NULL,
  PRIMARY KEY (`id_evenement`,`id_organisateur`),
  KEY `id_organisateur` (`id_organisateur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `participants`
--

DROP TABLE IF EXISTS `participants`;
CREATE TABLE IF NOT EXISTS `participants` (
  `id_participant` int NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_participant`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `retours`
--

DROP TABLE IF EXISTS `retours`;
CREATE TABLE IF NOT EXISTS `retours` (
  `id_retour` int NOT NULL,
  `montant` int DEFAULT NULL,
  PRIMARY KEY (`id_retour`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sponsoriser`
--

DROP TABLE IF EXISTS `sponsoriser`;
CREATE TABLE IF NOT EXISTS `sponsoriser` (
  `id_evenement` int NOT NULL,
  `id_sponsor` int NOT NULL,
  PRIMARY KEY (`id_evenement`,`id_sponsor`),
  KEY `id_sponsor` (`id_sponsor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sponsors`
--

DROP TABLE IF EXISTS `sponsors`;
CREATE TABLE IF NOT EXISTS `sponsors` (
  `id_sponsor` int NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_sponsor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
