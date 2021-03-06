-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 08, 2017 at 02:19 AM
-- Server version: 10.0.29-MariaDB
-- PHP Version: 7.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `PROPCO_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `Activity_Status`
--

CREATE TABLE IF NOT EXISTS `Activity_Status` (
  `ActivityStatus` varchar(1) NOT NULL,
  `ActivityDescription` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Activity_Status`
--

INSERT INTO `Activity_Status` (`ActivityStatus`, `ActivityDescription`) VALUES
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
-- Table structure for table `Bundles`
--

CREATE TABLE IF NOT EXISTS `Bundles` (
  `BID` smallint(6) NOT NULL,
  `BundleName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Bundles`
--

INSERT INTO `Bundles` (`BID`, `BundleName`) VALUES
(2, 'B1'),
(2, 'B2'),
(2, 'B3'),
(2, 'B4'),
(1, 'B1'),
(1, 'B2'),
(1, 'B3'),
(1, '');

-- --------------------------------------------------------

--
-- Table structure for table `Business_Details`
--

CREATE TABLE IF NOT EXISTS `Business_Details` (
  `BID` smallint(6) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Alias` varchar(50) NOT NULL,
  `Address` varchar(60) NOT NULL,
  `City` varchar(30) NOT NULL,
  `Province` varchar(2) NOT NULL,
  `PostalCode` varchar(7) NOT NULL,
  `ContactName` varchar(20) NOT NULL,
  `PrimaryPhone` varchar(12) NOT NULL,
  `Ext` varchar(5) NOT NULL,
  `SecondaryPhone` varchar(12) NOT NULL,
  `Ext2` varchar(5) NOT NULL,
  `Fax` varchar(12) NOT NULL,
  `EmailAddress` varchar(30) NOT NULL,
  `Tax` varchar(3) NOT NULL,
  `TaxRate` varchar(5) NOT NULL,
  `CreationDate` date NOT NULL,
  `UpdateDate` date NOT NULL,
  `UID` tinyint(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Business_Details`
--

INSERT INTO `Business_Details` (`BID`, `Name`, `Alias`, `Address`, `City`, `Province`, `PostalCode`, `ContactName`, `PrimaryPhone`, `Ext`, `SecondaryPhone`, `Ext2`, `Fax`, `EmailAddress`, `Tax`, `TaxRate`, `CreationDate`, `UpdateDate`, `UID`) VALUES
(1, 'REGIONAL MUNICIPALITY OF DURHAM', '', '605 ROSSLAND RD E', 'WHITBY', 'ON', 'L1N 6A3', 'dudu', '', '', '', '', '', '', 'HST', '13.00', '0000-00-00', '2017-05-07', 0),
(2, 'C/O GOLDVIEW PROPERTIES MANAGEMENT', 'VARIOUS LOCATIONS', '51 TORO RD # 200', 'TORONTO', 'ON', 'M6A 2E5', '', '', '', '', '', '', '', 'HST', '13.00', '0000-00-00', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE IF NOT EXISTS `Customer` (
  `CID` int(5) NOT NULL,
  `CustomerName` varchar(50) NOT NULL,
  `Notes` varchar(50) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `AddressNotes` varchar(30) NOT NULL,
  `City` varchar(30) NOT NULL,
  `Province` varchar(2) NOT NULL,
  `PostalCode` varchar(7) NOT NULL,
  `ContactName` varchar(20) NOT NULL,
  `PrimaryPhone` varchar(12) NOT NULL,
  `Ext` varchar(5) NOT NULL,
  `SecondaryPhone` varchar(12) NOT NULL,
  `Ext2` varchar(5) NOT NULL,
  `Other` varchar(30) NOT NULL,
  `Fax` varchar(12) NOT NULL,
  `EmailAddress` varchar(30) NOT NULL,
  `BID` smallint(6) NOT NULL,
  `BundleName` varchar(30) DEFAULT NULL,
  `DepartmentName` varchar(50) NOT NULL,
  `ContractNr` varchar(15) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UID` tinyint(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`CID`, `CustomerName`, `Notes`, `Address`, `AddressNotes`, `City`, `Province`, `PostalCode`, `ContactName`, `PrimaryPhone`, `Ext`, `SecondaryPhone`, `Ext2`, `Other`, `Fax`, `EmailAddress`, `BID`, `BundleName`, `DepartmentName`, `ContractNr`, `CreationDate`, `UpdateDate`, `UID`) VALUES
(1, 'DRL008 - DRLHC 655 HARWOOD AVE.S', '', '655 HARWOOD AVE.S.', '', 'AJAX', 'ON', '61S 1K8', 'MICHAEL BOGLE', '905-239-8049', '', '', '', '', '905-261-6440', '', 1, 'B3', '', '', '2017-03-30 23:23:15', '2017-05-03 04:00:00', 1),
(2, 'REGIONAL MUNICIPALITY OF DURHAM', '', '520 NORMANDY ST.', '', 'OSHAWA', 'ON', 'I1H 5X3', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '', 1, 'B1', '', '', '2017-03-30 23:23:15', '2017-05-03 04:00:00', 1),
(3, 'REGIONAL MUNICIPALITY OF DURHAM', '', '552 NORMANDY ST.', '', 'OSHAWA', 'ON', 'I1H 5X3', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(4, 'REGIONAL MUNICIPALITY OF DURHAM', '', '351 POPLAR ST.', '', 'OSHAWA', 'ON', 'I1H 6P9', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-04-16 21:02:55', 1),
(5, 'REGIONAL MUNICIPALITY OF DURHAM', '', '299 WASAGA CRT.', '', 'OSHAWA', 'ON', 'I1J 1M5', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-04-16 22:15:08', 1),
(6, 'REGIONAL MUNICIPALITY OF DURHAM', '', '302 CARLTON CRT.', '', 'OSHAWA', 'ON', 'I1J 1M8', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-04-16 22:05:57', 1),
(7, 'REGIONAL MUNICIPALITY OF DURHAM', '', '320 CARLTON CT.', '', 'OSHAWA', 'ON', 'I1J 1M8', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(8, 'REGIONAL MUNICIPALITY OF DURHAM', '', '416 MALAGA RD.', '', 'OSHAWA', 'ON', 'I1J 1N8', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(9, 'REGIONAL MUNICIPALITY OF DURHAM', '', '424 MALAGA RD.', '', 'OSHAWA', 'ON', 'I1J 1N8', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(10, 'REGIONAL MUNICIPALITY OF DURHAM', '', '432 MALAGA RD', '', 'OSHAWA', 'ON', 'I1J 1N8', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(11, 'REGIONAL MUNICIPALITY OF DURHAM', '', '448 MALAGA RD.', '', 'OSHAWA', 'ON', 'I1J 1N8', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(12, 'REGIONAL MUNICIPALITY OF DURHAM', '', '1481 RITSON RD. S.', '', 'OSHAWA', 'ON', 'I1J 3M3', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(13, 'WAT102 - BLACKSTOCK RESERVOIR', '', '132 GREENSBORO DR.', '', 'SUNDERLAND', 'ON', 'L0B 1B0', 'BARB COE', '905-260-1797', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(14, 'WAT095 - BLACKSTOCK WELL 6', '', '14020, RR#57', '', 'BLACKSTOCK', 'ON', 'L0B 1B0', 'BARB COE', '905-260-1797', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(15, 'WAT096 - GREENBANK WELL 1&2 RESERVOIR', '', '11 MURRAY STREET', '', 'GREENBANK', 'ON', 'L0C 1B0', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(16, 'WAT098 - GREENBANK WELLS 3,5, & 6', '', '20500-20700 HWY 12', '', 'GREENBANK', 'ON', 'L0C 1B0', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(17, 'ADM101 - ADMIN', '', '135 ALBERT ST.', '', 'SUNDERLAND', 'ON', 'L0C 1H0', 'DANIEL LI/PAULA GOOD', '905-683-3451', 'x222', '', '', '', '905-404-4792', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(18, 'WAT023 - SUNDERLAND ', 'STAND TANK', '32 JANE ST.', '', 'SUNDERLAND', 'ON', 'L0C 1H0', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '', 1, '', '', '', '2017-04-14 21:26:22', '2017-03-30 23:18:48', 1),
(19, 'DEP010 - SUNDERLAND DEPOT', 'RR #10', 'SUNDERLAND', '', 'SUNDERLAND', 'ON', 'L0C 1H0', 'DAN BLAKELY', '905-985-1710', '', '', '', '', '', '', 1, '', '', '', '2017-04-14 21:27:13', '2017-03-30 23:18:48', 1),
(20, 'MCDRL012 - DRLHC 103 CAMERON ST. W', '', '103 CAMERON ST. W,', '', 'CANNINGTON', 'ON', 'L0E 1E0', 'RITA ALLEN', '416-900-8301', '', '', '', '', '905-261-6344', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(21, 'WAS017 - BROCK WASTE MANAGEMENT FACILITY', 'BROCK LANDFILL STE', '22480 SIDE RD.17', '', 'CANNINGTON', 'ON', 'L0E 1E0', 'NELSON MINNIE', '705-437-2933', '', '', '', '', '', '', 1, '', '', '', '2017-04-14 21:27:44', '2017-03-30 23:18:48', 1),
(22, 'WAT024 - SUNDERLAND', 'WELL #1&2', '51270 CONCESSION RD. 6', '', 'SUNDERLAND', 'ON', 'L0E 1E0', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '', 1, '', '', '', '2017-04-14 21:28:13', '2017-03-30 23:18:48', 1),
(23, 'DRL015 - LAKEVIEW MANOR SOCIAL SERVICES', '', '133 MAIN ST.', '', 'BEAVERTON', 'ON', 'L0K 1A0', '', '', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(24, 'HOME FOR THE AGED - LONG TERM CARE', 'LAKEVIEW MANOR', '133 MAIN ST.', '', 'BEAVERTON', 'ON', 'L0K 1A0', '', '', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(25, 'DRL013 - DRLHC 342 MAIN ST.', '', '342 MAIN ST. E.', '', 'BEAVERTON', 'ON', 'L0K 1A0', 'WATERFOLD JANITORIAL', '', '', '', '', '', '705-426-3076', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(26, 'EMS011 - BEAVERTON EMS', '', '343 BAY ST.', '', 'BEAVERTON', 'ON', 'L0K 1A0', 'SHIFT MANAGER', '905-444-2034', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(27, 'DRP014 - BEAVERTON-CPC', '', '412 BAY ST.', '', 'BEAVERTON', 'ON', 'L0K 1A0', '', '', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(28, 'SEW016 - LAKE SIMCOE (BEAVERTON) WPCP', '', '9 MILE RD.', '', 'BEAVERTON', 'ON', 'L0K 1A0', 'JAMIE GRATRIX', '905-431-4272', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(29, 'SEW033 - NEWCASTLE WPCP (WILMOTCREEK)', '', '1000 TORONTO ST.', '', 'NEW CASTLE', 'ON', 'L1B 0A6', 'JENNA PEARCE', '905-576-9844', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(30, 'WAT039 - NEW CASTLE WSP', '', '400 BALDWIN ST', '', 'NEW CASTLE', 'ON', 'L1B 1C1', 'BARB COE', '905-260-1797', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(31, 'SEW036 - RUDELL ST. SPS', '', '1 HART BLVD', '', 'NEW CASTLE', 'ON', 'L1B 1E2', 'RED WRIGHT', '905-576-9844', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(32, 'WAT040 - NEWTONVILLE WPS', '', '3742 DURHAM REGIONAL HWY. 2', '', 'NEW CASTLE', 'ON', 'L1B 1L9', 'BARB COE', '905-260-1797', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(33, 'DRL028 - DRLHC 2 NELSON ST.', '', '2 NELSON ST. E', '', 'BOWMANVILLE', 'ON', 'L1C 1E5', '', '905-697-1747', '', '', '', '', '905-697-2702', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(34, 'WAT037 - BOWMANVILLE BOOSTER PS', '', '171 WELLINGTON ST.', '', 'BOWMANVILLE', 'ON', 'L1C 3S1', 'BARB COE', '905-260-1797', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(35, 'DRP030 - PROPERTY BUREAU', '', '19 COURTICE CRT.', '', 'COURTICE', 'ON', 'L1E 1T4', '', '', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(36, 'SEW142 - WHITECLIFFE SPS', '', '13 HATHAWAY DR', '', 'CLARINGTON', 'ON', 'L1E 1T7', 'MAUREEN LESLIE', '905-668-0250', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(37, 'EMS044 - COURTICE EMS', '', '2701 COURTICE RD', '', 'COURTICE', 'ON', 'L1E 2M7', 'SHIFT MANAGER', '905-444-2034', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(38, 'WAT067 - HORTOP ST.RESERVOIR', '', '930 HORTOP CRT', '', 'OSHAWA', 'ON', 'L1G 4R2', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(39, 'DRL054 - DRLHC', '', '385 BEATRICE ST. E', '', 'OSHAWA', 'ON', 'L1G 7H3', 'FRANK MEZZAPELLI', '905-2603795', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(40, 'DRL053 - DRLHC', '', '155 KING ST. E', '', 'OSHAWA', 'ON', 'L1H 1C2', 'MEGAN', '416-275-4775', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(41, 'DRL056 - DRLHC', '', '439 DEAN ST.', '', 'OSHAWA', 'ON', 'L1H 3E3', 'DAN RUIS', '905-261-8983', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(42, 'EMS051 - OSHAWA SOUTH EMS', '', '497 BLOOR STREET E', '', 'OSHAWA', 'ON', 'L1H 3M9', 'SHIFT MANAGER', '905-444-2034', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(43, 'DRL055 - DRLHC', '', '460 NORMANDY ST.', '', 'OSHAWA', 'ON', 'L1H 5X3', 'FRANK MEZZAPELLI', '905-260-3795', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(44, 'REGIONAL MUNICIPALITY OF DURHAM', '', '352 LINDEN ST.', '', 'OSHAWA', 'ON', 'L1H 6R5', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(45, 'REGIONAL MUNICIPALITY OF DURHAM', '', '368 LINDEN ST.', '', 'OSHAWA', 'ON', 'L1H 6R5', 'DAN RUIS', '905-261-8983', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(46, 'WAT066 - GRANDVIEW WPS', '', '1090 ST.ANDREW CRT', '', 'OSHAWA', 'ON', 'L1H 8B5', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(47, 'WAT071 - HARMONY RESERVOIR', '', '2271 HARMONY ROAD NORTH', '', 'OSHAWA', 'ON', 'L1H 8L7', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(48, 'CHI048 - LAKEWOODS CHILD CARE CTR.', '', '353 CHALEUR AVE', '', 'OSHAWA', 'ON', 'L1J 1G5', 'MINDY WILLIAMS', '289-927-5763', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(49, 'REGIONAL MUNICIPALITY OF DURHAM', '', '301 WASAGA CRT.', '', 'OSHAWA', 'ON', 'L1J 1M5', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(50, 'REGIONAL MUNICIPALITY OF DURHAM', '', '313 CARLTON CRT.', '', 'OSHAWA', 'ON', 'L1J 1M7', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(51, 'TRA050 - DURHAM REGION TRANSIT, EAST CREW ROOM', '', '419 KINGS ST. WEST', '', 'OSHAWA', 'ON', 'L1J 2K5', 'FRANCIS D''ANTIMO', '905-579-2471', 'x213', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(52, 'HEA058 - OSHAWA SEXUAL HEALTH', '', '419 KING ST. W, SUITE 180', '', 'OSHAWA', 'ON', 'L1J 2K8', 'JODI LEDDY', '905-433-7014', 'x222', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(53, 'WAT070 - WAVERLY ST WPS', '', '670 BUCHAN AVE', '', 'OSHAWA', 'ON', 'L1J 3A3', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(54, 'REGIONAL MUNICIPALITY OF DURHAM', '', '1490 BIRCHCLIFF AVE.', '', 'OSHAWA', 'ON', 'L1J 3M2', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(55, 'REGIONAL MUNICIPALITY OF DURHAM', '', '1499 RITSON ROAD S', '', 'OSHAWA', 'ON', 'L1J 3M3', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(56, 'DRL057 - DRLHC', '', '1529 RITSON ROAD SOUTH', '', 'OSHAWA', 'ON', 'L1J 3M3', 'ADAM WALFRIFF', '289-928-3046', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(57, 'WAT069 - OSHAWA WSP', '', '1540 RITSON ROAD SOUTH', '', 'OSHAWA', 'ON', 'L1J 3M3', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(58, 'REGIONAL MUNICIPALITY OF DURHAM', '', '1525 RITSON ROAD SOUTH', '', 'OSHAWA', 'ON', 'L1J 3M3', 'REBECCA', '905-668-7711', 'x2475', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(59, 'DRP059 - VICTIM SERVICES OF DURHAM REGION', '', '1173 CEDAR STREET', '', 'OSHAWA', 'ON', 'L1J 3R8', '', '', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(60, 'ADM046 - SOCIAL SERVICES', '', '505 WENTWORTH ST. W', '', 'OSHAWA', 'ON', 'L1J 6G5', 'CHANTAL GERBAUD', '905-436-6747', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(61, 'WAT065 - GRANDVIEW RES/TAUNTON BOOSTER PS', '', '1265 GRANDVIEW ST. N', '', 'OSHAWA', 'ON', 'L1K 2L2', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(62, 'DEP140 - FACILITIES DEPOT', '', '289 WATER STREET', '', 'WHITBY', 'ON', 'L1N 0C1', 'MAUREEN LESLIE', '905-668-0250', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(63, 'WAT141 - WHITBY WSP', '', '301 WATER STREET', '', 'WHITBY', 'ON', 'L1N 0C1', 'MAUREEN LESLIE', '905-668-0250', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(64, 'SEW139 - BREAKWATER SPS', '', '240 WATER. ST.', '', 'WHITBY', 'ON', 'L1N 0G5', 'RED WRIGHT', '905-576-9844', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(65, 'DEP122 - TRAFIC OPERATIONS', '', '101 CONSUMERS ROAD', '', 'WHITBY', 'ON', 'L1N 1C4', 'RAFFAELA THICKETT', '905-666-8116', 'x4719', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(66, 'HEA123 - ENVIRONMENTAL HEALTH', ' 2ND FLOOR', '101 CONSUMERS ROAD', '', 'WHITBY', 'ON', 'L1N 1C4', 'COLLEEN WEBB', '905-723-3818', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(67, 'DRL126 - WINDSOR PALACE', '', '315 COLBORNE ST. WEST', '', 'WHITBY', 'ON', 'L1N 1X4', 'SHONA MEZZAPELLI', '905-665-0637', '', '', '', '', '905-430-3407', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(68, 'HEA130 - ORAL HEALTH DIVISION', '', '1615 DUNDAS ST. EAST', '', 'WHITBY', 'ON', 'L1N 2K8', 'BARB DEL GOBBO/PAT L', '905-723-2013', 'x4557', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(69, 'ADM118 - DENTAL CLINIC', '', '1615 DUNDAS ST. EAST', '', 'WHITBY', 'ON', 'L1N 2K8', 'BARB DEL GOBBO/PAT L', '905-723-2013', 'x4557', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(70, 'HEA129 - BREAST FEEDING CLINIC', '', '1615 DUNDAS ST. EAST', '', 'WHITBY', 'ON', 'L1N 2K9', 'BARB DEL GOBBO/PAT L', '905-723-2013', 'x4557', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(71, 'DRP131 - KIDS SAFETY VILLAGE OF DURHAM REGION', '', '1449 ATHOL ST.', '', 'WHITBY', 'ON', 'L1N 4A6', '', '', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(72, 'DRL127 - CENTER', '', '409 CENTER ST. WEST', '', 'WHITBY', 'ON', 'L1N 4W3', '', '905-430-4595', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(73, 'DRP133 - CENTRAL WEST DIVISION', '', '480 TAUNTON RD. EAST', '', 'WHITBY', 'ON', 'L1N 5R5', '', '', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(74, 'DRL128 - BOWLING GREEN TOWERS', '', '850 GREEN ST.', '', 'WHITBY', 'ON', 'L1N 6A5', 'BILL/TINA BROWN', '905-666-9320', '', '', '', '', '905-430-3407', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(75, 'DRP132 - LAWFUL ACCESS', '', '1600 CHAMPLAIN AVE.', '', 'WHITBY', 'ON', 'L1N 9B2', '', '', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(76, 'DEP003 - AJAX DEPOT', '', '2020 SALEM RD.', '', 'WHITBY', 'ON', 'L1R 0H5', 'SHAWN DOWNEY', '905-683-1741', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(77, 'DRP134 - OTC', '', '4060 ANDERSON ST.', '', 'WHITBY', 'ON', 'L1R 2W3', '', '', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(78, 'CORBETT CREEK WPCP', '', '2400 FORBES ST.', '', 'WHITBY', 'ON', 'L1R 3K3', '', '905-668-7711', 'x2475', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(79, 'DEP115 - WHITBY DEPOT', '', '825 CONLIN ROAD', '', 'WHITBY', 'ON', 'L1R 3K3', 'JOHN TRYON', '905-655-3344', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(80, 'EMS125 - WHITBY EMS AND HEADQUARTERS', '', '4040 ANDERSON ROAD', '', 'WHITBY', 'ON', 'L1R 3P6', 'SHIFT MANAGER', '905-444-2034', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-05-08 01:45:28', 1),
(81, 'TRA009 - DURHAM TRANSIT WEST', '', '110 WESTNEY RD. S.', '', 'AJAX', 'ON', 'L1S 2C8', 'CHRIS PAPACONSTANTIO', '905-683-4111', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(82, 'ADM007 - FAMILY SERVICES', '', '339 WESTNEY RD. S.', '', 'AJAX', 'ON', 'L1S 2E1', 'SAMANTHA WILLIAMS', '905-683-3451', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(83, 'CHI002 - AJAX CHILDCARE CTR.', '', '22 CENTENNIAL RD.', '', 'AJAX', 'ON', 'L1S 3K4', 'JUDY REDMOND', '289-928-6117', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(84, 'WAT001 - AJAX WSP', '', '75 LAKE DRIVEWAY E', '', 'AJAX', 'ON', 'L1S 3Z3', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(85, 'EMS006 - AJAX EMS', '', '175 HUNT STREET', '', 'AJAX', 'ON', 'L1S 4S4', 'SHIFT MANAGER', '905-444-2034', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(86, 'WAT005 - WESTNEY RESERVOIR', '', '2900 WESTNEY RD. NORTH', '', 'AJAX', 'ON', 'L1T 4S3', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(87, 'WAT004 - HARWOOD BOOSTER PS', '', '144 ROSSLAND RD. E.', '', 'AJAX', 'ON', 'L1T 4V2', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(88, 'EMS074 - PICKERING EMS', '', '1103 KINGTONS ROAD WEST', '', 'PICKERING', 'ON', 'L1V 1B5', 'SHIFT MANAGER', '905-444-2034', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(89, 'HEA077 - PICKERING SEXUAL HEALTH', '', '1355 KINGSTON ROAD UNIT 38', '', 'PICKERING', 'ON', 'L1V 1C6', 'LINDA MITCHELL/TRISH', '905-420-8781', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(90, 'DRP078 - WEST DIVISION', '', '1710 KINGSTON ROAD', '', 'PICKERING', 'ON', 'L1V 1C6', '', '', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(91, 'WAT085 - PICKERING ELEVATED TANK', '', '384 FINCH AVE.', '', 'PICKERING`', 'ON', 'L1V 1H8', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(92, 'DRL076 - DRLHC', '', '1910 FAYLEE CRES', '', 'PICKERING`', 'ON', 'L1V 3B1', 'PAUL/BIBIANNE AMYOT', '905-492-3280', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(93, 'DRL075 - DRLHC', '', '1330 FOXGLOVE AVE.', '', 'PICKERING', 'ON', 'L1W 1E9', 'JANIS HAFENBRACK', '647-608-4291', '', '', '', '', '905-831-5560', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(94, 'CHI073 - PICKERING DAY CARE CENTER', '', '1262 RADOM STREET', '', 'PICKERING', 'ON', 'L1W 1J4', 'LEIGH TUCKER', '905-767-6360', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(95, 'SEW079 - DUFFIN CREEK WPCP', '', '901 MCKAY ROAD', '', 'PICKERING`', 'ON', 'L1W 3A3', 'ROGER GRAF', '905-261-8147', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(96, 'WAT084 - LOOKOUT POINT BOOSTER', '', '383 EYER DRIVE', '', 'PICKERING`', 'ON', 'L1W 3A6', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(97, 'SEW081 - LIVERPOOL SPS', '', '1250 BARNWOOD SQUARE', '', 'PICKERING', 'ON', 'L1X 1C7', 'RED WRIGHT', '905-576-9844', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(98, 'WAT083 - GRAND OAK BOOSTER', '', '1611 PEPPERWOOD GATE', '', 'PICKERING', 'ON', 'L1X 2J7', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(99, 'WAT082 - CHERRYWOOD RESERVOIR', '', '2255 ROSEBANK ROAD', '', 'PICKERING`', 'ON', 'L1X 2R5', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(100, 'SEW080 - BUCKINGHAM GATE SPS', '', '2282 CANTERBURY CRES.', '', 'PICKERING`', 'ON', 'L1X 2T5', 'RED WRIGHT', '905-576-9844', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(101, 'DRP093 - NORTH DIVISION', '', '15765 HWY #12 ,RR #1', '', 'PORT PERRY', 'ON', 'L9L 1B2', '', '', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(102, 'WAS094 - SCUGOG WMF', '', '1623 REACH STREET', '', 'PORT PERRY', 'ON', 'L9L 1B2', 'DWAYNE POLLARD', '905-985-7973', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(103, 'WAT099 - PORT PERRY WELL #6', '', '12235 SIMCOE ST.', '', 'PORT PERRY', 'ON', 'L9L 1B3', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(104, 'WAT100 - PORT PERRY WELLS 3&5', '', '12375 SIMCOE ST.', '', 'PORT PERRY', 'ON', 'L9L 1B3', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(105, 'DEP088 - SCUGOG DEPOT', '', '#10 RR# 21', '', 'PORT PERRY', 'ON', 'L9L 1B5', 'DAN BLAKELY', '905-985-1710', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(106, 'HEA092 - PERRY SEXUAL HEALTH', '', '181 PERRY ST. SUITE 200', '', 'PORT PERRY', 'ON', 'L9L 1B8', 'JULIE CHAMBERLAIN/KA', '905-985-4889', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(107, 'EMS089 - PORT PERRY EMS', '', '1775 REACH ST.,RR#8', '', 'PORT PERRY', 'ON', 'L9L 1P2', 'SHIFT MANAGER', '905-444-2034', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(108, 'WAT114 - UXVILLE INDUSTRIAL PARK', '', '15 ANDERSON BLVD', '', 'UXBRIDGE', 'ON', 'L9P 0C7', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(109, 'WAT110 - UXBRIDGE INDUSTRIAL PARK STAND TANK', '', '20 ANDERSON BLVD.', '', 'UXBRIDGE', 'ON', 'L9P 0C7', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(110, 'WAT111 - UXBRIDGE WELL #1', '', '141 BROCK ST. WEST', '', 'UXBRIDGE', 'ON', 'L9P 1B1', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(111, 'SEW107 - UXBRIDGE BROOK WPCP', '', '127 MAIN ST.', '', 'UXBRIDGE', 'ON', 'L9P 1C7', 'BILL BRIDGE', '705-426-4492', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(112, 'ADM103 - SOCIAL SERVICES', '', '2 CAMPBELL DRIVE', '', 'UXBRIDGE', 'ON', 'L9P 1H6', 'CRAIG SMITH', '905-852-4566', 'x5400', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(113, 'DRL105 - DRLHC', '', '20 PERRY ST.', '', 'UXBRIDGE', 'ON', 'L9P 1H7', 'ELLIE CADEAU', '905-862-3543', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(114, 'WAT112 - UXBRIDGE WELL #2', '', '137 REACH ST.', '', 'UXBRIDGE', 'ON', 'L9P 1L3', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(115, 'DRP106 - UXBRIDGE CPC', '', '34 BROCK ST.', '', 'UXBRIDGE', 'ON', 'L9P 1P3', '', '', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(116, 'WAT109 - QUAKER HILL RESERVOIR', '', '7245 CONCESSION ROAD 6', '', 'UXBRIDGE', 'ON', 'L9P 1R1', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(117, 'WAT097 - GREENBANK WELL 3', '', '1131 CRAGG ROAD', '', 'UXBRIDGE', 'ON', 'L9P 1R3', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(118, 'SEW108 - ANTENNA TOWER', '', '721 HIGGINS LANE', '', 'UXBRIDGE', 'ON', 'L9P 1R4', '', '', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(119, 'EMS104 - UXBRIDGE EMS', '', '4 CAMPBELL DR.', '', 'UXBRIDGE', 'ON', 'L9P 1R5', 'SHIFT MANAGER', '905-444-2034', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(120, 'WAT113 - UXBRIDGE WELLL 3', '', '6 CAMPBELL DRIVE', '', 'UXBRIDGE', 'ON', 'L9P 1R5', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(121, 'ADM047 - ONTARIO WORKS SOCIAL SERVICES', '', '200 JOHN ST.W', '', 'OSHAWA', 'ON', 'LIJ 2B4', 'ALMA MCKEEVER', '905-432-2929', 'x5497', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(122, 'WAT042 - ORONO WELL #3', '', '3490 CONCORD RD. NO.5', '', 'ORONO', 'ON', 'L0B 1M0', '', '905-260-1797', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(123, 'WAT020 - CANNINGTON WELL 4,6&8', '', '114 & 179 DAVIDSON RD.', '', 'CANNINGTON', 'ON', 'L0E 1E0', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(124, 'WAT021 - CANNINGTON WELL 5', '', '165 LAIDLAW ST. S.', '', 'CANNINGTON', 'ON', 'L0E 1E0', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(125, 'WAT022 - CANNINGTON WELLS 1&2 RR#12', '', 'DURHAM REGIONAL RD.12', '', 'CANNINGTON', 'ON', 'L0E 1E0', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(126, 'WAT018 - BEAVERTON WSP', '', '35 SIMCOE ST.', '', 'BEAVERTON', 'ON', 'L0K 1A0', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(127, 'DRP060 - CENTRAL DIVISION', '', '77 CENTRE STREET', '', 'OSHAWA', 'ON', 'L1G 4B7', '', '', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(128, 'WAT138 - DUFFS ROAD RESERVOIR', '', '7705 DUFFS ROAD', '', 'WHITBY', 'ON', 'L1M 1Z8', 'ROD JOBIN', '905-261-3221', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(129, 'SEW063 - HARMONEY CREEK', '', '785 COLONEL SAM DR.', '', 'OSHAWA', 'ON', 'L1H 8S2', 'WADE HUNT', '905-728-9423', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(130, 'TRA072 - TRAFFIC- WILKINSON GARAGE', '', '79 WILKINSON AVE', '', 'OSHAWA', 'ON', 'L1H 2J6', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(131, 'WAT019 - CANNINGTON WELL 3 ,C12', '', '80 PEACE ST,', '', 'CANNINGTON', 'ON', 'LO3 1E0', 'FRANCISCO PONCIANO', '905-260-2281', '', '', '', '', '', '', 1, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(132, 'YCC 212 - GOLDVIEW PROPERTIES MANAGEMENT', '', '11 WINCOTT DRIVE', '', 'TORONTO', 'ON', 'M9R 2R9', 'TOM', '416-887-2642', '', '416-247-5806', '', '', '416-247-4234', '', 2, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(133, 'ELMSDALE APARTMENTS', '', '9 ELMSDALE ROAD', '', 'TORONTO', 'ON', 'M4J 3M8', 'PETER/LYN', '647-770-9819', '', '416-630-1234', 'x203', '', '', '', 2, 'B4', '', '', '2017-03-30 23:23:15', '2017-04-22 04:00:00', 1),
(134, 'MALLORY TOWERS', '', '5 MALLORY GARDENS', '', 'TORONTO', 'ON', 'M4V 2A7', 'DENIELA', '647-829-4676', '', '', '', '', '', '', 2, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(135, '448 SPADINA ROAD', '', '448 SPADINA RD', '', 'TORONTO', 'ON', 'M5P 2W4', 'JASMINE', '647-248-7006', '', '', '', '', '', '', 2, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(136, 'LANDALE ROAD - 340 LONSDALE ROAD', '', '340 LONSDALE ROAD', '', 'TORONTO', 'ON', 'M5P 1R2', 'JASMINE', '647-248-7006', '', '', '', '', '', '', 2, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(137, 'MARCUS BULDING - 464 SPADINA RD', '', '464 SPADINA RD', '', 'TORONTO', 'ON', 'M5P 2W4', 'ZORAN', '647-248-7006', '', '', '', '', '', '', 2, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(138, 'MTCC 425 - 70 ERSKINE AVE.', '', '70 ERSLINE AVE', '', 'TORONTO', 'ON', 'M4P 1Y2', 'EMILIA', '647-3286-553', '', '', '', '', '', '', 2, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(139, 'MTCC 700', '', '425 WALLMER ROAD', '', 'TORONTO', 'ON', '', '', '416-964-1125', '', '', '', '', '', '', 2, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(140, 'YCC 310 - 349 ST. CLAIRE AVE. W', '', '349 STCLAIR AVE W', '', 'TORONTO', 'ON', '', 'FAYE', '416-568-3967', '', '', '', '', '', '', 2, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(141, 'SIGO INVESTMENTS', '', '3638 BATHURST ST', '', 'TORONTO', 'ON', 'M6A 2E5', 'CATHY', '416-782-2221', '', '', '', '', '', '', 2, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(142, 'PCC 20-1660 BLOOR ST', '', '1660 BLOOR ST', '', 'MISSISSAUGA', 'ON', 'L4X 1R9', 'ALEX', '416-271-4360', '', '', '', '', '', '', 2, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1),
(143, 'GREENWIN INC.', '', '80 MICRO COURT', ' 3RD FLOOR', 'MARKHAM', 'ON', 'L3R 9Z5', '', '416-487-3883', '', '', '', '', '', '', 0, '', '', '', '2017-03-30 23:23:15', '2017-03-30 23:18:48', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Degree_Infested`
--

CREATE TABLE IF NOT EXISTS `Degree_Infested` (
  `DI_Code` tinytext NOT NULL,
  `Description` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Degree_Infested`
--

INSERT INTO `Degree_Infested` (`DI_Code`, `Description`) VALUES
('N', 'NON-EVIDENCE'),
('L', 'LOW'),
('M', 'MODERATE'),
('HE', 'HEAVY'),
('H', 'HAZARDOUS');

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE IF NOT EXISTS `Department` (
  `BID` smallint(6) NOT NULL,
  `DeptName` varchar(50) NOT NULL,
  `ContractNr` varchar(15) NOT NULL,
  `CreationDate` datetime NOT NULL,
  `UpdateDate` datetime NOT NULL,
  `UID` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `House_Keeping`
--

CREATE TABLE IF NOT EXISTS `House_Keeping` (
  `HK_Type` tinytext NOT NULL,
  `Description` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `House_Keeping`
--

INSERT INTO `House_Keeping` (`HK_Type`, `Description`) VALUES
('E', 'Excellent'),
('G', 'Good'),
('H', 'Hazardous'),
('P', 'Poor');

-- --------------------------------------------------------

--
-- Table structure for table `Labels`
--

CREATE TABLE IF NOT EXISTS `Labels` (
  `Labels` char(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Labels`
--

INSERT INTO `Labels` (`Labels`) VALUES
('Create Service Receipt'),
('Assign Service to Technician'),
('Pending Work Orders'),
('Review Service Receipts'),
('Create Invoice'),
('Reports'),
('Logout');

-- --------------------------------------------------------

--
-- Table structure for table `Pests`
--

CREATE TABLE IF NOT EXISTS `Pests` (
  `PestsID` smallint(2) NOT NULL,
  `PestsType` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Pests`
--

INSERT INTO `Pests` (`PestsID`, `PestsType`) VALUES
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
-- Table structure for table `Pests_linked_Product`
--

CREATE TABLE IF NOT EXISTS `Pests_linked_Product` (
  `ID` int(11) NOT NULL,
  `PestsID` int(2) NOT NULL,
  `ProductID` int(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Pests_linked_Product`
--

INSERT INTO `Pests_linked_Product` (`ID`, `PestsID`, `ProductID`) VALUES
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
-- Table structure for table `Preparation`
--

CREATE TABLE IF NOT EXISTS `Preparation` (
  `Preparation` tinytext NOT NULL,
  `Description` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Preparation`
--

INSERT INTO `Preparation` (`Preparation`, `Description`) VALUES
('NO', 'NOT'),
('PA', 'PARTIAL'),
('PR', 'PREPARED');

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE IF NOT EXISTS `Product` (
  `ID` tinyint(4) NOT NULL,
  `Product_name` char(35) NOT NULL,
  `Measurement` varchar(8) NOT NULL,
  `PCP_Number` char(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Product`
--

INSERT INTO `Product` (`ID`, `Product_name`, `Measurement`, `PCP_Number`) VALUES
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
-- Table structure for table `Service_Request`
--

CREATE TABLE IF NOT EXISTS `Service_Request` (
  `ServiceReqNr` int(6) NOT NULL,
  `CID` int(5) NOT NULL,
  `BID` smallint(6) NOT NULL,
  `BundleName` varchar(30) NOT NULL,
  `PONr` varchar(7) DEFAULT NULL,
  `Invoicing` varchar(20) NOT NULL,
  `ServiceType` varchar(50) NOT NULL,
  `PaymentType` varchar(10) NOT NULL,
  `Schedule` varchar(7) NOT NULL,
  `ServiceDate` date NOT NULL,
  `CreationDate` datetime NOT NULL,
  `UpdateDate` datetime NOT NULL,
  `UID` tinyint(4) NOT NULL,
  `ActivityCount` tinyint(3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Service_Request`
--

INSERT INTO `Service_Request` (`ServiceReqNr`, `CID`, `BID`, `BundleName`, `PONr`, `Invoicing`, `ServiceType`, `PaymentType`, `Schedule`, `ServiceDate`, `CreationDate`, `UpdateDate`, `UID`, `ActivityCount`) VALUES
(4, 1, 1, '', '', 'Per Service Request', 'In Suit Regular Service Day', 'Check', 'Anytime', '2017-05-22', '2017-05-05 07:25:15', '2017-05-05 07:25:15', 1, 0),
(5, 5, 1, '', '', 'Per Service Request', 'In Suit Regular Service Day', 'Check', 'Anytime', '2017-05-30', '2017-05-05 17:58:55', '2017-05-05 17:58:55', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Service_Request_Activities`
--

CREATE TABLE IF NOT EXISTS `Service_Request_Activities` (
  `ServiceReqNr` int(6) NOT NULL,
  `ActivityNr` int(2) NOT NULL,
  `WONr` varchar(7) NOT NULL,
  `Unit` varchar(10) NOT NULL,
  `Notes` varchar(100) NOT NULL,
  `PestsID` smallint(2) NOT NULL,
  `ActivityStatus` varchar(15) NOT NULL,
  `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdateDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UID` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `UID` tinyint(4) NOT NULL,
  `user_name` varchar(12) NOT NULL,
  `password` varchar(8) NOT NULL,
  `full_privilege` tinyint(1) NOT NULL DEFAULT '0',
  `Service_Receipt` tinyint(1) NOT NULL DEFAULT '1',
  `Assign_Service_Tech` tinyint(1) NOT NULL DEFAULT '1',
  `Pending_WO` tinyint(1) NOT NULL DEFAULT '1',
  `Review_SR` tinyint(1) NOT NULL DEFAULT '1',
  `Invoices` tinyint(1) NOT NULL DEFAULT '1',
  `Reports` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Users table';

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`UID`, `user_name`, `password`, `full_privilege`, `Service_Receipt`, `Assign_Service_Tech`, `Pending_WO`, `Review_SR`, `Invoices`, `Reports`) VALUES
(1, 'dan', 'Zackmera', 1, 1, 1, 1, 1, 1, 1),
(2, 'zack', 'test', 0, 1, 1, 1, 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Business_Details`
--
ALTER TABLE `Business_Details`
  ADD PRIMARY KEY (`BID`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`CID`),
  ADD UNIQUE KEY `cust_id` (`CID`);

--
-- Indexes for table `Degree_Infested`
--
ALTER TABLE `Degree_Infested`
  ADD UNIQUE KEY `DI_Code` (`DI_Code`(2));

--
-- Indexes for table `House_Keeping`
--
ALTER TABLE `House_Keeping`
  ADD PRIMARY KEY (`HK_Type`(1));

--
-- Indexes for table `Pests`
--
ALTER TABLE `Pests`
  ADD PRIMARY KEY (`PestsID`),
  ADD UNIQUE KEY `PestsID` (`PestsID`);

--
-- Indexes for table `Pests_linked_Product`
--
ALTER TABLE `Pests_linked_Product`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Preparation`
--
ALTER TABLE `Preparation`
  ADD UNIQUE KEY `Preparation` (`Preparation`(2));

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Service_Request`
--
ALTER TABLE `Service_Request`
  ADD PRIMARY KEY (`ServiceReqNr`);

--
-- Indexes for table `Service_Request_Activities`
--
ALTER TABLE `Service_Request_Activities`
  ADD PRIMARY KEY (`ServiceReqNr`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UID`),
  ADD UNIQUE KEY `user_id_2` (`UID`),
  ADD KEY `user_id` (`UID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Business_Details`
--
ALTER TABLE `Business_Details`
  MODIFY `BID` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Customer`
--
ALTER TABLE `Customer`
  MODIFY `CID` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=144;
--
-- AUTO_INCREMENT for table `Pests_linked_Product`
--
ALTER TABLE `Pests_linked_Product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=257;
--
-- AUTO_INCREMENT for table `Product`
--
ALTER TABLE `Product`
  MODIFY `ID` tinyint(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `Service_Request`
--
ALTER TABLE `Service_Request`
  MODIFY `ServiceReqNr` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `UID` tinyint(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
