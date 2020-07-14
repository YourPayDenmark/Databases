-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Vært: aurora-1.cluster-czl14h06ail9.eu-west-1.rds.amazonaws.com
-- Genereringstid: 12. 05 2020 kl. 13:31:49
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
-- Database: `dinterminal_documents`
--

-- --------------------------------------------------------
USE dinterminal_documents;
--
-- Struktur-dump for tabellen `document_access_log`
--

CREATE TABLE `document_access_log` (
  `log_id` int(7) NOT NULL DEFAULT '0',
  `log_timestamp` bigint(12) NOT NULL DEFAULT '0',
  `log_action` enum('upload','access') NOT NULL,
  `access_ip` varchar(20) NOT NULL DEFAULT '',
  `user_id` int(7) NOT NULL DEFAULT '0',
  `document_id` int(7) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `document_container`
--

CREATE TABLE `document_container` (
  `document_id` int(7) NOT NULL DEFAULT '0',
  `user_id` int(7) NOT NULL DEFAULT '0',
  `document_type` enum('logo','documentation') NOT NULL,
  `document_token` varchar(120) NOT NULL DEFAULT '',
  `document_key` varchar(30) NOT NULL DEFAULT '',
  `document_extension` varchar(20) NOT NULL DEFAULT '',
  `document_upload` bigint(12) NOT NULL DEFAULT '0',
  `document_expire` bigint(12) NOT NULL DEFAULT '0',
  `document_last_reviewed` bigint(12) NOT NULL DEFAULT '0',
  `document_container` longblob NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `document_users`
--

CREATE TABLE `document_users` (
  `user_id` int(7) NOT NULL DEFAULT '0',
  `user_name` varchar(10) NOT NULL DEFAULT '',
  `user_token` varchar(32) NOT NULL DEFAULT '',
  `user_created` bigint(12) NOT NULL DEFAULT '0',
  `user_last_access` bigint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `document_access_log`
--
ALTER TABLE `document_access_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `document_id` (`document_id`);

--
-- Indeks for tabel `document_container`
--
ALTER TABLE `document_container`
  ADD PRIMARY KEY (`document_id`);

--
-- Indeks for tabel `document_users`
--
ALTER TABLE `document_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `document_access_log`
--
ALTER TABLE `document_access_log`
  MODIFY `log_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `document_container`
--
ALTER TABLE `document_container`
  MODIFY `document_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `document_users`
--
ALTER TABLE `document_users`
  MODIFY `user_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `document_access_log`
--
ALTER TABLE `document_access_log`
  ADD CONSTRAINT `document_access_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `document_users` (`user_id`),
  ADD CONSTRAINT `document_access_log_ibfk_2` FOREIGN KEY (`document_id`) REFERENCES `document_container` (`document_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
