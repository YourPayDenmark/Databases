USE di_payments;
INSERT INTO `02_paymentcapture_finances` (`FinanceID`,`ActionID`,`TransID`,`merchant_token`,`dateid`,`payment_institute`,`currency`,`req_timestamp`,`actual_timestamp`,`local_currency`,`projected_merchant_settlement`,`projected_funding_receival`,`institute_release_timestamp`,`raw_line`,`invoiced_transaction`,`merchant_paid_fee`,`merchant_other_fees`,`transid_volume`,`institute_paid_fee`,`institute_other_fees`,`net_activity`,`volume_activity`,`arn`,`last_updated`,`institute_transactionIdentifier`,`institute_authorizationCode`,`institute_merchantId`,`small_adjusted`) values ("4831267","3158637","2004196760","ztY6hxeLGmRBM8t8fandNnyE2FuSW","197110","20","208","1602160159","1602160171","208","0","0","0","4145,","0","70","0","4500","4","18","4500","4500","","0000-00-00 00:00:00","","","63149827","0");
INSERT INTO `02_paymentcapture` (`ActionID`,`PaymentID`,`req_timestamp`,`actual_captures`,`actual_payout_stamp`,`FinanceID`,`financial_date`,`payment_institute`,`short_id`,`uniqueid`,`capture_state`,`capture_reason`,`dateid`,`amount`,`amount_one`,`dateid_two`,`amount_two`,`captured`,`handlingtype`,`institute`,`verified_payon_data`,`reprocess`,`retries`,`last_retry`,`last_updated`) values ("3158637","3369434","1602160159","1602160171","0","4831267","0","20","BAPROD20201008022931508641","","ACK","","197110","4500","0","0","0","1","capture","0","0","0","0","0","2020-10-08 12:31:14");
INSERT INTO `02_payments` (`PaymentID`,`processing_platform`,`pay_method`,`pos_trans`,`merchantnumber`,`testtrans`,`ct`,`bankinglist`,`orderID`,`TransID`,`Currency`,`transfee`,`transfeeyp`,`amount`,`reserved_amount`,`reserve_payout`,`transferedtoreserve`,`cardtype`,`cardholder`,`card_country`,`cardno`,`cardnoprefix`,`restimestamp`,`accountid`,`dateid`,`bkreg`,`bkacc`,`secure`,`approved`,`ended`,`end_time`,`notification`,`notification_email`,`callback`,`callback_time`,`callback_ip`,`callback_header`,`req_capture`,`req_capture_time`,`transactionfile`,`split`,`mass_capture`,`mass_refund`,`mass_delete`,`req_amount`,`epay_capture`,`epay_capture_timestamp`,`req_delete`,`req_delete_time`,`req_delete_epay`,`req_refund`,`req_refund_amount`,`req_refund_time`,`req_refund_epay`,`req_refund_epay_time`,`req_refund_date_offsetting`,`req_refund_paymentcapture`,`platform`,`platform_domain`,`version`,`customerdetails`,`customer_ip`,`fraud`,`paymentplatform`,`channelID`,`uniqueid`,`shortid`,`shortid_ccrg`,`ccrg_trans`,`capture_shortid`,`capture_uniqueid`,`free_transaction`,`upd_check`,`pbs_forretningsid`,`chainedpayment`,`chainedPaymentID`,`ChainedAmount`,`payment_institute`,`payon_channel`,`payon_sender`,`payon_login`,`payon_pwd`,`consumer_data_validated`,`connected_subscriptioncode`,`connected_chained`,`last_updated`) values ("3369434","BAMBORA","card","0","600183439","0","0","0","196","2004196760","208","65.25","0","4500","0","0","0","2","Lea Brændgaard","208","457149XXXXXX8520","8520","1602017302","0","0","0","0","0","1","0","0","","","","","","","1","1602160159","0","0","0","0","0","4500","1","1602160171","0","0","0","0","0","0","0","0","0","0","","","109","","0","0","0","0","BAPROD2004196760","BAPROD20201006104820888416","","0","BAPROD20201008022931508641","","0","0","0","0","","0","20","","","","","0","","","2020-10-08 12:30:03");
