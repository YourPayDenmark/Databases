USE `dinterminal`

CREATE TABLE `partner_terminal_orders` (
  `order_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
COMMIT;
