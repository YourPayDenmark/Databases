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
('MAC','psp_customer_create','Merchant account create','Adgang til at oprette merchants'),
('MAL','psp_ot_key_acknowledgement','Merchant account link','Adgang til at indtaste en ot_key for at link til en merchant'),
('MAU','psp_merchant_update', 'Merchant account update','Mulighed for at ændre merchants procentsats og settelment days'),
('MAR','psp_merchant_remove','Merchant account remove','Adgang til at fjerne sammenkoblingen mellem en merchant og partner kontoen'),
('MTU','psp_terminal_assign', 'Merchant terminal update','Adgang til at tilkoble og frakoble terminaler'),
('MVS','psp_merchant_overview','Merchant view statistics','Adgang til at se statetik over merchants'),
('MVD','psp_merchant_data','Merchant view data','Adgang til at se specifikt data over merchant'),
('BU' ,'psp_bank_update','Bank update','Tilføje og ændre bankoplysninger på partner kontoen'),
('IU' ,'psp_update','Information update','Adgang til at ændre og opdatere informationer på partner kontoen'),
('UC' ,'psp_user_create', 'User create','Adgang til at oprette nye brugere'),
('UD' ,'psp_user_delete', 'User delete','Adgang til at fjerne brugere'),
('UVS','psp_user_data', 'User view settings','Adgang til at ændre users bruger settings og informationer'),
('UUA', 'psp_access_right_update','User update access rights','Adgang til at ændre accessrights på users'),
('TOU','psp_terminal_order_update','Terminal order update','Adgang til at opdatere ordre som ikke er 100% complete'),
('TBT','psp_terinal_purchase', 'Terminal buy terminals','Adgang til at købe terminaler ind til partner kontoen'),
('VB' ,'','View bank','Adgang til at se en bankkonto'),
('VK' ,'', 'View kickback','Adgang til at se kickback informationer på kontoen'),
('VA' ,'', 'View agreement','Adgang til at se partner aftale med Yourpay'),
('VW' ,'', 'View widgets','Adgang til at se widgets'),
('VS' ,'' ,'view statistics','Adgang til at se siden med partners statestikker'),
('VML','psp_merchant_list' ,'View merchant list','Adgang til at se listen over merchants'), 
('VUL','psp_user_list', 'View user list','Adgang til at se partner kontoens bruger liste');