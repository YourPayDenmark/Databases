
CREATE TABLE `crm_dashboard_queries` (
  `query_id` int NOT NULL,
  `query_owner` int NOT NULL,
  `query_active` smallint NOT NULL DEFAULT '0',
  `query_content` longtext NOT NULL,
  `query_uid` varchar(80) NOT NULL,
  `query_groups` varchar(80) NOT NULL,
  `query_used` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `crm_dashboard_queries`
--
ALTER TABLE `crm_dashboard_queries`
  ADD PRIMARY KEY (`query_id`);
