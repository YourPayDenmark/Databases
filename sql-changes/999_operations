USE di_payments;
CREATE TABLE `02_payments_declined` (
  `id` int(12) NOT NULL,
  `transid` bigint(12) NOT NULL,
  `token` varchar(120) NOT NULL,
  `merchantid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `02_payments_declined`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transid` (`transid`);

