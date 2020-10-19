--
-- Database: `di_payments`
--
USE di_payments;
-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_callbacks`
--

CREATE TABLE `02_callbacks` (
  `UniqueID` bigint(7) NOT NULL COMMENT 'AutoID',
  `merchantid` bigint(12) DEFAULT NULL,
  `unixtime` bigint(12) DEFAULT NULL,
  `tid` varchar(10) NOT NULL DEFAULT '',
  `CallbackURL` longtext NOT NULL,
  `CallbackBody` longtext NOT NULL,
  `callbackstatus` enum('0','1','2') NOT NULL DEFAULT '0',
  `lasttry` varchar(12) NOT NULL DEFAULT '0',
  `tries` int(2) NOT NULL DEFAULT '0',
  `last_updated` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_callbacks_log`
--

CREATE TABLE `02_callbacks_log` (
  `logid` int(12) NOT NULL COMMENT 'Unique Identifier',
  `UniqueId` int(12) DEFAULT NULL COMMENT 'UniqueID',
  `utimer` bigint(12) DEFAULT NULL COMMENT 'Unix Timestamp',
  `header` int(3) DEFAULT NULL COMMENT 'Header response',
  `response` longtext NOT NULL COMMENT 'Response HTML'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_cardnorequests`
--

CREATE TABLE `02_cardnorequests` (
  `request_id` int(8) NOT NULL COMMENT 'AutoID',
  `cardno` varchar(16) NOT NULL,
  `token` varchar(64) NOT NULL,
  `timestp` bigint(12) NOT NULL,
  `ip` varchar(255) NOT NULL COMMENT 'Requester IP'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_cards`
--

CREATE TABLE `02_cards` (
  `ProcessID` int(11) NOT NULL COMMENT 'AutoID',
  `merchantid` bigint(7) NOT NULL,
  `orderid` blob NOT NULL,
  `amount` int(35) NOT NULL,
  `transfee` int(35) NOT NULL,
  `group` blob NOT NULL,
  `currency` int(3) NOT NULL,
  `description` blob NOT NULL,
  `cardtype` int(3) NOT NULL,
  `instantcapture` smallint(1) NOT NULL,
  `use3D` int(1) NOT NULL,
  `accepturl` longblob NOT NULL,
  `declineurl` longblob NOT NULL,
  `callbackurl` longblob NOT NULL,
  `cardno` blob NOT NULL,
  `expmonth` int(2) NOT NULL,
  `expyear` int(4) NOT NULL,
  `cvc` int(3) NOT NULL,
  `TransID` int(8) NOT NULL,
  `date` int(8) NOT NULL,
  `time` int(4) NOT NULL,
  `cardid` int(2) NOT NULL,
  `uxtime` bigint(12) NOT NULL DEFAULT '0',
  `rebilling` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_cardtypes`
--

CREATE TABLE `02_cardtypes` (
  `cardno` bigint(6) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_chargebacks`
--

CREATE TABLE `02_chargebacks` (
  `chargebackid` int(8) NOT NULL,
  `TransID` int(7) NOT NULL DEFAULT '0',
  `PaymentID` int(10) NOT NULL,
  `merchantnumber` int(10) NOT NULL DEFAULT '0',
  `payment_institute` int(2) NOT NULL DEFAULT '0',
  `currency` int(3) NOT NULL DEFAULT '0',
  `arn` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `chargeback_fee` int(5) NOT NULL DEFAULT '20000',
  `datestamp` bigint(12) NOT NULL DEFAULT '0',
  `casetype` varchar(2555) NOT NULL,
  `dateid` int(7) NOT NULL DEFAULT '0',
  `dateid_fee` int(7) NOT NULL DEFAULT '0',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '0 = Received, 1 = Pending Documentation, 2 = Documentation received, 3 = 2nd CBK, 4 = 3rd CBK, 5 = Pending acceptace from Issuer, 6 = Won, 7 = Lost',
  `order_summary_file` varchar(255) NOT NULL,
  `order_summary_file_key` varchar(12) NOT NULL,
  `order_summary_file_token` varchar(120) NOT NULL,
  `invoice_file` varchar(255) NOT NULL,
  `invoice_file_key` varchar(12) NOT NULL,
  `invoice_file_token` varchar(120) NOT NULL,
  `track_and_trace_file` varchar(255) NOT NULL,
  `track_and_trace_file_key` varchar(12) NOT NULL,
  `track_and_trace_file_token` varchar(120) NOT NULL,
  `customer_dialogue_file` varchar(255) NOT NULL,
  `customer_dialogue_file_key` varchar(12) NOT NULL,
  `customer_dialogue_file_token` varchar(120) NOT NULL,
  `days_left_to_represent` int(2) NOT NULL DEFAULT '5',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_merchantfiles`
--

CREATE TABLE `02_merchantfiles` (
  `fileID` int(11) NOT NULL COMMENT 'FileID',
  `merchantid` bigint(10) NOT NULL COMMENT 'MerchantID',
  `datestamp` varchar(10) NOT NULL COMMENT 'DateStamp of Payments',
  `transactions` int(10) NOT NULL,
  `totalamount` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_paymentcapture`
--

CREATE TABLE `02_paymentcapture` (
  `ActionID` int(12) NOT NULL,
  `PaymentID` bigint(12) NOT NULL COMMENT 'TransactionID',
  `req_timestamp` bigint(12) NOT NULL COMMENT 'Unix Timestamp',
  `actual_captures` bigint(12) NOT NULL DEFAULT '0',
  `actual_payout_stamp` bigint(12) NOT NULL COMMENT 'Timestamp for which day the transaction have been added for',
  `FinanceID` bigint(12) NOT NULL DEFAULT '0',
  `financial_date` int(10) NOT NULL,
  `payment_institute` int(3) NOT NULL DEFAULT '0',
  `short_id` varchar(32) NOT NULL DEFAULT '',
  `uniqueid` varchar(80) NOT NULL DEFAULT '',
  `capture_state` varchar(3) NOT NULL DEFAULT '',
  `capture_reason` varchar(255) NOT NULL,
  `dateid` int(7) NOT NULL DEFAULT '0' COMMENT '-3 = No Bank Account, -4 = TEST',
  `amount` int(8) DEFAULT NULL COMMENT 'Amount to capture',
  `amount_one` int(10) NOT NULL,
  `dateid_two` int(10) NOT NULL,
  `amount_two` int(10) NOT NULL,
  `captured` int(1) DEFAULT NULL COMMENT 'If Captured then 1',
  `handlingtype` varchar(15) NOT NULL DEFAULT 'capture',
  `institute` int(3) NOT NULL DEFAULT '0',
  `verified_payon_data` smallint(1) NOT NULL DEFAULT '0' COMMENT 'Used by Capture PayON',
  `reprocess` smallint(1) NOT NULL DEFAULT '0',
  `retries` smallint(2) NOT NULL DEFAULT '0',
  `last_retry` bigint(12) NOT NULL DEFAULT '0',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_paymentcapture_finances`
--

CREATE TABLE `02_paymentcapture_finances` (
  `FinanceID` int(11) NOT NULL,
  `ActionID` int(11) NOT NULL,
  `TransID` int(12) NOT NULL DEFAULT '0',
  `merchant_token` varchar(120) NOT NULL DEFAULT '0',
  `dateid` int(7) NOT NULL DEFAULT '0',
  `payment_institute` int(2) NOT NULL DEFAULT '0',
  `currency` int(3) NOT NULL DEFAULT '0',
  `req_timestamp` bigint(20) NOT NULL COMMENT 'Payment Requested for Capture',
  `actual_timestamp` bigint(20) NOT NULL COMMENT 'Actual Timestamp for Capture',
  `local_currency` int(12) NOT NULL COMMENT 'Transaction Amount',
  `projected_merchant_settlement` bigint(12) NOT NULL,
  `projected_funding_receival` bigint(12) NOT NULL DEFAULT '0',
  `institute_release_timestamp` bigint(20) NOT NULL COMMENT 'Timestamp for when the institute released the funds',
  `raw_line` varchar(20) NOT NULL DEFAULT '0',
  `invoiced_transaction` smallint(6) NOT NULL DEFAULT '0',
  `merchant_paid_fee` int(8) NOT NULL,
  `merchant_other_fees` int(5) NOT NULL DEFAULT '0',
  `transid_volume` int(12) NOT NULL DEFAULT '0',
  `institute_paid_fee` int(8) NOT NULL,
  `institute_other_fees` int(5) NOT NULL DEFAULT '0',
  `net_activity` int(10) NOT NULL,
  `volume_activity` int(11) NOT NULL,
  `arn` varchar(64) NOT NULL,
  `last_updated` timestamp NOT NULL,
  `institute_transactionIdentifier` varchar(255) NOT NULL,
  `institute_authorizationCode` varchar(255) NOT NULL,
  `institute_merchantId` bigint(10) NOT NULL,
  `small_adjusted` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_paymentcapture_finances_raw`
--

CREATE TABLE `02_paymentcapture_finances_raw` (
  `ImportID` bigint(20) NOT NULL,
  `acquirer` varchar(50) NOT NULL,
  `raw_data` longtext NOT NULL,
  `registered` bigint(12) NOT NULL DEFAULT '0',
  `imported` smallint(1) NOT NULL DEFAULT '0',
  `last_updated` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_paymentdata`
--

CREATE TABLE `02_paymentdata` (
  `PaymentID` int(15) NOT NULL,
  `datakey` varchar(50) NOT NULL,
  `datavalue` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_paymentnotes`
--

CREATE TABLE `02_paymentnotes` (
  `paymentid` int(10) NOT NULL,
  `transid` int(12) NOT NULL,
  `notetext` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_paymentrequest`
--

CREATE TABLE `02_paymentrequest` (
  `RequestID` bigint(12) NOT NULL,
  `orderid` varchar(255) NOT NULL,
  `amount` int(12) NOT NULL,
  `currency` int(3) NOT NULL DEFAULT '208',
  `person_name` varchar(255) NOT NULL,
  `person_email` varchar(255) NOT NULL,
  `mailbody` longtext NOT NULL,
  `sent` smallint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_payments`
--

CREATE TABLE `02_payments` (
  `PaymentID` int(15) NOT NULL COMMENT 'Auto¨ID',
  `processing_platform` varchar(10) NOT NULL,
  `pay_method` enum('card','invoice','credit','resursbank','viabill','afterpay','mobilepay','cash','unknown') NOT NULL DEFAULT 'card',
  `pos_trans` smallint(1) NOT NULL DEFAULT '0' COMMENT 'POS transaction',
  `merchantnumber` bigint(12) NOT NULL DEFAULT '0',
  `testtrans` int(11) NOT NULL DEFAULT '0' COMMENT '1 if test-trans',
  `ct` smallint(1) NOT NULL DEFAULT '0' COMMENT 'Customer have paid Transaction Fee',
  `bankinglist` smallint(1) NOT NULL DEFAULT '0' COMMENT 'Bankinglist in admin.yourpay, showing the actual funds on account',
  `orderID` varchar(255) NOT NULL DEFAULT '' COMMENT 'Internal OrderID',
  `TransID` varchar(125) NOT NULL DEFAULT '',
  `Currency` varchar(5) NOT NULL DEFAULT '208',
  `transfee` varchar(10) NOT NULL DEFAULT '',
  `transfeeyp` bigint(7) NOT NULL DEFAULT '0',
  `amount` varchar(10) NOT NULL DEFAULT '',
  `reserved_amount` bigint(10) NOT NULL DEFAULT '0',
  `reserve_payout` bigint(12) NOT NULL DEFAULT '0',
  `transferedtoreserve` smallint(1) NOT NULL DEFAULT '0',
  `cardtype` varchar(10) NOT NULL DEFAULT '',
  `cardholder` varchar(75) NOT NULL DEFAULT '',
  `card_country` int(3) NOT NULL DEFAULT '0',
  `cardno` varchar(16) NOT NULL DEFAULT '',
  `cardnoprefix` int(4) NOT NULL DEFAULT '0' COMMENT 'Card Prefix',
  `restimestamp` varchar(14) NOT NULL DEFAULT '',
  `accountid` int(7) NOT NULL DEFAULT '0',
  `dateid` int(11) NOT NULL DEFAULT '0',
  `bkreg` int(4) NOT NULL DEFAULT '0',
  `bkacc` varchar(10) NOT NULL DEFAULT '',
  `secure` smallint(1) NOT NULL DEFAULT '0',
  `approved` int(1) NOT NULL DEFAULT '1' COMMENT 'If Approved by ePay, then set to payout',
  `ended` int(1) NOT NULL DEFAULT '0',
  `end_time` int(12) NOT NULL DEFAULT '0',
  `notification` varchar(1) NOT NULL DEFAULT '0',
  `notification_email` varchar(80) NOT NULL DEFAULT '',
  `callback` varchar(1) NOT NULL DEFAULT '0',
  `callback_time` varchar(12) NOT NULL DEFAULT '',
  `callback_ip` varchar(24) NOT NULL DEFAULT '',
  `callback_header` longtext,
  `req_capture` int(11) NOT NULL DEFAULT '0' COMMENT 'Requested Capture',
  `req_capture_time` bigint(12) NOT NULL DEFAULT '0' COMMENT 'UnixTimestamp of when customer requested capture',
  `transactionfile` smallint(1) NOT NULL DEFAULT '0',
  `split` int(1) NOT NULL DEFAULT '0' COMMENT 'Split Capture',
  `mass_capture` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = Not flagged for mass capture, 1 = Flagged for mass capture, 2 = Mass capture has been performed on this record, 3 = Mass capture failed on record',
  `mass_refund` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = Not flagged for mass refund, 1 = Flagged for mass refund, 2 = Mass refund has been performed on this record.',
  `mass_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = Not flagged for mass delete, 1 = Flagged for mass delete, 2 = Mass delete has been performed on this record.',
  `req_amount` bigint(10) NOT NULL DEFAULT '0' COMMENT 'Requested Capture Amount',
  `epay_capture` int(1) NOT NULL DEFAULT '0' COMMENT 'Mark with 1 if transaction have been captured',
  `epay_capture_timestamp` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Timestamp of Actual Capture',
  `req_delete` smallint(1) NOT NULL DEFAULT '0' COMMENT 'If set to 1 then delete transaction',
  `req_delete_time` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Unixtimestamp for deletation',
  `req_delete_epay` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Have epay released payment',
  `req_refund` int(7) NOT NULL DEFAULT '0',
  `req_refund_amount` bigint(9) NOT NULL DEFAULT '0',
  `req_refund_time` bigint(12) NOT NULL DEFAULT '0',
  `req_refund_epay` smallint(1) NOT NULL DEFAULT '0' COMMENT 'Complete Refund',
  `req_refund_epay_time` bigint(12) NOT NULL DEFAULT '0',
  `req_refund_date_offsetting` bigint(12) NOT NULL DEFAULT '0',
  `req_refund_paymentcapture` smallint(1) NOT NULL DEFAULT '0' COMMENT 'Refund PaymentID found in PaymentCapture',
  `platform` varchar(30) NOT NULL DEFAULT 'unknown',
  `platform_domain` varchar(95) NOT NULL DEFAULT '',
  `version` varchar(5) NOT NULL DEFAULT '' COMMENT 'Script Version',
  `customerdetails` longblob NOT NULL,
  `customer_ip` blob NOT NULL,
  `fraud` varchar(10) NOT NULL DEFAULT '0',
  `paymentplatform` int(1) NOT NULL DEFAULT '1' COMMENT '1 = epay, 2 = multicards, 3 = payon',
  `channelID` bigint(12) NOT NULL DEFAULT '0',
  `uniqueid` varchar(255) NOT NULL DEFAULT '',
  `shortid` varchar(255) NOT NULL DEFAULT '',
  `shortid_ccrg` varchar(255) NOT NULL DEFAULT '',
  `ccrg_trans` smallint(1) NOT NULL DEFAULT '0',
  `capture_shortid` varchar(255) NOT NULL DEFAULT '',
  `capture_uniqueid` varchar(255) NOT NULL DEFAULT '',
  `free_transaction` smallint(1) NOT NULL DEFAULT '0',
  `upd_check` smallint(1) NOT NULL DEFAULT '0',
  `pbs_forretningsid` int(10) NOT NULL DEFAULT '0',
  `chainedpayment` int(5) NOT NULL DEFAULT '0',
  `chainedPaymentID` varchar(12) NOT NULL DEFAULT '0',
  `ChainedAmount` int(10) NOT NULL DEFAULT '0',
  `payment_institute` int(2) NOT NULL DEFAULT '0',
  `payon_channel` blob,
  `payon_sender` varchar(255) NOT NULL DEFAULT '',
  `payon_login` varchar(255) NOT NULL DEFAULT '',
  `payon_pwd` varchar(255) NOT NULL DEFAULT '',
  `consumer_data_validated` smallint(1) NOT NULL DEFAULT '0' COMMENT '1 = Payment validated in Consumer Data, 0 = Not validated yet',
  `connected_subscriptioncode` varchar(50) NOT NULL DEFAULT '',
  `connected_chained` varchar(50) NOT NULL DEFAULT '',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_payments_sitereference`
--

CREATE TABLE `02_payments_sitereference` (
  `payment_id` int(6) NOT NULL,
  `site_reference` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_payments_tracking`
--

CREATE TABLE `02_payments_tracking` (
  `PaymentID` bigint(20) NOT NULL,
  `digitcode` varchar(15) NOT NULL,
  `delivery` enum('bring') NOT NULL,
  `consignmentNumber` varchar(50) NOT NULL,
  `packageNumber` varchar(50) NOT NULL,
  `correlationId` varchar(50) NOT NULL,
  `label_url` varchar(255) NOT NULL,
  `last_checked` bigint(12) NOT NULL,
  `state` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_payment_data`
--

CREATE TABLE `02_payment_data` (
  `PaymentID` int(10) NOT NULL COMMENT 'PaymentID from 02_payments',
  `bin` int(8) DEFAULT NULL,
  `bin_country` varchar(255) NOT NULL DEFAULT '',
  `pending_valid` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_preparing_tokens`
--

CREATE TABLE `02_preparing_tokens` (
  `tokenid` varchar(64) NOT NULL,
  `transid` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_rebilling`
--

CREATE TABLE `02_rebilling` (
  `RebillingID` int(12) NOT NULL COMMENT 'AutoID',
  `original_orderid` varchar(50) NOT NULL DEFAULT '',
  `testtrans` smallint(1) NOT NULL DEFAULT '1',
  `schedule` smallint(1) NOT NULL DEFAULT '0' COMMENT 'Use Schedule through Shopping Platform',
  `short_id` varchar(255) NOT NULL DEFAULT '',
  `unique_id` varchar(255) NOT NULL DEFAULT '',
  `mask` smallint(1) NOT NULL DEFAULT '0' COMMENT 'If 1 then This ID is masked for another',
  `webservice_id` bigint(10) NOT NULL DEFAULT '0',
  `masked_shortid` varchar(20) NOT NULL DEFAULT '',
  `masked_uniqueID` varchar(255) NOT NULL DEFAULT '',
  `customer_name` varchar(255) NOT NULL DEFAULT '',
  `merchantid` varchar(12) NOT NULL DEFAULT '',
  `period_days` varchar(5) NOT NULL DEFAULT '',
  `period_dayinmonth` varchar(2) NOT NULL DEFAULT '',
  `period_price` varchar(8) NOT NULL DEFAULT '',
  `period_currency` varchar(3) NOT NULL DEFAULT '',
  `period_start` varchar(12) NOT NULL DEFAULT '0',
  `period_next_schedule` bigint(12) NOT NULL DEFAULT '0',
  `period_left` int(10) NOT NULL DEFAULT '0',
  `times_happend` int(12) NOT NULL DEFAULT '0',
  `activated` smallint(1) NOT NULL DEFAULT '1',
  `period_capture` varchar(12) NOT NULL DEFAULT '0',
  `callbackurl` varchar(255) NOT NULL DEFAULT '',
  `rebilling_rb` smallint(1) NOT NULL DEFAULT '0' COMMENT 'If 1 then RB is being used to identify the transaction for PA',
  `rebilling_rb_identification` varchar(255) NOT NULL DEFAULT '',
  `last_capture_response` varchar(255) NOT NULL DEFAULT '',
  `rebilling_failures` smallint(2) NOT NULL DEFAULT '0',
  `verified` smallint(1) NOT NULL DEFAULT '0',
  `lastused` bigint(12) NOT NULL DEFAULT '0',
  `lastMerchantID` int(8) DEFAULT NULL,
  `last_updated` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_rebilling_cardno`
--

CREATE TABLE `02_rebilling_cardno` (
  `rebilling_cid` int(11) NOT NULL,
  `test` smallint(1) NOT NULL DEFAULT '0',
  `cardtoken` longtext NOT NULL,
  `rebilling_short_id` varchar(50) NOT NULL,
  `merchant_token` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_rebilling_products`
--

CREATE TABLE `02_rebilling_products` (
  `id` int(10) NOT NULL,
  `state` int(2) NOT NULL DEFAULT '1' COMMENT '0 = Inactive, 1 = Active',
  `subscription_id` varchar(20) NOT NULL,
  `subscription_product` int(7) NOT NULL,
  `subscription_value` int(5) NOT NULL,
  `subscription_date` int(5) NOT NULL,
  `subscription_period` int(5) NOT NULL,
  `subscription_last` int(5) NOT NULL,
  `subscription_next` bigint(12) NOT NULL DEFAULT '0',
  `subscription_chained` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_rebillng_products_actions`
--

CREATE TABLE `02_rebillng_products_actions` (
  `chained_id` varchar(12) NOT NULL,
  `action` varchar(255) NOT NULL,
  `value` int(7) NOT NULL,
  `timestp` bigint(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_subscriptiondata`
--

CREATE TABLE `02_subscriptiondata` (
  `subscription_id` bigint(12) NOT NULL,
  `PaymentID` bigint(12) NOT NULL,
  `identification_name` varchar(255) NOT NULL DEFAULT '',
  `choosen_product` varchar(255) NOT NULL DEFAULT '',
  `total_volume` bigint(12) NOT NULL DEFAULT '0',
  `monthly_volume` bigint(12) NOT NULL DEFAULT '0',
  `timestamp_created` bigint(12) NOT NULL,
  `timestamp_last_update` bigint(12) NOT NULL,
  `timestamp_last_capture` bigint(12) NOT NULL,
  `timestamp_next_capture` bigint(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_subscription_data`
--

CREATE TABLE `02_subscription_data` (
  `data_id` int(12) NOT NULL,
  `merchantid` bigint(12) NOT NULL,
  `data_key` varchar(255) NOT NULL,
  `data_value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `02_touches`
--

CREATE TABLE `02_touches` (
  `TouchID` bigint(12) NOT NULL COMMENT 'Unique Identifier',
  `PaymentID` bigint(12) NOT NULL COMMENT 'Reference to 02_payments',
  `timestp` bigint(12) NOT NULL COMMENT 'Unixtimestamp for Touch',
  `paction` varchar(255) NOT NULL COMMENT 'action preformed',
  `action_text` varchar(255) NOT NULL COMMENT 'HTML text for action',
  `LoginID` bigint(12) NOT NULL COMMENT 'LoginID who preformed that touch'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `3d_secure_redirect`
--

CREATE TABLE `3d_secure_redirect` (
  `unique_id` longtext NOT NULL,
  `token` varchar(128) NOT NULL,
  `merchant_token` varchar(64) NOT NULL,
  `base64code` longtext NOT NULL,
  `requestblock` longtext NOT NULL,
  `md` longtext NOT NULL,
  `PaRes` longtext NOT NULL,
  `generationtime` bigint(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `all_processing_responses`
--

CREATE TABLE `all_processing_responses` (
  `response_id` bigint(20) NOT NULL,
  `acknowledgement` varchar(3) NOT NULL,
  `method` varchar(20) NOT NULL,
  `response_xml` longtext NOT NULL,
  `timestamp` bigint(12) NOT NULL,
  `state` varchar(255) NOT NULL,
  `merchantid` int(12) NOT NULL,
  `type` varchar(3) NOT NULL,
  `transaction_id` varchar(50) NOT NULL,
  `amount` bigint(12) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `descriptor` varchar(255) NOT NULL,
  `xml_usage` varchar(50) NOT NULL,
  `cardholder` varchar(50) NOT NULL,
  `short_id` varchar(255) NOT NULL,
  `unique_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `bambora_settings`
--

CREATE TABLE `bambora_settings` (
  `access_token` longtext NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `binlist`
--

CREATE TABLE `binlist` (
  `bin_id` int(7) NOT NULL,
  `card_bin` int(8) DEFAULT NULL,
  `scheme` varchar(50) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT '',
  `brand` varchar(50) NOT NULL DEFAULT '',
  `prepaid` tinyint(1) DEFAULT NULL,
  `bank_name` varchar(255) NOT NULL DEFAULT '',
  `bank_logo` varchar(255) NOT NULL DEFAULT '',
  `bank_url` varchar(255) NOT NULL DEFAULT '',
  `bank_city` varchar(255) NOT NULL DEFAULT '',
  `bank_phone` varchar(255) NOT NULL DEFAULT '',
  `country_alpha` varchar(50) NOT NULL DEFAULT '',
  `country_name` varchar(50) NOT NULL DEFAULT '',
  `country_iso` int(3) DEFAULT NULL,
  `pending_registration` varchar(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `blocked_ips`
--

CREATE TABLE `blocked_ips` (
  `iptolong` varchar(50) NOT NULL,
  `reason` varchar(50) NOT NULL,
  `timestmp` datetime NOT NULL,
  `times` bigint(12) NOT NULL DEFAULT '0',
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `bring_packages`
--

CREATE TABLE `bring_packages` (
  `package_id` bigint(10) NOT NULL,
  `bring_consignmentId` bigint(20) NOT NULL,
  `transid` int(10) NOT NULL,
  `timeid` bigint(12) NOT NULL,
  `merchantid` int(10) NOT NULL,
  `transid_chained` int(10) NOT NULL,
  `merchantid_chained` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `state` varchar(255) NOT NULL,
  `last_state_check` bigint(12) NOT NULL DEFAULT '0',
  `captured` int(1) NOT NULL DEFAULT '0',
  `mobile_sender` bigint(10) NOT NULL,
  `mobile_receiver` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `cash_dropoff`
--

CREATE TABLE `cash_dropoff` (
  `id` int(11) NOT NULL,
  `bag_id` varchar(12) NOT NULL,
  `merchant_token` varchar(72) NOT NULL,
  `amount` int(11) NOT NULL,
  `currency` int(11) NOT NULL DEFAULT '208',
  `dropoff_timestamp` bigint(12) NOT NULL DEFAULT '0',
  `pickup_timestamp` bigint(12) NOT NULL DEFAULT '0',
  `pickup_count` int(10) NOT NULL,
  `dateid` int(7) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `economic_integration`
--

CREATE TABLE `economic_integration` (
  `PaymentID` int(10) NOT NULL,
  `draftInvoiceNumber` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `funding_batch`
--

CREATE TABLE `funding_batch` (
  `batch_seq_id` int(11) NOT NULL,
  `batch_id` varchar(255) NOT NULL,
  `batch_start` bigint(12) NOT NULL DEFAULT '0',
  `batch_state` varchar(10) NOT NULL DEFAULT 'open',
  `merchant_token` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `merchant_transfer_transactiondata`
--

CREATE TABLE `merchant_transfer_transactiondata` (
  `TransactionDataID` int(7) NOT NULL,
  `action` smallint(1) NOT NULL DEFAULT '2',
  `transferdate` bigint(12) NOT NULL,
  `accountid` bigint(12) NOT NULL,
  `transfertext` varchar(255) NOT NULL,
  `amount` bigint(12) NOT NULL,
  `PaymentID` int(7) NOT NULL COMMENT 'PaymentID of where the transaction is from',
  `account_volume` int(10) NOT NULL DEFAULT '0',
  `zerovalue` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `methods`
--

CREATE TABLE `methods` (
  `method_id` int(5) NOT NULL,
  `method_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `mobile_urlshorten`
--

CREATE TABLE `mobile_urlshorten` (
  `shortcode` varchar(25) NOT NULL,
  `merchantnumber` int(10) NOT NULL,
  `accepturl` varchar(75) NOT NULL,
  `callbackurl` varchar(75) NOT NULL,
  `amount` int(8) NOT NULL,
  `orderid` varchar(25) NOT NULL,
  `currency` int(3) NOT NULL,
  `language` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payments_datasets`
--

CREATE TABLE `payments_datasets` (
  `uuid` varchar(36) NOT NULL,
  `merchant_token` varchar(90) NOT NULL,
  `sms_request_id` int(10) NOT NULL,
  `mail_request_id` int(10) NOT NULL,
  `ended` smallint(1) NOT NULL DEFAULT '0' COMMENT 'If Payment have been ended'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payments_datasets_container`
--

CREATE TABLE `payments_datasets_container` (
  `uuid` varchar(36) NOT NULL,
  `dataset_uuid` varchar(36) NOT NULL,
  `container_key` varchar(255) NOT NULL,
  `container_value` longtext NOT NULL,
  `timestamp` bigint(12) NOT NULL COMMENT 'Unique Timestamp'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payments_failed`
--

CREATE TABLE `payments_failed` (
  `error_id` int(7) NOT NULL,
  `transid` int(255) NOT NULL,
  `merchantnumber` bigint(10) NOT NULL,
  `timestamp` bigint(12) NOT NULL DEFAULT '0',
  `token` varchar(255) NOT NULL,
  `shortID` varchar(255) NOT NULL,
  `uniqueid` varchar(255) NOT NULL,
  `result` varchar(5) NOT NULL,
  `statuscode` varchar(50) NOT NULL,
  `statustext` varchar(255) NOT NULL,
  `reasoncode` int(5) NOT NULL,
  `reasontext` varchar(255) NOT NULL,
  `returncode` varchar(15) NOT NULL,
  `returntext` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payments_persondata`
--

CREATE TABLE `payments_persondata` (
  `tokenid` varchar(64) NOT NULL,
  `completed_trans` smallint(1) NOT NULL DEFAULT '0',
  `merchantid` int(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sex` enum('Male','Female') NOT NULL,
  `age` smallint(2) NOT NULL,
  `ctype` enum('VISA','MASTER') NOT NULL,
  `amount` int(8) NOT NULL,
  `isp` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payment_errorcodes`
--

CREATE TABLE `payment_errorcodes` (
  `errorcode` int(6) NOT NULL,
  `errorresponse` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payment_requests`
--

CREATE TABLE `payment_requests` (
  `payment_token` varchar(255) NOT NULL,
  `process_time` bigint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payment_transactions`
--

CREATE TABLE `payment_transactions` (
  `PaymentID` int(7) NOT NULL,
  `action` varchar(25) NOT NULL,
  `ended` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payon_data`
--

CREATE TABLE `payon_data` (
  `ShortId` varchar(50) NOT NULL,
  `UniqueId` varchar(50) NOT NULL,
  `Result` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payon_old_tokens`
--

CREATE TABLE `payon_old_tokens` (
  `token` varchar(64) NOT NULL,
  `unixtime` bigint(12) NOT NULL,
  `state` smallint(1) NOT NULL DEFAULT '0' COMMENT '0 = Not complete, 1 = accepted, 2 = declined',
  `UniqueID` varchar(255) NOT NULL,
  `ShortID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payon_old_transactions`
--

CREATE TABLE `payon_old_transactions` (
  `token` varchar(64) NOT NULL,
  `keydata` varchar(128) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payon_tokens`
--

CREATE TABLE `payon_tokens` (
  `token` varchar(64) NOT NULL DEFAULT '',
  `unixtime` bigint(12) NOT NULL,
  `state` smallint(1) NOT NULL DEFAULT '0' COMMENT '0 = Not complete, 1 = accepted, 2 = declined, 3 = pending completion',
  `UniqueID` varchar(255) NOT NULL DEFAULT '',
  `UniqueIDrg` varchar(50) NOT NULL DEFAULT '',
  `ShortID` varchar(255) NOT NULL DEFAULT '',
  `merchantid` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payon_token_responses`
--

CREATE TABLE `payon_token_responses` (
  `token` varchar(90) NOT NULL,
  `request_reference` varchar(40) NOT NULL,
  `timestamp` bigint(12) NOT NULL,
  `responsetext` longtext NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payon_token_sca_request`
--

CREATE TABLE `payon_token_sca_request` (
  `token` varchar(90) NOT NULL,
  `merchant_token` varchar(90) NOT NULL,
  `timestamp` bigint(12) NOT NULL,
  `responsetext` longtext NOT NULL,
  `returntext` longtext NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payon_transactions`
--

CREATE TABLE `payon_transactions` (
  `token` varchar(64) NOT NULL,
  `keydata` varchar(128) NOT NULL,
  `value` varchar(3000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payon_transactions2`
--

CREATE TABLE `payon_transactions2` (
  `token` varchar(64) NOT NULL,
  `keydata` varchar(128) NOT NULL,
  `value` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payon_transid`
--

CREATE TABLE `payon_transid` (
  `token` varchar(92) NOT NULL,
  `transid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payon_transid_operationid`
--

CREATE TABLE `payon_transid_operationid` (
  `creationtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` varchar(255) NOT NULL,
  `transid` bigint(12) NOT NULL,
  `operation_id` varchar(255) NOT NULL,
  `operation_type` varchar(255) NOT NULL,
  `request` longtext NOT NULL,
  `response` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payout_invoice`
--

CREATE TABLE `payout_invoice` (
  `id` int(11) NOT NULL,
  `psper` int(3) NOT NULL DEFAULT '0' COMMENT 'PSPer',
  `date_id` int(11) NOT NULL,
  `merchant_token` varchar(128) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `amount` int(11) NOT NULL,
  `fee` int(11) NOT NULL,
  `time_created` int(11) NOT NULL,
  `time_lasttried` bigint(12) NOT NULL,
  `flag_status` int(11) NOT NULL COMMENT '1 = PAID BY BANK',
  `file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payout_invoice_renewals`
--

CREATE TABLE `payout_invoice_renewals` (
  `renewal_id` int(6) NOT NULL,
  `merchant_token` varchar(32) NOT NULL,
  `psper` bigint(12) NOT NULL,
  `amount` int(10) NOT NULL,
  `currency` int(3) NOT NULL DEFAULT '208',
  `next_renewal` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payworks_sync`
--

CREATE TABLE `payworks_sync` (
  `payworks_id` bigint(10) NOT NULL,
  `paymentid` int(10) NOT NULL,
  `status` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `process_payment_throttling`
--

CREATE TABLE `process_payment_throttling` (
  `cardno` bigint(16) NOT NULL,
  `restime` bigint(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `slow_commands_running_async`
--

CREATE TABLE `slow_commands_running_async` (
  `async_id` bigint(12) NOT NULL,
  `done_from_file` varchar(255) NOT NULL,
  `query_to_run` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `store_transactions`
--

CREATE TABLE `store_transactions` (
  `token` varchar(255) NOT NULL,
  `cardno` varchar(255) NOT NULL,
  `endmonth` varchar(255) NOT NULL,
  `endyear` varchar(255) NOT NULL,
  `cvc` varchar(255) NOT NULL,
  `cardholder` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `TABLE 37`
--

CREATE TABLE `TABLE 37` (
  `COL 1` varchar(14) DEFAULT NULL,
  `COL 2` varchar(32) DEFAULT NULL,
  `COL 3` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `test2`
--

CREATE TABLE `test2` (
  `test2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `transaction_movement_v5`
--

CREATE TABLE `transaction_movement_v5` (
  `merchantid` bigint(12) NOT NULL,
  `PaymentID` bigint(12) NOT NULL,
  `latest_transaction` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `velocity_check`
--

CREATE TABLE `velocity_check` (
  `vel_id` int(7) NOT NULL,
  `merchant_token` varchar(64) NOT NULL,
  `vel_binid` int(8) NOT NULL,
  `cardtoken` varchar(255) NOT NULL,
  `vel_timestamp` bigint(12) NOT NULL,
  `vel_response` bigint(12) NOT NULL,
  `vel_result` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in-struktur for visning `view_payoutdata`
-- (Se nedenfor for det aktuelle view)
--
CREATE TABLE `view_payoutdata` (
`ActionID` int(12)
,`PaymentID` bigint(12)
,`handlingtype` varchar(15)
,`amount` int(8)
,`req_timestamp` bigint(12)
,`captured` int(1)
,`cardno` varchar(16)
);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `yourpay_cards`
--

CREATE TABLE `yourpay_cards` (
  `card_id` int(10) NOT NULL,
  `card_validator` varchar(12) NOT NULL,
  `card_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '0 = Pending activation, 1 = Card details received, 2 = Activated, 3 = Deactivated',
  `card_details` varchar(100) NOT NULL,
  `card_trunked` varchar(16) NOT NULL,
  `card_type` enum('debit','credit') NOT NULL DEFAULT 'debit',
  `card_scheme` enum('MASTER','VISA') NOT NULL DEFAULT 'MASTER',
  `card_funding` smallint(1) NOT NULL DEFAULT '1' COMMENT '1 = Only funds on card, 2 = Group funds',
  `merchant_token` varchar(64) NOT NULL,
  `card_activation` bigint(12) NOT NULL,
  `card_deactivation` bigint(12) NOT NULL,
  `card_funds` int(10) NOT NULL,
  `card_currency` int(3) NOT NULL DEFAULT '208'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `yourpay_cards_funding_group`
--

CREATE TABLE `yourpay_cards_funding_group` (
  `funding_group_id` int(7) NOT NULL,
  `funding_validator` varchar(10) NOT NULL,
  `merchant_token` varchar(64) NOT NULL,
  `last_update` int(11) NOT NULL,
  `funding_state` int(10) NOT NULL,
  `funding_amount` int(8) NOT NULL,
  `funding_currency` varchar(3) NOT NULL DEFAULT 'DKK'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `yourpay_cards_funding_transactions`
--

CREATE TABLE `yourpay_cards_funding_transactions` (
  `transaction_id` int(7) NOT NULL,
  `funding_group_id` int(7) NOT NULL,
  `card_id` int(6) NOT NULL DEFAULT '0',
  `date_id` int(12) NOT NULL,
  `merchant_token` varchar(64) NOT NULL,
  `action_type` varchar(32) NOT NULL,
  `amount` int(12) NOT NULL,
  `currency` varchar(3) NOT NULL DEFAULT 'DKK',
  `transaction_timestamp` bigint(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur for visning `view_payoutdata`
--
DROP TABLE IF EXISTS `view_payoutdata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_payoutdata`  AS  select `02_paymentcapture`.`ActionID` AS `ActionID`,`02_paymentcapture`.`PaymentID` AS `PaymentID`,`02_paymentcapture`.`handlingtype` AS `handlingtype`,`02_paymentcapture`.`amount` AS `amount`,`02_paymentcapture`.`req_timestamp` AS `req_timestamp`,`02_paymentcapture`.`captured` AS `captured`,`02_payments`.`cardno` AS `cardno` from (`02_paymentcapture` join `02_payments` on((`02_paymentcapture`.`PaymentID` = `02_payments`.`PaymentID`))) ;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `02_callbacks`
--
ALTER TABLE `02_callbacks`
  ADD PRIMARY KEY (`UniqueID`),
  ADD UNIQUE KEY `UniqueID` (`UniqueID`),
  ADD KEY `last_updated` (`last_updated`),
  ADD KEY `UniqueID_2` (`UniqueID`),
  ADD KEY `merchantid` (`merchantid`);

--
-- Indeks for tabel `02_callbacks_log`
--
ALTER TABLE `02_callbacks_log`
  ADD PRIMARY KEY (`logid`);

--
-- Indeks for tabel `02_cardnorequests`
--
ALTER TABLE `02_cardnorequests`
  ADD PRIMARY KEY (`request_id`);

--
-- Indeks for tabel `02_cards`
--
ALTER TABLE `02_cards`
  ADD PRIMARY KEY (`ProcessID`);

--
-- Indeks for tabel `02_chargebacks`
--
ALTER TABLE `02_chargebacks`
  ADD PRIMARY KEY (`chargebackid`),
  ADD KEY `datestamp` (`datestamp`),
  ADD KEY `TransID` (`TransID`),
  ADD KEY `PaymentID` (`PaymentID`);

--
-- Indeks for tabel `02_merchantfiles`
--
ALTER TABLE `02_merchantfiles`
  ADD PRIMARY KEY (`fileID`);

--
-- Indeks for tabel `02_paymentcapture`
--
ALTER TABLE `02_paymentcapture`
  ADD PRIMARY KEY (`ActionID`),
  ADD KEY `last_updated` (`last_updated`),
  ADD KEY `ActionID` (`ActionID`),
  ADD KEY `index` (`PaymentID`,`handlingtype`),
  ADD KEY `req_timestamp` (`req_timestamp`),
  ADD KEY `dateid` (`dateid`),
  ADD KEY `amount` (`amount`),
  ADD KEY `handlingtype` (`handlingtype`),
  ADD KEY `FinanceID` (`FinanceID`,`dateid`),
  ADD KEY `PayonCapture` (`short_id`,`captured`,`verified_payon_data`,`handlingtype`,`req_timestamp`),
  ADD KEY `capture_reason` (`capture_reason`),
  ADD KEY `captured` (`captured`),
  ADD KEY `ActionID_2` (`ActionID`,`FinanceID`),
  ADD KEY `RawFinance` (`dateid`,`FinanceID`,`handlingtype`,`ActionID`),
  ADD KEY `RawFinance2` (`FinanceID`,`dateid`,`handlingtype`,`ActionID`,`actual_captures`,`req_timestamp`,`payment_institute`,`PaymentID`,`amount`),
  ADD KEY `FinanceID_2` (`FinanceID`),
  ADD KEY `capture_state` (`capture_state`),
  ADD KEY `Capture` (`dateid`,`handlingtype`,`payment_institute`,`capture_state`,`short_id`,`uniqueid`,`capture_reason`),
  ADD KEY `CaptureSender` (`payment_institute`,`captured`,`handlingtype`,`verified_payon_data`),
  ADD KEY `dateid_two` (`dateid_two`),
  ADD KEY `POS` (`handlingtype`,`payment_institute`,`captured`,`capture_state`,`FinanceID`,`short_id`,`uniqueid`);

--
-- Indeks for tabel `02_paymentcapture_finances`
--
ALTER TABLE `02_paymentcapture_finances`
  ADD PRIMARY KEY (`FinanceID`),
  ADD UNIQUE KEY `ActionID` (`ActionID`),
  ADD KEY `ActionID_2` (`ActionID`),
  ADD KEY `arn` (`arn`),
  ADD KEY `net_activity` (`net_activity`),
  ADD KEY `net_activity_2` (`net_activity`),
  ADD KEY `institute_paid_fee` (`institute_paid_fee`),
  ADD KEY `merchant_paid_fee` (`merchant_paid_fee`),
  ADD KEY `raw_line` (`raw_line`),
  ADD KEY `institute_release_timestamp` (`institute_release_timestamp`),
  ADD KEY `projected_funding_receival` (`projected_funding_receival`),
  ADD KEY `actual_timestamp` (`actual_timestamp`),
  ADD KEY `req_timestamp` (`req_timestamp`),
  ADD KEY `volume_activity` (`volume_activity`),
  ADD KEY `projected_merchant_settlement` (`projected_merchant_settlement`),
  ADD KEY `TransID` (`TransID`);

--
-- Indeks for tabel `02_paymentcapture_finances_raw`
--
ALTER TABLE `02_paymentcapture_finances_raw`
  ADD PRIMARY KEY (`ImportID`),
  ADD KEY `ImportID` (`ImportID`),
  ADD KEY `imported` (`imported`);
ALTER TABLE `02_paymentcapture_finances_raw` ADD FULLTEXT KEY `raw_data` (`raw_data`);

--
-- Indeks for tabel `02_paymentrequest`
--
ALTER TABLE `02_paymentrequest`
  ADD PRIMARY KEY (`RequestID`);

--
-- Indeks for tabel `02_payments`
--
ALTER TABLE `02_payments`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `last_updated` (`last_updated`),
  ADD KEY `merchantnumber` (`merchantnumber`),
  ADD KEY `restimestamp` (`merchantnumber`,`restimestamp`),
  ADD KEY `mass_capture` (`mass_capture`),
  ADD KEY `mass_refund` (`mass_refund`),
  ADD KEY `connected_subscriptioncode` (`connected_subscriptioncode`),
  ADD KEY `index` (`PaymentID`,`merchantnumber`),
  ADD KEY `delete_payments` (`merchantnumber`,`amount`,`req_delete`),
  ADD KEY `shortid_ccrg` (`shortid_ccrg`),
  ADD KEY `uniqueid` (`uniqueid`),
  ADD KEY `cardno` (`cardno`),
  ADD KEY `uniqueid_2` (`uniqueid`),
  ADD KEY `req_delete_time` (`req_delete_time`),
  ADD KEY `req_refund_time` (`req_refund_time`),
  ADD KEY `req_capture_time` (`req_capture_time`),
  ADD KEY `TransID` (`TransID`),
  ADD KEY `payments` (`testtrans`,`amount`,`req_capture`,`req_delete`,`restimestamp`),
  ADD KEY `TransID_2` (`TransID`),
  ADD KEY `processing_platform` (`processing_platform`),
  ADD KEY `Currency` (`Currency`),
  ADD KEY `FindTransactions` (`amount`,`PaymentID`,`Currency`,`merchantnumber`,`req_delete`,`req_refund`,`req_capture`),
  ADD KEY `transfee` (`transfee`),
  ADD KEY `FindTransactionsOnDetails` (`merchantnumber`,`req_capture`,`req_delete`,`req_refund`),
  ADD KEY `chainedPaymentID` (`chainedPaymentID`),
  ADD KEY `cardnoprefix` (`cardnoprefix`);
ALTER TABLE `02_payments` ADD FULLTEXT KEY `restime` (`restimestamp`);
ALTER TABLE `02_payments` ADD FULLTEXT KEY `cardno_2` (`cardno`);

--
-- Indeks for tabel `02_payments_sitereference`
--
ALTER TABLE `02_payments_sitereference`
  ADD KEY `payment_id` (`payment_id`);

--
-- Indeks for tabel `02_payments_tracking`
--
ALTER TABLE `02_payments_tracking`
  ADD UNIQUE KEY `PaymentID` (`PaymentID`);

--
-- Indeks for tabel `02_payment_data`
--
ALTER TABLE `02_payment_data`
  ADD UNIQUE KEY `paymentid` (`PaymentID`);

--
-- Indeks for tabel `02_rebilling`
--
ALTER TABLE `02_rebilling`
  ADD PRIMARY KEY (`RebillingID`),
  ADD KEY `last_updated` (`last_updated`),
  ADD KEY `short_id` (`short_id`);

--
-- Indeks for tabel `02_rebilling_cardno`
--
ALTER TABLE `02_rebilling_cardno`
  ADD PRIMARY KEY (`rebilling_cid`);

--
-- Indeks for tabel `02_rebilling_products`
--
ALTER TABLE `02_rebilling_products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `02_subscriptiondata`
--
ALTER TABLE `02_subscriptiondata`
  ADD PRIMARY KEY (`subscription_id`);

--
-- Indeks for tabel `02_subscription_data`
--
ALTER TABLE `02_subscription_data`
  ADD PRIMARY KEY (`data_id`);

--
-- Indeks for tabel `02_touches`
--
ALTER TABLE `02_touches`
  ADD PRIMARY KEY (`TouchID`);

--
-- Indeks for tabel `all_processing_responses`
--
ALTER TABLE `all_processing_responses`
  ADD PRIMARY KEY (`response_id`),
  ADD KEY `acknowledgement` (`merchantid`,`acknowledgement`);

--
-- Indeks for tabel `binlist`
--
ALTER TABLE `binlist`
  ADD PRIMARY KEY (`bin_id`);

--
-- Indeks for tabel `bring_packages`
--
ALTER TABLE `bring_packages`
  ADD PRIMARY KEY (`package_id`);

--
-- Indeks for tabel `cash_dropoff`
--
ALTER TABLE `cash_dropoff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bag_id` (`bag_id`);

--
-- Indeks for tabel `economic_integration`
--
ALTER TABLE `economic_integration`
  ADD UNIQUE KEY `PaymentID` (`PaymentID`);

--
-- Indeks for tabel `funding_batch`
--
ALTER TABLE `funding_batch`
  ADD PRIMARY KEY (`batch_seq_id`);

--
-- Indeks for tabel `merchant_transfer_transactiondata`
--
ALTER TABLE `merchant_transfer_transactiondata`
  ADD PRIMARY KEY (`TransactionDataID`),
  ADD KEY `transferdate` (`transferdate`);

--
-- Indeks for tabel `methods`
--
ALTER TABLE `methods`
  ADD PRIMARY KEY (`method_id`),
  ADD UNIQUE KEY `method_name` (`method_name`);

--
-- Indeks for tabel `mobile_urlshorten`
--
ALTER TABLE `mobile_urlshorten`
  ADD UNIQUE KEY `shortcode_2` (`shortcode`),
  ADD KEY `shortcode` (`shortcode`);

--
-- Indeks for tabel `payments_datasets`
--
ALTER TABLE `payments_datasets`
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indeks for tabel `payments_datasets_container`
--
ALTER TABLE `payments_datasets_container`
  ADD UNIQUE KEY `uuid` (`uuid`);
ALTER TABLE `payments_datasets_container` ADD FULLTEXT KEY `dataset_uuid` (`dataset_uuid`);

--
-- Indeks for tabel `payments_failed`
--
ALTER TABLE `payments_failed`
  ADD PRIMARY KEY (`error_id`),
  ADD KEY `token` (`token`);

--
-- Indeks for tabel `payments_persondata`
--
ALTER TABLE `payments_persondata`
  ADD PRIMARY KEY (`tokenid`),
  ADD UNIQUE KEY `tokenid` (`tokenid`);

--
-- Indeks for tabel `payon_old_tokens`
--
ALTER TABLE `payon_old_tokens`
  ADD KEY `token` (`token`);

--
-- Indeks for tabel `payon_old_transactions`
--
ALTER TABLE `payon_old_transactions`
  ADD KEY `keydata` (`keydata`),
  ADD KEY `keydata_2` (`keydata`,`value`),
  ADD KEY `token` (`token`);
ALTER TABLE `payon_old_transactions` ADD FULLTEXT KEY `FullIndex` (`token`);
ALTER TABLE `payon_old_transactions` ADD FULLTEXT KEY `FullIndexView` (`token`,`keydata`,`value`);
ALTER TABLE `payon_old_transactions` ADD FULLTEXT KEY `KeyValue` (`keydata`,`value`);

--
-- Indeks for tabel `payon_token_responses`
--
ALTER TABLE `payon_token_responses`
  ADD KEY `token` (`token`),
  ADD KEY `status` (`status`);

--
-- Indeks for tabel `payon_transactions`
--
ALTER TABLE `payon_transactions`
  ADD KEY `token` (`token`,`keydata`,`value`(767)),
  ADD KEY `value` (`value`(767)),
  ADD KEY `keydata` (`keydata`,`value`(767)),
  ADD KEY `token_2` (`token`,`keydata`);
ALTER TABLE `payon_transactions` ADD FULLTEXT KEY `FullIndex` (`token`);
ALTER TABLE `payon_transactions` ADD FULLTEXT KEY `FullIndexView` (`token`,`keydata`,`value`);
ALTER TABLE `payon_transactions` ADD FULLTEXT KEY `KeyValue` (`keydata`,`value`);

--
-- Indeks for tabel `payon_transactions2`
--
ALTER TABLE `payon_transactions2` ADD FULLTEXT KEY `FullIndex` (`token`);
ALTER TABLE `payon_transactions2` ADD FULLTEXT KEY `FullIndexView` (`token`,`keydata`,`value`);
ALTER TABLE `payon_transactions2` ADD FULLTEXT KEY `KeyValue` (`keydata`,`value`);

--
-- Indeks for tabel `payon_transid`
--
ALTER TABLE `payon_transid`
  ADD PRIMARY KEY (`transid`),
  ADD UNIQUE KEY `transid` (`transid`),
  ADD KEY `token` (`token`);

--
-- Indeks for tabel `payon_transid_operationid`
--
ALTER TABLE `payon_transid_operationid`
  ADD UNIQUE KEY `operation_id` (`operation_id`),
  ADD KEY `transid` (`transid`),
  ADD KEY `creationtime` (`creationtime`);

--
-- Indeks for tabel `payout_invoice`
--
ALTER TABLE `payout_invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_id` (`date_id`),
  ADD KEY `merchant_id` (`merchant_token`),
  ADD KEY `time_created` (`time_created`);

--
-- Indeks for tabel `payout_invoice_renewals`
--
ALTER TABLE `payout_invoice_renewals`
  ADD PRIMARY KEY (`renewal_id`);

--
-- Indeks for tabel `payworks_sync`
--
ALTER TABLE `payworks_sync`
  ADD PRIMARY KEY (`payworks_id`);

--
-- Indeks for tabel `process_payment_throttling`
--
ALTER TABLE `process_payment_throttling`
  ADD KEY `cardno` (`cardno`,`restime`),
  ADD KEY `cardno_2` (`cardno`),
  ADD KEY `restime` (`restime`);

--
-- Indeks for tabel `slow_commands_running_async`
--
ALTER TABLE `slow_commands_running_async`
  ADD PRIMARY KEY (`async_id`);

--
-- Indeks for tabel `velocity_check`
--
ALTER TABLE `velocity_check`
  ADD PRIMARY KEY (`vel_id`);

--
-- Indeks for tabel `yourpay_cards`
--
ALTER TABLE `yourpay_cards`
  ADD PRIMARY KEY (`card_id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indeks for tabel `yourpay_cards_funding_group`
--
ALTER TABLE `yourpay_cards_funding_group`
  ADD PRIMARY KEY (`funding_group_id`);

--
-- Indeks for tabel `yourpay_cards_funding_transactions`
--
ALTER TABLE `yourpay_cards_funding_transactions`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `02_callbacks`
--
ALTER TABLE `02_callbacks`
  MODIFY `UniqueID` bigint(7) NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `02_callbacks_log`
--
ALTER TABLE `02_callbacks_log`
  MODIFY `logid` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Unique Identifier';

--
-- Tilføj AUTO_INCREMENT i tabel `02_cardnorequests`
--
ALTER TABLE `02_cardnorequests`
  MODIFY `request_id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `02_cards`
--
ALTER TABLE `02_cards`
  MODIFY `ProcessID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `02_chargebacks`
--
ALTER TABLE `02_chargebacks`
  MODIFY `chargebackid` int(8) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `02_merchantfiles`
--
ALTER TABLE `02_merchantfiles`
  MODIFY `fileID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'FileID';

--
-- Tilføj AUTO_INCREMENT i tabel `02_paymentcapture`
--
ALTER TABLE `02_paymentcapture`
  MODIFY `ActionID` int(12) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `02_paymentcapture_finances`
--
ALTER TABLE `02_paymentcapture_finances`
  MODIFY `FinanceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `02_paymentcapture_finances_raw`
--
ALTER TABLE `02_paymentcapture_finances_raw`
  MODIFY `ImportID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `02_paymentrequest`
--
ALTER TABLE `02_paymentrequest`
  MODIFY `RequestID` bigint(12) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `02_payments`
--
ALTER TABLE `02_payments`
  MODIFY `PaymentID` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Auto¨ID';

--
-- Tilføj AUTO_INCREMENT i tabel `02_rebilling`
--
ALTER TABLE `02_rebilling`
  MODIFY `RebillingID` int(12) NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `02_rebilling_cardno`
--
ALTER TABLE `02_rebilling_cardno`
  MODIFY `rebilling_cid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `02_rebilling_products`
--
ALTER TABLE `02_rebilling_products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `02_subscriptiondata`
--
ALTER TABLE `02_subscriptiondata`
  MODIFY `subscription_id` bigint(12) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `02_touches`
--
ALTER TABLE `02_touches`
  MODIFY `TouchID` bigint(12) NOT NULL AUTO_INCREMENT COMMENT 'Unique Identifier';

--
-- Tilføj AUTO_INCREMENT i tabel `all_processing_responses`
--
ALTER TABLE `all_processing_responses`
  MODIFY `response_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `binlist`
--
ALTER TABLE `binlist`
  MODIFY `bin_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `bring_packages`
--
ALTER TABLE `bring_packages`
  MODIFY `package_id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `cash_dropoff`
--
ALTER TABLE `cash_dropoff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `funding_batch`
--
ALTER TABLE `funding_batch`
  MODIFY `batch_seq_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `merchant_transfer_transactiondata`
--
ALTER TABLE `merchant_transfer_transactiondata`
  MODIFY `TransactionDataID` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `methods`
--
ALTER TABLE `methods`
  MODIFY `method_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `payments_failed`
--
ALTER TABLE `payments_failed`
  MODIFY `error_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `payon_transid`
--
ALTER TABLE `payon_transid`
  MODIFY `transid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `payout_invoice`
--
ALTER TABLE `payout_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `payout_invoice_renewals`
--
ALTER TABLE `payout_invoice_renewals`
  MODIFY `renewal_id` int(6) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `payworks_sync`
--
ALTER TABLE `payworks_sync`
  MODIFY `payworks_id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `slow_commands_running_async`
--
ALTER TABLE `slow_commands_running_async`
  MODIFY `async_id` bigint(12) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `velocity_check`
--
ALTER TABLE `velocity_check`
  MODIFY `vel_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `yourpay_cards`
--
ALTER TABLE `yourpay_cards`
  MODIFY `card_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `yourpay_cards_funding_group`
--
ALTER TABLE `yourpay_cards_funding_group`
  MODIFY `funding_group_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `yourpay_cards_funding_transactions`
--
ALTER TABLE `yourpay_cards_funding_transactions`
  MODIFY `transaction_id` int(7) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
