USE dinterminal

ALTER TABLE crm_login_psp
	ALTER COLUMN terminal_buy_currency SET DEFAULT '208',
	ALTER COLUMN currency SET DEFAULT '208',
	ALTER COLUMN terminal_buy_price SET DEFAULT '360000';
COMMIT;