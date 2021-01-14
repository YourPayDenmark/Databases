--
-- Database: `dinterminal`
--
USE dinterminal;
ALTER TABLE `app_user_pricing` ADD `version` SMALLINT(1) NOT NULL DEFAULT '1' COMMENT 'Version 1 = Deprecated invoices pre 2021' AFTER `user_pricing_id`;
ALTER TABLE `app_user_pricing` ADD `product_lines` LONGTEXT NOT NULL AFTER `next_stopped`;
