USE di_paments;

ALTER TABLE `3d_secure_redirect` CHANGE `merchant_token` `merchant_token` VARCHAR(90) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL;
