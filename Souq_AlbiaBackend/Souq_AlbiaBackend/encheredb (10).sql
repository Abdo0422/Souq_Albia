-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 04 Octobre 2024 à 19:32
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `encheredb`
--

-- --------------------------------------------------------

--
-- Structure de la table `acheteur`
--

CREATE TABLE IF NOT EXISTS `acheteur` (
  `id` int(11) NOT NULL,
  `Adresse_Livraison` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `acheteur`
--

INSERT INTO `acheteur` (`id`, `Adresse_Livraison`) VALUES
(9, NULL),
(10, NULL),
(11, NULL),
(12, NULL),
(13, NULL),
(14, NULL),
(15, NULL),
(16, NULL),
(17, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `admin`
--

INSERT INTO `admin` (`id`) VALUES
(11);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `id_categorie` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `nom`, `image`, `description`) VALUES
(1, 'Décoration de maison', 'Images/Categorie/Décorationmaison.jpg', 'Découvrez l''inspiration pour votre chez-vous'),
(2, 'Bijoux et Montres', 'Images/Categorie/BijouxMontres.jpg', 'Éclat à votre portée'),
(3, 'Électronique et Informatique', 'Images/Categorie/informatique.jpg', 'Technologie en vue'),
(4, 'Mode et Accessoires', 'Images/Categorie/ModeAccessoires.jpg', 'Style à saisir'),
(5, 'Art et Objets de Collection', 'Images/Categorie/ArtCollection.jpg', 'Trésors uniques'),
(6, 'Automobiles et Véhicules', 'Images/Categorie/AutomobilesVéhicules.png', 'Puissance à découvrir');

-- --------------------------------------------------------

--
-- Structure de la table `enchere`
--

CREATE TABLE IF NOT EXISTS `enchere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produit_id` int(11) DEFAULT NULL,
  `dateDebut` datetime DEFAULT NULL,
  `dateFin` datetime DEFAULT NULL,
  `prixDepart` float DEFAULT NULL,
  `prixActuel` float DEFAULT NULL,
  `id_sous_categorie` int(11) DEFAULT NULL,
  `nombre_de_bids` int(11) DEFAULT '0',
  `acheteur_id` int(11) DEFAULT NULL,
  `vendeur_id` int(11) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'inactive',
  `transaction_completed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produit_id` (`produit_id`),
  KEY `fk_enchere_souscategorie` (`id_sous_categorie`),
  KEY `fk_enchere_acheteur` (`acheteur_id`),
  KEY `fk_enchere_vendeur` (`vendeur_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=230 ;

--
-- Contenu de la table `enchere`
--

INSERT INTO `enchere` (`id`, `produit_id`, `dateDebut`, `dateFin`, `prixDepart`, `prixActuel`, `id_sous_categorie`, `nombre_de_bids`, `acheteur_id`, `vendeur_id`, `status`, `transaction_completed_at`) VALUES
(36, 32, '2024-10-01 00:00:00', '2024-10-02 00:00:00', 1500, 1550, 2, 3, 10, 9, 'active', NULL),
(37, 33, '2024-10-17 00:00:00', '2024-10-08 00:00:00', 7000, 7150, 19, 2, 10, 9, 'active', NULL),
(38, 34, '2024-10-02 00:00:00', '2024-10-03 12:30:00', 4000, 6070, 22, 24, 11, 9, 'active', '2024-10-03 22:40:13'),
(39, 35, '2024-10-10 00:00:00', '2024-10-06 00:00:00', 10000, 10300, 2, 4, 13, 9, 'active', NULL),
(40, 36, '2024-10-09 00:00:00', '2024-10-07 00:00:00', 5000, 5040, 2, 1, 11, 9, 'active', NULL),
(201, 101, '2024-10-09 00:00:00', '2024-10-18 00:00:00', 10, 10, 1, 0, NULL, 10, 'active', NULL),
(202, 102, '2024-10-11 00:00:00', '2024-10-13 00:00:00', 15, 150, 2, 1, 11, 11, 'active', NULL),
(203, 103, '2024-10-17 00:00:00', '2024-10-10 00:00:00', 20, 20, 3, 0, NULL, 15, 'active', NULL),
(204, 104, '2024-10-16 00:00:00', '2024-10-26 00:00:00', 5, 5, 4, 0, NULL, 10, 'active', NULL),
(205, 105, '2024-10-07 00:00:00', '2024-10-17 00:00:00', 50, 50, 5, 0, NULL, 9, 'active', NULL),
(206, 106, '2024-10-15 00:00:00', '2024-10-06 00:00:00', 600, 600, 6, 0, NULL, 11, 'active', NULL),
(207, 107, '2024-10-05 00:00:00', '2024-10-19 00:00:00', 400, 400, 7, 0, NULL, 10, 'active', NULL),
(208, 108, '2024-10-05 00:00:00', '2024-10-18 00:00:00', 200, 200, 8, 0, NULL, 9, 'active', NULL),
(209, 109, '2024-10-10 00:00:00', '2024-10-16 00:00:00', 25, 25, 9, 0, NULL, 10, 'active', NULL),
(210, 110, '2024-10-16 00:00:00', '2024-10-17 00:00:00', 30, 30, 10, 0, NULL, 12, 'active', NULL),
(211, 111, '2024-10-10 00:00:00', '2024-10-06 00:00:00', 40, 40, 11, 0, NULL, 15, 'active', NULL),
(212, 112, '2024-10-16 00:00:00', '2024-10-08 00:00:00', 60, 60, 12, 0, NULL, 11, 'active', NULL),
(213, 113, '2024-10-15 00:00:00', '2024-10-04 00:00:00', 1000, 1000, 13, 0, NULL, 10, 'active', NULL),
(214, 114, '2024-10-07 00:00:00', '2024-10-12 00:00:00', 800, 800, 14, 0, NULL, 13, 'active', NULL),
(215, 115, '2024-10-03 00:00:00', '2024-10-07 00:00:00', 500, 500, 15, 0, NULL, 9, 'active', NULL),
(216, 116, '2024-10-13 10:00:00', '2024-10-23 10:00:00', 50000, 50000, 16, 0, NULL, 10, 'active', NULL),
(217, 117, '2024-10-14 10:00:00', '2024-10-24 10:00:00', 300, 300, 17, 0, NULL, 15, 'active', NULL),
(218, 118, '2024-10-15 10:00:00', '2024-10-25 10:00:00', 200, 200, 18, 0, NULL, 15, 'active', NULL),
(219, 119, '2024-10-16 10:00:00', '2024-10-26 10:00:00', 150, 150, 19, 0, NULL, 15, 'active', NULL),
(220, 120, '2024-10-17 10:00:00', '2024-10-27 10:00:00', 400, 400, 20, 0, NULL, 15, 'active', NULL),
(221, 121, '2024-10-18 10:00:00', '2024-10-28 10:00:00', 50, 50, 21, 0, NULL, 9, 'active', NULL),
(222, 122, '2024-10-19 10:00:00', '2024-10-29 10:00:00', 30, 50, 22, 1, 11, 9, 'active', NULL),
(223, 123, '2024-10-20 10:00:00', '2024-10-30 10:00:00', 70, 70, 23, 0, NULL, 9, 'active', NULL),
(224, 124, '2024-10-21 10:00:00', '2024-10-31 10:00:00', 100, 100, 24, 0, NULL, 9, 'active', NULL),
(225, 125, '2024-10-03 21:29:41', '2024-10-06 21:29:41', 1500, 1500, 7, 0, NULL, 11, 'active', NULL),
(226, 126, '2024-10-04 12:05:07', '2024-10-11 12:05:07', 10000, 11000, 16, 1, 17, 11, 'active', NULL),
(227, 127, '2024-10-04 12:09:32', '2024-10-11 12:09:32', 20000, 20000, 6, 0, NULL, 11, 'active', NULL),
(229, 128, '2024-10-04 19:26:17', '2024-10-11 19:26:17', 150000, 150000, 16, 0, NULL, 17, 'active', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expediteur_id` int(11) DEFAULT NULL,
  `destinataire_id` int(11) DEFAULT NULL,
  `contenu` text,
  `dateEnvoi` timestamp NULL DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `message_ibfk_1` (`expediteur_id`),
  KEY `message_ibfk_2` (`destinataire_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=190 ;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `description` varchar(9999) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `localisation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=129 ;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`id`, `nom`, `description`, `state`, `image`, `localisation`) VALUES
(32, 'Œuvre d''art unique par Van Gogh - Les Tournesols', 'Cette œuvre d''art est une peinture emblématique de Van Gogh, représentant des tournesols dans un vase. La peinture est réalisée à l''huile sur toile, avec des couleurs vibrantes et une texture riche. Elle mesure 70x90 cm et est en excellent état.', 'excellent', 'files/f343bfd3ae9f40129df7a96a7df0f879.webp', 'États-Unis'),
(33, ' Bijou antique par Fabergé - Œuf en Émail', 'Œuf en émail fabriqué par Fabergé, orné de détails en or et pierres précieuses. Le bijou est en excellent état avec un mécanisme secret à l''intérieur. Dimensions : 15 cm de hauteur.', 'utilisés pour pièces', 'files/telecharger.jpg', 'Russie'),
(34, 'Tapis persan antique - Motifs Traditionnels', 'Tapis persan ancien avec des motifs traditionnels. La pièce est en laine de haute qualité, mesurant 2x3 mètres, avec des couleurs riches et un design complexe. Le tapis est en très bon état malgré quelques signes d''usure.', 'bon', 'files/OIP.jpg', 'Émirats Arabes Unis'),
(35, 'Peinture abstraite par Jackson Pollock - Composition', 'Peinture abstraite réalisée par Jackson Pollock, utilisant la technique de l''éclaboussure de peinture. La toile est de 100x100 cm, avec des couleurs vives et un style dynamique. L''œuvre est en bon état et possède un cadre moderne.', 'acceptable', 'files/OIP (1).jpg', 'Royaume-Uni'),
(36, 'Photographie rare par Ansel Adams - Moonrise', 'Photographie en noir et blanc prise par Ansel Adams, montrant le lever de la lune sur un paysage montagneux. Tirage limité, signé par l''artiste, avec des détails exquis et une qualité exceptionnelle. Dimensions : 60x90 cm.', 'excellent', 'files/OIP (2).jpg', 'États-Unis'),
(58, 'fffffffffffff', 'sssssssssss', 'excellent', 'files/more (1).png', 'Arabie Saoudite'),
(59, 'Write a title that summarizes your document to increase your chance', 'xxxxxxxxxxxxxxxxx', 'excellent', 'files/3.PNG', 'Allemagne'),
(60, 'Write a title that summarizes your document to increase your chance', 'ooooooooooooooo', 'bon', 'files/6.PNG', 'Allemagne'),
(61, 'Write a title that summarizes your document to increase your chance', 'kkkkkkkkkkkk', 'excellent', 'files/4.PNG', 'Allemagne'),
(62, 'Œuvre d''art unique par Van Gogh - Les Tournesols', 'aaaaaaaaaaaaaaaa', 'excellent', 'files/125.PNG', 'Afrique du Sud'),
(63, ' Bijou antique par Fabergé - Œuf en Émail', 'sssssssssssss', 'excellent', 'files/5.PNG', 'États-Unis'),
(64, 'Peinture abstraite par Jackson Pollock - Composition', 'sssssssssssss', 'bon', 'files/1.PNG', 'États-Unis'),
(65, 'Un portrait de Cliopatra', 'ssssssssssss', 'excellent', 'files/1.PNG', 'Nouvelle-Zélande'),
(66, 'Un portrait de Cliopatra', 'aaaaaaaaaaaaaaa', 'excellent', 'files/4.PNG', 'Nouvelle-Zélande'),
(67, 'Un portrait de Cliopatra', 'un portrait très authentique ', 'excellent', 'files/2897b4165c1311c6e8e379e15bdb3278.jpg', 'Nouvelle-Zélande'),
(68, 'Write a title that summarizes your document to increase your chance', 'cool hat', 'utilisés pour pièces', 'files/person.png', 'Maroc'),
(101, 'Figurine de collection', 'Figurine en résine représentant un personnage', 'Excellent', 'files/fig1.jpeg', 'Rabat'),
(102, 'Peinture à l’huile', 'Peinture d’un paysage', 'Bon', 'files/art1.jpeg', 'Marrakech'),
(103, 'Pièce de monnaie antique', 'Pièce en or du Moyen Âge', 'Acceptable', 'files/coin1.jpeg', 'Casablanca'),
(104, 'Timbre rare', 'Timbre de collection en parfait état', 'Utilisés pour pièces', 'files/stamp1.jpeg', 'Fès'),
(105, 'Casque audio Bluetooth', 'Casque sans fil avec réduction de bruit', 'Excellent', 'files/headphone1.jpg', 'Tanger'),
(106, 'Ordinateur portable HP', 'Ordinateur portable 15 pouces', 'Bon', 'files/laptop1.jpg', 'Agadir'),
(107, 'Smartphone Samsung', 'Smartphone dernière génération', 'Excellent', 'files/smartphone1.jpeg', 'Oujda'),
(108, 'Caméra reflex', 'Caméra numérique avec objectifs interchangeables', 'Acceptable', 'files/camera1.jpeg', 'Kenitra'),
(109, 'Chapeau de paille', 'Chapeau léger pour l’été', 'Bon', 'files/hat1.jpeg', 'Tangier'),
(110, 'Lunettes de soleil Ray-Ban', 'Lunettes de soleil classiques', 'Excellent', 'files/sunglasses1.jpg', 'Marrakech'),
(111, 'Sac à main en cuir', 'Sac à main élégant pour femme', 'Bon', 'files/bag1.jpeg', 'Rabat'),
(112, 'T-shirt en coton', 'T-shirt simple en coton', 'Utilisés pour pièces', 'files/tshirt1.jpg', 'Casablanca'),
(113, 'ATV tout terrain', 'Véhicule tout terrain', 'Excellent', 'files/atv1.jpeg', 'Marrakech'),
(114, 'Vélo électrique', 'Vélo avec assistance électrique', 'Bon', 'files/ebike1.jpeg', 'Agadir'),
(115, 'Voiture de luxe', 'Voiture avec toutes les options', 'Excellent', 'files/luxurycar1.jpeg', 'Rabat'),
(116, 'Voiture de sport', 'Voiture rapide et sportive', 'Acceptable', 'files/sportscar1.jpeg', 'Marrakech'),
(117, 'Bague en or', 'Bague en or 18 carats', 'Excellent', 'files/ring1.jpeg', 'Tanger'),
(118, 'Boucles d’oreilles en argent', 'Boucles d’oreilles en argent sterling', 'Bon', 'files/earing1.jpeg', 'Oujda'),
(119, 'Collier en perles', 'Collier élégant en perles', 'Acceptable', 'files/necklace1.jpeg', 'Casablanca'),
(120, 'Montre-bracelet en cuir', 'Montre classique avec bracelet en cuir', 'Utilisés pour pièces', 'files/watch1.jpg', 'Fès'),
(121, 'Cadre photo en bois', 'Cadre en bois pour photos', 'Excellent', 'files/frame1.jpeg', 'Rabat'),
(122, 'Coussin décoratif', 'Coussin avec motifs modernes', 'Bon', 'files/pillow1.jpeg', 'Marrakech'),
(123, 'Horloge murale', 'Horloge moderne pour décoration', 'Acceptable', 'files/clock1.jpg', 'Casablanca'),
(124, 'Vase en céramique', 'Vase décoratif en céramique', 'Bon', 'files/vase1.jpeg', 'Agadir'),
(125, 'Samsung A7', 'Samsung telephone\r\n8ram\r\n16 Gb', 'bon', 'files/OIP (13).jpeg', 'Maroc'),
(126, 'UNO ', 'Voiture aucien', 'acceptable', 'files/R (6).jpeg', 'Maroc'),
(127, 'APPLE MRYR3FN/A', 'Reference fournisseur	MRYR3FN/A\r\nMarque	APPLE\r\nGARANTIE	1 AN\r\nPROCESSEUR	M3\r\nMODELE DU PROCESSEUR	Apple M3 (8-Core/GPU8-Core)\r\nFREQUENCE	\r\nTAILLE D''ÉCRAN	15\r\nMÉMOIRE VIVE (RAM)	8\r\nCAPACITE DISQUE DUR HDD	\r\nCAPACITE DISQUE DUR SSD	256\r\nCARTE GRAPHIQUE	Apple M3 GPU 8 cœurs\r\nMODELE DU PROCESSEUR GRAPHIQUE	\r\nSYSTÈME D''EXPLOITATION	MAC OS', 'excellent', 'files/3031100_3031094_3031095_1_1-removebg-preview.png', 'Maroc'),
(128, 'Mercedese C class', 'voitures très luxe ', 'bon', 'files/R (7).jpeg', 'Maroc');

-- --------------------------------------------------------

--
-- Structure de la table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enchere_id` int(11) NOT NULL,
  `reason` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `enchere_id` (`enchere_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `reports`
--

INSERT INTO `reports` (`id`, `enchere_id`, `reason`, `created_at`) VALUES
(1, 36, 'bad', '2024-10-03 15:42:36');

-- --------------------------------------------------------

--
-- Structure de la table `souscategorie`
--

CREATE TABLE IF NOT EXISTS `souscategorie` (
  `id_sous_categorie` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `id_categorie` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_sous_categorie`),
  KEY `id_categorie` (`id_categorie`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Contenu de la table `souscategorie`
--

INSERT INTO `souscategorie` (`id_sous_categorie`, `nom`, `id_categorie`, `image`) VALUES
(1, 'Figurines', 5, 'Images/SousCategorie/art1.png'),
(2, 'Peintures', 5, 'Images/SousCategorie/art2.png'),
(3, 'Pièces de monnaie', 5, 'Images/SousCategorie/art3.png'),
(4, 'Timbres', 5, 'Images/SousCategorie/art4.png'),
(5, 'Casques audio', 3, 'Images/SousCategorie/info1.png'),
(6, 'Ordinateurs portables', 3, 'Images/SousCategorie/info2.png'),
(7, 'Smartphones', 3, 'Images/SousCategorie/info3.png'),
(8, 'Camera', 3, 'Images/SousCategorie/info4.png'),
(9, 'Chapeaux', 4, 'Images/SousCategorie/mode1.png'),
(10, 'Lunettes de soleil', 4, 'Images/SousCategorie/mode2.png'),
(11, 'Sacs', 4, 'Images/SousCategorie/mode3.png'),
(12, 'Vêtements', 4, 'Images/SousCategorie/mode4.png'),
(13, 'Véhicules tout-terrain (ATV)', 6, 'Images/SousCategorie/auto1.png'),
(14, 'Vélos électriques', 6, 'Images/SousCategorie/auto2.png'),
(15, 'Voitures de luxe', 6, 'Images/SousCategorie/auto3.png'),
(16, 'Voitures de sport', 6, 'Images/SousCategorie/auto4.png'),
(17, 'Bagues', 2, 'Images/SousCategorie/bij1.png'),
(18, 'Boucles d''oreilles', 2, 'Images/SousCategorie/bij2.png'),
(19, 'Colliers', 2, 'Images/SousCategorie/bij3.png'),
(20, 'Montres-bracelets', 2, 'Images/SousCategorie/bij4.png'),
(21, 'Cadres photo', 1, 'Images/SousCategorie/deco1.png'),
(22, 'Coussins décoratifs', 1, 'Images/SousCategorie/deco2.png'),
(23, 'Horloges murales', 1, 'Images/SousCategorie/deco3.png'),
(24, 'Vases', 1, 'Images/SousCategorie/deco4.png');

-- --------------------------------------------------------

--
-- Structure de la table `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `montant` float DEFAULT NULL,
  `date` date DEFAULT NULL,
  `statut` varchar(50) DEFAULT NULL,
  `acheteur_id` int(11) DEFAULT NULL,
  `vendeur_id` int(11) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `enchere_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `acheteur_id` (`acheteur_id`),
  KEY `vendeur_id` (`vendeur_id`),
  KEY `fk_transaction_enchere` (`enchere_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `transaction`
--

INSERT INTO `transaction` (`id`, `montant`, `date`, `statut`, `acheteur_id`, `vendeur_id`, `payment_method`, `enchere_id`) VALUES
(13, 6070, '2024-10-03', 'Completed', 11, 9, 'paypal', 38);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `addresse` varchar(255) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `RegistrationDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `email`, `password`, `addresse`, `telephone`, `RegistrationDate`) VALUES
(9, 'abderrahmane', 'mylifeasabdo@gmail.com', '$2y$10$r3oD4Zj2EmxGztEpr7XKzOyUPs2CJgYA8B7ryeM7QvFXnKTkZI2tG', '', '0643449779', '2024-09-06'),
(10, 'user1', 'jean@email.com', '$2y$10$FeGI6UtX.HYtLhuhhG.HYuzUnl4OcpNx4Qfg0.LMwoQpk0Ip47iya', 'Jean Dupont 25 Rue de la Liberté 75001 Paris France', '0645127845', '2024-09-06'),
(11, 'admin', 'john@mail.com', '$2y$10$kH/O9FuqJ4fyDQrbS7E6FOAdyYUaUovjp0QOZzK09AHsChU2Md54G', 'Jean Dupont 25 Rue de la Liberté 75001 Paris France', '0643449770', '2024-09-08'),
(12, 'abderrahmane loubachi', 'abderrahmanelouybachi@gmail.com', '$2y$10$mFgQRgfJ5gOqsi1p/y9ZFumO50fW80ywKmlrlLASNvbPK6CIkkHk.', '', '0643449779', '2024-09-20'),
(13, 'abderrahmane loubachi', 'abderrahmanelouybachi22@gmail.com', '$2y$10$TdBEt9wHdIUNsboI2KVvzeDl1jlbBt.8.12s29aqhGfwgXAYStwLa', '', '0643449779', '2024-09-20'),
(14, 'abderrahmane loubachi', 'mylifeasabdo88@gmail.com', '$2y$10$HW2StjIhgVqGi.uDJQMtoOX8Unx5MV697zpQ6hd0MY.6N2fNlkM66', '', '0643449779', '2024-09-26'),
(15, 'User Abdo', 'userabdo@gmail.com', '$2y$10$XORViCo0CGFQsrXMac2jIu/P79EWKspr5l22Wd8aTz4rjwoK0DlNq', '', '0678451256', '2024-09-26'),
(16, 'abdo loubachi', 'userabdo66@gmail.com', '$2y$10$ABc.hYI2ANSyh9CZa7vJM.STk2HiWN5ofkKLwjGKnZ1Y6YMe9Xs0y', '', '0678451256', '2024-09-27'),
(17, 'abderrahmane loubachi', 'mylifeasabdo02@gmail.com', '$2y$10$da/5rzGft18leqpm3XQEjOQOer/qU2ohcS00GbPW.nJsWtJag.B0q', '', '0643449779', '2024-10-04');

-- --------------------------------------------------------

--
-- Structure de la table `vendeur`
--

CREATE TABLE IF NOT EXISTS `vendeur` (
  `id` int(11) NOT NULL,
  `Adresse_Expedition` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vendeur`
--

INSERT INTO `vendeur` (`id`, `Adresse_Expedition`) VALUES
(9, NULL),
(10, NULL),
(11, NULL),
(12, NULL),
(13, NULL),
(14, NULL),
(15, NULL),
(16, NULL),
(17, NULL);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `acheteur`
--
ALTER TABLE `acheteur`
  ADD CONSTRAINT `acheteur_ibfk_1` FOREIGN KEY (`id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `enchere`
--
ALTER TABLE `enchere`
  ADD CONSTRAINT `enchere_ibfk_1` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`),
  ADD CONSTRAINT `fk_enchere_acheteur` FOREIGN KEY (`acheteur_id`) REFERENCES `acheteur` (`id`),
  ADD CONSTRAINT `fk_enchere_souscategorie` FOREIGN KEY (`id_sous_categorie`) REFERENCES `souscategorie` (`id_sous_categorie`),
  ADD CONSTRAINT `fk_enchere_vendeur` FOREIGN KEY (`vendeur_id`) REFERENCES `vendeur` (`id`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`expediteur_id`) REFERENCES `utilisateur` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`destinataire_id`) REFERENCES `utilisateur` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`enchere_id`) REFERENCES `enchere` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `fk_transaction_enchere` FOREIGN KEY (`enchere_id`) REFERENCES `enchere` (`id`),
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`acheteur_id`) REFERENCES `acheteur` (`id`),
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`vendeur_id`) REFERENCES `vendeur` (`id`);

--
-- Contraintes pour la table `vendeur`
--
ALTER TABLE `vendeur`
  ADD CONSTRAINT `vendeur_ibfk_1` FOREIGN KEY (`id`) REFERENCES `utilisateur` (`id`);

DELIMITER $$
--
-- Événements
--
CREATE DEFINER=`root`@`localhost` EVENT `delete_old_encheres` ON SCHEDULE EVERY 1 DAY STARTS '2024-10-03 22:40:51' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    DELETE FROM enchere
    WHERE transaction_completed_at < NOW() - INTERVAL 10 DAY
      AND status = 'inactive'; -- Assuming you want to delete only inactive transactions
END$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
