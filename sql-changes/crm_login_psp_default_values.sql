USE dinterminal

ALTER TABLE crm_login_psp
ALTER terminal_buy_price SET DEFAULT '260000';

ALTER TABLE crm_login_psp
ALTER terminal_buy_currency SET DEFAULT '208';

ALTER TABLE crm_login_psp
ALTER currency SET DEFAULT '208';

ALTER TABLE crm_login_psp
ALTER terminal_buy_price SET DEFAULT '260000';

COMMIT;