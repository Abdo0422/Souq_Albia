-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 04 Septembre 2024 à 15:27
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `acheteur_enchere`
--

CREATE TABLE IF NOT EXISTS `acheteur_enchere` (
  `acheteur_id` int(11) NOT NULL DEFAULT '0',
  `enchere_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`acheteur_id`,`enchere_id`),
  KEY `enchere_id` (`enchere_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `acheteur_transaction`
--

CREATE TABLE IF NOT EXISTS `acheteur_transaction` (
  `acheteur_id` int(11) NOT NULL DEFAULT '0',
  `transaction_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`acheteur_id`,`transaction_id`),
  KEY `transaction_id` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `dateDebut` date DEFAULT NULL,
  `dateFin` date DEFAULT NULL,
  `prixDepart` float DEFAULT NULL,
  `prixActuel` float DEFAULT NULL,
  `id_sous_categorie` int(11) DEFAULT NULL,
  `nombre_de_bids` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `produit_id` (`produit_id`),
  KEY `fk_enchere_souscategorie` (`id_sous_categorie`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `enchere`
--

INSERT INTO `enchere` (`id`, `produit_id`, `dateDebut`, `dateFin`, `prixDepart`, `prixActuel`, `id_sous_categorie`, `nombre_de_bids`) VALUES
(4, 1, '2024-03-09', '2024-03-12', 500, 500, 7, 1),
(5, 2, '2024-03-25', '2024-04-01', 1000, 1000, 6, 2),
(6, 3, '2024-03-26', '2024-04-02', 1500, 1500, 8, 3);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expediteur_id` int(11) DEFAULT NULL,
  `destinataire_id` int(11) DEFAULT NULL,
  `contenu` text,
  `dateEnvoi` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expediteur_id` (`expediteur_id`),
  KEY `destinataire_id` (`destinataire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `description` text,
  `state` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `localisation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`id`, `nom`, `description`, `state`, `image`, `localisation`) VALUES
(1, 'Smartphone', 'Description of smartphone', 'Bon', 'Images/Smartphone.jpg', 'USA'),
(2, 'Laptop', 'Description of laptop', 'Excellent', 'Images/laptop.jpeg', 'Germany'),
(3, 'Camera', 'Description of camera', 'Acceptable', 'Images/camera.jpg', 'France');

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
  PRIMARY KEY (`id`),
  KEY `acheteur_id` (`acheteur_id`),
  KEY `vendeur_id` (`vendeur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `email`, `password`, `addresse`, `telephone`, `RegistrationDate`) VALUES
(2, 'aaaaaaaaaaaaa', 'mylifeasabdo22@gmail.com', '$2y$10$9GZyaOuR320ez0cZwJcgTeicq5R8k6eABMCgHCUntnFcIjXPqv8dC', '', '0643449779', '2024-09-01'),
(3, 'aaaaaaaaaaaaa', 'mylifeasabdoZZ@gmail.com', '$2y$10$gV57vQ.s3y6eDGfSjdM/L.6N8IPvQfPJ/3jKsabw4g66QKvE0hpl.', '', '0643449779', '2024-09-01'),
(4, 'azzaza', 'john@mail.com', '$2y$10$BfR6SRhq5h2nH49J4QmMROijA3jrJeXNOtqTy6wvAK6a6ibUsvp.i', '', '0643449779', '2024-09-01'),
(5, 'admin', 'joe@email.com', '$2y$10$Lx2jzHrT.jUiuSQz6FSgI.JU5kliUT.W5YSZa4/I93HbCj6Zl8kFa', '', '0645127845', '2024-09-03'),
(7, 'abderrahmane loubachi', 'mylifeasabdo@gmail.com', '$2y$10$Qe/vyYsx9nSrQ05yOjaUVO4hZfqAKJ4QbvP/bpa317LuLENkE3P/e', '', '0643449779', '2024-09-04');

-- --------------------------------------------------------

--
-- Structure de la table `vendeur`
--

CREATE TABLE IF NOT EXISTS `vendeur` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vendeur_enchere`
--

CREATE TABLE IF NOT EXISTS `vendeur_enchere` (
  `vendeur_id` int(11) NOT NULL DEFAULT '0',
  `enchere_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vendeur_id`,`enchere_id`),
  KEY `enchere_id` (`enchere_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vendeur_transaction`
--

CREATE TABLE IF NOT EXISTS `vendeur_transaction` (
  `vendeur_id` int(11) NOT NULL DEFAULT '0',
  `transaction_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vendeur_id`,`transaction_id`),
  KEY `transaction_id` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `acheteur`
--
ALTER TABLE `acheteur`
  ADD CONSTRAINT `acheteur_ibfk_1` FOREIGN KEY (`id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `acheteur_enchere`
--
ALTER TABLE `acheteur_enchere`
  ADD CONSTRAINT `acheteur_enchere_ibfk_1` FOREIGN KEY (`acheteur_id`) REFERENCES `acheteur` (`id`),
  ADD CONSTRAINT `acheteur_enchere_ibfk_2` FOREIGN KEY (`enchere_id`) REFERENCES `enchere` (`id`);

--
-- Contraintes pour la table `acheteur_transaction`
--
ALTER TABLE `acheteur_transaction`
  ADD CONSTRAINT `acheteur_transaction_ibfk_1` FOREIGN KEY (`acheteur_id`) REFERENCES `acheteur` (`id`),
  ADD CONSTRAINT `acheteur_transaction_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`id`);

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
  ADD CONSTRAINT `fk_enchere_souscategorie` FOREIGN KEY (`id_sous_categorie`) REFERENCES `souscategorie` (`id_sous_categorie`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`expediteur_id`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`destinataire_id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`acheteur_id`) REFERENCES `acheteur` (`id`),
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`vendeur_id`) REFERENCES `vendeur` (`id`);

--
-- Contraintes pour la table `vendeur`
--
ALTER TABLE `vendeur`
  ADD CONSTRAINT `vendeur_ibfk_1` FOREIGN KEY (`id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `vendeur_enchere`
--
ALTER TABLE `vendeur_enchere`
  ADD CONSTRAINT `vendeur_enchere_ibfk_1` FOREIGN KEY (`vendeur_id`) REFERENCES `vendeur` (`id`),
  ADD CONSTRAINT `vendeur_enchere_ibfk_2` FOREIGN KEY (`enchere_id`) REFERENCES `enchere` (`id`);

--
-- Contraintes pour la table `vendeur_transaction`
--
ALTER TABLE `vendeur_transaction`
  ADD CONSTRAINT `vendeur_transaction_ibfk_1` FOREIGN KEY (`vendeur_id`) REFERENCES `vendeur` (`id`),
  ADD CONSTRAINT `vendeur_transaction_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
