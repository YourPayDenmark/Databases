-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Vært: aurora-1.cluster-czl14h06ail9.eu-west-1.rds.amazonaws.com
-- Genereringstid: 08. 04 2021 kl. 08:13:35
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
-- Struktur-dump for tabellen `crm_login_psp`
--

CREATE TABLE `crm_login_psp` (
  `pspid` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_description` longtext NOT NULL,
  `logo` varchar(255) NOT NULL,
  `pipedrive_id` int(10) NOT NULL DEFAULT '0',
  `amount_of_merchants` int(3) NOT NULL DEFAULT '0',
  `response` varchar(255) NOT NULL,
  `settlement_days` int(3) NOT NULL DEFAULT '14',
  `merchant_percentage` int(4) NOT NULL DEFAULT '225' COMMENT 'Percentage merchant is paying to Yourpay',
  `partner_kickback` int(3) NOT NULL DEFAULT '0',
  `finders_fee` int(3) NOT NULL DEFAULT '0',
  `finders_fee_currency` int(3) NOT NULL DEFAULT '208',
  `percentage` int(2) NOT NULL DEFAULT '5' COMMENT 'Percentage in Kickback / 100',
  `volume_total` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Total volume on PSP',
  `kickback_total` bigint(12) NOT NULL COMMENT 'Total kickback',
  `kickback_released` bigint(12) NOT NULL COMMENT 'Kickback release',
  `last_kickbackrelease` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Timestamp for last release of kickback',
  `last_updated` bigint(12) NOT NULL DEFAULT '0',
  `deactivated` smallint(1) NOT NULL DEFAULT '0',
  `last_update` int(11) NOT NULL,
  `merchants` int(8) NOT NULL,
  `total_volume` bigint(12) NOT NULL,
  `total_kickback` bigint(12) NOT NULL,
  `total_release` bigint(12) NOT NULL,
  `bank_reg` smallint(4) NOT NULL,
  `bank_acc` bigint(12) NOT NULL,
  `agreement_url` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `postal` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `default_language_code` int(11) DEFAULT NULL,
  `multi_media_share` int(1) DEFAULT NULL,
  `terminal_buy_price` int(11) DEFAULT NULL,
  `terminal_buy_currency` int(11) DEFAULT NULL,
  `bank_information` varchar(255) DEFAULT NULL,
  `Iban` int(11) DEFAULT NULL,
  `Bic_code` int(11) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `currency_text` varchar(255) DEFAULT NULL,
  `lowest_card_fee` int(11) DEFAULT NULL,
  `lowest_settlement_days` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `crm_login_psp`
--
ALTER TABLE `crm_login_psp`
  ADD PRIMARY KEY (`pspid`),
  ADD KEY `pspid` (`pspid`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `crm_login_psp`
--
ALTER TABLE `crm_login_psp`
  MODIFY `pspid` int(2) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
