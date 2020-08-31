USE dinterminal;

INSERT INTO `crm_login` (`user_id`, `username`, `fullname`, `mobileno`, `localno`, `useremail`, `pwd`, `pwd2`, `pincode`, `heystack`, `active`, `accesslevel`, `session_id`, `psp`, `mobilesec`, `added_mailchimp`, `group_member`) VALUES
(1, 'mag', 'Mathias Gajhede', 4520645235, 201, 'mag@yourpay.dk', 0x36326230316261316331346430653464353634643164666661306463356465333339316334383336, '', '', 'prasUwR6', 1, 10, 'siv0tp3b9fji996k0g69jogpn1', 0, 'Support', 1, '1'),
(14, 'cat', 'Camilla', 4560188092, 203, 'cat@yourpay.dk', 0x34643733373830626131313631336631646437306133356630393439343032626237343761323265, '', '', 'catY20uR$AY', 1, 10, 'fuf7sjp6e1hifuk8k2ib9e4nu1', 0, 'Happy', 1, '10'),
(1440, 'pkm', '', 4561503709, 211, 'pkm@yourpay.io', 0x64623630383436653939313064353961313061303934643565333961646631373865623766363163, '', '', 'geivbhRDXI5pe', 1, 10, 'fo1t67nenm29g09266a72nr4k0', 0, 'Panda', 1, '2'),
(1421, 'eej', '', 4521491689, 1, 'eej%40yourpay.io', 0x66663466313136363933636362383732646333356139616361343462333032613133373462396138, '', '', 'g6nnQn359oUuG', 1, 1, 'sa284400d0lvppap7dl7kbjh24', 0, 'padawan', 1, '2'),
(97, 'lir', 'Linda Irene Rybank', 4521979865, 207, 'lir@yourpay.io', 0x35363132396437346166653636303863393861386433636530383339333466653865666562363638, '', '', 'pojisdagfpjoi3245lkjsafd', 1, 10, 'm1dkitrofm7hfi4skm2me7m730', 0, 'YouRock', 1, '1'),
(198, 'alh', 'Alexander Haugaard', 4528342620, 216, 'alh', 0x65323163653637316438333565386664343462633831643438393638396361383436383830386337, '', '', 'lkjasdflkj32458u90dvfslkj34250', 1, 1, 'r5mrd0oac6ku5j3sq300119t47', 0, 'Marketing ', 1, '1'),
(1349, 'jub', 'Julie', 4524675150, 215, 'jub@yourpay.io', 0x62356561643139326636353564646463343733343865306666373935353935313539623564396534, 'vjV1MN0owhmxmO5ru2P0MUtoIQvw3uKyOFzAsAZZSlweaBFF.1559734029.', '', 'W8tdLpziUXtIk', 1, 1, '6052qee2ff1f5l5f6pmtrdmeq1', 0, 'Wicket', 1, '1'),
(1556, 'tor', '', 4553857510, 1, 'tor@yourpay.io', 0x39633166363537363835626563323062303335326334393838646434613934666133386266343663, '', '', 'CKjI88pMjILwo', 1, 1, '', 0, '', 0, '');


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

INSERT INTO dinterminal.customer_transfer_accounts (
`accountid`,
`creationtime`,
`merchantid`,
`currency`,
`settlement_currency`,
`account_state`,
`account_activated`,
`account_invoices`,
`account_amount`,
`bankreg`,
`bankacc`
) VALUES ('1', '0', 9090, 208, 208, 1, 1, 1, 1,0,0);

INSERT INTO dinterminal.customer_transfer_accounts (
`accountid`,
`creationtime`,
`merchantid`,
`currency`,
`settlement_currency`,
`account_state`,
`account_activated`,
`account_invoices`,
`account_amount`,
`bankreg`,
`bankacc`
) VALUES ('1', '0', 9090, 208, 208, 0, 1, 0, 1,1,1);


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

INSERT INTO dinterminal.customer_cvr
(merchant_token, merchantid, merchantid_prod,customer_pos, cvr, psper,cvr_created
)VALUES ("UtZv3bY5fHEPBrKoqNJyEtREAgarbM", 50000000, 50000003, 0,123456,1277,151476900);

INSERT INTO dinterminal.customer_cvr
(merchant_token, merchantid,overall_merchantid, merchantid_prod,customer_pos, cvr, psper,cvr_created,institute_id
)VALUES ("1wHSEzjTVcwZ6hxanaHDJFvzvtoY9Rf", 50000004,50000004, 50000007, 0,123456,1277,151476900,0);


INSERT INTO dinterminal.customer_transfer_accounts
(accountid,creationtime, merchantid, currency,settlement_currency, account_state, account_activated,account_invoices,bankname,bankreg,bankacc,country,IBAN,biccode
)VALUES (1000,1596000000, 50000003, 208, 208,1,1,1,"Test_Bank",1234,0002000000,"Denmark","","");


INSERT INTO dinterminal.customer_currency_conversions
(currencyid,currency_code,currency_name,currency_rate
)VALUES (1, 208, "DKK", 208);

INSERT INTO dinterminal.customer_cvr_audit
(merchantid
)VALUES(50000000);


INSERT INTO dinterminal.merchant_transfer_accounts_daily_overview
(accountid,captured_amount_converted,released_amount,conversionrate
)VALUES(1000,0,0,0);


INSERT INTO dinterminal.merchant_transfer_accounts_daily_overview
(accountid,captured_amount_converted,released_amount,conversionrate
)VALUES(1000,0,0,1);

INSERT INTO dinterminal.merchant_transfer_accounts_daily_overview
(accountid,captured_amount_converted,released_amount,date_expected_release,unique_code
)VALUES(1000,0,0,3192307200,"");

INSERT INTO dinterminal.merchant_transfer_accounts_daily_overview
(accountid,captured_amount_converted,released_amount,date_expected_release,unique_code
)VALUES(1000,0,0,0,"");


INSERT INTO dinterminal.customer_transfer_accounts
(accountid,creationtime, merchantid, currency,settlement_currency, account_state, account_activated,account_invoices,bankname,bankreg,bankacc,country,IBAN,biccode
)VALUES (1000,1596000000, 50000003, 208, 208,1,1,1,"Test_Bank",1234,0002000000,"Denmark","","");

INSERT INTO dinterminal.customer_transfer_accounts
(accountid,creationtime, merchantid, currency,settlement_currency, account_state, account_activated,account_invoices,bankname,bankreg,bankacc,country,IBAN,biccode
)VALUES (1000,1596000000, 50000003, 208, 208,0,0,1,"Test_Bank",1234,0002000000,"Denmark","","");


INSERT INTO dinterminal.merchant_outgoing_transactions
(import_accepted,merchantid,dateid,internal_descriptor,external_descriptor
)VALUES(0,50000003,0,"Tekst til modtager","");

INSERT INTO dinterminal.merchant_outgoing_transactions
(import_accepted,merchantid,dateid,internal_descriptor,external_descriptor
)VALUES(1,50000003,0,"Tekst til modtager","");

INSERT INTO dinterminal.merchant_outgoing_transactions
(import_accepted,merchantid,dateid,internal_descriptor,external_descriptor
)VALUES(2,50000003,0,"Tekst til modtager","");

INSERT INTO dinterminal.merchant_outgoing_transactions
(import_accepted,merchantid,dateid,internal_descriptor,external_descriptor
)VALUES(4,50000003,0,"","");

INSERT INTO dinterminal.merchant_outgoing_transactions
(import_accepted,merchantid,dateid,internal_descriptor,external_descriptor
)VALUES(9,50000003,0,"","Der er");

INSERT INTO dinterminal.merchant_transfer_accounts_daily_overview
(date_start,date_expected_release,daily_percentage,released_amount,unique_code
)VALUES(1596000000,1596000100,0,12,"test_unique");


INSERT INTO dinterminal.viabill_logger
(container,checked,log_state
)VALUES("status=DECLINE",0,"");

INSERT INTO dinterminal.viabill_logger
(container,checked,log_state
)VALUES("status=APPROVED&order_number=5&amount=500&token=viabill_token_ddikmsoi_unique",0,"");


INSERT INTO dinterminal.crm_login_psp
(pspid,merchant_percentage,name,response
)VALUES(1277,20,"dinero test","test");

INSERT INTO dinterminal.crm_login_psp_volume
(pspid,date_start
)VALUES(1277,151476900);

INSERT INTO dinterminal.crm_login_psp_monthly_data
(month_start,month_id,pspid
)VALUES(1593554400,82,1277);

INSERT INTO dinterminal.app_user_invoicing
(invoice_amount,invoice_currency,invoice_paid,invoice_next_retry,invoice_token,merchant_token
)VALUES(100,208,0,151476900,"koasiufrmcjaiejt","UtZv3bY5fHEPBrKoqNJyEtREAgarbM");

INSERT INTO dinterminal.app_user_pricing
(merchant_token,service,service_text,next_amount
)VALUES("UtZv3bY5fHEPBrKoqNJyEtREAgarbM","service_test","service_text_test",100);

INSERT INTO dinterminal.bambora_merchants
(merchant_token,file_confirm_name
)VALUES("UtZv3bY5fHEPBrKoqNJyEtREAgarbM","file_confirm_name");


INSERT INTO dinterminal.merchant_transfer_accounts_daily_overview
(date_start,date_end,date_expected_release,released_amount,captured_fee,captured_amount,daily_percentage
)VALUES(1595973600,1596060000,0,0,0,100,1);

INSERT INTO dinterminal.merchant_transfer_accounts_daily_overview
(date_start,date_end,date_expected_release,released_amount,captured_fee,captured_amount,daily_settlement_period
)VALUES(1595973600,1596060000,0,0,100,1,2);

INSERT INTO dinterminal.merchant_transfer_accounts_daily_overview
(date_start,date_end,date_expected_release,released_amount,captured_fee,captured_amount
)VALUES(1595973600,1596060000,0,0,0,0);

INSERT INTO dinterminal.customer_transfer_accounts
(creationtime, merchantid, currency,settlement_currency, account_state, account_activated,account_invoices,bankname,bankreg,bankacc,country,IBAN,biccode
)VALUES (1596000000, 50000000, 208, 208,0,0,1,"Test_Bank",1234,0002000000,"Denmark","test","");

INSERT INTO dinterminal.customer_transfer_accounts
(creationtime, merchantid, currency,settlement_currency, account_state, account_activated,account_invoices,bankname,bankreg,bankacc,country,IBAN,biccode
)VALUES (1596000000, 50000001, 208, 208,1,0,0,"Test_Bank",1234,0002000000,"Denmark","test","");


INSERT INTO dinterminal.merchant_transfer_accounts_daily_overview
(accountid,captured_amount_converted,released_amount,date_expected_release,unique_code,captured_amount
)VALUES(1000,1000000,0,1,"",1000000);

INSERT INTO dinterminal.settlement_holidays
(unixtimestamp
)VALUES (259200);


INSERT INTO dinterminal.customer_fee
(merchantid
)VALUES (50000003);

USE di_payments;

INSERT INTO di_payments.payon_transid (`token`, `transid`) VALUES ('a', '1000000000');

INSERT INTO di_payments.02_payments
(`MerchantNumber`,`amount`, `req_capture`, `payment_institute`,`processing_platform`,`pos_trans`, `orderID`,`TransID`, `transfee`,`cardtype`,`cardholder`,`cardno`,`restimestamp`,`payon_sender`) VALUES (50000003,'500','0','1','stl','1','test','1234','100','3','mathias','510551xxxxxx5100','15600','payworks_sender');

INSERT INTO di_payments.02_payments
(`MerchantNumber`,`amount`, `req_capture`, `payment_institute`,`processing_platform`,`pos_trans`, `orderID`,`TransID`, `transfee`,`cardtype`,`cardholder`,`cardno`,`restimestamp`,`payon_sender`) VALUES (50000003,'500','0','30','stl','1','test','1234','100','3','mathias','510551xxxxxx5100','15600','payworks_sender');

INSERT INTO di_payments.02_payments
(`MerchantNumber`,`amount`, `req_capture`, `payment_institute`,`processing_platform`,`pos_trans`, `orderID`,`TransID`, `transfee`,`cardtype`,`cardholder`,`cardno`,`restimestamp`,`payon_sender`) VALUES (50000003,'500','0','4','stl','1','test','1234','100','3','mathias','510551xxxxxx5100','15600','payworks_sender');

INSERT INTO di_payments.02_payments
(`MerchantNumber`,`amount`, `req_capture`, `payment_institute`,`processing_platform`,`pos_trans`, `orderID`,`TransID`, `transfee`,`cardtype`,`cardholder`,`cardno`,`restimestamp`,`payon_sender`) VALUES (50000003,'500','0','7','stl','1','test','1234','100','3','mathias','510551xxxxxx5100','15600','payworks_sender');

INSERT INTO di_payments.02_payments
(`MerchantNumber`,`amount`, `req_capture`, `payment_institute`,`processing_platform`,`pos_trans`, `orderID`,`TransID`, `transfee`,`cardtype`,`cardholder`,`cardno`,`restimestamp`,`payon_sender`) VALUES (50000003,'500','0','9','stl','1','5','1234','100','3','mathias','510551xxxxxx5100','15600','payworks_sender');

INSERT INTO di_payments.02_payments
(`MerchantNumber`,`amount`, `req_capture`, `payment_institute`,`processing_platform`,`pos_trans`, `orderID`,`TransID`, `transfee`,`cardtype`,`cardholder`,`cardno`,`restimestamp`,`payon_sender`) VALUES (50000003,'500','0','10','stl','1','test','1234','100','3','mathias','510551xxxxxx5100','15600','payworks_sender');

INSERT INTO di_payments.02_payments
(`MerchantNumber`,`amount`, `req_capture`, `payment_institute`,`processing_platform`,`pos_trans`, `orderID`,`TransID`, `transfee`,`cardtype`,`cardholder`,`cardno`,`restimestamp`,`payon_sender`) VALUES (50000003,'500','0','10','stl','1','test','1234','100','3','mathias','510551xxxxxx5100','3187108800','payworks_sender');

INSERT INTO di_payments.02_payments
(`MerchantNumber`,`amount`, `req_capture`, `payment_institute`,`processing_platform`,`pos_trans`, `orderID`,`TransID`, `transfee`,`cardtype`,`cardholder`,`cardno`,`restimestamp`,`payon_sender`,`payon_channel`,`epay_capture`,`testtrans`) VALUES (50000003,'500','0','10','stl','1','test','1234','0','3','mathias','510551xxxxxx5100','15600','payworks_sender','1','1','0');

INSERT INTO di_payments.02_payments
(`MerchantNumber`,`amount`, `req_capture`, `payment_institute`,`processing_platform`,`pos_trans`, `orderID`,`TransID`, `transfee`,`cardtype`,`cardholder`,`cardno`,`payon_sender`,`payon_channel`,`epay_capture`,`testtrans`,`restimestamp`) VALUES (50000003,'0','0','10','stl','1','test','1234','0','3','mathias','510551xxxxxx5100','payworks_sender','1','1','0','100');

INSERT INTO di_payments.02_payments
(`MerchantNumber`,`amount`, `req_capture`, `payment_institute`,`processing_platform`,`uniqueid`,`pos_trans`, `orderID`,`TransID`, `transfee`,`cardtype`,`cardholder`,`cardno`,`payon_sender`,`payon_channel`,`epay_capture`,`testtrans`,`restimestamp`) VALUES (50000003,'0','0','10','stl','1','1','test','1234','0','3','mathias','510551xxxxxx5100','payworks_sender','1','1','0','100');

INSERT INTO di_payments.02_payments
(`MerchantNumber`,`amount`, `req_capture`, `payment_institute`,`processing_platform`,`uniqueid`,`pos_trans`, `orderID`,`TransID`, `transfee`,`cardtype`,`cardholder`,`cardno`,`payon_sender`,`payon_channel`,`epay_capture`,`testtrans`,`restimestamp`) VALUES (50000003,'0','0','10','stl','1','1','test','1234','0','3','mathias','XXXXXX','payworks_sender','1','1','0','1596176675');

INSERT INTO di_payments.02_payments
(`MerchantNumber`,`amount`, `req_capture`, `payment_institute`,`processing_platform`,`uniqueid`,`pos_trans`, `orderID`,`TransID`, `transfee`,`cardtype`,`cardholder`,`cardno`,`payon_sender`,`payon_channel`,`epay_capture`,`testtrans`,`restimestamp`) VALUES (50000003,'0','0','10','bambora','1','1','test','1234','0','3','mathias','XXXXXX','payworks_sender','1','1','0','1596176675');

INSERT INTO di_payments.02_payments
(`MerchantNumber`,`amount`, `req_capture`, `payment_institute`,`processing_platform`,`uniqueid`,`pos_trans`, `orderID`,`TransID`, `transfee`,`cardtype`,`cardholder`,`cardno`,`payon_sender`,`payon_channel`,`epay_capture`,`testtrans`,`restimestamp`) VALUES (50000003,'0','0','10','bambora','1','1','test','1234','0','3','mathias','XXXXXX','payworks_sender','1','1','0','1596176675');

INSERT INTO di_payments.02_payments
(`MerchantNumber`,`amount`, `req_capture`, `payment_institute`,`processing_platform`,`uniqueid`,`pos_trans`, `orderID`,`TransID`, `transfee`,`cardtype`,`cardholder`,`cardno`,`payon_sender`,`payon_channel`,`epay_capture`,`testtrans`,`restimestamp`) VALUES (50000003,'0','0','10','bambora','1','1','test','1234','0','3','mathias','XXXXXX','payworks_sender','1','1','0','1596176675');

INSERT INTO di_payments.02_payments
(`MerchantNumber`,`amount`, `req_capture`, `payment_institute`,`processing_platform`,`uniqueid`,`pos_trans`, `orderID`,`TransID`, `transfee`,`cardtype`,`cardholder`,`cardno`,`payon_sender`,`payon_channel`,`epay_capture`,`testtrans`,`restimestamp`) VALUES (50000003,'0','0','10','bambora','1','1','test','1234','0','3','mathias','XXXXXX','payworks_sender','1','1','0','1596176675');

INSERT INTO di_payments.02_payments
(`MerchantNumber`,`amount`, `req_capture`, `payment_institute`,`processing_platform`,`uniqueid`,`pos_trans`, `orderID`,`TransID`, `transfee`,`cardtype`,`cardholder`,`cardno`,`payon_sender`,`payon_channel`,`epay_capture`,`testtrans`,`restimestamp`) VALUES (50000003,'0','0','10','bambora','1','1','test','1234','0','3','mathias','XXXXXX','payworks_sender','1','1','0','1596176675');


INSERT INTO di_payments.02_payments_sitereference
(payment_id,site_reference) VALUES (13,'sitereference_securetrading_for_xml');

INSERT INTO di_payments.02_payments
(`connected_subscriptioncode`,`cardholder`,`cardno`,`shortid_ccrg`) VALUES ('12','test','510551xxxxxx5100','12');



INSERT INTO di_payments.02_paymentcapture
(`PaymentID`,`amount`, `handlingtype`, `captured`)
VALUES
(1,'500', 'refund','500');

INSERT INTO di_payments.02_paymentcapture
(`PaymentID`,`amount`, `captured`)
VALUES
(2,'500','0');

INSERT INTO di_payments.02_paymentcapture
(`PaymentID`,`amount`, `captured`,`dateid`,`payment_institute`)
VALUES
(3,'500','1','0','4');

INSERT INTO di_payments.02_paymentcapture
(`PaymentID`,`amount`, `captured`,`dateid`,`payment_institute`)
VALUES
(4,'500',NULL,'0','0');

INSERT INTO di_payments.02_paymentcapture
(`PaymentID`,`amount`, `captured`,`dateid`,`payment_institute`)
VALUES
(10,'500','0','0','5');

INSERT INTO di_payments.02_paymentcapture
(`PaymentID`,`amount`, `captured`,`dateid`,`payment_institute`,`handlingtype`,`actual_captures`,`req_timestamp`,`uniqueid`)
VALUES
(6,'500','0','0','10','release','100','1543622500','1');

INSERT INTO di_payments.02_paymentcapture
(`PaymentID`,`amount`, `captured`,`dateid`,`payment_institute`,`uniqueid`,`handlingtype`,`capture_state`,`req_timestamp`)
VALUES
(7,'500','1','1','4','1','capture','0','1543622500');

INSERT INTO di_payments.02_paymentcapture
(`PaymentID`,`req_timestamp`,`amount`,`dateid`,`handlingtype`,`payment_institute`,`last_retry`,`retries`,`reprocess`,`captured`)
VALUES
(7,'1528156900','500','1','refund','10','100','10','1','0');

INSERT INTO di_payments.02_paymentcapture
(`PaymentID`,`amount`,`dateid`,`handlingtype`,`payment_institute`,`capture_state`,`captured`)
VALUES
(8,'500','0','capture','4','ACK','1');

INSERT INTO di_payments.02_paymentcapture
(`PaymentID`,`amount`, `captured`,`dateid`,`payment_institute`,`req_timestamp`)
VALUES
(9,'500','0','0','20','1577836900');

INSERT INTO di_payments.02_paymentcapture
(`PaymentID`,`amount`, `handlingtype`,`FinanceID`,`payment_institute`,`dateID`,`captured`)
VALUES
(5,'500','capture','0','9','1','0');

INSERT INTO di_payments.02_paymentcapture
(`PaymentID`,`amount`,`dateid`,`handlingtype`,`payment_institute`,`capture_state`,`captured`)
VALUES
(8,'500','0','capture','10','ACK','1');

INSERT INTO di_payments.02_paymentcapture
(`PaymentID`,`amount`,`dateid`,`handlingtype`,`payment_institute`,`capture_state`,`captured`,`reprocess`)
VALUES
(11,'500','0','refund','10','ACK','1','1');

INSERT INTO di_payments.02_paymentcapture
(`PaymentID`,`amount`,`dateid`,`handlingtype`,`payment_institute`,`captured`,`req_timestamp`)
VALUES
(13,'500','1','capture','5','0','3155673600');

INSERT INTO di_payments.02_paymentcapture
(`PaymentID`,`amount`,`dateid`,`handlingtype`,`payment_institute`,`captured`,`req_timestamp`)
VALUES
(14,'500','0','release','20','0','3155673600');

INSERT INTO di_payments.02_paymentcapture
(`PaymentID`,`amount`,`dateid`,`handlingtype`,`payment_institute`,`captured`,`req_timestamp`)
VALUES
(15,'500','0','capture','0','0','3155673600');

INSERT INTO di_payments.02_paymentcapture
(`PaymentID`,`amount`,`dateid`,`handlingtype`,`payment_institute`,`captured`,`req_timestamp`)
VALUES
(16,'500','0','capture','5','0','3155673600');


INSERT INTO di_payments.02_paymentcapture_finances
(`raw_line`, `currency`)
VALUES
('0','0');

INSERT INTO di_payments.02_chargebacks
(`merchantnumber`,`dateid`,`status`,`currency`,`datestamp`)
VALUES
('9090','0','7','208',3192307200);




INSERT INTO di_payments.02_chargebacks
(`merchantnumber`,`dateid`,`status`,`currency`)
VALUES
('9003','0','7','208');


INSERT INTO di_payments.payout_invoice
(`time_lasttried`,`date_id`,`flag_status`,merchant_token)
VALUES
('100','0','0','UtZv3bY5fHEPBrKoqNJyEtREAgarbM');


INSERT INTO di_payments.payon_transid
(`transid`,`token`)
VALUES
('1','1');

INSERT INTO di_payments.payon_transid_operationid
(`transid`,`operation_type`)
VALUES
('1','INFO');