-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2023 at 10:54 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sporto_sales`
--

-- --------------------------------------------------------

--
-- Table structure for table `ar_dirba_visas_paras`
--

CREATE TABLE `ar_dirba_visas_paras` (
  `id_AR_DIRBA_VISA_PARA` int(11) NOT NULL,
  `name` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_lithuanian_ci;

--
-- Dumping data for table `ar_dirba_visas_paras`
--

INSERT INTO `ar_dirba_visas_paras` (`id_AR_DIRBA_VISA_PARA`, `name`) VALUES
(1, 'Taip'),
(2, 'Ne');

-- --------------------------------------------------------

--
-- Table structure for table `asmenys`
--

CREATE TABLE `asmenys` (
  `Vardas` varchar(255) NOT NULL,
  `Pavarde` varchar(255) NOT NULL,
  `Banko_saskaita` varchar(255) NOT NULL,
  `Adresas` varchar(255) NOT NULL,
  `Asmens_kodas` int(11) NOT NULL,
  `Lytis` int(11) NOT NULL,
  `id_SPORTO_SALE` int(11) NOT NULL,
  `fk_DARBUOTOJASDarbuotojo_asmens_kodas` int(11) NOT NULL,
  `fk_SPORTO_SUTARTISid_SPORTO_SUTARTIS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_lithuanian_ci;

--
-- Dumping data for table `asmenys`
--

INSERT INTO `asmenys` (`Vardas`, `Pavarde`, `Banko_saskaita`, `Adresas`, `Asmens_kodas`, `Lytis`, `id_SPORTO_SALE`, `fk_DARBUOTOJASDarbuotojo_asmens_kodas`, `fk_SPORTO_SUTARTISid_SPORTO_SUTARTIS`) VALUES
('Jonis', 'Budgey', '384-380-4454', '545 Ruskin Avenue', 111, 1, 16, 870, 447),
('Monty', 'Boller', '753-596-9824', '65 Northwestern Pass', 142, 1, 20, 411, 387),
('Kameko', 'Grazier', '348-933-6501', '0513 Lerdahl Place', 248, 1, 19, 816, 29),
('Sergio', 'Finnie', '240-559-2158', '6 Manitowish Way', 252, 1, 10, 204, 65),
('Tobie', 'Braxton', '234-192-9533', '7 Waubesa Junction', 514, 2, 12, 359, 29),
('Fredra', 'Parzis', '860-669-9888', '34141 Mcbride Court', 659, 2, 11, 837, 495),
('Brand', 'Wrotchford', '266-377-7126', '417 Judy Point', 803, 1, 16, 870, 201),
('Alena', 'Danihel', '192-948-8862', '461 Kipling Parkway', 898, 2, 15, 910, 376),
('Alena', 'Danihel', '192-948-8862', '461 Kipling Parkway', 899, 2, 15, 910, 376),
('Jacqueline', 'Reen', '541-113-2260', '19 Prairie Rose Point', 920, 2, 6, 622, 160);

-- --------------------------------------------------------

--
-- Table structure for table `darbo_sutartys`
--

CREATE TABLE `darbo_sutartys` (
  `Sutarties_numeris` int(11) NOT NULL,
  `Data` date NOT NULL,
  `Etatas` double NOT NULL,
  `Fiksuota_alga` decimal(10,0) NOT NULL,
  `Dokumentas` int(11) NOT NULL,
  `id_DARBO_SUTARTIS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_lithuanian_ci;

--
-- Dumping data for table `darbo_sutartys`
--

INSERT INTO `darbo_sutartys` (`Sutarties_numeris`, `Data`, `Etatas`, `Fiksuota_alga`, `Dokumentas`, `id_DARBO_SUTARTIS`) VALUES
(1, '2022-02-28', 1.5, '1526', 2, 1),
(2, '2022-05-12', 0.6, '1526', 1, 2),
(3, '2022-09-20', 1.5, '125', 2, 3),
(4, '2023-01-08', 1.5, '700', 1, 4),
(5, '2022-07-10', 1.5, '700', 2, 5),
(6, '2022-09-25', 1.5, '125', 2, 6),
(7, '2022-04-03', 1.5, '125', 1, 7),
(8, '2023-02-07', 1.5, '700', 2, 8),
(9, '2022-06-22', 0.6, '1526', 2, 9),
(10, '2022-11-16', 1.5, '125', 2, 10),
(11, '2022-08-06', 2, '700', 2, 11),
(12, '2022-05-17', 2, '700', 1, 12),
(13, '2022-11-23', 0.6, '700', 2, 13),
(14, '2022-09-15', 0.6, '1526', 1, 14),
(15, '2022-04-18', 0.6, '1526', 1, 15),
(16, '2022-11-24', 1.5, '1526', 1, 16),
(17, '2022-11-21', 2, '1526', 2, 17),
(18, '2022-03-29', 2, '125', 2, 18),
(19, '2022-07-22', 2, '700', 1, 19),
(20, '2022-04-30', 0.6, '125', 2, 20),
(21, '2022-12-27', 1.5, '1526', 1, 21),
(22, '2022-08-02', 0.6, '125', 1, 22),
(23, '2023-01-20', 2, '125', 1, 23),
(24, '2022-04-15', 2, '700', 1, 24),
(25, '2022-05-03', 2, '125', 1, 25);

-- --------------------------------------------------------

--
-- Table structure for table `darbuotojai`
--

CREATE TABLE `darbuotojai` (
  `Vardas` varchar(255) NOT NULL,
  `Pavarde` varchar(255) NOT NULL,
  `Darbuotojo_asmens_kodas` int(11) NOT NULL,
  `Banko_saskaita` varchar(255) NOT NULL,
  `Pozicija` int(11) NOT NULL,
  `Lytis` int(11) NOT NULL,
  `fk_SPORTO_SALEid_SPORTO_SALE` int(11) NOT NULL,
  `fk_DARBO_SUTARTISid_DARBO_SUTARTIS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_lithuanian_ci;

--
-- Dumping data for table `darbuotojai`
--

INSERT INTO `darbuotojai` (`Vardas`, `Pavarde`, `Darbuotojo_asmens_kodas`, `Banko_saskaita`, `Pozicija`, `Lytis`, `fk_SPORTO_SALEid_SPORTO_SALE`, `fk_DARBO_SUTARTISid_DARBO_SUTARTIS`) VALUES
('Tracy', 'Pollicatt', 204, '156-590-9353', 3, 2, 10, 10),
('Tildy', 'Vispo', 212, '256-949-8246', 2, 1, 5, 5),
('Wilie', 'Laundon', 231, '265-397-2845', 1, 2, 7, 7),
('Andrus', 'Battram', 359, '412-743-0218', 2, 2, 12, 12),
('Cate', 'Prendiville', 411, '648-176-1804', 2, 2, 20, 20),
('Tonie', 'Bimson', 421, '353-510-6258', 1, 2, 17, 17),
('Dario', 'Stout', 439, '235-246-1847', 1, 2, 13, 13),
('Reeta', 'Fransoni', 479, '240-620-5152', 3, 1, 14, 14),
('Brad', 'Benda', 507, '687-377-3800', 1, 1, 3, 3),
('Andie', 'Burnand', 546, '460-357-4853', 3, 1, 9, 9),
('Brody', 'Coucher', 608, '540-652-5091', 3, 2, 1, 1),
('Jany', 'Vasishchev', 609, '593-189-0242', 3, 1, 18, 18),
('Fara', 'Bart', 622, '693-273-3028', 1, 2, 6, 6),
('Joyce', 'Banes', 628, '887-669-8479', 3, 1, 2, 2),
('Harper', 'Ridesdale', 678, '706-279-8364', 1, 1, 4, 4),
('Win', 'Jarrette', 816, '612-860-8371', 3, 2, 19, 19),
('Ricoriki', 'Van', 837, '888-766-9062', 2, 1, 11, 11),
('Elijah', 'Sandifer', 870, '957-897-3465', 1, 1, 16, 16),
('Brande', 'Milvarnie', 910, '232-596-7902', 2, 1, 15, 15),
('Lalo', 'Gounard', 919, '158-532-8270', 2, 1, 8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `dokumentai`
--

CREATE TABLE `dokumentai` (
  `id_DOKUMENTAS` int(11) NOT NULL,
  `name` char(17) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_lithuanian_ci;

--
-- Dumping data for table `dokumentai`
--

INSERT INTO `dokumentai` (`id_DOKUMENTAS`, `name`) VALUES
(1, 'Pasas'),
(2, 'Tapatybes_kortele');

-- --------------------------------------------------------

--
-- Table structure for table `gamyklos`
--

CREATE TABLE `gamyklos` (
  `Salis` varchar(255) NOT NULL,
  `Miestas` varchar(255) NOT NULL,
  `Adresas` varchar(255) NOT NULL,
  `Darbo_laikas` date NOT NULL,
  `Irangos_kiekis` int(11) NOT NULL,
  `id_GAMYKLA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_lithuanian_ci;

--
-- Dumping data for table `gamyklos`
--

INSERT INTO `gamyklos` (`Salis`, `Miestas`, `Adresas`, `Darbo_laikas`, `Irangos_kiekis`, `id_GAMYKLA`) VALUES
('Portugal', 'Antas', '8 Northfield Junction', '0000-00-00', 6831, 1),
('China', 'Xinhua', '85331 Carioca Avenue', '0000-00-00', 5731, 2),
('Poland', 'Mętków', '88 Ludington Plaza', '0000-00-00', 5530, 3),
('Ecuador', 'Playas', '58807 Moulton Trail', '0000-00-00', 9823, 4),
('South Africa', 'Ventersdorp', '3 Mallory Hill', '0000-00-00', 5399, 5),
('Philippines', 'San Juan', '4 Summit Drive', '0000-00-00', 5357, 6),
('Sweden', 'Torslanda', '56779 Victoria Point', '0000-00-00', 6470, 7),
('Slovenia', 'Destrnik', '46487 Northridge Drive', '0000-00-00', 2684, 8),
('Japan', 'Maizuru', '2 Colorado Street', '0000-00-00', 5803, 9),
('Russia', 'Beringovskiy', '48266 Esker Terrace', '0000-00-00', 7960, 10),
('Switzerland', 'Bern', '50578 Lien Terrace', '0000-00-00', 4978, 11),
('Russia', 'Sokol', '2 Fairfield Street', '0000-00-00', 5485, 12),
('Peru', 'La Breita', '75 Union Way', '0000-00-00', 1749, 13),
('Sweden', 'Arlöv', '53495 Vidon Street', '0000-00-00', 8248, 14),
('China', 'Axili', '77 Petterle Point', '0000-00-00', 5905, 15),
('Norway', 'Trondheim', '41526 Hoard Park', '0000-00-00', 1744, 16),
('Indonesia', 'Cikayas', '62 Lien Parkway', '0000-00-00', 8843, 17),
('China', 'Qingyang', '4 Clemons Park', '0000-00-00', 7612, 18),
('China', 'Gongji', '23 Memorial Drive', '0000-00-00', 8272, 19),
('French Polynesia', 'Papetoai', '3 Scofield Pass', '0000-00-00', 9243, 20);

-- --------------------------------------------------------

--
-- Table structure for table `irangos`
--

CREATE TABLE `irangos` (
  `Tipas` varchar(255) NOT NULL,
  `Pagaminimo_data` date NOT NULL,
  `Gamintojas` varchar(255) NOT NULL,
  `Garantijos_laikotarpis` int(11) NOT NULL,
  `Medziagos_is_kuriu_pagaminta` varchar(255) NOT NULL,
  `id_IRANGA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_lithuanian_ci;

--
-- Dumping data for table `irangos`
--

INSERT INTO `irangos` (`Tipas`, `Pagaminimo_data`, `Gamintojas`, `Garantijos_laikotarpis`, `Medziagos_is_kuriu_pagaminta`, `id_IRANGA`) VALUES
('Sporto kilimeliai', '2022-05-22', '', 2, 'Guma', 1),
('Sporto kilimeliai', '2023-01-14', '', 3, 'Guma', 2),
('Jegos treniruokliai', '2022-05-09', '', 2, 'Aliuminis', 3),
('Gimnastikos kamuoliai', '2022-12-10', '', 3, 'Guma', 4),
('Sporto kilimeliai', '2022-11-22', '', 3, 'Guma', 5),
('Cardio treniruokliai', '2022-05-12', '', 1, 'Aliuminis', 6),
('Suoliukai sportui', '2022-06-07', '', 3, 'Guma', 7),
('Gimnastikos kamuoliai', '2022-03-23', '', 1, 'Guma', 8),
('Lygiagretes', '2022-04-16', '', 1, 'Gelezis', 9),
('Sporto kilimeliai', '2023-02-08', '', 1, 'Guma', 10),
('Jegos treniruokliai', '2022-04-30', '', 3, 'Gelezis', 11),
('Gimnastikos kamuoliai', '2022-09-09', '', 1, 'Guma', 12),
('Crossfit suoliu platformos', '2022-04-03', '', 1, 'Plastikas', 13),
('Gumos sportui', '2022-09-02', '', 1, 'Guma', 14),
('Lygiagretes', '2022-08-28', '', 2, 'Aliuminis', 15),
('Gimnastikos kamuoliai', '2023-01-10', '', 3, 'Guma', 16),
('Gimnastikos kamuoliai', '2022-06-09', '', 2, 'Guma', 17),
('Svoriai', '2022-06-05', '', 2, 'Aliuminis', 18),
('Suoliukai sportui', '2022-05-05', '', 1, 'Guma', 19),
('Svoriai', '2022-05-02', '', 3, 'Aliuminis', 20),
('Svoriai', '2022-12-18', '', 2, 'Gelezis', 21),
('Svoriai', '2022-10-29', '', 1, 'Gelezis', 22),
('Hanteliai', '2023-01-17', '', 1, 'Aliuminis', 23),
('Sporto kilimeliai', '2022-04-09', '', 3, 'Guma', 24),
('Hanteliai', '2022-04-27', '', 2, 'Gelezis', 25);

-- --------------------------------------------------------

--
-- Table structure for table `lytys`
--

CREATE TABLE `lytys` (
  `id_LYTIS` int(11) NOT NULL,
  `name` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_lithuanian_ci;

--
-- Dumping data for table `lytys`
--

INSERT INTO `lytys` (`id_LYTIS`, `name`) VALUES
(1, 'Vyras'),
(2, 'Moteris');

-- --------------------------------------------------------

--
-- Table structure for table `pozicijos_tipai`
--

CREATE TABLE `pozicijos_tipai` (
  `id_POZICIJOS_TIPAS` int(11) NOT NULL,
  `name` char(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_lithuanian_ci;

--
-- Dumping data for table `pozicijos_tipai`
--

INSERT INTO `pozicijos_tipai` (`id_POZICIJOS_TIPAS`, `name`) VALUES
(1, 'Direktorius'),
(2, 'Treneris'),
(3, 'Administratorius');

-- --------------------------------------------------------

--
-- Table structure for table `savininkai`
--

CREATE TABLE `savininkai` (
  `Vardas` varchar(255) NOT NULL,
  `Pavarde` varchar(255) NOT NULL,
  `Savininko_asmens_kodas` int(24) NOT NULL,
  `Amzius` int(11) NOT NULL,
  `Banko_saskaita` varchar(255) NOT NULL,
  `Adresas` varchar(255) NOT NULL,
  `Lytis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_lithuanian_ci;

--
-- Dumping data for table `savininkai`
--

INSERT INTO `savininkai` (`Vardas`, `Pavarde`, `Savininko_asmens_kodas`, `Amzius`, `Banko_saskaita`, `Adresas`, `Lytis`) VALUES
('Tatum', 'Westman', 102, 50, '807-722-4756', 'Room 43', 1),
('Dione', 'Kearley', 112, 47, '442-430-0181', 'Room 1087', 2),
('Wildon', 'Domegan', 117, 50, '437-939-9062', 'PO Box 64293', 2),
('Isidor', 'Esposi', 163, 49, '334-634-0195', 'Apt 1520', 2),
('Chalmers', 'Kleiser', 252, 36, '177-955-0974', '4th Floor', 1),
('Elwin', 'Dresche', 261, 47, '850-909-9026', 'Apt 1235', 1),
('Doro', 'Blofield', 327, 38, '985-603-1100', 'Suite 14', 2),
('Cordelie', 'Sinnott', 329, 42, '990-777-9272', 'Apt 552', 1),
('Kaleb', 'Ahmed', 394, 50, '846-720-7353', '5th Floor', 2),
('Zelda', 'Kerwood', 422, 29, '938-226-9629', 'Suite 86', 2),
('Di', 'Stathor', 446, 31, '147-128-3136', 'Apt 22', 1),
('Pavia', 'Hazleton', 480, 29, '784-949-7263', 'PO Box 18688', 2),
('Nikolas', 'Gryglewski', 560, 26, '443-657-8781', 'PO Box 90661', 1),
('Estele', 'Knee', 565, 33, '300-367-2232', 'Room 1020', 2),
('Iggy', 'Atwill', 597, 33, '120-123-9407', 'PO Box 70949', 2),
('Major', 'Hussy', 637, 32, '627-628-2722', 'Room 64', 2),
('Ludvig', 'Andree', 775, 38, '676-499-7151', 'PO Box 66429', 1),
('Valaree', 'Bowles', 842, 33, '320-887-3540', 'Suite 46', 2),
('Burch', 'Wharrier', 949, 31, '551-503-2956', 'Apt 1631', 1),
('Cyrus', 'Nickols', 950, 33, '998-302-7837', 'Suite 10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sporto_sales`
--

CREATE TABLE `sporto_sales` (
  `Salis` varchar(255) NOT NULL,
  `Miestas` varchar(255) NOT NULL,
  `Adresas` varchar(255) NOT NULL,
  `Darbo_laikas` varchar(255) NOT NULL,
  `Vietu_kiekis` int(11) NOT NULL,
  `Irengimo_data` date NOT NULL,
  `Darbuotoju_kiekis` int(11) NOT NULL,
  `Ar_dirba_visa_para` int(11) NOT NULL,
  `id_SPORTO_SALE` int(11) NOT NULL,
  `fk_SAVININKASSavininko_asmens_kodas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_lithuanian_ci;

--
-- Dumping data for table `sporto_sales`
--

INSERT INTO `sporto_sales` (`Salis`, `Miestas`, `Adresas`, `Darbo_laikas`, `Vietu_kiekis`, `Irengimo_data`, `Darbuotoju_kiekis`, `Ar_dirba_visa_para`, `id_SPORTO_SALE`, `fk_SAVININKASSavininko_asmens_kodas`) VALUES
('Sierra Leone', 'Alikalia', '7015 Lighthouse Bay Terrace', '10:30 - 00:00', 5354, '2016-12-16', 26, 1, 1, 112),
('Sweden', 'Stockholm', '17609 Bashford Center', '6:00 - 23:00', 3000, '2007-12-15', 91, 1, 2, 117),
('Indonesia', 'Warungtanjung', '85 Carioca Road', '9:00 - 22:00', 5246, '2012-08-02', 131, 2, 3, 163),
('Peru', 'Circa', '94 Logan Parkway', '6:00 - 23:00', 829, '2009-12-09', 116, 1, 4, 252),
('Syria', '‘Arīqah', '277 Moose Point', '9:00 - 22:00', 932, '2017-12-02', 59, 1, 5, 252),
('Indonesia', 'Wanareja', '9 Paget Drive', '00:00 - 00:00', 4996, '2022-09-01', 137, 1, 6, 261),
('Indonesia', 'Lemahputih', '86 Nova Junction', '6:00 - 23:00', 7813, '2006-10-13', 50, 1, 7, 327),
('Philippines', 'Calatrava', '2157 Briar Crest Way', '8:30 - 00:00', 378, '2002-03-24', 97, 1, 8, 102),
('Colombia', 'Orocué', '1631 Hoard Alley', '10:30 - 00:00', 537, '2023-02-22', 122, 1, 9, 394),
('Russia', 'Tomilino', '13647 Hollow Ridge Terrace', '6:00 - 23:00', 5932, '2012-07-27', 88, 1, 10, 560),
('Spain', 'Madrid', '9 Vidon Circle', '6:00 - 23:00', 6581, '2013-12-12', 147, 1, 11, 565),
('Japan', 'Suwa', '08890 Hoffman Terrace', '9:00 - 22:00', 4175, '2011-10-18', 10, 2, 12, 597),
('Mexico', 'Los Pinos', '390 Mockingbird Park', '6:00 - 23:00', 9431, '2004-08-31', 12, 1, 13, 329),
('Philippines', 'Tagoloan', '4822 Judy Way', '00:00 - 00:00', 3916, '2017-07-31', 44, 1, 14, 775),
('Panama', 'La Palma', '4 Dakota Road', '6:00 - 23:00', 6513, '2009-10-01', 138, 2, 15, 637),
('Indonesia', 'Wanareja', '9 Paget Drive', '00:00 - 00:00', 4996, '2022-09-01', 137, 1, 16, 261),
('Russia', 'Tomilino', '13647 Hollow Ridge Terrace', '6:00 - 23:00', 5932, '2012-07-27', 88, 1, 17, 560),
('Spain', 'Madrid', '9 Vidon Circle', '6:00 - 23:00', 6581, '2013-12-12', 147, 1, 18, 565),
('Russia', 'Tomilino', '13647 Hollow Ridge Terrace', '6:00 - 23:00', 5932, '2012-07-27', 88, 1, 19, 560),
('Japan', 'Suwa', '08890 Hoffman Terrace', '9:00 - 22:00', 4175, '2011-10-18', 10, 2, 20, 597),
('Russia', 'Tomilino', '13647 Hollow Ridge Terrace', '6:00 - 23:00', 5932, '2012-07-27', 88, 1, 21, 560),
('Indonesia', 'Lemahputih', '86 Nova Junction', '6:00 - 23:00', 7813, '2006-10-13', 50, 1, 31, 327),
('Spain', 'Madrid', '9 Vidon Circle', '6:00 - 23:00', 6581, '2013-12-12', 147, 1, 33, 565),
('Russia', 'Tomilino', '13647 Hollow Ridge Terrace', '6:00 - 23:00', 5932, '2012-07-27', 88, 1, 37, 560),
('Indonesia', 'Wanareja', '9 Paget Drive', '00:00 - 00:00', 4996, '2022-09-01', 137, 1, 94, 261);

-- --------------------------------------------------------

--
-- Table structure for table `sporto_sutartys`
--

CREATE TABLE `sporto_sutartys` (
  `Ar_galioja` tinyint(1) NOT NULL,
  `Trukme` varchar(255) NOT NULL,
  `Kada_pasirasyta` date NOT NULL,
  `Ar_taikoma_nuolaida` varchar(255) NOT NULL,
  `id_SPORTO_SUTARTIS` int(11) NOT NULL,
  `fk_SPORTO_SALEid_SPORTO_SALE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_lithuanian_ci;

--
-- Dumping data for table `sporto_sutartys`
--

INSERT INTO `sporto_sutartys` (`Ar_galioja`, `Trukme`, `Kada_pasirasyta`, `Ar_taikoma_nuolaida`, `id_SPORTO_SUTARTIS`, `fk_SPORTO_SALEid_SPORTO_SALE`) VALUES
(2, '6men', '2022-07-04', 'Studento nuolaida', 29, 12),
(2, '24men', '2022-10-18', 'Senjoro nuolaida', 65, 10),
(1, '12men', '2022-05-26', 'Studento nuolaida', 160, 6),
(1, '12men', '2022-03-07', 'Senjoro nuolaida', 201, 16),
(1, '12men', '2022-10-03', 'Senjoro nuolaida', 376, 15),
(1, '24men', '2023-02-08', 'Studento nuolaida', 387, 20),
(1, '6men', '2022-07-01', 'Studento nuolaida', 447, 16),
(1, '24men', '2022-10-20', 'Senjoro nuolaida', 495, 11),
(1, '24men', '2022-08-08', 'Senjoro nuolaida', 600, 6),
(2, '24men', '2022-10-15', 'Senjoro nuolaida', 646, 16),
(1, '24men', '2022-11-28', 'Senjoro nuolaida', 675, 6),
(2, '24men', '2022-06-22', 'Senjoro nuolaida', 721, 5),
(2, '6men', '2023-01-11', 'Senjoro nuolaida', 799, 5),
(1, '12men', '2022-08-10', 'Neigaliojo nuolaida', 809, 8),
(1, '6men', '2022-03-12', 'Neigaliojo nuolaida', 816, 14),
(2, '12men', '2022-08-13', 'Studento nuolaida', 831, 15),
(1, '12men', '2022-11-27', 'Neigaliojo nuolaida', 834, 9),
(1, '12men', '2023-01-11', 'Senjoro nuolaida', 841, 14),
(2, '24men', '2022-10-24', 'Studento nuolaida', 885, 16),
(1, '24men', '2022-06-09', 'Senjoro nuolaida', 911, 18);

-- --------------------------------------------------------

--
-- Table structure for table `transportai`
--

CREATE TABLE `transportai` (
  `Marke` varchar(255) NOT NULL,
  `Modelis` varchar(255) NOT NULL,
  `Numeriai` varchar(255) NOT NULL,
  `Pagaminimo_data` date NOT NULL,
  `Tipas` int(11) NOT NULL,
  `id_TRANSPORTAS` int(11) NOT NULL,
  `fk_DARBUOTOJASDarbuotojo_asmens_kodas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_lithuanian_ci;

--
-- Dumping data for table `transportai`
--

INSERT INTO `transportai` (`Marke`, `Modelis`, `Numeriai`, `Pagaminimo_data`, `Tipas`, `id_TRANSPORTAS`, `fk_DARBUOTOJASDarbuotojo_asmens_kodas`) VALUES
('Aston Martin', 'V8 Vantage', 'WAU2GAFC6EN550144', '2012-10-17', 3, 1, 204),
('Ford', 'Expedition', '3VWPG3AG8AM807465', '1999-10-23', 2, 2, 212),
('Dodge', 'Grand Caravan', 'SCBLC31E31C694721', '2005-04-24', 1, 3, 231),
('Pontiac', 'Sunbird', 'WAUMFAFL8CN015079', '2020-01-27', 5, 4, 359),
('Mazda', 'RX-7', 'WAULK78KX9N584913', '1994-01-31', 1, 5, 411),
('Mercedes-Benz', 'E-Class', 'KNDMG4C33A6362347', '2011-02-11', 1, 6, 439),
('Hyundai', 'Genesis Coupe', 'JN1AV7AP0FM192549', '1993-12-08', 3, 7, 507),
('Kia', 'Spectra', 'WBAAV53481J736436', '1994-06-19', 4, 8, 546),
('Kia', 'Sorento', '1FMJU1G58AE166764', '2007-04-24', 2, 9, 608),
('Hyundai', 'Santa Fe', '5UXZV4C52CL888100', '2018-05-31', 5, 10, 609),
('Buick', 'Park Avenue', '1GYUKCEF3AR009065', '2000-03-17', 1, 11, 622),
('Mercury', 'Mariner', 'JTDBT4K34C1771218', '2018-03-04', 2, 12, 628),
('Mitsubishi', 'Mirage', '5J8TB1H25AA178339', '2001-06-27', 5, 13, 678),
('BMW', 'X5', '3G5DB03LX6S373637', '1998-04-11', 1, 26, 837),
('Volkswagen', 'Jetta III', '3TMJU4GN2EM785692', '2008-12-14', 1, 33, 870),
('Toyota', 'Tundra', '1G6YV34A645074298', '2015-09-05', 3, 34, 919),
('Mercedes-Benz', 'SL-Class', 'WBA5B1C57FD563011', '2015-08-01', 1, 78, 910),
('Ford', 'Econoline E150', '1FTWF3B59AE783193', '2019-09-08', 2, 99, 816);

-- --------------------------------------------------------

--
-- Table structure for table `transporto_priemoniu_tipai`
--

CREATE TABLE `transporto_priemoniu_tipai` (
  `id_TRANSPORTO_PRIEMONES_TIPAS` int(11) NOT NULL,
  `name` char(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_lithuanian_ci;

--
-- Dumping data for table `transporto_priemoniu_tipai`
--

INSERT INTO `transporto_priemoniu_tipai` (`id_TRANSPORTO_PRIEMONES_TIPAS`, `name`) VALUES
(1, 'Krovinine_masina'),
(2, 'Sedanas'),
(3, 'Universalas'),
(4, 'Hecbekas'),
(5, 'Mikro_autobusas');

-- --------------------------------------------------------

--
-- Table structure for table `transportu_defektai`
--

CREATE TABLE `transportu_defektai` (
  `Defektas` varchar(255) NOT NULL,
  `Defekto_data` varchar(255) NOT NULL,
  `Sutvarkymo_data` date NOT NULL,
  `id_TRANSPORTO_DEFEKTAI` int(11) NOT NULL,
  `fk_TRANSPORTASid_TRANSPORTAS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_lithuanian_ci;

--
-- Dumping data for table `transportu_defektai`
--

INSERT INTO `transportu_defektai` (`Defektas`, `Defekto_data`, `Sutvarkymo_data`, `id_TRANSPORTO_DEFEKTAI`, `fk_TRANSPORTASid_TRANSPORTAS`) VALUES
('Starterio problemos', '2021-01-29', '2023-02-26', 1, 1),
('Ausinimo skyscio netekejimas', '2020-01-25', '2020-08-28', 2, 2),
('Starterio problemos', '2020-10-27', '2022-12-18', 3, 3),
('Ausinimo skyscio netekejimas', '2018-07-01', '2021-06-21', 4, 4),
('Ausinimo skyscio netekejimas', '2019-07-29', '2022-10-16', 5, 5),
('Starterio problemos', '2020-02-13', '2022-02-18', 6, 6),
('Didelis alyvos suvartojimas', '2018-03-01', '2020-03-04', 7, 7),
('Elektros problemos', '2020-03-04', '2019-07-25', 8, 8),
('Starterio problemos', '2018-05-20', '2019-08-27', 9, 9),
('Didelis alyvos suvartojimas', '2019-12-30', '2021-08-16', 10, 10),
('Generatoriaus gedimas', '2020-10-11', '2018-08-23', 11, 11),
('Generatoriaus gedimas', '2020-09-15', '2019-08-22', 12, 12),
('Starterio problemos', '2019-07-31', '2019-04-12', 13, 13),
('Ausinimo skyscio netekejimas', '2019-10-22', '2019-04-24', 82, 2),
('Didelis alyvos suvartojimas', '2018-04-09', '2021-06-02', 92, 5),
('Starterio problemos', '2019-02-27', '2020-03-09', 99, 3),
('Elektros problemos', '2018-05-12', '2020-11-06', 100, 4);

-- --------------------------------------------------------

--
-- Table structure for table `uzsakymai`
--

CREATE TABLE `uzsakymai` (
  `Uzsakymo_id` varchar(255) NOT NULL,
  `Kiekis` int(11) NOT NULL,
  `Data` date NOT NULL,
  `id_UZSAKYMAS` int(11) NOT NULL,
  `fk_SPORTO_SALEid_SPORTO_SALE` int(11) NOT NULL,
  `fk_IRANGAid_IRANGA` int(11) NOT NULL,
  `fk_GAMYKLAid_GAMYKLA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_lithuanian_ci;

--
-- Dumping data for table `uzsakymai`
--

INSERT INTO `uzsakymai` (`Uzsakymo_id`, `Kiekis`, `Data`, `id_UZSAKYMAS`, `fk_SPORTO_SALEid_SPORTO_SALE`, `fk_IRANGAid_IRANGA`, `fk_GAMYKLAid_GAMYKLA`) VALUES
('41.170.167.96/18', 49, '2020-04-07', 1, 18, 11, 11),
('167.46.169.22/4', 55, '2018-04-15', 2, 7, 3, 19),
('3.49.186.10/16', 38, '2016-09-15', 5, 8, 9, 20),
('79.21.83.40/18', 32, '2023-02-23', 6, 17, 5, 16),
('222.30.110.109/16', 58, '2020-01-06', 7, 6, 9, 20),
('194.23.209.95/24', 72, '2020-12-11', 12, 10, 16, 16),
('132.235.121.27/24', 55, '2022-10-30', 35, 15, 15, 9),
('180.23.253.199/11', 79, '2017-04-04', 37, 3, 19, 7),
('156.127.207.78/17', 13, '2021-06-24', 39, 12, 12, 17),
('222.30.110.109/16', 58, '2020-01-06', 40, 6, 9, 20),
('79.40.58.103/1', 88, '2018-04-10', 42, 2, 6, 14),
('33.66.215.168/10', 92, '2020-12-16', 44, 17, 19, 8),
('33.66.215.168/10', 92, '2020-12-16', 49, 17, 19, 8),
('35.63.161.168/10', 58, '2023-01-31', 51, 12, 8, 14),
('149.51.232.247/18', 79, '2019-02-01', 56, 17, 11, 20),
('237.251.96.1/10', 90, '2021-04-03', 58, 4, 9, 11),
('129.119.206.177/28', 83, '2016-08-04', 59, 20, 8, 5),
('134.161.62.171/30', 19, '2021-05-28', 63, 8, 11, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ar_dirba_visas_paras`
--
ALTER TABLE `ar_dirba_visas_paras`
  ADD PRIMARY KEY (`id_AR_DIRBA_VISA_PARA`);

--
-- Indexes for table `asmenys`
--
ALTER TABLE `asmenys`
  ADD PRIMARY KEY (`Asmens_kodas`),
  ADD KEY `Lytis` (`Lytis`),
  ADD KEY `priima` (`fk_DARBUOTOJASDarbuotojo_asmens_kodas`),
  ADD KEY `rasosi` (`fk_SPORTO_SUTARTISid_SPORTO_SUTARTIS`);

--
-- Indexes for table `darbo_sutartys`
--
ALTER TABLE `darbo_sutartys`
  ADD PRIMARY KEY (`id_DARBO_SUTARTIS`),
  ADD KEY `Dokumentas` (`Dokumentas`);

--
-- Indexes for table `darbuotojai`
--
ALTER TABLE `darbuotojai`
  ADD PRIMARY KEY (`Darbuotojo_asmens_kodas`),
  ADD KEY `Pozicija` (`Pozicija`),
  ADD KEY `Lytis` (`Lytis`),
  ADD KEY `dirba` (`fk_SPORTO_SALEid_SPORTO_SALE`),
  ADD KEY `pasiraso` (`fk_DARBO_SUTARTISid_DARBO_SUTARTIS`);

--
-- Indexes for table `dokumentai`
--
ALTER TABLE `dokumentai`
  ADD PRIMARY KEY (`id_DOKUMENTAS`);

--
-- Indexes for table `gamyklos`
--
ALTER TABLE `gamyklos`
  ADD PRIMARY KEY (`id_GAMYKLA`);

--
-- Indexes for table `irangos`
--
ALTER TABLE `irangos`
  ADD PRIMARY KEY (`id_IRANGA`);

--
-- Indexes for table `lytys`
--
ALTER TABLE `lytys`
  ADD PRIMARY KEY (`id_LYTIS`);

--
-- Indexes for table `pozicijos_tipai`
--
ALTER TABLE `pozicijos_tipai`
  ADD PRIMARY KEY (`id_POZICIJOS_TIPAS`);

--
-- Indexes for table `savininkai`
--
ALTER TABLE `savininkai`
  ADD PRIMARY KEY (`Savininko_asmens_kodas`),
  ADD KEY `Lytis` (`Lytis`);

--
-- Indexes for table `sporto_sales`
--
ALTER TABLE `sporto_sales`
  ADD PRIMARY KEY (`id_SPORTO_SALE`),
  ADD KEY `Ar_dirba_visa_para` (`Ar_dirba_visa_para`),
  ADD KEY `valdo` (`fk_SAVININKASSavininko_asmens_kodas`);

--
-- Indexes for table `sporto_sutartys`
--
ALTER TABLE `sporto_sutartys`
  ADD PRIMARY KEY (`id_SPORTO_SUTARTIS`),
  ADD KEY `sudaro` (`fk_SPORTO_SALEid_SPORTO_SALE`);

--
-- Indexes for table `transportai`
--
ALTER TABLE `transportai`
  ADD PRIMARY KEY (`id_TRANSPORTAS`),
  ADD KEY `Tipas` (`Tipas`),
  ADD KEY `vairuoja` (`fk_DARBUOTOJASDarbuotojo_asmens_kodas`);

--
-- Indexes for table `transporto_priemoniu_tipai`
--
ALTER TABLE `transporto_priemoniu_tipai`
  ADD PRIMARY KEY (`id_TRANSPORTO_PRIEMONES_TIPAS`);

--
-- Indexes for table `transportu_defektai`
--
ALTER TABLE `transportu_defektai`
  ADD PRIMARY KEY (`id_TRANSPORTO_DEFEKTAI`),
  ADD KEY `turi` (`fk_TRANSPORTASid_TRANSPORTAS`);

--
-- Indexes for table `uzsakymai`
--
ALTER TABLE `uzsakymai`
  ADD PRIMARY KEY (`id_UZSAKYMAS`),
  ADD KEY `daro` (`fk_SPORTO_SALEid_SPORTO_SALE`),
  ADD KEY `itraukia` (`fk_IRANGAid_IRANGA`),
  ADD KEY `siunciamas` (`fk_GAMYKLAid_GAMYKLA`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `asmenys`
--
ALTER TABLE `asmenys`
  ADD CONSTRAINT `asmenys_ibfk_1` FOREIGN KEY (`Lytis`) REFERENCES `lytys` (`id_LYTIS`),
  ADD CONSTRAINT `asmenys_ibfk_2` FOREIGN KEY (`id_SPORTO_SALE`) REFERENCES `sporto_sales` (`id_SPORTO_SALE`),
  ADD CONSTRAINT `priima` FOREIGN KEY (`fk_DARBUOTOJASDarbuotojo_asmens_kodas`) REFERENCES `darbuotojai` (`Darbuotojo_asmens_kodas`),
  ADD CONSTRAINT `rasosi` FOREIGN KEY (`fk_SPORTO_SUTARTISid_SPORTO_SUTARTIS`) REFERENCES `sporto_sutartys` (`id_SPORTO_SUTARTIS`);

--
-- Constraints for table `darbo_sutartys`
--
ALTER TABLE `darbo_sutartys`
  ADD CONSTRAINT `darbo_sutartys_ibfk_1` FOREIGN KEY (`Dokumentas`) REFERENCES `dokumentai` (`id_DOKUMENTAS`);

--
-- Constraints for table `darbuotojai`
--
ALTER TABLE `darbuotojai`
  ADD CONSTRAINT `darbuotojai_ibfk_1` FOREIGN KEY (`Pozicija`) REFERENCES `pozicijos_tipai` (`id_POZICIJOS_TIPAS`),
  ADD CONSTRAINT `darbuotojai_ibfk_2` FOREIGN KEY (`Lytis`) REFERENCES `lytys` (`id_LYTIS`),
  ADD CONSTRAINT `dirba` FOREIGN KEY (`fk_SPORTO_SALEid_SPORTO_SALE`) REFERENCES `sporto_sales` (`id_SPORTO_SALE`),
  ADD CONSTRAINT `pasiraso` FOREIGN KEY (`fk_DARBO_SUTARTISid_DARBO_SUTARTIS`) REFERENCES `darbo_sutartys` (`id_DARBO_SUTARTIS`);

--
-- Constraints for table `savininkai`
--
ALTER TABLE `savininkai`
  ADD CONSTRAINT `savininkai_ibfk_1` FOREIGN KEY (`Lytis`) REFERENCES `lytys` (`id_LYTIS`);

--
-- Constraints for table `sporto_sales`
--
ALTER TABLE `sporto_sales`
  ADD CONSTRAINT `sporto_sales_ibfk_1` FOREIGN KEY (`Ar_dirba_visa_para`) REFERENCES `ar_dirba_visas_paras` (`id_AR_DIRBA_VISA_PARA`),
  ADD CONSTRAINT `valdo` FOREIGN KEY (`fk_SAVININKASSavininko_asmens_kodas`) REFERENCES `savininkai` (`Savininko_asmens_kodas`);

--
-- Constraints for table `sporto_sutartys`
--
ALTER TABLE `sporto_sutartys`
  ADD CONSTRAINT `sudaro` FOREIGN KEY (`fk_SPORTO_SALEid_SPORTO_SALE`) REFERENCES `sporto_sales` (`id_SPORTO_SALE`);

--
-- Constraints for table `transportai`
--
ALTER TABLE `transportai`
  ADD CONSTRAINT `transportai_ibfk_1` FOREIGN KEY (`Tipas`) REFERENCES `transporto_priemoniu_tipai` (`id_TRANSPORTO_PRIEMONES_TIPAS`),
  ADD CONSTRAINT `vairuoja` FOREIGN KEY (`fk_DARBUOTOJASDarbuotojo_asmens_kodas`) REFERENCES `darbuotojai` (`Darbuotojo_asmens_kodas`);

--
-- Constraints for table `transportu_defektai`
--
ALTER TABLE `transportu_defektai`
  ADD CONSTRAINT `turi` FOREIGN KEY (`fk_TRANSPORTASid_TRANSPORTAS`) REFERENCES `transportai` (`id_TRANSPORTAS`);

--
-- Constraints for table `uzsakymai`
--
ALTER TABLE `uzsakymai`
  ADD CONSTRAINT `daro` FOREIGN KEY (`fk_SPORTO_SALEid_SPORTO_SALE`) REFERENCES `sporto_sales` (`id_SPORTO_SALE`),
  ADD CONSTRAINT `itraukia` FOREIGN KEY (`fk_IRANGAid_IRANGA`) REFERENCES `irangos` (`id_IRANGA`),
  ADD CONSTRAINT `siunciamas` FOREIGN KEY (`fk_GAMYKLAid_GAMYKLA`) REFERENCES `gamyklos` (`id_GAMYKLA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
