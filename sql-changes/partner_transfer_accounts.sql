USE `dinterminal`

CREATE TABLE `partner_transfer_accounts` (
  `accountid` bigint(12) DEFAULT NULL,
  `creationtime` bigint(12) DEFAULT NULL,
  `currency` int(3) DEFAULT NULL,
  `settlement_currency` int(3) DEFAULT NULL,
  `account_state` bigint(12) DEFAULT NULL,
  `account_activated` smallint(1) DEFAULT NULL,
  `account_invoices` smallint(1) DEFAULT NULL,
  `account_amount` bigint(12) DEFAULT NULL,
  `account_adjustment_status` bigint(12) DEFAULT NULL,
  `account_amount_last_updated` bigint(12) DEFAULT NULL,
  `account_total_capture` bigint(12) DEFAULT NULL,
  `account_total_settlement` bigint(12) DEFAULT NULL,
  `account_total_tax` bigint(12) DEFAULT NULL,
  `account_adjustments` int(11) DEFAULT NULL,
  `refund_amount_calculated` int(7) DEFAULT NULL,
  `refund_amount_total` bigint(20) DEFAULT NULL,
  `merchant_total_debt` bigint(12) DEFAULT NULL,
  `account_reserve` bigint(12) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `IBAN` varchar(255) DEFAULT NULL,
  `biccode` varchar(12) DEFAULT NULL,
  `bankname` varchar(255) DEFAULT NULL,
  `bankreg` bigint(6) DEFAULT NULL,
  `bankacc` bigint(12) DEFAULT NULL,
  `recalculate_period` bigint(12) DEFAULT NULL,
  `recalculate_status` int(1) DEFAULT NULL,
  `last_releasedate` bigint(12) DEFAULT NULL,
  `last_updated` bigint(12) DEFAULT NULL,
  `reviewed_date` smallint(1) DEFAULT NULL,
  `verified_ctpe` smallint(1) DEFAULT NULL,
  `activation_code` varchar(8) DEFAULT NULL,
  `activation_amount` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
COMMIT;

