USE dinterminal;


CREATE TABLE `credorax_merchants` (
  `credorax_id` int NOT NULL,
  `merchant_token` varchar(90) NOT NULL,
  `terminal_ids` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `credorax_merchants`
--
ALTER TABLE `credorax_merchants`
  ADD PRIMARY KEY (`credorax_id`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `credorax_merchants`
--
ALTER TABLE `credorax_merchants`
  MODIFY `credorax_id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `credorax_merchants` CHANGE `terminal_ids` `terminal_ids` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL;
