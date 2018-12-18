-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 18 déc. 2018 à 07:33
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `title`, `content`, `image`, `created_at`) VALUES
(1, 'Titre de l\'article n°1', '<p>Contenu de l\'article n°1</p>', 'http://placehold.it/350x150', '2018-11-28 12:08:07'),
(2, 'Titre de l\'article n°2', '<p>Contenu de l\'article n°2</p>', 'http://placehold.it/350x150', '2018-11-28 12:08:07'),
(3, 'Titre de l\'article n°3', '<p>Contenu de l\'article n°3</p>', 'http://placehold.it/350x150', '2018-11-28 12:08:07'),
(4, 'Titre de l\'article n°4', '<p>Contenu de l\'article n°4</p>', 'http://placehold.it/350x150', '2018-11-28 12:08:07'),
(5, 'Titre de l\'article n°5', '<p>Contenu de l\'article n°5</p>', 'http://placehold.it/350x150', '2018-11-28 12:08:07'),
(6, 'Titre de l\'article n°6', '<p>Contenu de l\'article n°6</p>', 'http://placehold.it/350x150', '2018-11-28 12:08:07'),
(7, 'Titre de l\'article n°7', '<p>Contenu de l\'article n°7</p>', 'http://placehold.it/350x150', '2018-11-28 12:08:07'),
(8, 'Titre de l\'article n°8', '<p>Contenu de l\'article n°8</p>', 'http://placehold.it/350x150', '2018-11-28 12:08:07'),
(9, 'Titre de l\'article n°9', '<p>Contenu de l\'article n°9</p>', 'http://placehold.it/350x150', '2018-11-28 12:08:07'),
(10, 'Titre de l\'article n°10', '<p>Contenu de l\'article n°10</p>', 'http://placehold.it/350x150', '2018-11-28 12:08:07');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`) VALUES
('20181121151833');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
