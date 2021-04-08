-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Vært: aurora-1.cluster-czl14h06ail9.eu-west-1.rds.amazonaws.com
-- Genereringstid: 08. 04 2021 kl. 07:38:19
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
-- Struktur-dump for tabellen `partner_terminal_purchase`
--

CREATE TABLE `partner_terminal_purchase` (
  `order_id` int(11) NOT NULL,
  `pspid` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `currency` int(11) NOT NULL,
  `completed` int(11) NOT NULL DEFAULT '0',
  `payment_token` varchar(255) DEFAULT NULL,
  `processing_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `partner_terminal_purchase`
--
ALTER TABLE `partner_terminal_purchase`
  ADD PRIMARY KEY (`order_id`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `partner_terminal_purchase`
--
ALTER TABLE `partner_terminal_purchase`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
