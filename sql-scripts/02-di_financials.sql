
--
-- Database: `di_financials`
--
USE di_financials;
-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `banking_transactions`
--

CREATE TABLE `banking_transactions` (
  `banking_id` int(11) NOT NULL,
  `banking_date` bigint(12) NOT NULL,
  `banking_statement` bigint(12) NOT NULL,
  `banking_amount` int(10) NOT NULL,
  `banking_currency` varchar(3) NOT NULL,
  `banking_sender` varchar(14) NOT NULL,
  `banking_recipient` varchar(14) NOT NULL,
  `banking_text` longtext NOT NULL,
  `banking_text_recipient` longtext NOT NULL,
  `banking_creditorreference` varchar(50) NOT NULL,
  `banking_repipient_name` varchar(50) NOT NULL,
  `banking_type` varchar(50) NOT NULL,
  `rule_matched` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `import_rules`
--

CREATE TABLE `import_rules` (
  `rule_id` int(12) NOT NULL,
  `rule_sort` int(3) NOT NULL DEFAULT '0',
  `rules` longtext NOT NULL,
  `booking_accountid` bigint(10) NOT NULL,
  `active` smallint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `navision_accounts`
--

CREATE TABLE `navision_accounts` (
  `navision_accounts_id` bigint(12) NOT NULL,
  `navision_acccount_type` longtext NOT NULL,
  `navision_account_number` varchar(50) NOT NULL,
  `banking_account_no` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `navision_transactions`
--

CREATE TABLE `navision_transactions` (
  `navision_id` int(11) NOT NULL,
  `banking_id` bigint(12) NOT NULL,
  `navision_account_id` bigint(12) NOT NULL,
  `navision_counter_account_id` bigint(12) NOT NULL,
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
