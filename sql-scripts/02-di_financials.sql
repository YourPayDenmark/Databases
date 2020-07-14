-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Vært: aurora-1.cluster-czl14h06ail9.eu-west-1.rds.amazonaws.com
-- Genereringstid: 12. 05 2020 kl. 13:32:05
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
-- Database: `di_financials`
--

-- --------------------------------------------------------
USE di_financials;

--
-- Struktur-dump for tabellen `banking_transactions`
--

CREATE TABLE `banking_transactions` (
  `banking_id` int(11) NOT NULL DEFAULT '0',
  `banking_date` bigint(12) NOT NULL DEFAULT '0',
  `banking_amount` int(10) NOT NULL DEFAULT '0',
  `banking_currency` varchar(3) NOT NULL DEFAULT '',
  `banking_sender` varchar(14) NOT NULL DEFAULT '',
  `banking_recipient` varchar(14) NOT NULL DEFAULT '',
  `banking_text` longtext NOT NULL DEFAULT '',
  `banking_text_recipient` longtext NOT NULL DEFAULT '',
  `banking_creditorreference` varchar(50) NOT NULL DEFAULT '',
  `banking_repipient_name` varchar(50) NOT NULL DEFAULT '',
  `banking_type` varchar(50) NOT NULL DEFAULT '',
  `rule_matched` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `import_rules`
--

CREATE TABLE `import_rules` (
  `rule_id` int(12) NOT NULL DEFAULT '0',
  `rule_sort` int(3) NOT NULL DEFAULT '0',
  `rules` longtext NOT NULL DEFAULT '',
  `booking_accountid` bigint(10) NOT NULL DEFAULT '0',
  `active` smallint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `navision_accounts`
--

CREATE TABLE `navision_accounts` (
  `navision_accounts_id` bigint(12) NOT NULL DEFAULT '0',
  `navision_acccount_type` longtext NOT NULL DEFAULT '',
  `navision_account_number` varchar(50) NOT NULL DEFAULT '',
  `banking_account_no` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `navision_transactions`
--

CREATE TABLE `navision_transactions` (
  `navision_id` int(11) NOT NULL DEFAULT '0',
  `banking_id` bigint(12) NOT NULL DEFAULT '0',
  `navision_account_id` bigint(12) NOT NULL DEFAULT '0',
  `navision_counter_account_id` bigint(12) NOT NULL DEFAULT '0',
  `navision_imported` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `banking_transactions`
--
ALTER TABLE `banking_transactions`
  ADD PRIMARY KEY (`banking_id`),
  ADD KEY `banking_id` (`banking_id`);

--
-- Indeks for tabel `import_rules`
--
ALTER TABLE `import_rules`
  ADD PRIMARY KEY (`rule_id`);

--
-- Indeks for tabel `navision_accounts`
--
ALTER TABLE `navision_accounts`
  ADD PRIMARY KEY (`navision_accounts_id`);

--
-- Indeks for tabel `navision_transactions`
--
ALTER TABLE `navision_transactions`
  ADD PRIMARY KEY (`navision_id`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `banking_transactions`
--
ALTER TABLE `banking_transactions`
  MODIFY `banking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `import_rules`
--
ALTER TABLE `import_rules`
  MODIFY `rule_id` int(12) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `navision_accounts`
--
ALTER TABLE `navision_accounts`
  MODIFY `navision_accounts_id` bigint(12) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `navision_transactions`
--
ALTER TABLE `navision_transactions`
  MODIFY `navision_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
