
CREATE TABLE `crm_queries` (
  `query_id` int NOT NULL,
  `query_owner` int NOT NULL,
  `query_active` smallint NOT NULL DEFAULT '0',
  `query_content` longtext NOT NULL,
  `query_uid` varchar(80) NOT NULL,
  `query_groups` varchar(80) NOT NULL,
  `query_used` int NOT NULL
) ENGINE=InnoDB;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `crm_queries_queries`
--
ALTER TABLE `crm_queries`
  ADD PRIMARY KEY (`query_id`);

ALTER TABLE `crm_queries` ADD `query_name` VARCHAR(255) NOT NULL AFTER `query_active`;
ALTER TABLE `crm_queries` ADD `query_database` VARCHAR(60) NOT NULL AFTER `query_name`;
