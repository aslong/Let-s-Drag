-- phpMyAdmin SQL Dump
-- version 2.11.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 07, 2009 at 01:01 PM
-- Server version: 5.0.45
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `LetsDrag`
--

-- --------------------------------------------------------

--
-- Table structure for table `CARS`
--

CREATE TABLE IF NOT EXISTS `CARS` (
  `id` bigint(20) NOT NULL auto_increment,
  `year` bigint(20) NOT NULL,
  `model` bigint(20) NOT NULL,
  `make` bigint(20) NOT NULL,
  `specs` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=173 ;

--
-- Dumping data for table `CARS`
--

INSERT INTO `CARS` (`id`, `year`, `model`, `make`, `specs`) VALUES
(1, 2, 1, 1, 1),
(2, 2, 2, 1, 2),
(3, 2, 3, 1, 3),
(4, 2, 4, 1, 4),
(5, 1, 5, 2, 5),
(6, 1, 6, 2, 6),
(7, 1, 7, 3, 7),
(8, 1, 8, 2, 8),
(9, 1, 9, 2, 9),
(10, 1, 10, 1, 10),
(11, 1, 11, 1, 11),
(12, 1, 12, 1, 12),
(13, 1, 13, 1, 13),
(14, 1, 14, 1, 14),
(15, 1, 15, 1, 15),
(16, 1, 16, 1, 16),
(17, 1, 17, 1, 17),
(18, 1, 18, 1, 18),
(19, 1, 19, 1, 19),
(20, 1, 20, 1, 20),
(21, 1, 3, 1, 21),
(22, 7, 22, 1, 22),
(23, 1, 2, 1, 23),
(24, 7, 23, 17, 24),
(25, 2, 24, 45, 25),
(26, 1, 25, 17, 26),
(27, 1, 27, 17, 27),
(28, 1, 28, 17, 28),
(29, 1, 29, 17, 29),
(30, 1, 30, 17, 30),
(31, 1, 31, 26, 31),
(32, 1, 32, 1, 32),
(33, 1, 33, 1, 33),
(34, 1, 34, 1, 34),
(35, 1, 35, 1, 35),
(36, 1, 36, 1, 36),
(37, 1, 37, 2, 37),
(38, 1, 38, 2, 38),
(39, 1, 39, 2, 39),
(40, 1, 40, 2, 40),
(41, 1, 41, 2, 41),
(42, 1, 42, 2, 42),
(43, 1, 43, 2, 43),
(44, 1, 44, 2, 44),
(45, 1, 45, 2, 45),
(46, 1, 46, 2, 46),
(47, 1, 47, 2, 47),
(48, 1, 48, 2, 48),
(49, 1, 49, 2, 49),
(50, 1, 50, 10, 50),
(51, 1, 51, 10, 51),
(52, 1, 52, 10, 52),
(53, 1, 53, 11, 53),
(54, 1, 54, 11, 54),
(55, 1, 55, 11, 55),
(56, 1, 56, 11, 56),
(57, 1, 57, 11, 57),
(58, 1, 58, 11, 58),
(59, 1, 59, 11, 59),
(60, 1, 60, 11, 60),
(61, 1, 61, 11, 61),
(62, 1, 62, 11, 62),
(63, 1, 65, 14, 63),
(64, 15, 66, 14, 64),
(65, 15, 67, 14, 65),
(66, 15, 68, 14, 66),
(67, 1, 69, 14, 67),
(68, 1, 70, 14, 68),
(69, 1, 71, 5, 69),
(70, 1, 72, 5, 70),
(71, 1, 73, 5, 71),
(72, 1, 76, 5, 72),
(73, 1, 75, 5, 73),
(74, 1, 74, 5, 74),
(75, 1, 77, 5, 75),
(76, 1, 78, 17, 76),
(77, 1, 79, 17, 77),
(78, 4, 80, 4, 78),
(79, 5, 80, 4, 79),
(80, 1, 81, 4, 80),
(81, 1, 82, 4, 81),
(82, 1, 83, 4, 82),
(83, 1, 84, 6, 83),
(84, 1, 85, 6, 84),
(85, 1, 86, 6, 85),
(86, 1, 87, 6, 86),
(87, 1, 88, 6, 87),
(88, 1, 89, 6, 88),
(89, 1, 90, 6, 89),
(90, 1, 91, 6, 90),
(91, 5, 92, 6, 91),
(92, 6, 92, 6, 92),
(93, 1, 93, 6, 93),
(94, 1, 94, 6, 94),
(95, 1, 95, 6, 95),
(96, 1, 96, 6, 96),
(97, 1, 97, 6, 97),
(98, 1, 98, 6, 98),
(99, 1, 99, 6, 99),
(100, 15, 100, 6, 100),
(101, 15, 101, 6, 101),
(102, 15, 102, 6, 102),
(103, 1, 103, 32, 103),
(104, 1, 104, 29, 104),
(105, 1, 105, 29, 105),
(106, 12, 38, 2, 106),
(107, 1, 106, 13, 107),
(108, 1, 108, 19, 108),
(109, 1, 107, 19, 109),
(110, 15, 110, 21, 110),
(111, 15, 109, 21, 111),
(112, 1, 111, 23, 112),
(113, 1, 112, 28, 113),
(114, 1, 113, 31, 114),
(115, 1, 114, 31, 115),
(116, 1, 115, 31, 116),
(117, 1, 116, 31, 117),
(118, 1, 117, 32, 118),
(119, 1, 118, 32, 119),
(120, 1, 119, 32, 120),
(121, 1, 120, 32, 121),
(122, 1, 121, 32, 122),
(123, 1, 122, 34, 123),
(124, 1, 123, 34, 124),
(125, 1, 124, 34, 125),
(126, 1, 125, 34, 126),
(127, 1, 126, 34, 127),
(128, 1, 127, 34, 128),
(129, 1, 128, 35, 129),
(130, 1, 129, 35, 130),
(131, 1, 130, 35, 131),
(132, 1, 131, 35, 132),
(133, 1, 132, 36, 133),
(134, 1, 133, 36, 134),
(135, 1, 134, 38, 135),
(136, 1, 136, 38, 136),
(137, 1, 138, 39, 137),
(138, 1, 139, 46, 138),
(139, 1, 140, 43, 139),
(140, 1, 141, 43, 140),
(141, 1, 142, 44, 141),
(142, 1, 143, 13, 142),
(143, 1, 144, 13, 143),
(144, 1, 145, 19, 144),
(145, 1, 146, 22, 145),
(146, 1, 147, 22, 146),
(147, 1, 148, 28, 147),
(148, 1, 149, 31, 148),
(149, 1, 150, 32, 149),
(150, 1, 151, 32, 150),
(151, 1, 152, 32, 151),
(152, 1, 153, 32, 152),
(153, 1, 154, 3, 153),
(154, 1, 155, 3, 154),
(155, 1, 156, 41, 155),
(156, 1, 157, 41, 156),
(157, 1, 158, 26, 157),
(158, 1, 159, 30, 158),
(159, 1, 160, 30, 159),
(160, 1, 161, 30, 160),
(161, 1, 162, 30, 161),
(162, 1, 163, 30, 162),
(163, 1, 164, 29, 163),
(164, 1, 165, 29, 164),
(165, 2, 166, 26, 165),
(166, 3, 156, 41, 166),
(167, 2, 167, 26, 167),
(168, 2, 168, 26, 168),
(169, 4, 169, 27, 169),
(170, 8, 157, 41, 170),
(171, 8, 170, 41, 171),
(172, 2, 171, 35, 172);

-- --------------------------------------------------------

--
-- Table structure for table `MAKES`
--

CREATE TABLE IF NOT EXISTS `MAKES` (
  `id` bigint(20) NOT NULL auto_increment,
  `make` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=47 ;

--
-- Dumping data for table `MAKES`
--

INSERT INTO `MAKES` (`id`, `make`) VALUES
(1, 'Audi'),
(2, 'BMW'),
(3, 'Nissan'),
(4, 'Ford'),
(5, 'Dodge'),
(6, 'Porsche'),
(7, 'Saab'),
(8, 'Acura'),
(9, 'Alfa Romeo'),
(10, 'Aston Martin'),
(11, 'Bentley'),
(12, 'Buick'),
(13, 'Cadillac'),
(14, 'Chevrolet'),
(15, 'Chrysler'),
(16, 'Daewoo'),
(17, 'Ferrari'),
(18, 'GMC'),
(19, 'Honda'),
(20, 'Hummer'),
(21, 'Hyundai'),
(22, 'Infiniti'),
(23, 'Jaguar'),
(24, 'Jeep'),
(25, 'Kia'),
(26, 'Lamborghini'),
(27, 'Land Rover'),
(28, 'Lexus'),
(29, 'Lotus'),
(30, 'Maserati'),
(31, 'Mazda'),
(32, 'Mercedes-Benz'),
(33, 'Mercury'),
(34, 'Mini'),
(35, 'Mitsubishi'),
(36, 'Pontiac'),
(37, 'Rolls Royce'),
(38, 'Saturn'),
(39, 'Scion'),
(40, 'Smart'),
(41, 'Subaru'),
(42, 'Toyota'),
(43, 'Volkswagen'),
(44, 'Volvo'),
(45, 'Bugatti'),
(46, 'Tesla');

-- --------------------------------------------------------

--
-- Table structure for table `MODELS`
--

CREATE TABLE IF NOT EXISTS `MODELS` (
  `id` bigint(20) NOT NULL auto_increment,
  `model` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=172 ;

--
-- Dumping data for table `MODELS`
--

INSERT INTO `MODELS` (`id`, `model`) VALUES
(1, 'RS4'),
(2, 'R8'),
(3, 'S4'),
(4, 'A4 3.2L Quattro'),
(5, '135i'),
(6, '125i'),
(7, '370Z'),
(8, '750i'),
(9, '328i'),
(10, 'Q7 3.6L'),
(11, 'Q7 4.2L'),
(12, 'TT 2.0T Coupe'),
(13, 'TT 2.0T Roadster'),
(14, 'TT 3.2 Coupe'),
(15, 'TT 3.2 Roadster'),
(16, 'TTS Roadster'),
(17, 'TTS Coupe'),
(18, 'S8'),
(19, 'S6'),
(20, 'S5'),
(21, 'S4'),
(22, 'RS6'),
(23, 'Enzo'),
(24, 'Veyron'),
(25, 'F430 Spider F1'),
(27, 'F430 Spider'),
(28, 'F430 Berlinetta'),
(29, 'F430 Berlinetta F1'),
(30, 'F430 Scuderia'),
(31, 'Murcielago LP640'),
(32, 'A8 4.2L'),
(33, 'A8 6.0L'),
(34, 'A6 4.2L'),
(35, 'A5'),
(36, 'A3 3.2L'),
(37, '128i'),
(38, 'M3'),
(39, 'M5'),
(40, 'M6'),
(41, 'Z4 sDrive35i'),
(42, '335i'),
(43, '528i'),
(44, '535i'),
(45, '550i'),
(46, '650i'),
(47, 'X3'),
(48, 'X5 4.8L'),
(49, 'X6 4.4L'),
(50, 'DB9'),
(51, 'DBS'),
(52, 'V8 Vantage'),
(53, 'Arnage R'),
(54, 'Arnage T'),
(55, 'Arnage RL'),
(56, 'Azure'),
(57, 'Brooklands'),
(58, 'Continental Flying Spur'),
(59, 'Continental Flying Spur Speed'),
(60, 'Continental GT'),
(61, 'Continental GT Speed'),
(62, 'Continental GTC'),
(63, 'Camaro'),
(64, 'Camaro 1LS'),
(65, 'Camaro 1LT'),
(66, 'Camaro 2LT'),
(67, 'Camaro 1SS'),
(68, 'Camaro 2SS'),
(69, 'Corvette Z06'),
(70, 'Corvette ZR1'),
(71, 'Challenger SE'),
(72, 'Challenger R/T'),
(73, 'Challenger SRT8'),
(74, 'Charger SRT8'),
(75, 'Charger R/T'),
(76, 'Charger SXT'),
(77, 'Viper SRT 10'),
(78, '599 GTB Fiorano'),
(79, '612 Scaglietti'),
(80, 'GT'),
(81, 'Mustang'),
(82, 'Mustang GT'),
(83, 'Shelby GT500'),
(84, '911 Carrera'),
(85, '911 Carrera 4'),
(86, '911 Turbo'),
(87, '911 Carrera S'),
(88, '911 Carrera 4S'),
(89, '911 Targa 4S'),
(90, 'Boxster'),
(91, 'Boxster S'),
(92, 'Carrera GT'),
(93, 'Cayenne'),
(94, 'Cayenne S'),
(95, 'Cayenne GTS'),
(96, 'Cayenne Turbo'),
(97, 'Cayenne Turbo S'),
(98, 'Cayman'),
(99, 'Cayman S'),
(100, 'Panamera S'),
(101, 'Panamera 4S'),
(102, 'Panamera Turbo'),
(103, 'SLR McLaren'),
(104, 'Elise'),
(105, 'Elise SC'),
(106, 'XLR'),
(107, 'Civic Si'),
(108, 'Civic EX'),
(109, 'Genesis 3.8 Track'),
(110, 'Genesis 2.0T'),
(111, 'XKR'),
(112, 'SC 430'),
(113, 'MX-5 Miata SV'),
(114, 'MX-5 Miata Sport'),
(115, 'RX-8 Sport'),
(116, 'RX-8 R3'),
(117, 'CLK350'),
(118, 'CLK550'),
(119, 'SLK300'),
(120, 'SLK350'),
(121, 'SLK55 AMG'),
(122, 'Cooper S Clubman'),
(123, 'Cooper S'),
(124, 'Cooper S Convertible'),
(125, 'Cooper'),
(126, 'Cooper Convertible'),
(127, 'John Cooper Works'),
(128, 'Eclipse Spyder GS'),
(129, 'Eclipse Spyder GT'),
(130, 'Eclipse GS'),
(131, 'Eclipse GT'),
(132, 'Solstice'),
(133, 'Solstice GXP'),
(134, 'Sky'),
(135, 'Sky Hydro Blue'),
(136, 'Sky Red Line'),
(137, 'Sky Red Line Hydro Blue'),
(138, 'tC'),
(139, 'Roadster'),
(140, 'Eos'),
(141, 'GTI'),
(142, 'C70'),
(143, 'STS-V'),
(144, 'XLR-V'),
(145, 'S2000'),
(146, 'G37'),
(147, 'G37 S'),
(148, 'IS-F'),
(149, 'MAZDASPEED3'),
(150, 'SL550'),
(151, 'SL63 AMG'),
(152, 'SL600'),
(153, 'SL65 AMG'),
(154, '350Z'),
(155, 'GT-R'),
(156, 'Impreza WRX STi'),
(157, 'Impreza WRX'),
(158, 'Gallardo'),
(159, 'GranTurismo'),
(160, 'GranTurismo S'),
(161, 'Quattroporte'),
(162, 'Quattroporte S'),
(163, 'Quattroporte GT S'),
(164, 'Exige S 240'),
(165, 'Exige S 260'),
(166, 'Reventon'),
(167, 'Gallardo Spyder'),
(168, 'Gallardo Superleggera'),
(169, 'Range Rover Supercharged'),
(170, 'Impreza'),
(171, 'Lancer Evolution X FQ-360 GSR');

-- --------------------------------------------------------

--
-- Table structure for table `REQUESTEDCARS`
--

CREATE TABLE IF NOT EXISTS `REQUESTEDCARS` (
  `id` bigint(20) NOT NULL auto_increment,
  `email` text collate utf8_unicode_ci,
  `year` text collate utf8_unicode_ci,
  `make` text collate utf8_unicode_ci NOT NULL,
  `model` text collate utf8_unicode_ci NOT NULL,
  `notes` text collate utf8_unicode_ci NOT NULL,
  `added_to_list` tinyint(4) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `REQUESTEDCARS`
--

INSERT INTO `REQUESTEDCARS` (`id`, `email`, `year`, `make`, `model`, `notes`, `added_to_list`) VALUES
(4, 'scalesubewrx@yahoo.com', '2007', 'Subaru', 'WRX STI', ' ', 1),
(5, ' ', ' ', 'Lamborghini', 'Gallardo Spyder', ' ', 1),
(6, ' ', ' ', 'Lamborghini', 'Superleggera', ' ', 1),
(7, ' ', ' ', 'Lamborghini', 'Reventon', ' ', 1),
(8, ' ', ' ', 'Range Rover', 'Whatever', ' ', 1),
(9, 'independence_brad@yahoo.com', '2002', 'Subaru', 'WRX', ' ', 1),
(10, 'cyclonebrad@yahoo.com', '2002', 'Subaru', 'Impreza', ' ', 1),
(11, ' ', '2008', ' ', ' ', 'sfdklj', 1),
(12, ' ', '2004', 'jksdaf', 'fsad', ' ', 1),
(13, 'ampversion', '3214', 'sdaf', 'asfe', ' ', 1),
(14, ' ', '2341', 'fdsa', 'awfe', ' ', 1),
(15, ' ', '2009', 'Mitsubishi', 'Lancer Evolution X', ' ', 1),
(16, 'hggg', 'FCC', 'gbb', 'bggh', 'bgggh', 1);

-- --------------------------------------------------------

--
-- Table structure for table `SPECS`
--

CREATE TABLE IF NOT EXISTS `SPECS` (
  `id` bigint(20) NOT NULL auto_increment,
  `horse_power` int(11) NOT NULL,
  `torque` int(11) NOT NULL,
  `zero_to_sixty` double NOT NULL,
  `image_path` text collate utf8_unicode_ci,
  `quarter_mile` double default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=173 ;

--
-- Dumping data for table `SPECS`
--

INSERT INTO `SPECS` (`id`, `horse_power`, `torque`, `zero_to_sixty`, `image_path`, `quarter_mile`) VALUES
(1, 420, 317, 4.5, 'Audi/RS4/2008/RS4.jpg', 13.1),
(2, 420, 317, 4.2, 'Audi/2/2008/AudiR8.jpg', 12.6),
(3, 340, 302, 5.3, 'Audi/S4/2008/AudiS4.jpg', 13.9),
(4, 255, 243, 6.28, 'Audi/4/2008/AudiA4.jpg', 14.83),
(5, 300, 300, 5.2, 'BMW/135i/2009/2009bmw135i.jpg', 13.6),
(6, 218, 199, 6.4, 'BMW/125i/2009/2009BMW125i.jpg', 0),
(7, 332, 270, 5.1, 'Nissan/370Z/2009/2009Nissan370Z.jpg', 13.4),
(8, 400, 450, 5.2, 'BMW/8/2009/2009BMW750i.jpg', 13.5),
(9, 230, 200, 6.98, 'BMW/328i/2009/2009BMW328i.jpg', 15.43),
(10, 280, 266, 8.3, 'Audi/10/2009/2009AudiQ73-7.jpg', 16.1),
(11, 350, 325, 7.1, 'Audi/11/2009/2009AudiQ74-2.jpg', 15.2),
(12, 200, 207, 6.1, 'Audi/12/2009/2009AudiTT2-0TCoupe.jpg', 14.8),
(13, 200, 207, 6.3, 'Audi/13/2009/2009AudiTT2-0TRoadster.jpg', 14.9),
(14, 250, 236, 5.5, 'Audi/14/2009/2009AudiTT3-2Coupe.jpg', 14.3),
(15, 250, 236, 5.8, 'Audi/15/2009/2009AudiTT3-2Roadster.jpg', 14.6),
(16, 265, 258, 5.1, 'Audi/16/2009/2009AudiTTSRoadster.jpg', 0),
(17, 265, 258, 4.9, 'Audi/17/2009/2009AudiTTSCoupe.jpg', 0),
(18, 450, 398, 6, 'Audi/18/2009/2009AudiS8.jpg', 0),
(19, 435, 398, 5.1, 'Audi/19/2009/2009AudiS6.jpg', 13.4),
(20, 354, 325, 4.9, 'Audi/20/2009/2009AudiS5.jpg', 13.3),
(21, 340, 302, 5.1, 'Audi/21/2009/2009AudiS4.jpg', 0),
(22, 450, 415, 4.7, 'Audi/22/2003/2003AudiRS6.jpg', 13.14),
(23, 420, 317, 4.2, 'Audi/2/2009/2009AudiR8.jpg', 12.7),
(24, 660, 484, 3.24, 'Ferrari/23/2003/2003FerrariEnzo.jpg', 10.96),
(25, 1001, 922, 2.5, 'Bugatti/24/2008/2008BugattiVeyron.jpg', 10.2),
(26, 490, 342, 4.08, 'Ferrari/25/2009/2009FerrariF430SpiderF1.jpg', 12.34),
(27, 490, 342, 4.08, 'Ferrari/27/2009/2009FerrariF430Spider.jpg', 12.34),
(28, 490, 342, 3.98, 'Ferrari/28/2009/2009FerrariF430Berlinetta.jpg', 12.19),
(29, 490, 342, 3.98, 'Ferrari/29/2009/2009FerrariBerlinettaF1.jpg', 12.19),
(30, 503, 347, 3.7, 'Ferrari/30/2009/2009FerrariF430Scuderia.jpg', 11),
(31, 640, 486, 3.3, 'Lamborghini/31/2009/2009LamborghiniMurcielagoLP640.jpg', 11.4),
(32, 350, 325, 5.62, 'Audi/32/2009/2009AudiA83-2L.jpg', 14.16),
(33, 450, 428, 5.06, 'Audi/33/2009/2009AudiA84-2L.jpg', 13.64),
(34, 350, 325, 5.55, 'Audi/34/2009/2009AudiA64-2L.jpg', 14.16),
(35, 265, 243, 5.9, 'Audi/35/2009/2009AudiA5.jpg', 0),
(36, 250, 236, 6.8, 'Audi/36/2009/2009AudiA33-2.jpg', 0),
(37, 230, 200, 6.1, 'BMW/37/2009/2009BMW128i.jpg', 0),
(38, 414, 295, 4.6, 'BMW/38/2009/2009BMWM3.jpg', 12.7),
(39, 500, 383, 4.8, 'BMW/39/2009/2009BMWM5.jpg', 0),
(40, 500, 383, 4.61, 'BMW/40/2009/2009BMWM6.jpg', 12.87),
(41, 300, 300, 5, 'BMW/41/2009/2009BMWZ435i.jpg', 13.5),
(42, 300, 300, 6.08, 'BMW/42/2009/2009BMW335i.jpg', 14.74),
(43, 230, 200, 7.8, 'BMW/43/2009/2009BMW528i.jpg', 0),
(44, 300, 300, 5.5, 'BMW/44/2009/2009BMW535i.jpg', 14),
(45, 360, 360, 5.5, 'BMW/45/2009/2009BMW550i.jpg', 13.7),
(46, 360, 360, 5.25, 'BMW/46/2009/2009BMW650i.jpg', 13.82),
(47, 260, 225, 6.9, 'BMW/47/2009/2009BMWX3.jpg', 0),
(48, 350, 350, 6.54, 'BMW/48/2009/2009BMWX54.8i.jpg', 15.15),
(49, 400, 450, 5.4, 'BMW/49/2009/2009BMWX64-4L.jpg', 0),
(50, 470, 443, 4.59, 'Aston-Martin/50/2009/2009AstonMartinDB9.jpg', 13.14),
(51, 510, 420, 4.3, 'Aston-Martin/51/2009/2009AstonMartinDBS.jpg', 12),
(52, 420, 346, 4.7, 'Aston-Martin/52/2009/2009AstonMartinV8Vantage.jpg', 13.1),
(53, 450, 645, 7.41, 'Bentley/53/2009/2009BentleyArnageR.jpg', 15.48),
(54, 500, 738, 6.71, 'Bentley/54/2009/2009BentleyArnageT.jpg', 14.87),
(55, 450, 645, 7.41, 'Bentley/55/2009/2009BentleyArnageRL.jpg', 15.48),
(56, 450, 645, 6.71, 'Bentley/56/2009/2009BentleyAzure.jpg', 14.87),
(57, 530, 774, 5, 'Bentley/57/2009/2009BentleyBrooklands.jpg', 13.3),
(58, 552, 479, 5.46, 'Bentley/58/2009/2009BentleyContinentalFlyingSpur.jpg', 14.08),
(59, 600, 553, 4.5, 'Bentley/59/2009/2009BentleyContinentalFlyingSpurSpeed.jpg', 12.5),
(60, 552, 479, 4.7, 'Bentley/60/2009/2009BentleyContinentalGT.jpg', 12.8),
(61, 600, 553, 4.3, 'Bentley/61/2009/2009BentleyContinentalGTSpeed.jpg', 12.5),
(62, 552, 479, 5.31, 'Bentley/62/2009/2009BentleyContinentalGTC.jpg', 13.81),
(63, 304, 273, 5.9, 'Chevrolet/65/2009/2010ChevroletCamaro1LT.jpg', 14.4),
(64, 304, 273, 5.9, 'Chevrolet/66/2010/2010ChevroletCamaro1LT.jpg', 14.4),
(65, 426, 420, 4.7, 'Chevrolet/67/2010/2010ChevroletCamaro1SS.jpg', 0),
(66, 426, 420, 4.7, 'Chevrolet/68/2010/2010ChevroletCamaro2SS.jpg', 0),
(67, 505, 470, 3.7, 'Chevrolet/69/2009/2009ChevroletCorvetteZ06.jpg', 11.7),
(68, 638, 604, 3.2, 'Chevrolet/70/2009/2009ChevroletCorvetteZR1.jpg', 0),
(69, 250, 250, 8.1, 'Dodge/71/2009/2009DodgeChallengerSE.jpg', 16.1),
(70, 376, 410, 5.9, 'Dodge/72/2009/2009DodgeChallengerRT.jpg', 14.1),
(71, 425, 420, 5.5, 'Dodge/73/2009/2009DodgeChallengerSRT8.jpg', 13.8),
(72, 250, 250, 9.3, 'Dodge/76/2009/2009DodgeChargerSXT.jpg', 0),
(73, 368, 395, 6, 'Dodge/75/2009/2009DodgeChargerRT.jpg', 0),
(74, 425, 420, 5, 'Dodge/74/2009/2009DodgeChargerSRT8.jpg', 13.9),
(75, 600, 560, 3.5, 'Dodge/77/2009/2009DodgeViperSRT10.jpg', 12.1),
(76, 612, 448, 3.3, 'Ferrari/78/2009/2009Ferrari599GTBFiorano.jpg', 11.2),
(77, 540, 434, 4.67, 'Ferrari/79/2009/2009Ferrari612Scaglietti.jpg', 12.75),
(78, 550, 500, 3.39, 'Ford/80/2006/2006FordGT.jpg', 11.69),
(79, 550, 500, 3.4, 'Ford/80/2005/2005FordGT.jpg', 11.7),
(80, 210, 240, 6.9, 'Ford/81/2009/2009FordMustang.jpg', 0),
(81, 300, 320, 5.2, 'Ford/82/2009/2009FordMustangGT.jpg', 0),
(82, 500, 480, 4.6, 'Ford/83/2009/2009FordShelbyGT500.jpg', 12.8),
(83, 345, 288, 4.77, 'Porsche/84/2009/2009Porsche911Carrera.jpg', 13.26),
(84, 345, 288, 4.74, 'Porsche/85/2009/2009PorscheCarrera4.jpg', 13.27),
(85, 480, 460, 3.7, 'Porsche/86/2009/2009Porsche911Turbo.jpg', 0),
(86, 385, 310, 4.52, 'Porsche/87/2009/2009Porsche911CarreraS.jpg', 12.87),
(87, 385, 310, 4.52, 'Porsche/88/2009/2009Porsche911Carrera4S.jpg', 12.87),
(88, 385, 310, 4.7, 'Porsche/89/2009/2009Porsche911Targa4S.jpg', 0),
(89, 255, 214, 5.6, 'Porsche/90/2009/2009PorscheBoxster.jpg', 0),
(90, 310, 266, 5, 'Porsche/91/2009/2009PorscheBoxsterS.jpg', 0),
(91, 605, 435, 3.51, 'Porsche/92/2005/2005PorscheCarreraGT.jpg', 11.37),
(92, 605, 435, 3.48, 'Porsche/92/2004/2004PorscheCarreraGT.jpg', 11.34),
(93, 290, 273, 7.5, 'Porsche/93/2009/2009PorscheCayenne.jpg', 0),
(94, 385, 369, 6.4, 'Porsche/94/2009/2009PorscheCayenneS.jpg', 0),
(95, 405, 369, 5.7, 'Porsche/95/2009/2009PorscheCayenneGTS.jpg', 0),
(96, 500, 516, 4.9, 'Porsche/96/2009/2009PorscheCayenneTurbo.jpg', 0),
(97, 550, 553, 4.7, 'Porsche/97/2009/2009PorscheCayenneTurboS.jpg', 0),
(98, 265, 221, 5.5, 'Porsche/98/2009/2009PorscheCayman.jpg', 0),
(99, 320, 273, 4.9, 'Porsche/99/2009/2009PorscheCaymanS.jpg', 0),
(100, 400, 369, 5.2, 'Porsche/100/2010/2010PorschePanameraS.jpg', 0),
(101, 400, 369, 4.8, 'Porsche/101/2010/2010PorschePanamera4S.jpg', 0),
(102, 500, 516, 4, 'Porsche/102/2010/2010PorschePanameraTurbo.jpg', 0),
(103, 617, 575, 3.6, 'Mercedes-Benz/103/2009/2009MercedesBenzSLRMcLaren.jpg', 11.5),
(104, 189, 133, 5.1, 'Lotus/104/2009/2009LotusElise.jpg', 13.6),
(105, 218, 156, 4.4, 'Lotus/105/2009/2009LotusEliseSC.jpg', 13.3),
(106, 240, 236, 5.5, 'BMW/38/1997/1997BMWM3.jpg', 14),
(107, 320, 310, 5.97, 'Cadillac/106/2009/2009CadillacXLR.jpg', 14.15),
(108, 140, 128, 8.4, 'Honda/108/2009/2009HondaCivicEX.jpg', 16.7),
(109, 197, 139, 7.3, 'Honda/107/2009/2009HondaCivicSi.jpg', 15.7),
(110, 306, 266, 6.8, 'Hyundai/110/2010/2010HyundaiGenesis2-0T.jpg', 15.2),
(111, 306, 266, 5.5, 'Hyundai/109/2010/2010HyundaiGenesis3-8Track.jpg', 14),
(112, 420, 413, 4.9, 'Jaguar/111/2009/2009JaguarXKR.jpg', 13.3),
(113, 288, 317, 6.2, 'Lexus/112/2009/2009LexusSC430.jpg', 14.84),
(114, 167, 140, 6.84, 'Mazda/113/2009/2009MazdaMX5MiataSV.jpg', 15.14),
(115, 167, 140, 6.84, 'Mazda/114/2009/2009MazdaMX5MiataSport.jpg', 15.14),
(116, 232, 159, 6.5, 'Mazda/115/2009/2009MazdaRX8Sport.jpg', 15),
(117, 232, 159, 6.5, 'Mazda/116/2009/2009MazdaRx8R3.jpg', 15),
(118, 268, 258, 6.47, 'Mercedes-Benz/117/2009/2009MercedesBenzCLK350.jpg', 15.11),
(119, 382, 391, 4.89, 'Mercedes-Benz/118/2009/2009MercedesBenzCLK550.jpg', 13.57),
(120, 228, 221, 6.1, 'Mercedes-Benz/119/2009/2009MercedesBenzSLK300.jpg', 14.5),
(121, 300, 265, 5.3, 'Mercedes-Benz/120/2009/2009MercedesBenzSLK350.jpg', 13.8),
(122, 355, 376, 4.9, 'Mercedes-Benz/121/2009/2009MercedesBenzSLK55AMG.jpg', 13),
(123, 172, 192, 7.2, 'Mini/122/2009/2009MiniCooperSClubman.jpg', 15.4),
(124, 172, 192, 6.2, 'Mini/123/2009/2009MiniCooperS.jpg', 14.8),
(125, 172, 192, 7, 'Mini/124/2009/2009MiniCooperSConvertible.jpg', 15.3),
(126, 118, 114, 8.5, 'Mini/125/2009/2009MiniCooper.jpg', 16.6),
(127, 118, 114, 8.5, 'Mini/126/2009/2009MiniCooperConvertible.jpg', 0),
(128, 208, 207, 6, 'Mini/127/2009/2009MiniJohnCooperWorks.jpg', 14.4),
(129, 162, 162, 8.48, 'Mitsubishi/128/2009/2009MitsubishiEclipseSpyderGS.jpg', 16.58),
(130, 265, 262, 6, 'Mitsubishi/129/2009/2009MitsubishiEclipseSpyderGT.jpg', 14.6),
(131, 162, 162, 8.37, 'Mitsubishi/130/2009/2009MitsubishiEclipseGS.jpg', 16.61),
(132, 265, 262, 6.79, 'Mitsubishi/131/2009/2009MitsubishiEclipseGT.jpg', 14.89),
(133, 173, 167, 7.2, 'Pontiac/132/2009/2009PontiacSolstice.jpg', 15.6),
(134, 260, 260, 5.5, 'Pontiac/133/2009/2009PontiacSolsticeGXP.jpg', 13.8),
(135, 173, 167, 7.5, 'Saturn/134/2009/2009SaturnSky.jpg', 0),
(136, 260, 260, 5.5, 'Saturn/136/2009/2009SaturnSkyRedLine.jpg', 13.9),
(137, 161, 162, 8.04, 'Scion/138/2009/2009SciontC.jpg', 15.85),
(138, 248, 280, 3.9, 'Tesla/139/2009/2009TeslaRoadster.jpg', 12.7),
(139, 200, 207, 7.8, 'Volkswagen/140/2009/2009VolkswagenEos.jpg', 15.66),
(140, 200, 207, 6, 'Volkswagen/141/2009/2009VolkswagenGTI.jpg', 14.6),
(141, 227, 236, 7.76, 'Volvo/142/2009/2009VolvoC70.jpg', 16.21),
(142, 469, 439, 5.1, 'Cadillac/143/2009/2009CadillacSTS-V.jpg', 13.6),
(143, 443, 414, 4.92, 'Cadillac/144/2009/2009CadillacXLR-V.jpg', 13.07),
(144, 237, 162, 5.2, 'Honda/145/2009/2009HondaS2000.jpg', 13.84),
(145, 330, 270, 5.5, 'Infiniti/146/2009/2009InfinitiG37.jpg', 13.9),
(146, 328, 269, 5, 'Infiniti/147/2009/2009InfinitiG37S.jpg', 13.5),
(147, 416, 371, 4.7, 'Lexus/148/2009/2009LexusIS-F.jpg', 13),
(148, 263, 280, 5.9, 'Mazda/149/2009/2009MazdaMazdaSpeed3.jpg', 14.2),
(149, 382, 391, 6.1, 'Mercedes-Benz/150/2009/2009MercedesBenzSL550.jpg', 0),
(150, 518, 465, 4.5, 'Mercedes-Benz/151/2009/2009MercedesBenzSL63AMG.jpg', 12.4),
(151, 510, 612, 4.5, 'Mercedes-Benz/152/2009/2009MercedesBenzSL600.jpg', 11.6),
(152, 604, 738, 4.2, 'Mercedes-Benz/153/2009/2009MercedesBenzSL65AMG.jpg', 11.5),
(153, 306, 268, 5.6, 'Nissan/154/2009/2009Nissan350Z.jpg', 13.7),
(154, 480, 430, 3.5, 'Nissan/155/2009/2009NissanGTR.jpg', 11.6),
(155, 305, 290, 5, 'Subaru/156/2009/2009SubaruImprezaWRXSTI.jpg', 0),
(156, 265, 244, 5.2, 'Subaru/157/2009/2009SubaruImprezaWRX.jpg', 13.4),
(157, 552, 398, 3.7, 'Lamborghini/158/2009/2009LamborghiniGallardo.jpg', 11.8),
(158, 405, 339, 5.1, 'Maserati/159/2009/2009MaseratiGranTurismo.jpg', 0),
(159, 433, 361, 4.8, 'Maserati/160/2009/2009MaseratiGranTurismoS.jpg', 12.9),
(160, 400, 339, 5.3, 'Maserati/161/2009/2009MaseratiQuattroporte.jpg', 13.9),
(161, 425, 361, 5.3, 'Maserati/162/2009/2009MaseratiQuattroporteS.jpg', 13.5),
(162, 433, 361, 5.1, 'Maserati/163/2009/2009MaseratiQuattroporteGTS.jpg', 13.4),
(163, 240, 170, 4.4, 'Lotus/164/2009/2009LotusExigeS240.jpg', 13.4),
(164, 257, 174, 4.3, 'Lotus/165/2009/2009LotusExigeS260.jpg', 13),
(165, 640, 487, 3.3, 'Lamborghini/166/2008/2008LamborghiniReventon.jpg', 11.4),
(166, 293, 290, 5.1, 'Subaru/156/2007/2007SubaruWRXSTI.jpg', 13.6),
(167, 520, 376, 4.3, 'Lamborghini/167/2008/2008LamborghiniGallardoSpyder.jpg', 12.4),
(168, 530, 398, 3.8, 'Lamborghini/168/2008/2008LamborghiniGallardoSuperleggera.jpg', 11.2),
(169, 400, 420, 7.1, 'Land-Rover/169/2006/2006LandRoverRangeRoverSupercharged.jpg', 15.2),
(170, 227, 217, 6.3, 'Subaru/157/2002/2002SubaruWRX', 14.9),
(171, 123, 136, 9.7, 'Subaru/170/2002/2002SubaruImpreza.jpg', 0),
(172, 354, 363, 4, 'Mitsubishi/171/2008/2008MitsubishiLancerEvoXFQ360GSR.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `USERS`
--

CREATE TABLE IF NOT EXISTS `USERS` (
  `id` bigint(20) NOT NULL auto_increment,
  `uuid` text collate utf8_unicode_ci NOT NULL,
  `last_updated_car_list` bigint(20) NOT NULL,
  `last_car_id_returned` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=102 ;

--
-- Dumping data for table `USERS`
--

INSERT INTO `USERS` (`id`, `uuid`, `last_updated_car_list`, `last_car_id_returned`) VALUES
(1, '89BCAABF-B1D7-520F-8999-0542D0604AE2', 1241933838, 23),
(2, '00000000-0000-1000-8000-0017F2F488D7', 1244320537, 170),
(4, 'cbaba04303e5af6a4071da3670f42d5d220814ac', 1243396304, 164),
(5, 'ec509201c5b71f19c450c6a7d55fa29b9dd0f010', 1244235013, 170),
(6, 'b81b60d36a57a008e6bc200ea36e7e4ddf64fef0', 1243465701, 164),
(7, '8257c8fd8d2e7bb4c91f4bfbfdd8c069e6ed1449', 1243745120, 164),
(8, '211df88e50fbe602fb25e7dafcf5aec0e6961aaf', 1243749448, 164),
(9, '694f2aafa85ebf20c2a24d6a7c8742aee369f025', 1244147705, 170),
(10, '137b1ff346c286f2d102d791420ac06ddfebf372', 1243755298, 164),
(11, 'cf4c612fe4b84481995e7b38c1c633823c9e23fe', 1243776628, 164),
(12, '7bc183a586b9a96cb764396f6c7e484735b85a5e', 1243777025, 164),
(13, 'bdced8732bbcd8a7eb903784fb335862bdfa400a', 1243782383, 164),
(14, 'f590da308cc42b842cb2f9ae1ecf3ac0edc60b44', 1243782797, 164),
(15, '99f91b9635e3af99241e535abd2f50052d224833', 1243787304, 164),
(16, '2791f3fd4fcbbfed270715a56b71fda48902ddce', 1243877523, 170),
(17, '308941a1e36e71f97a1f45759a94f0cde2d51a48', 1244288889, 170),
(18, '839e15bd34e0e8c0047cbb404d1b26024c666299', 1244167647, 170),
(19, '5c396898a80d6cb6ec2d1affb0ac2811bde55ab8', 1243998640, 170),
(20, 'b49a909dd26b9c5650be413b3ff6e04087fc3d21', 1243802915, 169),
(21, 'b42aeabc69e8157ccaf2955bbf0e26cfa0f4dea6', 1243806156, 169),
(22, '0bbca79bbe05957408a5eb8f107fe579ab640e23', 1243806468, 169),
(23, '4a4f4bb4055851d8c08090235df472b9b533ea61', 1243959392, 170),
(24, '9026be0e1d33357a9092934e1da17ec1a8110658', 1244234570, 170),
(25, 'c3bf47df7826a4e07d8f1e1a8a70afb988257343', 1243808633, 169),
(26, 'f05a6dde005cae1e5804047f70f5d7da3fe91773', 1243813788, 169),
(27, '3340e39354dbfc35b3007f7efc91177684203567', 1244211111, 170),
(28, '93dd1754101d93bce3e2710ea589344540f053ea', 1243822534, 169),
(29, '3b97b853cd1dec7914091f77eba021eca952127e', 1243829002, 169),
(30, '3161d01ee5624789671207e53f2eb128c13ba315', 1243831370, 169),
(31, '7e39249b684fedbd1a81cf2c08f435daf34962c4', 1243839892, 169),
(32, '78f0257c11fd1f8877c9cad81138a1d53d27e769', 1243857405, 169),
(33, '4584459c1d0aadde1f81c2660b20f2599d0ea197', 1243861969, 169),
(34, '457c53da48bbc52d69af68345470c46823dff512', 1244145358, 170),
(35, 'd2d6592b7e710723553de716624ad425a85b5f1f', 1243880490, 170),
(36, '7c5142999e2c6182d04820dcd782ddc3e5ea82ba', 1243897950, 170),
(37, '70543339b971b32e90905355956d4fc80c4e1a8e', 1243898645, 170),
(38, '77878b96638dda89c12e37c47c2aa0a69a5eef29', 1244339906, 170),
(39, 'a48f126a82feb4b59483252e2abe4d6c550217d6', 1243909462, 170),
(40, '3d8aefa32990d84908671c0e3af315060e475d92', 1243910337, 170),
(41, '94e4ff5ba82d3a76256746eb88cfaecf42686de5', 1243913457, 170),
(42, 'a314d1972d2c2c9f9b57f02cb103d31b89d043af', 1243913922, 170),
(43, '65be8dfc78e543c4056affb1e9bd80f62f855968', 1244090706, 170),
(44, 'befe490f9ecb32ddbf165656ae8f69d45e413470', 1243917697, 170),
(45, '99febe9bfc5e7617a1ccf5c257bd27b7d2d07235', 1243923830, 170),
(46, '0a49b1fcdf55b02d848fd56888fb39be1de658bc', 1244100275, 170),
(47, '2915d3a92da21656fa7ab8dc5167834bb42ad0b6', 1243954466, 170),
(48, '0d2f0a1d13b08151a5c5559692ea34d93fb700ae', 1243962465, 170),
(49, 'a715c5449d22f9a803a353ff51c23e790f755589', 1244151525, 170),
(50, 'cea4e63a2a9ec24f8a7805e1d91bd417491cc568', 1243979269, 170),
(51, '1a553364cc5613abcdb0a3aaef9f882f59071ec4', 1243988160, 170),
(52, 'eeb6236c3fc83baabf70226691dce3061e802304', 1243988848, 170),
(53, '65da6b0e8088cf41f3d178665f25d3982166bc09', 1244344918, 170),
(54, '6e1ddc25893039015d45d2cbab14d81f428c74ee', 1243999468, 170),
(55, 'acb280cbe0dc1e35ceaa7227a0bb1b63654b0cc9', 1243999684, 170),
(56, 'e3daaa224f815750531b843eadd11e3ffea78dda', 1244311151, 170),
(57, '537ae8cde87ae25af229c304b0dae6149c9990b4', 1244062633, 170),
(58, '96936cd6d8262e87b731b9375c7316e4a1d23792', 1244072227, 170),
(59, 'f0d5d5ba3b7ddf2f5f2bc50741d17061704fd4bb', 1244380404, 170),
(60, '9e0bf2f1ae825bd112c34dc870642cbb403e1891', 1244076240, 170),
(61, 'e47b9b3c0a1a58936823147adc045cbec11eb7a3', 1244078353, 170),
(62, 'ea0636cf021ed5de1962d8c0cf775d405309a862', 1244081260, 170),
(63, 'f7582a6edab5248d8d35c81bfd8f32fb080f9e75', 1244082699, 170),
(64, '921f7db1e316dbffe2a07507aa8ea4fe149f6094', 1244096113, 170),
(65, '4299fc7a2e8855b56b6c7a5975cc7ac7fc001ff6', 1244106208, 170),
(66, 'c54921278cc1185741b1c8714316231bf8d7c680', 1244109053, 170),
(67, 'f6003f82d1875a0ae113ebf3c5fbd0e0e5ca97f3', 1244117602, 170),
(68, '6bf4aee793c249d749f005bdebda65f783bcf899', 1244288608, 170),
(69, 'c5d4fb9bec2f5b99009307936b004a40995af609', 1244151511, 170),
(70, '75f132482f1d58e78000ca6e412885585cdbbd76', 1244153755, 170),
(71, '6bacc6d3c3b2449f58e7c1465863021eae62b31d', 1244159531, 170),
(72, '747f8373b374cf71bba9f474c42808bcec5238e6', 1244307384, 170),
(73, 'e30e94351d5da294815592857ae8a85540925124', 1244168066, 170),
(74, '2a0881df8e2d6b9d9acf28275e3beaf8b166d858', 1244171942, 170),
(75, 'a8871793cbee239d8a66ec01723ec646724711d0', 1244189901, 170),
(76, '2fe883abe653bbd9b91cac0844140ce55b59d11b', 1244377013, 170),
(77, 'bc5c329c8275bc1138e54c01b32e5f073e4e54a4', 1244199084, 170),
(78, 'a5a7d6e04e6d590746757d5fef0b8f1052ec79d3', 1244335408, 170),
(79, 'b6a7b6c6471e76ba17195bc5c1d09842bcac8735', 1244202533, 170),
(80, '1e01fa55e04d2e4d881eff7aabc2118539575029', 1244211990, 170),
(81, '3c0537765e7d6b910e375964bd9df7cf5db59e45', 1244316945, 170),
(82, 'f82d31e57b133be9c9f46f609291f1d9273381ad', 1244222448, 170),
(83, 'c8813a9a46e541805e5df85b9fe5c58707d31e6a', 1244232306, 170),
(84, '0a8dac6ebc4581fa7882f00a57e8bff56b01839a', 1244235835, 170),
(85, '8a14e59aa187ee84516633db65afea5b0993d0de', 1244247242, 170),
(86, '76c32dc6446ddd99fcf4d8c1ef8f37240a861a74', 1244393854, 170),
(87, '7e4dd131c1d66434cfce8c911a924fc37166a98d', 1244250694, 170),
(88, '18e148db939c2f49d66c9c84ad3c5835c17a8162', 1244252662, 170),
(89, '99422669a0942460d397d0c4cfd2e24de52fb778', 1244253752, 170),
(90, '9b59146288a3206c71a9d51bf5a4ad1a1d63b5ff', 1244354557, 170),
(91, 'caa01029036e6ae5c710269adb379b675c839fe8', 1244274645, 170),
(92, '4c7af394e0b5b34d0d24552d901a8c1d9c62f5b3', 1244306499, 170),
(93, 'bb303d157a0599d14282eb199089c5be33109881', 1244319246, 170),
(94, 'e00c969e09e724b0246563818c87f05a28fbb9f3', 1244328492, 170),
(95, '6c393a33b28c6de2d6533554aac23b94adf6242d', 1244329617, 170),
(96, 'de7c27fc32890f4e30ba12b42c14119442ccb687', 1244331242, 170),
(97, '46488f1308dc27ba7be7a39e4cdf325295a63477', 1244386129, 170),
(98, '8aa096de57b18d93eb64a2226ae6a8f48a9990e0', 1244390741, 170),
(99, '2334771d207358280465088430b137aebca95604', 1244393799, 170),
(100, '215b9e3ffea20030632b5ccd51fcf79fdcedea14', 1244394737, 170),
(101, 'e634f92da60f62c5cdee998c4a81b4b39bfe0915', 1244395559, 170);

-- --------------------------------------------------------

--
-- Table structure for table `YEARS`
--

CREATE TABLE IF NOT EXISTS `YEARS` (
  `id` bigint(20) NOT NULL auto_increment,
  `year` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `YEARS`
--

INSERT INTO `YEARS` (`id`, `year`) VALUES
(1, '2009'),
(2, '2008'),
(3, '2007'),
(4, '2006'),
(5, '2005'),
(6, '2004'),
(7, '2003'),
(8, '2002'),
(9, '2001'),
(10, '1999'),
(11, '1998'),
(12, '1997'),
(13, '1996'),
(14, '1995'),
(15, '2010');
