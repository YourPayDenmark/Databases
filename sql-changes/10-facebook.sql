USE dinterminal;
ALTER TABLE `customer_cvr` ADD `facebook_url` VARCHAR(255) NOT NULL DEFAULT '' AFTER `merchant_token`;
