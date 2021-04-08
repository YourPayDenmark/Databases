USE `dinterminal`

CREATE TABLE `partner_product_list` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `partner_product_list`
  ADD PRIMARY KEY (`product_id`);
COMMIT;
