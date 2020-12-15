--
-- Database: `dinterminal`
--
USE dinterminal;
-- --------------------------------------------------------
CREATE TABLE `bambora_blacklisted` (
  `blacklist_id` int(5) NOT NULL,
  `merchant_token` varchar(255) NOT NULL,
  `blacklisted_by` int(3) NOT NULL COMMENT 'Yourpay User ID',
  `blacklist_requested_by` varchar(255) NOT NULL COMMENT 'Name on Bambora Employee who requested blacklist'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `bambora_blacklisted`
--
ALTER TABLE `bambora_blacklisted`
  ADD PRIMARY KEY (`blacklist_id`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `bambora_blacklisted`
--
ALTER TABLE `bambora_blacklisted`
  MODIFY `blacklist_id` int(5) NOT NULL AUTO_INCREMENT;