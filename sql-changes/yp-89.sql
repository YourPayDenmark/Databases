USE dinterminal;

--
-- Struktur-dump for tabellen `crm_queries`
--
CREATE TABLE `crm_queries` (
                               `query_id` int NOT NULL,
                               `query_owner` int NOT NULL,
                               `query_active` smallint NOT NULL DEFAULT '0',
                               `query_name` varchar(255) NOT NULL,
                               `query_type` varchar(30) NOT NULL,
                               `query_database` varchar(60) NOT NULL,
                               `query_content` longtext NOT NULL,
                               `query_uid` varchar(80) NOT NULL,
                               `query_groups` varchar(80) NOT NULL,
                               `query_used` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Data dump for tabellen `crm_queries`
--

INSERT INTO `crm_queries` (`query_id`, `query_owner`, `query_active`, `query_name`, `query_type`, `query_database`, `query_content`, `query_uid`, `query_groups`, `query_used`) VALUES
(4, 1, 1, 'Newest 10 merchants', 'LIST', 'dinterminal', 'SELECT merchantid, cvr_name FROM customer_cvr ORDER BY merchantid DESC limit 10', '0', '0', 0),
(5, 1, 1, 'Total Transactions in Yourpay', 'COUNT', 'dinterminalpayments', 'SELECT PaymentID FROM 02_payments', '0', '0', 0),
(6, 1, 1, 'Newest 10 customers of Dinero', 'LIST', 'dinterminal', 'SELECT merchantid, cvr_name FROM customer_cvr WHERE psper = 1277 OR psper = 1280 ORDER BY merchantid DESC LIMIT 10', '0', '0', 0),
(7, 1, 1, 'E-mails sent by Yourpay today', 'COUNT', 'dinterminal', 'SELECT MailID FROM MailQueue WHERE registered >CURDATE()', '0', '0', 0),
(8, 1, 1, 'Callbacks Requested today', 'COUNT', 'dinterminalpayments', 'SELECT * FROM 02_callbacks WHERE unixtime>UNIX_TIMESTAMP(CURDATE())', '0', '0', 0),
(9, 1, 1, 'Callbacks in Queue right now', 'COUNT', 'dinterminalpayments', 'SELECT UniqueID FROM 02_callbacks WHERE unixtime>UNIX_TIMESTAMP(CURDATE()) AND callbackstatus=\'0\'', '0', '0', 0),
(10, 1, 1, 'Callbacks Completed Today', 'COUNT', 'dinterminalpayments', 'SELECT UniqueID FROM 02_callbacks WHERE unixtime>UNIX_TIMESTAMP(CURDATE()) AND callbackstatus=\'1\'', '0', '0', 0),
(11, 1, 1, 'Transactions Completed Today', 'COUNT', 'dinterminalpayments', 'SELECT UniqueID FROM 02_payments WHERE restimestamp>UNIX_TIMESTAMP(CURDATE())', '0', '0', 0),
(12, 1, 1, 'Transactions Captured Today', 'COUNT', 'dinterminalpayments', 'SELECT ActionID FROM 02_paymentcapture WHERE req_timestamp>UNIX_TIMESTAMP(CURDATE()) AND captured=\'1\' AND handlingtype=\'capture\'', '0', '0', 0),
(13, 1, 1, 'Transactions Where Refund Failed - Past 30 days', 'LIST', 'dinterminalpayments', 'SELECT ActionID, PaymentID FROM 02_paymentcapture WHERE captured=\'2\' AND handlingtype=\'refund\' AND req_timestamp>UNIX_TIMESTAMP(CURDATE()-INTERVAL 30 DAY) ', '0', '0', 0),
(14, 1, 1, 'Payouts not performed - Should have been performed', 'LIST', 'dinterminal', 'SELECT customer_transfer_accounts.merchantid, (merchant_transfer_accounts_daily_overview.captured_amount)/100 AS captured_amount FROM merchant_transfer_accounts_daily_overview,customer_transfer_accounts WHERE merchant_transfer_accounts_daily_overview.accountid = customer_transfer_accounts.accountid AND released_amount = 0 AND date_expected_release < UNIX_TIMESTAMP(CURDATE()) AND date_expected_release > UNIX_TIMESTAMP(CURDATE()-INTERVAL 30 DAY)', '0', '0', 0),
(15, 1, 1, 'Unapproved Merchants with Payouts, Next 7 days', 'LIST', 'dinterminal', 'SELECT customer_transfer_accounts.merchantid, (merchant_transfer_accounts_daily_overview.captured_amount)/100 AS captured_amount FROM merchant_transfer_accounts_daily_overview,customer_transfer_accounts, customer_cvr WHERE merchant_transfer_accounts_daily_overview.accountid = customer_transfer_accounts.accountid AND customer_transfer_accounts.merchantid = customer_cvr.merchantid_prod AND customer_cvr.final_approval<2 AND released_amount = 0 AND date_expected_release > UNIX_TIMESTAMP(CURDATE()) AND date_expected_release < UNIX_TIMESTAMP(CURDATE()+INTERVAL 7 DAY)', '0', '0', 0);

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `crm_queries`
--
ALTER TABLE `crm_queries`
    ADD PRIMARY KEY (`query_id`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `crm_queries`
--
ALTER TABLE `crm_queries`
    MODIFY `query_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;



CREATE TABLE `crm_dashboard` (
                                 `crm_id` int NOT NULL,
                                 `user_id` int NOT NULL,
                                 `crm_element` longtext NOT NULL,
                                 `crm_active` smallint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


ALTER TABLE `crm_dashboard`
    ADD PRIMARY KEY (`crm_id`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `crm_dashboard`
--
ALTER TABLE `crm_dashboard`
    MODIFY `crm_id` int NOT NULL AUTO_INCREMENT;
COMMIT;
