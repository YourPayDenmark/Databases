USE dinterminal;
ALTER TABLE `customer_cvr` ADD `processing_block` SMALLINT(1) NOT NULL DEFAULT '0' AFTER `testaccount`;
