-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 24, 2017 at 03:24 AM
-- Server version: 10.0.29-MariaDB
-- PHP Version: 7.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `PROPCO_Maven_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `activityStatus`
--

CREATE TABLE IF NOT EXISTS `activityStatus` (
  `ActivityStatus` varchar(1) NOT NULL,
  `ActivityDescription` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `activityStatus`
--

INSERT INTO `activityStatus` (`ActivityStatus`, `ActivityDescription`) VALUES
('I', 'Initial'),
('S', 'Sent'),
('R', 'Received'),
('C', 'Completed'),
('X', 'Cancelled'),
('I', 'Initial'),
('S', 'Sent'),
('R', 'Received'),
('C', 'Completed'),
('X', 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE IF NOT EXISTS `billing` (
  `billingID` int(6) NOT NULL,
  `billingName` varchar(50) NOT NULL,
  `billingAlias` varchar(50) DEFAULT NULL,
  `billingAddress` varchar(60) NOT NULL,
  `billingCity` varchar(30) NOT NULL,
  `billingProvince` varchar(2) DEFAULT NULL,
  `billingPostalCode` varchar(7) DEFAULT NULL,
  `billingContactName` varchar(20) DEFAULT NULL,
  `billingPrimaryPhone` varchar(12) NOT NULL,
  `billingExt` varchar(5) DEFAULT NULL,
  `billingSecondaryPhone` varchar(12) DEFAULT NULL,
  `billingExt2` varchar(5) DEFAULT NULL,
  `billingFax` varchar(12) DEFAULT NULL,
  `billingEmailAddress` varchar(30) DEFAULT NULL,
  `tax` varchar(3) NOT NULL,
  `taxRate` varchar(5) NOT NULL,
  `creationDate` date NOT NULL,
  `updateDate` date NOT NULL,
  `updatedByUser` int(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`billingID`, `billingName`, `billingAlias`, `billingAddress`, `billingCity`, `billingProvince`, `billingPostalCode`, `billingContactName`, `billingPrimaryPhone`, `billingExt`, `billingSecondaryPhone`, `billingExt2`, `billingFax`, `billingEmailAddress`, `tax`, `taxRate`, `creationDate`, `updateDate`, `updatedByUser`) VALUES
(0, 'NO BUSINESS', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2017-05-09', '2017-05-09', 1),
(1, 'REGIONAL MUNICIPALITY OF DURHAM', '', '605 ROSSLAND RD E', 'WHITBY', 'ON', 'L1N 6A3', 'dudu', '', '', '', '', '', '', 'HST', '13.00', '0000-00-00', '2017-05-07', 1),
(2, 'C/O GOLDVIEW PROPERTIES MANAGEMENT', 'VARIOUS LOCATIONS', '51 TORO RD # 200', 'TORONTO', 'ON', 'M6A 2E5', '', '', '', '', '', '', '', 'HST', '13.00', '0000-00-00', '0000-00-00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `billing_bundles`
--

CREATE TABLE IF NOT EXISTS `billing_bundles` (
  `billingBundlesID` int(6) NOT NULL,
  `bundleID` int(6) NOT NULL,
  `billingID` int(6) NOT NULL,
  `customerID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bundles`
--

CREATE TABLE IF NOT EXISTS `bundles` (
  `bundleID` int(6) NOT NULL,
  `bundleName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bundles`
--

INSERT INTO `bundles` (`bundleID`, `bundleName`) VALUES
(0, '');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customerID` int(6) NOT NULL,
  `billingID` int(6) NOT NULL,
  `bundleID` int(6) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `notes` varchar(50) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `unit` varchar(8) NOT NULL,
  `addressNotes` varchar(30) DEFAULT NULL,
  `city` varchar(30) NOT NULL,
  `province` varchar(2) DEFAULT NULL,
  `postalCode` varchar(7) DEFAULT NULL,
  `contactName` varchar(20) NOT NULL,
  `primaryPhone` varchar(12) NOT NULL,
  `ext` varchar(5) DEFAULT NULL,
  `secondaryPhone` varchar(12) DEFAULT NULL,
  `ext2` varchar(5) DEFAULT NULL,
  `fax` varchar(12) DEFAULT NULL,
  `emailAddress` varchar(30) DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedByUser` int(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `billingID`, `bundleID`, `customerName`, `notes`, `address`, `unit`, `addressNotes`, `city`, `province`, `postalCode`, `contactName`, `primaryPhone`, `ext`, `secondaryPhone`, `ext2`, `fax`, `emailAddress`, `creationDate`, `updateDate`, `updatedByUser`) VALUES
(1, 1, 0, 'DRL008 - DRLHC 655 HARWOOD AVE.S', '', '655 HARWOOD AVE.S.', '', '', 'AJAX', 'ON', '61S 1K8', 'MICHAEL BOGLE', '905-239-8049', '', '', '', '905-261-6440', '', '2017-03-30 23:23:15', '2017-05-03 04:00:00', 1),
(2, 1, 0, 'REGIONAL MUNICIPALITY OF DURHAM', '', '520 NORMANDY ST.', '', '', 'OSHAWA', 'ON', 'I1H 5X3', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '2017-03-30 23:23:15', '2017-05-03 04:00:00', 1),
(3, 1, 0, 'REGIONAL MUNICIPALITY OF DURHAM', '', '552 NORMANDY ST.', '', '', 'OSHAWA', 'ON', 'I1H 5X3', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(4, 1, 0, 'REGIONAL MUNICIPALITY OF DURHAM', '', '351 POPLAR ST.', '', '', 'OSHAWA', 'ON', 'I1H 6P9', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '2017-03-30 23:23:15', '2017-04-16 21:02:55', 1),
(5, 1, 0, 'REGIONAL MUNICIPALITY OF DURHAM', '', '299 WASAGA CRT.', '', '', 'OSHAWA', 'ON', 'I1J 1M5', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '2017-03-30 23:23:15', '2017-04-16 22:15:08', 1),
(6, 1, 0, 'REGIONAL MUNICIPALITY OF DURHAM', '', '302 CARLTON CRT.', '', '', 'OSHAWA', 'ON', 'I1J 1M8', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '2017-03-30 23:23:15', '2017-04-16 22:05:57', 1),
(7, 1, 0, 'REGIONAL MUNICIPALITY OF DURHAM', '', '320 CARLTON CT.', '', '', 'OSHAWA', 'ON', 'I1J 1M8', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(8, 1, 0, 'REGIONAL MUNICIPALITY OF DURHAM', '', '416 MALAGA RD.', '', '', 'OSHAWA', 'ON', 'I1J 1N8', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(9, 1, 0, 'REGIONAL MUNICIPALITY OF DURHAM', '', '424 MALAGA RD.', '', '', 'OSHAWA', 'ON', 'I1J 1N8', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(10, 1, 0, 'REGIONAL MUNICIPALITY OF DURHAM', '', '432 MALAGA RD', '', '', 'OSHAWA', 'ON', 'I1J 1N8', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(11, 1, 0, 'REGIONAL MUNICIPALITY OF DURHAM', '', '448 MALAGA RD.', '', '', 'OSHAWA', 'ON', 'I1J 1N8', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(12, 1, 0, 'REGIONAL MUNICIPALITY OF DURHAM', '', '1481 RITSON RD. S.', '', '', 'OSHAWA', 'ON', 'I1J 3M3', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(13, 1, 0, 'WAT102 - BLACKSTOCK RESERVOIR', '', '132 GREENSBORO DR.', '', '', 'SUNDERLAND', 'ON', 'L0B 1B0', 'BARB COE', '905-260-1797', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(14, 1, 0, 'WAT095 - BLACKSTOCK WELL 6', '', '14020, RR#57', '', '', 'BLACKSTOCK', 'ON', 'L0B 1B0', 'BARB COE', '905-260-1797', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(15, 1, 0, 'WAT096 - GREENBANK WELL 1&2 RESERVOIR', '', '11 MURRAY STREET', '', '', 'GREENBANK', 'ON', 'L0C 1B0', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(16, 1, 0, 'WAT098 - GREENBANK WELLS 3,5, & 6', '', '20500-20700 HWY 12', '', '', 'GREENBANK', 'ON', 'L0C 1B0', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(17, 1, 0, 'ADM101 - ADMIN', '', '135 ALBERT ST.', '', '', 'SUNDERLAND', 'ON', 'L0C 1H0', 'DANIEL LI/PAULA GOOD', '905-683-3451', 'x222', '', '', '905-404-4792', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(18, 1, 0, 'WAT023 - SUNDERLAND ', 'STAND TANK', '32 JANE ST.', '', '', 'SUNDERLAND', 'ON', 'L0C 1H0', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '2017-04-14 21:26:22', '2017-03-30 23:18:48', 1),
(19, 1, 0, 'DEP010 - SUNDERLAND DEPOT', 'RR #10', 'SUNDERLAND', '', '', 'SUNDERLAND', 'ON', 'L0C 1H0', 'DAN BLAKELY', '905-985-1710', '', '', '', '', '', '2017-04-14 21:27:13', '2017-03-30 23:18:48', 1),
(20, 1, 0, 'MCDRL012 - DRLHC 103 CAMERON ST. W', '', '103 CAMERON ST. W,', '', '', 'CANNINGTON', 'ON', 'L0E 1E0', 'RITA ALLEN', '416-900-8301', '', '', '', '905-261-6344', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(21, 1, 0, 'WAS017 - BROCK WASTE MANAGEMENT FACILITY', 'BROCK LANDFILL STE', '22480 SIDE RD.17', '', '', 'CANNINGTON', 'ON', 'L0E 1E0', 'NELSON MINNIE', '705-437-2933', '', '', '', '', '', '2017-04-14 21:27:44', '2017-03-30 23:18:48', 1),
(22, 1, 0, 'WAT024 - SUNDERLAND', 'WELL #1&2', '51270 CONCESSION RD. 6', '', '', 'SUNDERLAND', 'ON', 'L0E 1E0', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '2017-04-14 21:28:13', '2017-03-30 23:18:48', 1),
(23, 1, 0, 'DRL015 - LAKEVIEW MANOR SOCIAL SERVICES', '', '133 MAIN ST.', '', '', 'BEAVERTON', 'ON', 'L0K 1A0', '', '', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(24, 1, 0, 'HOME FOR THE AGED - LONG TERM CARE', 'LAKEVIEW MANOR', '133 MAIN ST.', '', '', 'BEAVERTON', 'ON', 'L0K 1A0', '', '', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(25, 1, 0, 'DRL013 - DRLHC 342 MAIN ST.', '', '342 MAIN ST. E.', '', '', 'BEAVERTON', 'ON', 'L0K 1A0', 'WATERFOLD JANITORIAL', '', '', '', '', '705-426-3076', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(26, 1, 0, 'EMS011 - BEAVERTON EMS', '', '343 BAY ST.', '', '', 'BEAVERTON', 'ON', 'L0K 1A0', 'SHIFT MANAGER', '905-444-2034', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(27, 1, 0, 'DRP014 - BEAVERTON-CPC', '', '412 BAY ST.', '', '', 'BEAVERTON', 'ON', 'L0K 1A0', '', '', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(28, 1, 0, 'SEW016 - LAKE SIMCOE (BEAVERTON) WPCP', '', '9 MILE RD.', '', '', 'BEAVERTON', 'ON', 'L0K 1A0', 'JAMIE GRATRIX', '905-431-4272', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(29, 1, 0, 'SEW033 - NEWCASTLE WPCP (WILMOTCREEK)', '', '1000 TORONTO ST.', '', '', 'NEW CASTLE', 'ON', 'L1B 0A6', 'JENNA PEARCE', '905-576-9844', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(30, 1, 0, 'WAT039 - NEW CASTLE WSP', '', '400 BALDWIN ST', '', '', 'NEW CASTLE', 'ON', 'L1B 1C1', 'BARB COE', '905-260-1797', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(31, 1, 0, 'SEW036 - RUDELL ST. SPS', '', '1 HART BLVD', '', '', 'NEW CASTLE', 'ON', 'L1B 1E2', 'RED WRIGHT', '905-576-9844', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(32, 1, 0, 'WAT040 - NEWTONVILLE WPS', '', '3742 DURHAM REGIONAL HWY. 2', '', '', 'NEW CASTLE', 'ON', 'L1B 1L9', 'BARB COE', '905-260-1797', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(33, 1, 0, 'DRL028 - DRLHC 2 NELSON ST.', '', '2 NELSON ST. E', '', '', 'BOWMANVILLE', 'ON', 'L1C 1E5', '', '905-697-1747', '', '', '', '905-697-2702', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(34, 1, 0, 'WAT037 - BOWMANVILLE BOOSTER PS', '', '171 WELLINGTON ST.', '', '', 'BOWMANVILLE', 'ON', 'L1C 3S1', 'BARB COE', '905-260-1797', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(35, 1, 0, 'DRP030 - PROPERTY BUREAU', '', '19 COURTICE CRT.', '', '', 'COURTICE', 'ON', 'L1E 1T4', '', '', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(36, 1, 0, 'SEW142 - WHITECLIFFE SPS', '', '13 HATHAWAY DR', '', '', 'CLARINGTON', 'ON', 'L1E 1T7', 'MAUREEN LESLIE', '905-668-0250', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(37, 1, 0, 'EMS044 - COURTICE EMS', '', '2701 COURTICE RD', '', '', 'COURTICE', 'ON', 'L1E 2M7', 'SHIFT MANAGER', '905-444-2034', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(38, 1, 0, 'WAT067 - HORTOP ST.RESERVOIR', '', '930 HORTOP CRT', '', '', 'OSHAWA', 'ON', 'L1G 4R2', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(39, 1, 0, 'DRL054 - DRLHC', '', '385 BEATRICE ST. E', '', '', 'OSHAWA', 'ON', 'L1G 7H3', 'FRANK MEZZAPELLI', '905-2603795', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(40, 1, 0, 'DRL053 - DRLHC', '', '155 KING ST. E', '', '', 'OSHAWA', 'ON', 'L1H 1C2', 'MEGAN', '416-275-4775', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(41, 1, 0, 'DRL056 - DRLHC', '', '439 DEAN ST.', '', '', 'OSHAWA', 'ON', 'L1H 3E3', 'DAN RUIS', '905-261-8983', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(42, 1, 0, 'EMS051 - OSHAWA SOUTH EMS', '', '497 BLOOR STREET E', '', '', 'OSHAWA', 'ON', 'L1H 3M9', 'SHIFT MANAGER', '905-444-2034', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(43, 1, 0, 'DRL055 - DRLHC', '', '460 NORMANDY ST.', '', '', 'OSHAWA', 'ON', 'L1H 5X3', 'FRANK MEZZAPELLI', '905-260-3795', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(44, 1, 0, 'REGIONAL MUNICIPALITY OF DURHAM', '', '352 LINDEN ST.', '', '', 'OSHAWA', 'ON', 'L1H 6R5', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(45, 1, 0, 'REGIONAL MUNICIPALITY OF DURHAM', '', '368 LINDEN ST.', '', '', 'OSHAWA', 'ON', 'L1H 6R5', 'DAN RUIS', '905-261-8983', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(46, 1, 0, 'WAT066 - GRANDVIEW WPS', '', '1090 ST.ANDREW CRT', '', '', 'OSHAWA', 'ON', 'L1H 8B5', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(47, 1, 0, 'WAT071 - HARMONY RESERVOIR', '', '2271 HARMONY ROAD NORTH', '', '', 'OSHAWA', 'ON', 'L1H 8L7', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(48, 1, 0, 'CHI048 - LAKEWOODS CHILD CARE CTR.', '', '353 CHALEUR AVE', '', '', 'OSHAWA', 'ON', 'L1J 1G5', 'MINDY WILLIAMS', '289-927-5763', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(49, 1, 0, 'REGIONAL MUNICIPALITY OF DURHAM', '', '301 WASAGA CRT.', '', '', 'OSHAWA', 'ON', 'L1J 1M5', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(50, 1, 0, 'REGIONAL MUNICIPALITY OF DURHAM', '', '313 CARLTON CRT.', '', '', 'OSHAWA', 'ON', 'L1J 1M7', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(51, 1, 0, 'TRA050 - DURHAM REGION TRANSIT, EAST CREW ROOM', '', '419 KINGS ST. WEST', '', '', 'OSHAWA', 'ON', 'L1J 2K5', 'FRANCIS D''ANTIMO', '905-579-2471', 'x213', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(52, 1, 0, 'HEA058 - OSHAWA SEXUAL HEALTH', '', '419 KING ST. W, SUITE 180', '', '', 'OSHAWA', 'ON', 'L1J 2K8', 'JODI LEDDY', '905-433-7014', 'x222', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(53, 1, 0, 'WAT070 - WAVERLY ST WPS', '', '670 BUCHAN AVE', '', '', 'OSHAWA', 'ON', 'L1J 3A3', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(54, 1, 0, 'REGIONAL MUNICIPALITY OF DURHAM', '', '1490 BIRCHCLIFF AVE.', '', '', 'OSHAWA', 'ON', 'L1J 3M2', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(55, 1, 0, 'REGIONAL MUNICIPALITY OF DURHAM', '', '1499 RITSON ROAD S', '', '', 'OSHAWA', 'ON', 'L1J 3M3', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(56, 1, 0, 'DRL057 - DRLHC', '', '1529 RITSON ROAD SOUTH', '', '', 'OSHAWA', 'ON', 'L1J 3M3', 'ADAM WALFRIFF', '289-928-3046', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(57, 1, 0, 'WAT069 - OSHAWA WSP', '', '1540 RITSON ROAD SOUTH', '', '', 'OSHAWA', 'ON', 'L1J 3M3', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(58, 1, 0, 'REGIONAL MUNICIPALITY OF DURHAM', '', '1525 RITSON ROAD SOUTH', '', '', 'OSHAWA', 'ON', 'L1J 3M3', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(59, 1, 0, 'DRP059 - VICTIM SERVICES OF DURHAM REGION', '', '1173 CEDAR STREET', '', '', 'OSHAWA', 'ON', 'L1J 3R8', '', '', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(60, 1, 0, 'ADM046 - SOCIAL SERVICES', '', '505 WENTWORTH ST. W', '', '', 'OSHAWA', 'ON', 'L1J 6G5', 'CHANTAL GERBAUD', '905-436-6747', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(61, 1, 0, 'WAT065 - GRANDVIEW RES/TAUNTON BOOSTER PS', '', '1265 GRANDVIEW ST. N', '', '', 'OSHAWA', 'ON', 'L1K 2L2', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(62, 1, 0, 'DEP140 - FACILITIES DEPOT', '', '289 WATER STREET', '', '', 'WHITBY', 'ON', 'L1N 0C1', 'MAUREEN LESLIE', '905-668-0250', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(63, 1, 0, 'WAT141 - WHITBY WSP', '', '301 WATER STREET', '', '', 'WHITBY', 'ON', 'L1N 0C1', 'MAUREEN LESLIE', '905-668-0250', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(64, 1, 0, 'SEW139 - BREAKWATER SPS', '', '240 WATER. ST.', '', '', 'WHITBY', 'ON', 'L1N 0G5', 'RED WRIGHT', '905-576-9844', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(65, 1, 0, 'DEP122 - TRAFIC OPERATIONS', '', '101 CONSUMERS ROAD', '', '', 'WHITBY', 'ON', 'L1N 1C4', 'RAFFAELA THICKETT', '905-666-8116', 'x4719', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(66, 1, 0, 'HEA123 - ENVIRONMENTAL HEALTH', ' 2ND FLOOR', '101 CONSUMERS ROAD', '', '', 'WHITBY', 'ON', 'L1N 1C4', 'COLLEEN WEBB', '905-723-3818', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(67, 1, 0, 'DRL126 - WINDSOR PALACE', '', '315 COLBORNE ST. WEST', '', '', 'WHITBY', 'ON', 'L1N 1X4', 'SHONA MEZZAPELLI', '905-665-0637', '', '', '', '905-430-3407', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(68, 1, 0, 'HEA130 - ORAL HEALTH DIVISION', '', '1615 DUNDAS ST. EAST', '', '', 'WHITBY', 'ON', 'L1N 2K8', 'BARB DEL GOBBO/PAT L', '905-723-2013', 'x4557', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(69, 1, 0, 'ADM118 - DENTAL CLINIC', '', '1615 DUNDAS ST. EAST', '', '', 'WHITBY', 'ON', 'L1N 2K8', 'BARB DEL GOBBO/PAT L', '905-723-2013', 'x4557', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(70, 1, 0, 'HEA129 - BREAST FEEDING CLINIC', '', '1615 DUNDAS ST. EAST', '', '', 'WHITBY', 'ON', 'L1N 2K9', 'BARB DEL GOBBO/PAT L', '905-723-2013', 'x4557', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(71, 1, 0, 'DRP131 - KIDS SAFETY VILLAGE OF DURHAM REGION', '', '1449 ATHOL ST.', '', '', 'WHITBY', 'ON', 'L1N 4A6', '', '', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(72, 1, 0, 'DRL127 - CENTER', '', '409 CENTER ST. WEST', '', '', 'WHITBY', 'ON', 'L1N 4W3', '', '905-430-4595', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(73, 1, 0, 'DRP133 - CENTRAL WEST DIVISION', '', '480 TAUNTON RD. EAST', '', '', 'WHITBY', 'ON', 'L1N 5R5', '', '', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(74, 1, 0, 'DRL128 - BOWLING GREEN TOWERS', '', '850 GREEN ST.', '', '', 'WHITBY', 'ON', 'L1N 6A5', 'BILL/TINA BROWN', '905-666-9320', '', '', '', '905-430-3407', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(75, 1, 0, 'DRP132 - LAWFUL ACCESS', '', '1600 CHAMPLAIN AVE.', '', '', 'WHITBY', 'ON', 'L1N 9B2', '', '', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(76, 1, 0, 'DEP003 - AJAX DEPOT', '', '2020 SALEM RD.', '', '', 'WHITBY', 'ON', 'L1R 0H5', 'SHAWN DOWNEY', '905-683-1741', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(77, 1, 0, 'DRP134 - OTC', '', '4060 ANDERSON ST.', '', '', 'WHITBY', 'ON', 'L1R 2W3', '', '', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(78, 1, 0, 'CORBETT CREEK WPCP', '', '2400 FORBES ST.', '', '', 'WHITBY', 'ON', 'L1R 3K3', '', '905-668-7711', 'x2475', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(79, 1, 0, 'DEP115 - WHITBY DEPOT', '', '825 CONLIN ROAD', '', '', 'WHITBY', 'ON', 'L1R 3K3', 'JOHN TRYON', '905-655-3344', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(80, 1, 0, 'EMS125 - WHITBY EMS AND HEADQUARTERS', '', '4040 ANDERSON ROAD', '', '', 'WHITBY', 'ON', 'L1R 3P6', 'SHIFT MANAGER', '905-444-2034', '', '', '', '', '', '2017-03-30 23:23:15', '2017-05-08 01:45:28', 1),
(81, 1, 0, 'TRA009 - DURHAM TRANSIT WEST', '', '110 WESTNEY RD. S.', '', '', 'AJAX', 'ON', 'L1S 2C8', 'CHRIS PAPACONSTANTIO', '905-683-4111', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(82, 1, 0, 'ADM007 - FAMILY SERVICES', '', '339 WESTNEY RD. S.', '', '', 'AJAX', 'ON', 'L1S 2E1', 'SAMANTHA WILLIAMS', '905-683-3451', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(83, 1, 0, 'CHI002 - AJAX CHILDCARE CTR.', '', '22 CENTENNIAL RD.', '', '', 'AJAX', 'ON', 'L1S 3K4', 'JUDY REDMOND', '289-928-6117', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(84, 1, 0, 'WAT001 - AJAX WSP', '', '75 LAKE DRIVEWAY E', '', '', 'AJAX', 'ON', 'L1S 3Z3', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(85, 1, 0, 'EMS006 - AJAX EMS', '', '175 HUNT STREET', '', '', 'AJAX', 'ON', 'L1S 4S4', 'SHIFT MANAGER', '905-444-2034', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(86, 1, 0, 'WAT005 - WESTNEY RESERVOIR', '', '2900 WESTNEY RD. NORTH', '', '', 'AJAX', 'ON', 'L1T 4S3', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(87, 1, 0, 'WAT004 - HARWOOD BOOSTER PS', '', '144 ROSSLAND RD. E.', '', '', 'AJAX', 'ON', 'L1T 4V2', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(88, 1, 0, 'EMS074 - PICKERING EMS', '', '1103 KINGTONS ROAD WEST', '', '', 'PICKERING', 'ON', 'L1V 1B5', 'SHIFT MANAGER', '905-444-2034', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(89, 1, 0, 'HEA077 - PICKERING SEXUAL HEALTH', '', '1355 KINGSTON ROAD UNIT 38', '', '', 'PICKERING', 'ON', 'L1V 1C6', 'LINDA MITCHELL/TRISH', '905-420-8781', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(90, 1, 0, 'DRP078 - WEST DIVISION', '', '1710 KINGSTON ROAD', '', '', 'PICKERING', 'ON', 'L1V 1C6', '', '', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(91, 1, 0, 'WAT085 - PICKERING ELEVATED TANK', '', '384 FINCH AVE.', '', '', 'PICKERING`', 'ON', 'L1V 1H8', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(92, 1, 0, 'DRL076 - DRLHC', '', '1910 FAYLEE CRES', '', '', 'PICKERING`', 'ON', 'L1V 3B1', 'PAUL/BIBIANNE AMYOT', '905-492-3280', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(93, 1, 0, 'DRL075 - DRLHC', '', '1330 FOXGLOVE AVE.', '', '', 'PICKERING', 'ON', 'L1W 1E9', 'JANIS HAFENBRACK', '647-608-4291', '', '', '', '905-831-5560', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(94, 1, 0, 'CHI073 - PICKERING DAY CARE CENTER', '', '1262 RADOM STREET', '', '', 'PICKERING', 'ON', 'L1W 1J4', 'LEIGH TUCKER', '905-767-6360', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(95, 1, 0, 'SEW079 - DUFFIN CREEK WPCP', '', '901 MCKAY ROAD', '', '', 'PICKERING`', 'ON', 'L1W 3A3', 'ROGER GRAF', '905-261-8147', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(96, 1, 0, 'WAT084 - LOOKOUT POINT BOOSTER', '', '383 EYER DRIVE', '', '', 'PICKERING`', 'ON', 'L1W 3A6', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(97, 1, 0, 'SEW081 - LIVERPOOL SPS', '', '1250 BARNWOOD SQUARE', '', '', 'PICKERING', 'ON', 'L1X 1C7', 'RED WRIGHT', '905-576-9844', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(98, 1, 0, 'WAT083 - GRAND OAK BOOSTER', '', '1611 PEPPERWOOD GATE', '', '', 'PICKERING', 'ON', 'L1X 2J7', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(99, 1, 0, 'WAT082 - CHERRYWOOD RESERVOIR', '', '2255 ROSEBANK ROAD', '', '', 'PICKERING`', 'ON', 'L1X 2R5', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(100, 1, 0, 'SEW080 - BUCKINGHAM GATE SPS', '', '2282 CANTERBURY CRES.', '', '', 'PICKERING`', 'ON', 'L1X 2T5', 'RED WRIGHT', '905-576-9844', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(101, 1, 0, 'DRP093 - NORTH DIVISION', '', '15765 HWY #12 ,RR #1', '', '', 'PORT PERRY', 'ON', 'L9L 1B2', '', '', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(102, 1, 0, 'WAS094 - SCUGOG WMF', '', '1623 REACH STREET', '', '', 'PORT PERRY', 'ON', 'L9L 1B2', 'DWAYNE POLLARD', '905-985-7973', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(103, 1, 0, 'WAT099 - PORT PERRY WELL #6', '', '12235 SIMCOE ST.', '', '', 'PORT PERRY', 'ON', 'L9L 1B3', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(104, 1, 0, 'WAT100 - PORT PERRY WELLS 3&5', '', '12375 SIMCOE ST.', '', '', 'PORT PERRY', 'ON', 'L9L 1B3', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(105, 1, 0, 'DEP088 - SCUGOG DEPOT', '', '#10 RR# 21', '', '', 'PORT PERRY', 'ON', 'L9L 1B5', 'DAN BLAKELY', '905-985-1710', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(106, 1, 0, 'HEA092 - PERRY SEXUAL HEALTH', '', '181 PERRY ST. SUITE 200', '', '', 'PORT PERRY', 'ON', 'L9L 1B8', 'JULIE CHAMBERLAIN/KA', '905-985-4889', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(107, 1, 0, 'EMS089 - PORT PERRY EMS', '', '1775 REACH ST.,RR#8', '', '', 'PORT PERRY', 'ON', 'L9L 1P2', 'SHIFT MANAGER', '905-444-2034', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(108, 1, 0, 'WAT114 - UXVILLE INDUSTRIAL PARK', '', '15 ANDERSON BLVD', '', '', 'UXBRIDGE', 'ON', 'L9P 0C7', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(109, 1, 0, 'WAT110 - UXBRIDGE INDUSTRIAL PARK STAND TANK', '', '20 ANDERSON BLVD.', '', '', 'UXBRIDGE', 'ON', 'L9P 0C7', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(110, 1, 0, 'WAT111 - UXBRIDGE WELL #1', '', '141 BROCK ST. WEST', '', '', 'UXBRIDGE', 'ON', 'L9P 1B1', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(111, 1, 0, 'SEW107 - UXBRIDGE BROOK WPCP', '', '127 MAIN ST.', '', '', 'UXBRIDGE', 'ON', 'L9P 1C7', 'BILL BRIDGE', '705-426-4492', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(112, 1, 0, 'ADM103 - SOCIAL SERVICES', '', '2 CAMPBELL DRIVE', '', '', 'UXBRIDGE', 'ON', 'L9P 1H6', 'CRAIG SMITH', '905-852-4566', 'x5400', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(113, 1, 0, 'DRL105 - DRLHC', '', '20 PERRY ST.', '', '', 'UXBRIDGE', 'ON', 'L9P 1H7', 'ELLIE CADEAU', '905-862-3543', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(114, 1, 0, 'WAT112 - UXBRIDGE WELL #2', '', '137 REACH ST.', '', '', 'UXBRIDGE', 'ON', 'L9P 1L3', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(115, 1, 0, 'DRP106 - UXBRIDGE CPC', '', '34 BROCK ST.', '', '', 'UXBRIDGE', 'ON', 'L9P 1P3', '', '', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(116, 1, 0, 'WAT109 - QUAKER HILL RESERVOIR', '', '7245 CONCESSION ROAD 6', '', '', 'UXBRIDGE', 'ON', 'L9P 1R1', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(117, 1, 0, 'WAT097 - GREENBANK WELL 3', '', '1131 CRAGG ROAD', '', '', 'UXBRIDGE', 'ON', 'L9P 1R3', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(118, 1, 0, 'SEW108 - ANTENNA TOWER', '', '721 HIGGINS LANE', '', '', 'UXBRIDGE', 'ON', 'L9P 1R4', '', '', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(119, 1, 0, 'EMS104 - UXBRIDGE EMS', '', '4 CAMPBELL DR.', '', '', 'UXBRIDGE', 'ON', 'L9P 1R5', 'SHIFT MANAGER', '905-444-2034', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(120, 1, 0, 'WAT113 - UXBRIDGE WELLL 3', '', '6 CAMPBELL DRIVE', '', '', 'UXBRIDGE', 'ON', 'L9P 1R5', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(121, 1, 0, 'ADM047 - ONTARIO WORKS SOCIAL SERVICES', '', '200 JOHN ST.W', '', '', 'OSHAWA', 'ON', 'LIJ 2B4', 'ALMA MCKEEVER', '905-432-2929', 'x5497', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(122, 1, 0, 'WAT042 - ORONO WELL #3', '', '3490 CONCORD RD. NO.5', '', '', 'ORONO', 'ON', 'L0B 1M0', '', '905-260-1797', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(123, 1, 0, 'WAT020 - CANNINGTON WELL 4,6&8', '', '114 & 179 DAVIDSON RD.', '', '', 'CANNINGTON', 'ON', 'L0E 1E0', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(124, 1, 0, 'WAT021 - CANNINGTON WELL 5', '', '165 LAIDLAW ST. S.', '', '', 'CANNINGTON', 'ON', 'L0E 1E0', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(125, 1, 0, 'WAT022 - CANNINGTON WELLS 1&2 RR#12', '', 'DURHAM REGIONAL RD.12', '', '', 'CANNINGTON', 'ON', 'L0E 1E0', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(126, 1, 0, 'WAT018 - BEAVERTON WSP', '', '35 SIMCOE ST.', '', '', 'BEAVERTON', 'ON', 'L0K 1A0', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(127, 1, 0, 'DRP060 - CENTRAL DIVISION', '', '77 CENTRE STREET', '', '', 'OSHAWA', 'ON', 'L1G 4B7', '', '', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(128, 1, 0, 'WAT138 - DUFFS ROAD RESERVOIR', '', '7705 DUFFS ROAD', '', '', 'WHITBY', 'ON', 'L1M 1Z8', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(129, 1, 0, 'SEW063 - HARMONEY CREEK', '', '785 COLONEL SAM DR.', '', '', 'OSHAWA', 'ON', 'L1H 8S2', 'WADE HUNT', '905-728-9423', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(130, 1, 0, 'TRA072 - TRAFFIC- WILKINSON GARAGE', '', '79 WILKINSON AVE', '', '', 'OSHAWA', 'ON', 'L1H 2J6', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(131, 1, 0, 'WAT019 - CANNINGTON WELL 3 ,C12', '', '80 PEACE ST,', '', '', 'CANNINGTON', 'ON', 'LO3 1E0', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(132, 2, 0, 'YCC 212 - GOLDVIEW PROPERTIES MANAGEMENT', '', '11 WINCOTT DRIVE', '', '', 'TORONTO', 'ON', 'M9R 2R9', 'TOM', '416-887-2642', '', '416-247-5806', '', '416-247-4234', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(133, 2, 0, 'ELMSDALE APARTMENTS', '', '9 ELMSDALE ROAD', '', '', 'TORONTO', 'ON', 'M4J 3M8', 'PETER/LYN', '647-770-9819', '', '416-630-1234', 'x203', '', '', '2017-03-30 23:23:15', '2017-04-22 04:00:00', 1),
(134, 2, 0, 'MALLORY TOWERS', '', '5 MALLORY GARDENS', '', '', 'TORONTO', 'ON', 'M4V 2A7', 'DENIELA', '647-829-4676', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(135, 2, 0, '448 SPADINA ROAD', '', '448 SPADINA RD', '', '', 'TORONTO', 'ON', 'M5P 2W4', 'JASMINE', '647-248-7006', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(136, 2, 0, 'LANDALE ROAD - 340 LONSDALE ROAD', '', '340 LONSDALE ROAD', '', '', 'TORONTO', 'ON', 'M5P 1R2', 'JASMINE', '647-248-7006', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(137, 2, 0, 'MARCUS BULDING - 464 SPADINA RD', '', '464 SPADINA RD', '', '', 'TORONTO', 'ON', 'M5P 2W4', 'ZORAN', '647-248-7006', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(138, 2, 0, 'MTCC 425 - 70 ERSKINE AVE.', '', '70 ERSLINE AVE', '', '', 'TORONTO', 'ON', 'M4P 1Y2', 'EMILIA', '647-3286-553', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(139, 2, 0, 'MTCC 700', '', '425 WALLMER ROAD', '', '', 'TORONTO', 'ON', '', '', '416-964-1125', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(140, 2, 0, 'YCC 310 - 349 ST. CLAIRE AVE. W', '', '349 STCLAIR AVE W', '', '', 'TORONTO', 'ON', '', 'FAYE', '416-568-3967', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(141, 2, 0, 'SIGO INVESTMENTS', '', '3638 BATHURST ST', '', '', 'TORONTO', 'ON', 'M6A 2E5', 'CATHY', '416-782-2221', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(142, 2, 0, 'PCC 20-1660 BLOOR ST', '', '1660 BLOOR ST', '', '', 'MISSISSAUGA', 'ON', 'L4X 1R9', 'ALEX', '416-271-4360', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(143, 0, 0, 'GREENWIN INC.', '', '80 MICRO COURT', '', ' 3RD FLOOR', 'MARKHAM', 'ON', 'L3R 9Z5', '', '416-487-3883', '', '', '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1);

-- --------------------------------------------------------

--
-- Table structure for table `degreeInfested`
--

CREATE TABLE IF NOT EXISTS `degreeInfested` (
  `DICode` tinytext NOT NULL,
  `Description` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `degreeInfested`
--

INSERT INTO `degreeInfested` (`DICode`, `Description`) VALUES
('N', 'NON-EVIDENCE'),
('L', 'LOW'),
('M', 'MODERATE'),
('HE', 'HEAVY'),
('H', 'HAZARDOUS');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `departmentID` int(6) NOT NULL,
  `billingID` int(6) NOT NULL,
  `departmentName` varchar(50) NOT NULL,
  `contractNumber` varchar(15) NOT NULL,
  `creationDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `updatedByUser` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentID`, `billingID`, `departmentName`, `contractNumber`, `creationDate`, `updateDate`, `updatedByUser`) VALUES
(1, 0, '', '', '2017-05-09 00:00:00', '2017-05-09 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `housekeeping`
--

CREATE TABLE IF NOT EXISTS `housekeeping` (
  `HKType` tinytext NOT NULL,
  `Description` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `housekeeping`
--

INSERT INTO `housekeeping` (`HKType`, `Description`) VALUES
('E', 'Excellent'),
('G', 'Good'),
('H', 'Hazardous'),
('P', 'Poor');

-- --------------------------------------------------------

--
-- Table structure for table `labels`
--

CREATE TABLE IF NOT EXISTS `labels` (
  `LBLID` tinyint(2) NOT NULL,
  `Labels` char(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `labels`
--

INSERT INTO `labels` (`LBLID`, `Labels`) VALUES
(2, 'Assign Service to Technician'),
(5, 'Create Invoice'),
(1, 'Create Service Receipt'),
(7, 'Logout'),
(3, 'Pending Work Orders'),
(6, 'Reports'),
(4, 'Review Service Receipts');

-- --------------------------------------------------------

--
-- Table structure for table `pests`
--

CREATE TABLE IF NOT EXISTS `pests` (
  `pestsID` int(6) NOT NULL,
  `pestsType` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pests`
--

INSERT INTO `pests` (`pestsID`, `pestsType`) VALUES
(1, 'ADULT MOSQUITOES'),
(2, 'ANGOUMOIS GRAIN MOTHS'),
(3, 'ANTS'),
(4, 'APHIDS'),
(5, 'BED BUGS'),
(6, 'BED BUGS EGGS'),
(7, 'BEES'),
(8, 'BLACKBIRDS;PIGEON;STERLING'),
(9, 'BOX ELDER BUG'),
(10, 'BROWN DOG TICKS'),
(11, 'CARPENTER ANTS'),
(12, 'CARPET BEETLES'),
(13, 'CENTIPEDES'),
(14, 'CIGARETTE BEATLES'),
(15, 'CLUSTER FLIES'),
(16, 'COCKROACHES'),
(17, 'CONFUSED FLOOR BEETLES'),
(18, 'COWBIRDS'),
(19, 'CRAWLING INSECTS'),
(20, 'CRICKETS'),
(21, 'CATERPILLAR'),
(22, 'DEAD RODENTS'),
(23, 'DECAY FUNGI'),
(24, 'DRYWOOD TERMITES'),
(25, 'EARWIGS'),
(26, 'FRUIT FLIES'),
(27, 'FIREBRATS'),
(28, 'FLEAS'),
(29, 'FLIES'),
(30, 'FLOUR BEETLES'),
(31, 'FLYING INSECTS'),
(32, 'GYPSY MOTH;HOPPER'),
(33, 'GNATS'),
(34, 'GRAIN INSECTS'),
(35, 'GRAIN BEETLES'),
(36, 'GRAIN MITES'),
(37, 'GRANARY WEEVILS'),
(38, 'GROUNDHOGS'),
(39, 'HOUSE MICE'),
(40, 'INDIAN MEAL MOTH'),
(41, 'MITES'),
(42, 'MICE'),
(43, 'MILLIPEDES'),
(44, 'MOSQUITOES LARVA'),
(45, 'NORWAY RATS'),
(46, 'PHARAOH ANTS'),
(47, 'RATS'),
(48, 'RED FLOUR BEETLES'),
(49, 'RICE WEEVILS'),
(50, 'RODENTS'),
(51, 'ROOF RATS'),
(52, 'SAWTOOTHED GRAIN BEETLES'),
(53, 'SILVERFISH'),
(54, 'SKUNKS'),
(55, 'SLUGS'),
(56, 'SMALL FLYING MOTHS'),
(57, 'SOWBUGS'),
(58, 'SPARROWS'),
(59, 'SPIDERS'),
(60, 'SQUIRRELS'),
(61, 'TERMITES'),
(62, 'THIRIPS'),
(63, 'TICKS'),
(64, 'TOBACCO BEETLES'),
(65, 'TOBACCO MOTHS'),
(66, 'WASPS'),
(67, 'WEEVIL'),
(68, 'WOOD BORING BEETLES'),
(69, 'YELLOW JACKED');

-- --------------------------------------------------------

--
-- Table structure for table `pestsLinkedProduct`
--

CREATE TABLE IF NOT EXISTS `pestsLinkedProduct` (
  `ID` int(11) NOT NULL,
  `PestsID` int(2) NOT NULL,
  `ProductID` int(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pestsLinkedProduct`
--

INSERT INTO `pestsLinkedProduct` (`ID`, `PestsID`, `ProductID`) VALUES
(1, 0, 0),
(2, 1, 4),
(3, 1, 13),
(4, 1, 18),
(5, 1, 26),
(6, 1, 7),
(8, 1, 37),
(9, 1, 39),
(10, 2, 18),
(11, 2, 26),
(12, 3, 1),
(13, 3, 2),
(14, 3, 3),
(15, 3, 6),
(16, 3, 11),
(17, 3, 12),
(18, 3, 13),
(19, 3, 17),
(20, 3, 18),
(21, 3, 19),
(22, 3, 20),
(23, 3, 22),
(24, 3, 26),
(25, 3, 28),
(26, 3, 30),
(27, 3, 33),
(28, 3, 34),
(29, 3, 36),
(30, 3, 37),
(31, 3, 38),
(32, 4, 18),
(33, 4, 22),
(34, 5, 9),
(35, 5, 14),
(36, 5, 17),
(37, 5, 18),
(38, 5, 20),
(39, 5, 22),
(40, 5, 26),
(41, 5, 33),
(42, 5, 36),
(43, 5, 37),
(44, 6, 9),
(45, 7, 18),
(46, 7, 36),
(47, 8, 8),
(48, 9, 18),
(49, 9, 22),
(50, 10, 13),
(51, 10, 18),
(52, 10, 34),
(53, 11, 2),
(54, 11, 3),
(55, 11, 11),
(56, 11, 12),
(57, 11, 17),
(58, 11, 18),
(59, 11, 19),
(60, 11, 26),
(61, 11, 37),
(62, 11, 38),
(63, 12, 18),
(64, 12, 22),
(65, 12, 26),
(66, 12, 34),
(67, 12, 37),
(68, 13, 11),
(69, 13, 17),
(70, 13, 26),
(71, 13, 33),
(72, 13, 36),
(73, 14, 22),
(74, 14, 39),
(75, 15, 17),
(76, 15, 18),
(77, 15, 34),
(78, 15, 36),
(79, 16, 7),
(80, 16, 10),
(81, 16, 11),
(82, 16, 12),
(83, 16, 13),
(84, 16, 17),
(85, 16, 18),
(86, 16, 20),
(87, 16, 21),
(88, 16, 22),
(89, 16, 26),
(90, 16, 29),
(91, 16, 30),
(92, 16, 33),
(93, 16, 34),
(94, 16, 35),
(95, 16, 36),
(96, 16, 37),
(97, 17, 26),
(98, 17, 37),
(99, 18, 8),
(100, 19, 13),
(101, 19, 33),
(102, 19, 37),
(103, 20, 13),
(104, 20, 17),
(105, 20, 18),
(106, 20, 22),
(107, 20, 26),
(108, 20, 33),
(109, 20, 34),
(110, 20, 36),
(111, 20, 37),
(112, 21, 21),
(113, 22, 38),
(114, 23, 38),
(115, 24, 13),
(116, 24, 18),
(117, 24, 22),
(118, 24, 33),
(119, 24, 34),
(120, 24, 36),
(121, 24, 37),
(122, 25, 13),
(123, 25, 18),
(124, 25, 31),
(125, 26, 17),
(126, 26, 18),
(127, 26, 37),
(128, 27, 11),
(129, 27, 13),
(130, 27, 18),
(131, 27, 20),
(132, 27, 21),
(133, 27, 22),
(134, 27, 26),
(135, 27, 32),
(136, 27, 33),
(137, 28, 17),
(138, 28, 18),
(139, 28, 26),
(141, 28, 31),
(142, 28, 35),
(143, 28, 36),
(144, 28, 37),
(145, 29, 35),
(146, 29, 36),
(147, 30, 37),
(148, 31, 18),
(149, 32, 26),
(150, 32, 31),
(151, 33, 33),
(152, 34, 13),
(153, 34, 26),
(154, 34, 35),
(155, 34, 36),
(156, 35, 26),
(157, 36, 26),
(158, 37, 16),
(159, 38, 25),
(160, 39, 27),
(161, 39, 41),
(162, 40, 18),
(163, 40, 26),
(164, 40, 34),
(165, 40, 35),
(166, 40, 36),
(167, 40, 37),
(168, 41, 13),
(169, 41, 33),
(170, 42, 15),
(171, 42, 23),
(172, 42, 24),
(173, 42, 27),
(174, 42, 41),
(175, 43, 11),
(176, 43, 13),
(177, 43, 17),
(178, 43, 26),
(179, 43, 33),
(180, 43, 36),
(181, 44, 4),
(182, 44, 5),
(183, 44, 40),
(184, 45, 25),
(185, 45, 27),
(186, 46, 1),
(187, 46, 2),
(188, 46, 3),
(189, 46, 6),
(190, 46, 19),
(191, 46, 28),
(192, 47, 15),
(193, 47, 23),
(194, 47, 24),
(195, 47, 27),
(196, 48, 26),
(197, 49, 26),
(198, 49, 35),
(199, 50, 24),
(200, 51, 25),
(201, 51, 27),
(202, 52, 13),
(203, 52, 26),
(204, 53, 12),
(205, 53, 13),
(206, 53, 18),
(207, 53, 20),
(208, 53, 22),
(209, 53, 26),
(210, 53, 33),
(211, 53, 34),
(212, 53, 35),
(213, 53, 36),
(214, 54, 21),
(215, 55, 33),
(216, 56, 26),
(217, 56, 31),
(218, 57, 13),
(219, 57, 17),
(220, 57, 22),
(221, 57, 26),
(222, 57, 33),
(223, 57, 34),
(224, 57, 36),
(225, 57, 37),
(226, 58, 8),
(227, 59, 13),
(228, 59, 18),
(229, 59, 22),
(230, 59, 26),
(231, 59, 33),
(232, 59, 34),
(233, 59, 35),
(234, 59, 36),
(235, 59, 37),
(236, 60, 16),
(237, 61, 18),
(238, 61, 21),
(239, 61, 38),
(240, 62, 22),
(241, 63, 13),
(242, 63, 36),
(243, 64, 35),
(244, 65, 35),
(245, 65, 39),
(246, 66, 13),
(247, 66, 18),
(248, 66, 26),
(249, 66, 33),
(250, 66, 36),
(251, 66, 37),
(252, 66, 39),
(253, 67, 39),
(254, 68, 38),
(255, 69, 18),
(256, 69, 36);

-- --------------------------------------------------------

--
-- Table structure for table `preparation`
--

CREATE TABLE IF NOT EXISTS `preparation` (
  `Preparation` tinytext NOT NULL,
  `Description` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `preparation`
--

INSERT INTO `preparation` (`Preparation`, `Description`) VALUES
('NO', 'NOT'),
('PA', 'PARTIAL'),
('PR', 'PREPARED');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `ID` tinyint(4) NOT NULL,
  `ProductName` char(35) NOT NULL,
  `Measurement` varchar(8) NOT NULL,
  `PCPNumber` char(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ID`, `ProductName`, `Measurement`, `PCPNumber`) VALUES
(1, 'AVERT 360A', 'gram', '27897'),
(2, 'AVERT GRANULAR ANT BAIT', 'gram', '27864'),
(3, 'ADVANCE PLUS', 'gram', '27863'),
(4, 'ALTOSID PELLETS', 'gram', '21809'),
(5, 'AQUABAC', 'kg/g', '26862'),
(6, 'ATTACK ANT KILLER', 'ml', '20203'),
(7, 'ATTRAX COCKROACH BAIT', 'gram', '27751'),
(8, 'AVITROL CORN CHOPS', 'kg/g', '12095'),
(9, 'BEDLAM INSECTICIDE', 'ml', '30075'),
(10, 'PRO BLUE DIAMOND', 'gram', '29169'),
(11, 'PRO BORADUST', 'kg', '19480'),
(12, 'BORADICATE', 'kg/g', '30533'),
(13, 'BUG-X INSECT SPRAY', 'litre', '24190'),
(14, 'CLIMBUP INSECT INTERCEPTOR', 'no', 'N/A'),
(15, 'CONTRAC BLOX', 'kg/pcs', '22239'),
(16, 'DEGESCH PHOSTOXIN TABLETS', 'tablets', '16351'),
(17, 'DEMAND CS INSECTICIDE', 'litre', '27428'),
(18, 'DRAGNET FT', 'litre', '24175'),
(19, 'DRAX ANT BAITS', 'gram', '20478'),
(20, 'DRIONE', 'kg/g', '15255'),
(21, 'EPOLEON DEODORIZER', 'litre', 'N/A'),
(22, 'EXTERMINATOR PM57', 'gram', '23352'),
(23, 'FINAL BLOX', 'kg/pcs', '25423'),
(24, 'FIRST STRIKE', 'pcs', '29503'),
(25, 'GENERATION PELLETS', 'pcs', '26279'),
(26, 'KONK 407 INSECTICIDE', 'ml', '24875'),
(27, 'LIQUA-TOX II INSECTICIDE', 'ml', '23720'),
(28, 'MAXFORCE ANT CONTROL', 'gram', '30255'),
(29, 'MAXFORCE ROACH KILLER GEL', 'gram', '24420'),
(30, 'NIBAN GRANULAR BAIT C', 'kg', '26565'),
(31, 'ORTHO HOME DEFENSE MAX', 'strips', '22027'),
(32, 'PRECOR EC', 'ml', '21573'),
(33, 'PRO GREEN EARTH INSECTICIDE', 'kg/g', '28746'),
(34, 'PRO PM 50', 'gram', '26627'),
(35, 'PRO PYRONIDE 5 INSECTICIDE', 'litre', '9230'),
(36, 'PRESCRIPTION 221L RESIDUAL', 'gram', '28485'),
(37, 'TEMPO 20 WP INSECTICIDE', 'gram', '25673'),
(38, 'TIM-BOR PROFESSIONAL', 'g/lb', '24091'),
(39, 'VAPONA INSECTICIDE', 'l/ml', '11819'),
(40, 'VECTOBAC 200G', 'kg/g', '19466'),
(41, 'ZP TRACKING POWDER', 'kg/g', '15368');

-- --------------------------------------------------------

--
-- Table structure for table `serviceRequest`
--

CREATE TABLE IF NOT EXISTS `serviceRequest` (
  `serviceRequestNr` int(6) NOT NULL,
  `customerID` int(6) NOT NULL,
  `purchaseOrderNumber` varchar(7) DEFAULT NULL,
  `invoicing` varchar(20) NOT NULL,
  `serviceType` varchar(50) NOT NULL,
  `paymentType` varchar(10) NOT NULL,
  `schedule` varchar(7) NOT NULL,
  `serviceDate` date NOT NULL,
  `creationDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `updatedByUser` int(6) NOT NULL,
  `ActivityCount` tinyint(3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `serviceRequestActivities`
--

CREATE TABLE IF NOT EXISTS `serviceRequestActivities` (
  `activityNr` int(6) NOT NULL,
  `serviceReqNr` int(6) NOT NULL,
  `workOrderNr` varchar(7) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `notes` varchar(100) NOT NULL,
  `pestsID` int(6) NOT NULL,
  `activityStatus` varchar(15) NOT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedByUser` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userID` int(6) NOT NULL,
  `userName` varchar(12) NOT NULL,
  `password` varchar(8) NOT NULL,
  `fullprivilege` tinyint(1) NOT NULL DEFAULT '1',
  `ServiceReceipt` tinyint(1) NOT NULL DEFAULT '1',
  `AssignServiceTech` tinyint(1) NOT NULL DEFAULT '1',
  `PendingWO` tinyint(1) NOT NULL DEFAULT '1',
  `ReviewSR` tinyint(1) NOT NULL DEFAULT '1',
  `Invoices` tinyint(1) NOT NULL DEFAULT '1',
  `Reports` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Users table';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `userName`, `password`, `fullprivilege`, `ServiceReceipt`, `AssignServiceTech`, `PendingWO`, `ReviewSR`, `Invoices`, `Reports`) VALUES
(1, 'dan', 'Zackmera', 1, 1, 1, 1, 1, 1, 1),
(2, 'zack', 'test', 0, 1, 1, 1, 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`billingID`),
  ADD UNIQUE KEY `BID` (`billingID`),
  ADD KEY `UID` (`updatedByUser`);

--
-- Indexes for table `billing_bundles`
--
ALTER TABLE `billing_bundles`
  ADD PRIMARY KEY (`billingBundlesID`),
  ADD UNIQUE KEY `billingBundlesID` (`billingBundlesID`),
  ADD UNIQUE KEY `bundleID` (`bundleID`),
  ADD UNIQUE KEY `billingID` (`billingID`),
  ADD UNIQUE KEY `customerID` (`customerID`);

--
-- Indexes for table `bundles`
--
ALTER TABLE `bundles`
  ADD PRIMARY KEY (`bundleID`),
  ADD UNIQUE KEY `BDLID` (`bundleID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`),
  ADD UNIQUE KEY `cust_id` (`customerID`),
  ADD KEY `BID` (`billingID`),
  ADD KEY `BID_2` (`billingID`),
  ADD KEY `UID` (`updatedByUser`),
  ADD KEY `UID_2` (`updatedByUser`),
  ADD KEY `BID_3` (`billingID`),
  ADD KEY `BundleName` (`bundleID`);

--
-- Indexes for table `degreeInfested`
--
ALTER TABLE `degreeInfested`
  ADD UNIQUE KEY `DI_Code` (`DICode`(2));

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentID`),
  ADD UNIQUE KEY `DeptName` (`departmentName`),
  ADD UNIQUE KEY `DID` (`departmentID`),
  ADD KEY `UID` (`updatedByUser`),
  ADD KEY `DID_2` (`departmentID`),
  ADD KEY `billingID` (`billingID`);

--
-- Indexes for table `housekeeping`
--
ALTER TABLE `housekeeping`
  ADD PRIMARY KEY (`HKType`(1));

--
-- Indexes for table `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`LBLID`),
  ADD UNIQUE KEY `Labels` (`Labels`),
  ADD UNIQUE KEY `LBLID` (`LBLID`);

--
-- Indexes for table `pests`
--
ALTER TABLE `pests`
  ADD PRIMARY KEY (`pestsID`),
  ADD UNIQUE KEY `PestsID` (`pestsID`);

--
-- Indexes for table `pestsLinkedProduct`
--
ALTER TABLE `pestsLinkedProduct`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `preparation`
--
ALTER TABLE `preparation`
  ADD UNIQUE KEY `Preparation` (`Preparation`(2));

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `serviceRequest`
--
ALTER TABLE `serviceRequest`
  ADD PRIMARY KEY (`serviceRequestNr`),
  ADD UNIQUE KEY `CID_2` (`customerID`),
  ADD UNIQUE KEY `UID_2` (`updatedByUser`),
  ADD KEY `CID` (`customerID`),
  ADD KEY `UID` (`updatedByUser`);

--
-- Indexes for table `serviceRequestActivities`
--
ALTER TABLE `serviceRequestActivities`
  ADD PRIMARY KEY (`activityNr`),
  ADD UNIQUE KEY `serviceReqNr` (`serviceReqNr`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `user_id_2` (`userID`),
  ADD KEY `user_id` (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `billingID` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=144;
--
-- AUTO_INCREMENT for table `pestsLinkedProduct`
--
ALTER TABLE `pestsLinkedProduct`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=257;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ID` tinyint(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `serviceRequest`
--
ALTER TABLE `serviceRequest`
  MODIFY `serviceRequestNr` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `billing_bundles`
--
ALTER TABLE `billing_bundles`
  ADD CONSTRAINT `billing_bundles_ibfk_1` FOREIGN KEY (`bundleID`) REFERENCES `bundles` (`bundleID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `billing_bundles_ibfk_3` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`billingID`) REFERENCES `billing` (`billingID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customer_ibfk_3` FOREIGN KEY (`updatedByUser`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`billingID`) REFERENCES `billing` (`billingID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `serviceRequest`
--
ALTER TABLE `serviceRequest`
  ADD CONSTRAINT `serviceRequest_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `serviceRequestActivities`
--
ALTER TABLE `serviceRequestActivities`
  ADD CONSTRAINT `serviceRequestActivities_ibfk_1` FOREIGN KEY (`serviceReqNr`) REFERENCES `serviceRequest` (`serviceRequestNr`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
