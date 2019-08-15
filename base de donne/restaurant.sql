-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 15, 2019 at 06:03 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `prix` float NOT NULL,
  `date de commande` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idlivreur` int(11) DEFAULT NULL,
  `statut` enum('EN_COURS','ARRIVE','EN_PREPARATION','') NOT NULL DEFAULT 'EN_PREPARATION',
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `composition` (`idlivreur`),
  KEY `client_id_2` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `commandeelement`
--

DROP TABLE IF EXISTS `commandeelement`;
CREATE TABLE IF NOT EXISTS `commandeelement` (
  `idcommande` int(11) NOT NULL,
  `idelement` int(11) NOT NULL,
  KEY `id commande` (`idcommande`),
  KEY `id element` (`idelement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `element`
--

DROP TABLE IF EXISTS `element`;
CREATE TABLE IF NOT EXISTS `element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('boisson','dessert') NOT NULL,
  `name` varchar(64) NOT NULL,
  `prix` float NOT NULL,
  `stock` float NOT NULL DEFAULT '0',
  `idMedia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idMedia` (`idMedia`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `element`
--

INSERT INTO `element` (`id`, `type`, `name`, `prix`, `stock`, `idMedia`) VALUES
(8, 'boisson', 'Citron', 3.5, 0, 7),
(9, 'dessert', 'Choco Coco', 3, 0, 24),
(10, 'dessert', 'Perles de Chia', 3, 0, 25),
(11, 'boisson', 'Menthe', 3, 0, 26),
(12, 'dessert', 'Sorbet coco', 3, 0, 27),
(13, 'dessert', 'Sorbet Litchi', 3, 0, 28),
(14, 'dessert', 'Sorbet mangue', 3, 0, 29);

-- --------------------------------------------------------

--
-- Table structure for table `elementingredient`
--

DROP TABLE IF EXISTS `elementingredient`;
CREATE TABLE IF NOT EXISTS `elementingredient` (
  `idElement` int(11) NOT NULL,
  `idIngredient` int(11) NOT NULL,
  KEY `idElement` (`idElement`),
  KEY `idIngredient` (`idIngredient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `formule`
--

DROP TABLE IF EXISTS `formule`;
CREATE TABLE IF NOT EXISTS `formule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `dessert` int(11) DEFAULT NULL,
  `composition` int(11) DEFAULT NULL,
  `boisson` int(11) DEFAULT NULL,
  `prix` float NOT NULL,
  `publication` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `formule`
--

INSERT INTO `formule` (`id`, `name`, `dessert`, `composition`, `boisson`, `prix`, `publication`) VALUES
(1, 'Pitaya', NULL, 1, NULL, 15, '2019-08-02 16:57:20'),
(2, 'Medium Pitaya', NULL, 1, 1, 20, '2019-08-02 17:00:54'),
(3, 'Big Pitaya', 1, 1, 1, 25, '2019-08-02 17:01:20');

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `prix` float NOT NULL,
  `type` enum('BASE','PROTEINE','SUPPLEMENT') NOT NULL,
  `stock` float NOT NULL DEFAULT '0',
  `idMedia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idMedia` (`idMedia`),
  KEY `base` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`id`, `name`, `prix`, `type`, `stock`, `idMedia`) VALUES
(6, 'riz', 5, 'BASE', 0, 2),
(7, 'nouilles', 3, 'BASE', 0, 8),
(8, 'quinoa', 3, 'BASE', 0, 9),
(9, 'boeuf', 3, 'PROTEINE', 0, 10),
(10, 'poulet', 3, 'PROTEINE', 0, 11),
(11, 'crevettes', 3, 'PROTEINE', 0, 12),
(12, 'tofu', 3, 'PROTEINE', 0, 13),
(13, 'ciboulette', 3, 'SUPPLEMENT', 0, 14),
(15, 'menthe', 3, 'SUPPLEMENT', 0, 16),
(16, 'coriandre', 3, 'SUPPLEMENT', 0, 17),
(17, 'basilic', 3, 'SUPPLEMENT', 0, 18),
(18, 'citron vert', 3, 'SUPPLEMENT', 0, 19),
(19, 'oignons frits', 3, 'SUPPLEMENT', 0, 20),
(20, 'pousse de soja', 3, 'SUPPLEMENT', 0, 21),
(21, 'salade', 3, 'SUPPLEMENT', 0, 22),
(22, 'algues', 3, 'SUPPLEMENT', 0, 23);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `name`, `type`) VALUES
(1, 'chocococo.jpg', 'image/jpeg'),
(2, 'rice.jpg', 'image/jpeg'),
(3, 'sorbetlitchi.jpg', 'image/jpeg'),
(4, 'nouilles.jpg', 'image/jpeg'),
(5, 'nouilles.jpg', 'image/jpeg'),
(6, 'moussekala.jpg', 'image/jpeg'),
(7, 'citron.jpeg', 'image/jpeg'),
(8, 'nouilles.jpg', 'image/jpeg'),
(9, 'quinoa.jpg', 'image/jpeg'),
(10, 'boeuf.jpg', 'image/jpeg'),
(11, 'poulet.jpg', 'image/jpeg'),
(12, 'gambas.jpeg', 'image/jpeg'),
(13, 'toffu.webp', 'image/webp'),
(14, 'ciboulette.jpeg', 'image/jpeg'),
(15, 'ciboulette.jpeg', 'image/jpeg'),
(16, 'menthe.jpg', 'image/jpeg'),
(17, 'coriande.jpeg', 'image/jpeg'),
(18, 'basilic.jpeg', 'image/jpeg'),
(19, 'citron.jpeg', 'image/jpeg'),
(20, 'oignon.jpg', 'image/jpeg'),
(21, 'poussesdesoja.jpg', 'image/jpeg'),
(22, 'salade.jpg', 'image/jpeg'),
(23, 'algue.jpg', 'image/jpeg'),
(24, 'chocococo.jpg', 'image/jpeg'),
(25, 'perlesdechiamangue.jpg', 'image/jpeg'),
(26, 'menthe.jpg', 'image/jpeg'),
(27, 'sorbetcoco.jpg', 'image/jpeg'),
(28, 'sorbetlitchi.jpg', 'image/jpeg'),
(29, 'sorbetmangue.jpg', 'image/jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `nombreDePlace` int(11) NOT NULL,
  `nombreDeTable` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `dateReservation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `clientId` (`clientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tablereservation`
--

DROP TABLE IF EXISTS `tablereservation`;
CREATE TABLE IF NOT EXISTS `tablereservation` (
  `id_reservation` int(11) NOT NULL,
  `id_table` int(11) NOT NULL,
  KEY `id reservation` (`id_reservation`),
  KEY `id table` (`id_table`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
CREATE TABLE IF NOT EXISTS `tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombreDePlace` int(11) NOT NULL,
  `statut` enum('RESERVEE','LIBRE') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(64) DEFAULT NULL,
  `login` varchar(64) NOT NULL,
  `motDePasse` varchar(64) NOT NULL,
  `tel` varchar(64) DEFAULT NULL,
  `mail` varchar(64) NOT NULL,
  `dateInscription` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastName` varchar(64) DEFAULT NULL,
  `adress` varchar(64) DEFAULT NULL,
  `town` varchar(64) DEFAULT NULL,
  `role` enum('client','admin','livreur','') NOT NULL,
  `statut` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `firstName`, `login`, `motDePasse`, `tel`, `mail`, `dateInscription`, `lastName`, `adress`, `town`, `role`, `statut`) VALUES
(5, 'admin', 'admin', '$2y$10$xgX0NsTk1SYhJLgIf73lcuBMrd/JoE34vNZj7S5mSR6ZqQl51WQ1K', NULL, 'admin', '2019-08-14 16:00:53', 'admin', NULL, NULL, 'admin', NULL),
(6, 'Georges', 'georges', '$2y$10$lrYiNt8ub1W8GgbIWTxXD..oPev3xLidOYlw52HVdumPu.WhVQQCu', NULL, 'georges', '2019-08-14 16:13:00', 'Nahal', NULL, NULL, 'client', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `utilisateur` (`id`);

--
-- Constraints for table `commandeelement`
--
ALTER TABLE `commandeelement`
  ADD CONSTRAINT `commandeElement_ibfk_1` FOREIGN KEY (`idcommande`) REFERENCES `commande` (`id`),
  ADD CONSTRAINT `commandeElement_ibfk_2` FOREIGN KEY (`idelement`) REFERENCES `element` (`id`);

--
-- Constraints for table `element`
--
ALTER TABLE `element`
  ADD CONSTRAINT `element_ibfk_1` FOREIGN KEY (`idMedia`) REFERENCES `media` (`id`);

--
-- Constraints for table `elementingredient`
--
ALTER TABLE `elementingredient`
  ADD CONSTRAINT `elementIngredient_ibfk_1` FOREIGN KEY (`idIngredient`) REFERENCES `ingredient` (`id`),
  ADD CONSTRAINT `elementIngredient_ibfk_2` FOREIGN KEY (`idElement`) REFERENCES `element` (`id`);

--
-- Constraints for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`idMedia`) REFERENCES `media` (`id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `utilisateur` (`id`);

--
-- Constraints for table `tablereservation`
--
ALTER TABLE `tablereservation`
  ADD CONSTRAINT `tableReservation_ibfk_1` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id`),
  ADD CONSTRAINT `tableReservation_ibfk_2` FOREIGN KEY (`id_table`) REFERENCES `tables` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
