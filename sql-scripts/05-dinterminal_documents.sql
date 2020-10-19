--
-- Database: `dinterminal_documents`
--
USE dinterminal_documents;
-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `document_access_log`
--

CREATE TABLE `document_access_log` (
  `log_id` int(7) NOT NULL,
  `log_timestamp` bigint(12) NOT NULL,
  `log_action` enum('upload','access') NOT NULL,
  `access_ip` varchar(20) NOT NULL,
  `user_id` int(7) NOT NULL,
  `document_id` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `document_container`
--

CREATE TABLE `document_container` (
  `document_id` int(7) NOT NULL,
  `user_id` int(7) NOT NULL,
  `document_type` enum('logo','documentation') NOT NULL,
  `document_token` varchar(120) NOT NULL,
  `document_key` varchar(30) NOT NULL,
  `document_extension` varchar(20) NOT NULL,
  `document_upload` bigint(12) NOT NULL,
  `document_expire` bigint(12) NOT NULL,
  `document_last_reviewed` bigint(12) NOT NULL,
  `document_container` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `document_users`
--

CREATE TABLE `document_users` (
  `user_id` int(7) NOT NULL,
  `user_name` varchar(10) NOT NULL,
  `user_token` varchar(32) NOT NULL,
  `user_created` bigint(12) NOT NULL,
  `user_last_access` bigint(12) NOT NULL
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
