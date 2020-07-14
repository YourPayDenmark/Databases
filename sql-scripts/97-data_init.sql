USE dinterminal;

INSERT INTO dinterminal.customer_cvr
(merchant_token, merchantid, merchantid_prod, cvr)
VALUES ("init", 9000, 9090, 1);

INSERT INTO dinterminal.customer_transfer_accounts (
`accountid`,
`creationtime`,
`merchantid`,
`currency`,
`settlement_currency`,
`account_state`,
`account_activated`,
`account_invoices`,
`account_amount`
) VALUES ('1', '0', 9090, 208, 208, 1, 1, 0, 1);


INSERT INTO dinterminal.merchant_transfer_accounts_daily_overview (
`dateid`,
`accountid`,
`captured_amount`,
`captured_amount_converted`,
`captured_fee`,
`chargeback_amount`,
`released_amount`,
`refund_amount`,
`refund_amount_total`,
`daily_percentage`
) VALUES ('1', '1', 0, 0, 0, 0, 0, 0, 0,135);



USE di_payments;

INSERT INTO di_payments.payon_transid (`token`, `transid`) VALUES ('a', '1000000000');

