USE dinterminalpayments;
ALTER TABLE `02_paymentcapture_finances` ADD `merchant_token` VARCHAR(120) NOT NULL DEFAULT '0' AFTER `ActionID`;
ALTER TABLE `02_paymentcapture_finances`  ADD `non_deducted_transaction` SMALLINT(1) NOT NULL DEFAULT '0'  AFTER `raw_line`;
ALTER TABLE `02_paymentcapture_finances` CHANGE `non_deducted_transaction` `invoiced_transaction` SMALLINT NOT NULL DEFAULT '0';
ALTER TABLE `02_paymentcapture_finances` ADD `local_currency` INT(12) NOT NULL AFTER `actual_timestamp`;
ALTER TABLE `02_paymentcapture_finances` ADD `merchant_other_fees` INT(5) NOT NULL DEFAULT '0' AFTER `merchant_paid_fee`;
ALTER TABLE `02_paymentcapture_finances` ADD `institute_other_fees` INT(5) NOT NULL DEFAULT '0' AFTER `institute_paid_fee`;
