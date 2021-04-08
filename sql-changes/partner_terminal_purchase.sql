USE `dinterminal`

CREATE TABLE `partner_terminal_purchase` (
  `order_id` int(11) NOT NULL,
  `pspid` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `currency` int(11) NOT NULL,
  `completed` int(11) NOT NULL DEFAULT '0',
  `payment_token` varchar(255) DEFAULT NULL,
  `processing_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `partner_terminal_purchase`
  ADD PRIMARY KEY (`order_id`);

ALTER TABLE `partner_terminal_purchase`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
