use dinterminal

create table partner_access_rights (
short_code varchar(5) NOT NULL,
user_id int(11) NOT NULL,
enabled BOOLEAN NOT NULL DEFAULT false,
last_updated int(11) NOT NULL,
FOREIGN KEY (user_id) REFERENCES user_login_psp(user_id)
);

create table partner_access_rights_list (
short_code varchar(5) NOT NULL,
name varchar(50) NOT NULL,
endpoint varchar(50),
description longtext NOT NULL,
editable_with varchar(5) NOT NULL DEFAULT 'UUA'
);

CREATE VIEW partner_access_rights_view AS SELECT * FROM partner_access_rights 
INNER JOIN partner_access_rights_list 
USING (short_code);

INSERT INTO partner_access_rights_list(short_code,endpoint,name,description) VALUES
('MAA','','Merchant account access', 'Denne rettighed giver user id adgang til at bruge clicklinks'),
('MAC','partner_customer_create','Merchant account create','Adgang til at oprette merchants'),
('MAL','partner_ot_key_acknowledgement','Merchant account link','Adgang til at indtaste en ot_key for at link til en merchant'),
('MAU','partner_merchant_update', 'Merchant account update','Mulighed for at ændre merchants procentsats og settelment days'),
('MAR','partner_merchant_remove','Merchant account remove','Adgang til at fjerne sammenkoblingen mellem en merchant og partner kontoen'),
('MTU','partner_terminal_assign', 'Merchant terminal update','Adgang til at tilkoble og frakoble terminaler'),
('MVS','partner_merchant_overview','Merchant view statistics','Adgang til at se statetik over merchants'),
('MVD','partner_merchant_data','Merchant view data','Adgang til at se specifikt data over merchant'),
('BU' ,'partner_bank_update','Bank update','Tilføje og ændre bankoplysninger på partner kontoen'),
('IU' ,'partner_update','Information update','Adgang til at ændre og opdatere informationer på partner kontoen'),
('UVS','partner_user_data', 'User view settings','Adgang til at ændre users bruger settings og informationer'),
('UUA', 'partner_access_right_update','User update access rights','Adgang til at ændre accessrights på users'),
('TOU','partner_terminal_order_update','Terminal order update','Adgang til at opdatere ordre som ikke er 100% complete'),
('TBT','partner_terinal_purchase', 'Terminal buy terminals','Adgang til at købe terminaler ind til partner kontoen'),
('VB' ,'','View bank','Adgang til at se en bankkonto'),
('VK' ,'', 'View kickback','Adgang til at se kickback informationer på kontoen'),
('VA' ,'', 'View agreement','Adgang til at se partner aftale med Yourpay'),
('VW' ,'', 'View widgets','Adgang til at se widgets'),
('VS' ,'' ,'view statistics','Adgang til at se siden med partners statestikker'),
('VML','partner_merchant_list' ,'View merchant list','Adgang til at se listen over merchants'), 
('VUL','partner_user_list', 'View user list','Adgang til at se partner kontoens bruger liste');