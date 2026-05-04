-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Sep 11, 2025 at 04:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `la_cash`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `nom_famille` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `date_naissance` date NOT NULL,
  `telephone_mobile` varchar(20) NOT NULL,
  `adresse_mail` varchar(150) NOT NULL,
  `num_identite_nationale` varchar(50) NOT NULL,
  `sexe` enum('Homme','Femme') NOT NULL,
  `id_wilaya` int(100) DEFAULT NULL,
  `commune` varchar(100) NOT NULL,
  `agence` varchar(150) NOT NULL,
  `code_postal` varchar(10) NOT NULL,
  `profession` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id_client`, `nom_famille`, `prenom`, `date_naissance`, `telephone_mobile`, `adresse_mail`, `num_identite_nationale`, `sexe`, `id_wilaya`, `commune`, `agence`, `code_postal`, `profession`) VALUES
(18, '', '', '0000-00-00', '', 'nadabn44r6@gmail.com', '7894', 'Femme', 1, '25', '', '', ''),
(22, '', '', '0000-00-00', '', '', '', 'Homme', 0, '2', '', '', ''),
(25, '', '', '0000-00-00', '', 'nada45556@gmail.com', '9956999', 'Femme', 0, '6', '', '', ''),
(31, '', '', '0000-00-00', '', 'nada7885@gmail.com', '789466', 'Femme', 1, '20', '', '', ''),
(33, '', '', '0000-00-00', '', 'nada7849@gmail.com', '6548515', 'Femme', 0, '5', '', '', ''),
(35, '', '', '0000-00-00', '', 'nada849@gmail.com', '654815', 'Femme', 0, '5', '', '', ''),
(36, '', '', '0000-00-00', '', 'n7ada849@gmail.com', '6548157', 'Femme', 0, '5', '', '', ''),
(37, '', '', '0000-00-00', '', 'nadab@g22mail.com', '9512364', 'Femme', 0, '6', '', '', ''),
(38, '', '', '0000-00-00', '', 'nadafff@gmail', '951235564', 'Femme', 0, '6', '', '', ''),
(39, '', '', '0000-00-00', '', 'nadafff@gmail.com', '957735564', 'Femme', 0, '6', '', '', ''),
(41, '', '', '0000-00-00', '', 'adrkkess@gmail.com', '74586', 'Femme', 0, '7', '', '', ''),
(42, 'ben amar', 'nada', '0000-00-00', '0553224582', 'nadabnr6l@gmail.com', '12345688885', 'Femme', 0, '12', 'alger', '16000', 'travailler'),
(43, 'ben amar', 'nada', '0000-00-00', '0553224582', 'nadabnr644@gmail.com', '1234568888www', 'Femme', 0, '6', 'alger', '16000', 'travailler'),
(45, 'ben amar', 'nada', '0000-00-00', '0553224582', 'nadabnr6mm@gmail.com', '123456888854', 'Homme', 1, '26', 'alger', '16000', 'travailler'),
(46, '', '', '0000-00-00', '', 'nadabrr@gmail.com', '4654797', 'Femme', 0, '8', '', '', ''),
(47, '', '', '0000-00-00', '', 'nadabhjjh@gmail.com', '123456877788', 'Femme', 1, '20', '', '', ''),
(48, '', '', '0000-00-00', '', 'setyuhj@gmail.com', '4595289', 'Femme', 1, '20', '', '', ''),
(49, '', '', '0000-00-00', '', 'nadabjhjh@gmail.com', '78944646', 'Femme', 1, '19', '', '', ''),
(50, '', '', '0000-00-00', '', 'nada784@gmail.com', '4562335', 'Femme', 0, '5', '', '', ''),
(51, '', '', '0000-00-00', '', 'nada7856@gmail.com', '462499', 'Femme', 0, '8', '', '', ''),
(52, '', '', '0000-00-00', '', 'nafda49@gmail.com', '64949744', 'Femme', 1, '19', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `commune`
--

CREATE TABLE `commune` (
  `id_commune` int(100) NOT NULL,
  `libelle_commune` varchar(100) DEFAULT NULL,
  `id_wilaya` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `commune`
--

INSERT INTO `commune` (`id_commune`, `libelle_commune`, `id_wilaya`) VALUES
(1, 'alger', 0),
(2, 'kouba', 0),
(3, 'bab el oued', 0),
(6, 'Saoula', 0),
(7, 'Khraicia', 0),
(8, 'Chéraga', 0),
(9, 'Zéralda', 0),
(10, 'Rouïba', 0),
(11, 'Sidi Moussa', 0),
(12, 'Dar El Beïda', 0),
(13, 'Bachdjerra', 0),
(14, 'Baraki', 0),
(15, 'Casbah', 0),
(16, 'Bologhine', 0),
(17, 'Annaba', 1),
(18, 'El Hadjar', 1),
(19, 'El Bouni', 1),
(20, 'Sidi Amar', 1),
(21, 'Sidi Salem', 1),
(22, 'Berrahal', 1),
(23, 'Oued El Aneb', 1),
(24, 'Ain El Berda', 1),
(25, 'Seraidi', 1),
(26, 'Cheurfa', 1),
(27, 'Eulma', 1),
(28, 'Es Senia', 2),
(29, 'Bir El Djir', 2),
(30, 'El Kerma', 2),
(31, 'Aïn El Turk', 2),
(32, 'Gdyel', 2),
(33, 'Arzew', 2),
(34, 'Marsat el hadjadj', 2),
(35, 'Boutlelis', 2),
(36, 'Bethioua', 2),
(37, 'Oran Centre', 2);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id_contact` int(11) NOT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `Commentaire` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id_contact`, `prenom`, `nom`, `Commentaire`, `email`) VALUES
(1, 'nada', 'ben amar', '145258hfuy', 'nadabnr6@gmail.com'),
(2, 'nada', 'ben amar', '145258hfuy', 'nadabnr6@gmail.com'),
(3, 'nada', 'ben amar', 'imaaane\r\n', 'nadaddd@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `devis_habitation`
--

CREATE TABLE `devis_habitation` (
  `id` int(11) NOT NULL,
  `type_habitation` varchar(100) NOT NULL,
  `qualite_juridique` varchar(100) NOT NULL,
  `superficie` decimal(10,2) NOT NULL,
  `valeur_contenu` decimal(15,2) NOT NULL,
  `nombre_pieces` int(11) NOT NULL,
  `situee_terrasse` tinyint(1) DEFAULT 0,
  `occupee_risque_professionnel` tinyint(1) DEFAULT 0,
  `materiaux_durs` tinyint(1) DEFAULT 0,
  `innocupee_45_jours` tinyint(1) DEFAULT 0,
  `protection_vol_alarme` tinyint(1) DEFAULT 0,
  `protection_vol_telesurveillance` tinyint(1) DEFAULT 0,
  `protection_vol_barreaudage` tinyint(1) DEFAULT 0,
  `protection_vol_gardiennage` tinyint(1) DEFAULT 0,
  `extension_vol_objets_valeur` tinyint(1) DEFAULT 0,
  `extension_tempete` tinyint(1) DEFAULT 0,
  `extension_intoxication` tinyint(1) DEFAULT 0,
  `wilaya` varchar(100) NOT NULL,
  `commune` varchar(100) NOT NULL,
  `adresse` text NOT NULL,
  `date_effet` date NOT NULL,
  `date_creation` date DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `devis_habitation`
--

INSERT INTO `devis_habitation` (`id`, `type_habitation`, `qualite_juridique`, `superficie`, `valeur_contenu`, `nombre_pieces`, `situee_terrasse`, `occupee_risque_professionnel`, `materiaux_durs`, `innocupee_45_jours`, `protection_vol_alarme`, `protection_vol_telesurveillance`, `protection_vol_barreaudage`, `protection_vol_gardiennage`, `extension_vol_objets_valeur`, `extension_tempete`, `extension_intoxication`, `wilaya`, `commune`, `adresse`, `date_effet`, `date_creation`, `id_client`) VALUES
(16, '', '', 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '0000-00-00', NULL, NULL),
(17, '', '', 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '0000-00-00', NULL, NULL),
(18, '', '', 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '0000-00-00', NULL, NULL),
(19, '', '', 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '0000-00-00', NULL, NULL),
(20, '', '', 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '0000-00-00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `duree_contrat`
--

CREATE TABLE `duree_contrat` (
  `id_duree_contrat` int(11) NOT NULL,
  `libelle_duree_contrat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `duree_contrat`
--

INSERT INTO `duree_contrat` (`id_duree_contrat`, `libelle_duree_contrat`) VALUES
(1, '11'),
(2, ''),
(3, '444'),
(4, '458'),
(5, '44'),
(6, '5965'),
(7, '96658');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `id_genre` int(11) NOT NULL,
  `libelle_genre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id_genre`, `libelle_genre`) VALUES
(1, ',njjnj'),
(2, ''),
(3, 'dksjkkdn'),
(4, 'gghjk');

-- --------------------------------------------------------

--
-- Table structure for table `la_cash_devis`
--

CREATE TABLE `la_cash_devis` (
  `id_devis` int(11) NOT NULL,
  `id_genre` int(100) NOT NULL,
  `id_usage_vehicule` int(100) DEFAULT NULL,
  `id_puissance` int(50) DEFAULT NULL,
  `prix` decimal(10,2) DEFAULT NULL,
  `id_duree_contrat` int(50) DEFAULT NULL,
  `id_type_couverture` int(100) DEFAULT NULL,
  `annee_mise_circulation` varchar(10) DEFAULT NULL,
  `garanties` text DEFAULT NULL,
  `options` text DEFAULT NULL,
  `date_permis` date DEFAULT NULL,
  `zone_circulation` varchar(100) DEFAULT NULL,
  `id_type` int(100) DEFAULT NULL,
  `id_client` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `la_cash_devis`
--

INSERT INTO `la_cash_devis` (`id_devis`, `id_genre`, `id_usage_vehicule`, `id_puissance`, `prix`, `id_duree_contrat`, `id_type_couverture`, `annee_mise_circulation`, `garanties`, `options`, `date_permis`, `zone_circulation`, `id_type`, `id_client`) VALUES
(99, 2, 2, 2, 0.00, 2, 2, '', '', '', '0000-00-00', '', 2, NULL),
(100, 2, 2, 2, 0.00, 2, 2, '', '', '', '0000-00-00', '', 2, NULL),
(101, 1, 1, 1, 555.00, 1, 1, '1', '1', '1', '0000-00-00', '1', 1, 45),
(111, 2, 2, 2, 0.00, 2, 2, '', '', '', '0000-00-00', '', 2, 51);

-- --------------------------------------------------------

--
-- Table structure for table `puissance`
--

CREATE TABLE `puissance` (
  `id_puissance` int(11) NOT NULL,
  `libelle_puissance` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `puissance`
--

INSERT INTO `puissance` (`id_puissance`, `libelle_puissance`) VALUES
(1, '3-4 CV'),
(2, '2 CV'),
(3, '11-14 CV');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id_type` int(11) NOT NULL,
  `libelle_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id_type`, `libelle_type`) VALUES
(1, 'utilitaire'),
(2, 'particulier');

-- --------------------------------------------------------

--
-- Table structure for table `type_couverture`
--

CREATE TABLE `type_couverture` (
  `id_type_couverture` int(11) NOT NULL,
  `libelle_type_couverture` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `type_couverture`
--

INSERT INTO `type_couverture` (`id_type_couverture`, `libelle_type_couverture`) VALUES
(1, 'Dommage collision à valeur vénale'),
(2, 'Tous risques');

-- --------------------------------------------------------

--
-- Table structure for table `usage_auto`
--

CREATE TABLE `usage_auto` (
  `id_usage_vehicule` int(11) NOT NULL,
  `libelle_usage` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usage_auto`
--

INSERT INTO `usage_auto` (`id_usage_vehicule`, `libelle_usage`) VALUES
(1, 'gggg'),
(2, ''),
(3, 'dqnjhjds'),
(4, 'nnnn'),
(5, 'ggihg');

-- --------------------------------------------------------

--
-- Table structure for table `wilaya`
--

CREATE TABLE `wilaya` (
  `id_wilaya` int(100) NOT NULL,
  `libelle_wilaya` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wilaya`
--

INSERT INTO `wilaya` (`id_wilaya`, `libelle_wilaya`) VALUES
(0, 'Alger'),
(1, 'annaba'),
(2, 'oran');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`),
  ADD UNIQUE KEY `adresse_mail` (`adresse_mail`),
  ADD UNIQUE KEY `num_identite_nationale` (`num_identite_nationale`),
  ADD UNIQUE KEY `id` (`id_client`),
  ADD KEY `id_wilaya_2` (`id_wilaya`);

--
-- Indexes for table `commune`
--
ALTER TABLE `commune`
  ADD PRIMARY KEY (`id_commune`),
  ADD UNIQUE KEY `id_wilaya` (`id_commune`),
  ADD KEY `id_wilaya_2` (`id_wilaya`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id_contact`);

--
-- Indexes for table `devis_habitation`
--
ALTER TABLE `devis_habitation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`);

--
-- Indexes for table `duree_contrat`
--
ALTER TABLE `duree_contrat`
  ADD PRIMARY KEY (`id_duree_contrat`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id_genre`);

--
-- Indexes for table `la_cash_devis`
--
ALTER TABLE `la_cash_devis`
  ADD PRIMARY KEY (`id_devis`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `id_genre` (`id_devis`,`id_genre`) USING BTREE,
  ADD KEY `id_usage_vehicule` (`id_usage_vehicule`),
  ADD KEY `FK_typecouverture` (`id_type_couverture`),
  ADD KEY `FK_puissance` (`id_puissance`),
  ADD KEY `FK_genre` (`id_genre`),
  ADD KEY `FK_duréecotrat` (`id_duree_contrat`),
  ADD KEY `id_client` (`id_client`);

--
-- Indexes for table `puissance`
--
ALTER TABLE `puissance`
  ADD PRIMARY KEY (`id_puissance`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id_type`);

--
-- Indexes for table `type_couverture`
--
ALTER TABLE `type_couverture`
  ADD PRIMARY KEY (`id_type_couverture`);

--
-- Indexes for table `usage_auto`
--
ALTER TABLE `usage_auto`
  ADD PRIMARY KEY (`id_usage_vehicule`);

--
-- Indexes for table `wilaya`
--
ALTER TABLE `wilaya`
  ADD PRIMARY KEY (`id_wilaya`),
  ADD KEY `libellé_wilaya` (`libelle_wilaya`),
  ADD KEY `libellé_wilaya_2` (`libelle_wilaya`),
  ADD KEY `id_wilaya` (`id_wilaya`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `commune`
--
ALTER TABLE `commune`
  MODIFY `id_commune` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id_contact` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `devis_habitation`
--
ALTER TABLE `devis_habitation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `duree_contrat`
--
ALTER TABLE `duree_contrat`
  MODIFY `id_duree_contrat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `id_genre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `la_cash_devis`
--
ALTER TABLE `la_cash_devis`
  MODIFY `id_devis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `puissance`
--
ALTER TABLE `puissance`
  MODIFY `id_puissance` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `type_couverture`
--
ALTER TABLE `type_couverture`
  MODIFY `id_type_couverture` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usage_auto`
--
ALTER TABLE `usage_auto`
  MODIFY `id_usage_vehicule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `fk_clients_wilaya` FOREIGN KEY (`id_wilaya`) REFERENCES `wilaya` (`id_wilaya`);

--
-- Constraints for table `commune`
--
ALTER TABLE `commune`
  ADD CONSTRAINT `fk_coomunewilya` FOREIGN KEY (`id_wilaya`) REFERENCES `wilaya` (`id_wilaya`);

--
-- Constraints for table `devis_habitation`
--
ALTER TABLE `devis_habitation`
  ADD CONSTRAINT `fk_habclient` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`);

--
-- Constraints for table `la_cash_devis`
--
ALTER TABLE `la_cash_devis`
  ADD CONSTRAINT `FK_duréecotrat` FOREIGN KEY (`id_duree_contrat`) REFERENCES `duree_contrat` (`id_duree_contrat`),
  ADD CONSTRAINT `FK_genre` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`),
  ADD CONSTRAINT `FK_puissance` FOREIGN KEY (`id_puissance`) REFERENCES `puissance` (`id_puissance`),
  ADD CONSTRAINT `FK_typecouverture` FOREIGN KEY (`id_type_couverture`) REFERENCES `type_couverture` (`id_type_couverture`),
  ADD CONSTRAINT `FK_usage` FOREIGN KEY (`id_usage_vehicule`) REFERENCES `usage_auto` (`id_usage_vehicule`),
  ADD CONSTRAINT `fk_autoclient` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`),
  ADD CONSTRAINT `la_cash_devis_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type` (`id_type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
