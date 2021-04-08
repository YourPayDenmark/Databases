-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Vært: aurora-1.cluster-czl14h06ail9.eu-west-1.rds.amazonaws.com
-- Genereringstid: 08. 04 2021 kl. 07:37:35
-- Serverversion: 5.6.10
-- PHP-version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dinterminal`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `partner_transfer_accounts`
--

CREATE TABLE `partner_transfer_accounts` (
  `accountid` bigint(12) DEFAULT NULL,
  `creationtime` bigint(12) DEFAULT NULL,
  `currency` int(3) DEFAULT NULL,
  `settlement_currency` int(3) DEFAULT NULL,
  `account_state` bigint(12) DEFAULT NULL,
  `account_activated` smallint(1) DEFAULT NULL,
  `account_invoices` smallint(1) DEFAULT NULL,
  `account_amount` bigint(12) DEFAULT NULL,
  `account_adjustment_status` bigint(12) DEFAULT NULL,
  `account_amount_last_updated` bigint(12) DEFAULT NULL,
  `account_total_capture` bigint(12) DEFAULT NULL,
  `account_total_settlement` bigint(12) DEFAULT NULL,
  `account_total_tax` bigint(12) DEFAULT NULL,
  `account_adjustments` int(11) DEFAULT NULL,
  `refund_amount_calculated` int(7) DEFAULT NULL,
  `refund_amount_total` bigint(20) DEFAULT NULL,
  `merchant_total_debt` bigint(12) DEFAULT NULL,
  `account_reserve` bigint(12) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `IBAN` varchar(255) DEFAULT NULL,
  `biccode` varchar(12) DEFAULT NULL,
  `bankname` varchar(255) DEFAULT NULL,
  `bankreg` bigint(6) DEFAULT NULL,
  `bankacc` bigint(12) DEFAULT NULL,
  `recalculate_period` bigint(12) DEFAULT NULL,
  `recalculate_status` int(1) DEFAULT NULL,
  `last_releasedate` bigint(12) DEFAULT NULL,
  `last_updated` bigint(12) DEFAULT NULL,
  `reviewed_date` smallint(1) DEFAULT NULL,
  `verified_ctpe` smallint(1) DEFAULT NULL,
  `activation_code` varchar(8) DEFAULT NULL,
  `activation_amount` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
