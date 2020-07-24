-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 24, 2020 at 01:29 AM
-- Server version: 5.7.30-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seqhunt`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `qid` smallint(5) UNSIGNED NOT NULL,
  `url` varchar(80) NOT NULL DEFAULT '',
  `level` smallint(6) NOT NULL,
  `answ` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`qid`, `url`, `level`, `answ`) VALUES
(11, 'hola.php', 1, 'bc9bf7bb6c4ab8d0daf374963110f4a7'),
(12, 'me.php', 2, '2b882400855082a1b1a97cedf64cb413'),
(13, 'wfo.php', 3, '1f4d06a3690f46d56bd1da598f65de6f'),
(14, 'hrx.php', 4, '061a01a98f80f415b1431236b62bb10b'),
(15, 'storage.php', 5, 'bf215181b5140522137b3d4f6b73544a'),
(16, 'business.php', 6, 'a8ff6c9514c35c853b350382534fb624'),
(17, 'phone.php', 7, 'ed317098497c799a59b9ea28b8c1f893'),
(18, 'india.php', 8, '916229a8d4ef288e7f4880ad356800aa'),
(19, 'visit.php', 9, '73b180aafc233cfe97be8619518ba876'),
(20, 'ohno.php', 10, '2f33c46fab1f5e54cc9f97fe8571a4a6'),
(21, 'stayaway.php', 11, 'b7b1dc541ba98a721295e3d2a9079e7a'),
(22, 'whatyearisit.php', 12, '6614e77fe28a81bb311dfadb80aae7d3'),
(23, 'sequoia.php', 13, 'b106d7fd67ff73c5dcbd6a10057e2476');

-- --------------------------------------------------------

--
-- Table structure for table `logger`
--

CREATE TABLE `logger` (
  `log_id` int(11) UNSIGNED NOT NULL,
  `emp_email` varchar(50) DEFAULT NULL,
  `answer` varchar(60) NOT NULL,
  `ip_addr` varchar(16) NOT NULL,
  `ref_url` varchar(80) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ref_detail` varchar(300) NOT NULL,
  `login_out` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logger`
--

INSERT INTO `logger` (`log_id`, `emp_email`, `answer`, `ip_addr`, `ref_url`, `time`, `ref_detail`, `login_out`) VALUES
(1, 'test@sequoia.com', '', '::1', 'logout.php', '2020-07-23 10:30:45', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(2, '1', '', '::1', 'login.php', '2020-07-23 10:30:47', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(3, '1', '', '::1', 'login.php', '2020-07-23 10:31:23', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(4, '1', '', '::1', 'login.php', '2020-07-23 10:31:24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(5, '1', '', '::1', 'login.php', '2020-07-23 10:31:24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(6, '1', '', '::1', 'login.php', '2020-07-23 10:31:24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(7, '1', '', '::1', 'login.php', '2020-07-23 10:38:09', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(8, '1', '', '::1', 'login.php', '2020-07-23 10:38:10', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(9, '1', '', '::1', 'login.php', '2020-07-23 10:38:10', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(10, '1', '', '::1', 'login.php', '2020-07-23 10:38:10', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(11, '1', '', '::1', 'login.php', '2020-07-23 10:38:11', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(12, '1', '', '::1', 'login.php', '2020-07-23 10:38:11', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(13, '1', '', '::1', 'login.php', '2020-07-23 10:38:11', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(14, '1', '', '::1', 'login.php', '2020-07-23 10:38:11', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(15, '1', '', '::1', 'login.php', '2020-07-23 10:38:14', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(16, '1', '', '::1', 'login.php', '2020-07-23 10:38:14', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(17, '1', '', '::1', 'login.php', '2020-07-23 10:38:15', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(18, '1', '', '::1', 'login.php', '2020-07-23 10:38:15', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(19, '1', '', '::1', 'login.php', '2020-07-23 10:38:15', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(20, '1', '', '::1', 'login.php', '2020-07-23 10:38:15', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(21, '1', '', '::1', 'login.php', '2020-07-23 10:38:16', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(22, '1', '', '::1', 'login.php', '2020-07-23 10:38:16', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(23, '1', '', '::1', 'login.php', '2020-07-23 10:38:16', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(24, '1', '', '::1', 'login.php', '2020-07-23 10:38:16', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(25, '1', '', '::1', 'login.php', '2020-07-23 10:38:16', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(26, '1', '', '::1', 'login.php', '2020-07-23 10:38:16', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(27, '1', '', '::1', 'login.php', '2020-07-23 10:38:17', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(28, '1', '', '::1', 'login.php', '2020-07-23 10:38:17', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(29, '1', '', '::1', 'login.php', '2020-07-23 10:38:18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(30, '1', '', '::1', 'login.php', '2020-07-23 10:38:18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(31, '1', '', '::1', 'login.php', '2020-07-23 10:38:18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(32, '1', '', '::1', 'login.php', '2020-07-23 10:38:18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(33, '1', '', '::1', 'login.php', '2020-07-23 10:38:28', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(34, '1', '', '::1', 'login.php', '2020-07-23 10:38:28', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(35, '1', '', '::1', 'login.php', '2020-07-23 10:38:29', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(36, '1', '', '::1', 'login.php', '2020-07-23 10:38:29', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(37, '1', '', '::1', 'register.php', '2020-07-23 10:38:30', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(38, '1', '', '::1', 'register.php', '2020-07-23 10:38:36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(39, '1', '', '::1', 'register.php', '2020-07-23 10:38:36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(40, '1', '', '::1', 'register.php', '2020-07-23 10:38:44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(41, '1', '', '::1', 'login.php', '2020-07-23 10:38:44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(42, '1', '', '::1', 'login.php', '2020-07-23 10:38:45', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(43, '1', '', '::1', 'login.php', '2020-07-23 10:38:45', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(44, '1', '', '::1', 'login.php', '2020-07-23 10:38:50', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(45, 'test@sequoia.com', '', '::1', 'hola.php', '2020-07-23 10:38:50', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(46, '1', '', '14.143.33.107', 'login.php', '2020-07-23 11:42:32', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(47, '1', '', '14.143.33.107', 'login.php', '2020-07-23 11:42:42', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(48, '1', '', '14.143.33.107', 'register.php', '2020-07-23 11:45:45', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(49, '1', '', '14.143.33.107', 'register.php', '2020-07-23 11:46:02', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(50, '1', '', '14.143.33.107', 'register.php', '2020-07-23 11:46:02', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(51, '1', '', '14.143.33.107', 'register.php', '2020-07-23 11:46:15', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(52, '1', '', '14.143.33.107', 'login.php', '2020-07-23 11:46:15', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(53, '1', '', '14.143.33.107', 'login.php', '2020-07-23 11:46:26', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(54, '1', '', '14.143.33.107', 'login.php', '2020-07-23 11:46:26', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(55, '1', '', '14.143.33.107', 'login.php', '2020-07-23 11:46:35', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(56, 'hola@sequoia.com', '', '14.143.33.107', 'hola.php', '2020-07-23 11:46:35', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(57, 'hola@sequoia.com', '', '14.143.33.107', 'me.php', '2020-07-23 11:46:49', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(58, 'hola@sequoia.com', '', '14.143.33.107', 'wfo.php', '2020-07-23 11:47:01', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(59, 'hola@sequoia.com', '', '14.143.33.107', 'hrx.php', '2020-07-23 11:47:23', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(60, 'hola@sequoia.com', '', '14.143.33.107', 'storage.php', '2020-07-23 11:47:30', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(61, 'hola@sequoia.com', '', '14.143.33.107', 'storage.php', '2020-07-23 11:47:42', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(62, 'hola@sequoia.com', '', '14.143.33.107', 'business.php', '2020-07-23 11:48:02', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(63, 'hola@sequoia.com', '', '14.143.33.107', 'business.php', '2020-07-23 11:48:14', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(64, 'hola@sequoia.com', '', '14.143.33.107', 'phone.php', '2020-07-23 11:48:38', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(65, 'hola@sequoia.com', '', '14.143.33.107', 'phone.php', '2020-07-23 11:48:42', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(66, 'hola@sequoia.com', '', '14.143.33.107', 'phone.php', '2020-07-23 11:50:41', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(67, 'hola@sequoia.com', '', '14.143.33.107', 'me.php', '2020-07-23 11:50:45', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(68, 'hola@sequoia.com', '', '14.143.33.107', 'phone.php', '2020-07-23 11:50:45', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(69, 'hola@sequoia.com', '', '14.143.33.107', 'phone.php', '2020-07-23 12:14:27', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(70, 'hola@sequoia.com', '', '14.143.33.107', 'india.php', '2020-07-23 12:14:34', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(71, 'hola@sequoia.com', '', '14.143.33.107', 'india.php', '2020-07-23 12:15:05', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(72, 'hola@sequoia.com', '', '14.143.33.107', 'ohno.php', '2020-07-23 12:15:42', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(73, 'hola@sequoia.com', '', '14.143.33.107', 'ohno.php', '2020-07-23 12:16:44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(74, 'hola@sequoia.com', '', '14.143.33.107', 'stayaway.php', '2020-07-23 12:17:04', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(75, 'hola@sequoia.com', '', '14.143.33.107', 'whatyearisit.php', '2020-07-23 12:17:12', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(76, 'hola@sequoia.com', '', '14.143.33.107', 'sequoia.php', '2020-07-23 12:17:29', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(77, 'hola@sequoia.com', '', '14.143.33.107', 'logout.php', '2020-07-23 12:17:36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(78, '1', '', '14.143.33.107', 'login.php', '2020-07-23 12:17:39', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(79, '1', '', '14.143.33.107', 'login.php', '2020-07-23 12:17:53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(80, 'hola@sequoia.com', '', '14.143.33.107', 'sequoia.php', '2020-07-23 12:17:53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(81, 'hola@sequoia.com', '', '14.143.33.107', 'logout.php', '2020-07-23 12:18:02', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(82, '1', '', '14.143.33.107', 'logout.php', '2020-07-23 12:21:38', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(83, '1', '', '14.143.33.107', 'login.php', '2020-07-23 12:21:46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(84, '1', '', '14.143.33.107', 'login.php', '2020-07-23 12:21:51', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(85, '1', '', '14.143.33.107', 'login.php', '2020-07-23 12:26:22', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(86, '1', '', '14.143.33.107', 'login.php', '2020-07-23 12:34:00', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(87, '1', '', '14.143.33.107', 'login.php', '2020-07-23 12:34:18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(88, '1', '', '14.143.33.107', 'login.php', '2020-07-23 12:38:24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(89, '1', '', '14.143.33.107', 'login.php', '2020-07-23 12:38:25', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(90, '1', '', '14.143.33.107', 'login.php', '2020-07-23 12:38:34', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(91, '1', '', '14.143.33.107', 'login.php', '2020-07-23 12:38:39', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(92, '1', '', '14.143.33.107', 'login.php', '2020-07-23 12:38:44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(93, 'hola@sequoia.com', '', '14.143.33.107', 'sequoia.php', '2020-07-23 12:38:44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(94, 'hola@sequoia.com', '', '14.143.33.107', '', '2020-07-23 12:38:49', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(95, 'hola@sequoia.com', '', '14.143.33.107', '', '2020-07-23 12:41:43', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(96, 'hola@sequoia.com', '', '14.143.33.107', 'hola.php', '2020-07-23 12:41:51', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(97, 'hola@sequoia.com', '', '14.143.33.107', 'logout.php', '2020-07-23 12:42:34', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(98, '1', '', '14.143.33.107', 'login.php', '2020-07-23 12:42:36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(99, '1', '', '14.143.33.107', 'login.php', '2020-07-23 12:48:12', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(100, '1', '', '14.143.33.107', 'login.php', '2020-07-23 12:48:14', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(101, '1', '', '14.143.33.107', 'login.php', '2020-07-23 12:48:14', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(102, '1', '', '14.143.33.107', 'register.php', '2020-07-23 12:48:25', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(103, '1', '', '14.143.33.107', 'login.php', '2020-07-23 12:59:44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(104, '1', '', '14.143.33.107', 'register.php', '2020-07-23 14:59:46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(105, '1', '', '14.143.33.107', 'register.php', '2020-07-23 15:00:05', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(106, '1', '', '14.143.33.107', 'login.php', '2020-07-23 15:00:05', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(107, '1', '', '14.143.33.107', 'login.php', '2020-07-23 15:00:17', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(108, 'shruti@sequoia.com', '', '14.143.33.107', 'hola.php', '2020-07-23 15:00:17', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(109, 'shruti@sequoia.com', '', '14.143.33.107', 'hola.php', '2020-07-23 15:00:50', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(110, 'shruti@sequoia.com', '', '14.143.33.107', 'me.php', '2020-07-23 15:01:14', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(111, 'shruti@sequoia.com', '', '14.143.33.107', 'me.php', '2020-07-23 15:01:31', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(112, 'shruti@sequoia.com', '', '14.143.33.107', 'wfo.php', '2020-07-23 15:01:50', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(113, 'shruti@sequoia.com', '', '14.143.33.107', 'hrx.php', '2020-07-23 15:02:05', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(114, 'shruti@sequoia.com', '', '14.143.33.107', 'storage.php', '2020-07-23 15:02:37', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(115, 'shruti@sequoia.com', '', '14.143.33.107', 'business.php', '2020-07-23 15:02:46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(116, 'shruti@sequoia.com', '', '14.143.33.107', 'business.php', '2020-07-23 15:02:58', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(117, 'shruti@sequoia.com', '', '14.143.33.107', 'phone.php', '2020-07-23 15:03:13', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(118, 'shruti@sequoia.com', '', '14.143.33.107', 'phone.php', '2020-07-23 15:03:23', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(119, 'shruti@sequoia.com', '', '14.143.33.107', 'phone.php', '2020-07-23 15:03:37', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(120, 'shruti@sequoia.com', '', '14.143.33.107', 'india.php', '2020-07-23 15:03:46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(121, 'shruti@sequoia.com', '', '14.143.33.107', 'ohno.php', '2020-07-23 15:05:28', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(122, 'shruti@sequoia.com', '', '14.143.33.107', 'stayaway.php', '2020-07-23 15:05:36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(123, 'shruti@sequoia.com', '', '14.143.33.107', 'whatyearisit.php', '2020-07-23 15:05:43', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(124, 'shruti@sequoia.com', '', '14.143.33.107', 'sequoia.php', '2020-07-23 15:06:02', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(125, 'shruti@sequoia.com', '', '14.143.33.107', '', '2020-07-23 15:15:57', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(126, 'shruti@sequoia.com', '', '14.143.33.107', 'hola.php', '2020-07-23 15:24:32', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(127, 'hoho@sequoia.com', '', '14.143.33.107', 'initiate.php', '2020-07-24 01:15:29', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(128, 'hoho@sequoia.com', '', '14.143.33.107', 'initiate.php', '2020-07-24 01:16:28', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(129, 'hoho@sequoia.com', '', '14.143.33.107', 'initiate.php', '2020-07-24 01:16:46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0),
(130, 'hoho@sequoia.com', 'garima', '14.143.33.107', 'initiate.php', '2020-07-24 01:18:37', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 0);

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `emp_name` varchar(100) NOT NULL,
  `emp_pwd` varchar(32) NOT NULL,
  `emp_email` varchar(100) NOT NULL,
  `emp_level` int(2) UNSIGNED NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`emp_name`, `emp_pwd`, `emp_email`, `emp_level`, `last_login`) VALUES
('ho', 'hoho', 'hoho@sequoia.com', 3, '2020-07-24 01:18:37'),
('hola', 'hola', 'hola@sequoia.com', 13, '2020-07-23 12:17:29'),
('shruti', 'hola', 'shruti@sequoia.com', 13, '2020-07-23 15:06:01'),
('Karthikeyan NG', 'hola', 'test@sequoia.com', 1, '2020-07-23 10:38:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `logger`
--
ALTER TABLE `logger`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `emp_email` (`emp_email`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`emp_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `qid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `logger`
--
ALTER TABLE `logger`
  MODIFY `log_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
