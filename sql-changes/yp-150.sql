USE dinterminalpayments;
ALTER TABLE `02_payments` CHANGE `pay_method` `pay_method` ENUM('card','invoice','credit','resursbank','viabill','afterpay','mobilepay') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'card';
ALTER TABLE `02_payments` CHANGE `pay_method` `pay_method` ENUM('card','invoice','credit','resursbank','viabill','afterpay','mobilepay','cash') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'card';
ALTER TABLE `02_paymentcapture_finances` ADD `dateid` INT(7) NOT NULL DEFAULT '0' AFTER `ActionID`;
