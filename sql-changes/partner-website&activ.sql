use dinterminal

Alter table `crm_login_psp` ADD COLUMN `website` VARCHAR(255) DEFAULT NULL AFTER `agreement_url`;

Alter table `user_login_psp` ADD COLUMN `active` smallint NOT NULL DEFAULT 1 AFTER `secret`;

COMMIT;