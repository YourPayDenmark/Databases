USE di_payments;
INSERT INTO `02_paymentcapture_finances` (`FinanceID`,`ActionID`,`TransID`,`merchant_token`,`dateid`,`payment_institute`,`currency`,`req_timestamp`,`actual_timestamp`,`local_currency`,`projected_merchant_settlement`,`projected_funding_receival`,`institute_release_timestamp`,`raw_line`,`invoiced_transaction`,`merchant_paid_fee`,`merchant_other_fees`,`transid_volume`,`institute_paid_fee`,`institute_other_fees`,`net_activity`,`volume_activity`,`arn`,`last_updated`,`institute_transactionIdentifier`,`institute_authorizationCode`,`institute_merchantId`,`small_adjusted`) values ("5079734","3161691","2004096608","RU5yOng6NEfpLDWRYNucWOsBD0NvZ3H","197267","20","208","1602241624","1602241685","208","0","0","0","430,","0","492","0","33900","28","85","33900","33900","","0000-00-00 00:00:00","","","63150361","0");
INSERT INTO `02_paymentcapture` (`ActionID`,`PaymentID`,`req_timestamp`,`actual_captures`,`actual_payout_stamp`,`FinanceID`,`financial_date`,`payment_institute`,`short_id`,`uniqueid`,`capture_state`,`capture_reason`,`dateid`,`amount`,`amount_one`,`dateid_two`,`amount_two`,`captured`,`handlingtype`,`institute`,`verified_payon_data`,`reprocess`,`retries`,`last_retry`,`last_updated`) values ("3161691","3289574","1602241624","1602241685","0","5079734","0","20","BAPROD20201009010805714914","","ACK","","197267","33900","0","0","0","1","capture","0","0","0","0","0","2020-10-09 11:09:51");
INSERT INTO `02_payments` (`PaymentID`,`processing_platform`,`pay_method`,`pos_trans`,`merchantnumber`,`testtrans`,`ct`,`bankinglist`,`orderID`,`TransID`,`Currency`,`transfee`,`transfeeyp`,`amount`,`reserved_amount`,`reserve_payout`,`transferedtoreserve`,`cardtype`,`cardholder`,`card_country`,`cardno`,`cardnoprefix`,`restimestamp`,`accountid`,`dateid`,`bkreg`,`bkacc`,`secure`,`approved`,`ended`,`end_time`,`notification`,`notification_email`,`callback`,`callback_time`,`callback_ip`,`callback_header`,`req_capture`,`req_capture_time`,`transactionfile`,`split`,`mass_capture`,`mass_refund`,`mass_delete`,`req_amount`,`epay_capture`,`epay_capture_timestamp`,`req_delete`,`req_delete_time`,`req_delete_epay`,`req_refund`,`req_refund_amount`,`req_refund_time`,`req_refund_epay`,`req_refund_epay_time`,`req_refund_date_offsetting`,`req_refund_paymentcapture`,`platform`,`platform_domain`,`version`,`customerdetails`,`customer_ip`,`fraud`,`paymentplatform`,`channelID`,`uniqueid`,`shortid`,`shortid_ccrg`,`ccrg_trans`,`capture_shortid`,`capture_uniqueid`,`free_transaction`,`upd_check`,`pbs_forretningsid`,`chainedpayment`,`chainedPaymentID`,`ChainedAmount`,`payment_institute`,`payon_channel`,`payon_sender`,`payon_login`,`payon_pwd`,`consumer_data_validated`,`connected_subscriptioncode`,`connected_chained`,`last_updated`) values ("3289574","BAMBORA","card","0","600225351","0","0","0","1667","2004096608","208","491.55","0","33900","0","0","0","3","MobilePayOrder","208","434596XXXXXX0614","614","1599986151","0","0","0","0","0","1","0","0","","","","","","","1","1602241624","0","0","3","0","0","33900","1","1602241685","0","0","0","0","0","0","0","0","0","0","","","109","","0","0","0","0","BAPROD2004096608","BAPROD20200913103550978790","","0","BAPROD20201009010805714914","","0","0","0","0","","0","20","","","","","0","","","2020-10-09 11:08:05");
