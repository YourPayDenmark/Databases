USE `dinterminal`

CREATE TABLE `customer_ot_keys` (
  `merchant_token` varchar(255) NOT NULL,
  `ot_key` varchar(255) NOT NULL,
  `exp_time` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
COMMIT;
