USE dinterminal;

Alter table `customer_cvr` ADD COLUMN `flag_merchant_onboarding` INT(1) DEFAULT NULL AFTER `flag_verified`;
