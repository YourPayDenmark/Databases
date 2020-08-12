USE dinterminal;

INSERT INTO dinterminal.customer_cvr
(merchant_token, merchantid, merchantid_prod, cvr)
VALUES ("init", 9000, 9090, 1);

INSERT INTO dinterminal.customer_transfer_accounts (
`accountid`,
`creationtime`,
`merchantid`,
`currency`,
`settlement_currency`,
`account_state`,
`account_activated`,
`account_invoices`,
`account_amount`
) VALUES ('1', '0', 9090, 208, 208, 1, 1, 0, 1);


INSERT INTO dinterminal.merchant_transfer_accounts_daily_overview (
`dateid`,
`accountid`,
`captured_amount`,
`captured_amount_converted`,
`captured_fee`,
`chargeback_amount`,
`released_amount`,
`refund_amount`,
`refund_amount_total`,
`daily_percentage`
) VALUES ('1', '1', 0, 0, 0, 0, 0, 0, 0,135);

INSERT INTO `crm_login` (`user_id`, `username`, `fullname`, `mobileno`, `localno`, `useremail`, `pwd`, `pwd2`, `pincode`, `heystack`, `active`, `accesslevel`, `session_id`, `psp`, `mobilesec`, `added_mailchimp`, `group_member`) VALUES
(1, 'mag', 'Mathias Gajhede', 4520645235, 201, 'mag@yourpay.dk', 0x36326230316261316331346430653464353634643164666661306463356465333339316334383336, '', '', 'prasUwR6', 1, 10, 'siv0tp3b9fji996k0g69jogpn1', 0, 'Support', 1, '1'),
(14, 'cat', 'Camilla', 4560188092, 203, 'cat@yourpay.dk', 0x34643733373830626131313631336631646437306133356630393439343032626237343761323265, '', '', 'catY20uR$AY', 1, 10, 'fuf7sjp6e1hifuk8k2ib9e4nu1', 0, 'Happy', 1, '10'),
(1440, 'pkm', '', 4561503709, 211, 'pkm@yourpay.io', 0x64623630383436653939313064353961313061303934643565333961646631373865623766363163, '', '', 'geivbhRDXI5pe', 1, 10, 'fo1t67nenm29g09266a72nr4k0', 0, 'Panda', 1, '2'),
(1421, 'eej', '', 4521491689, 1, 'eej%40yourpay.io', 0x66663466313136363933636362383732646333356139616361343462333032613133373462396138, '', '', 'g6nnQn359oUuG', 1, 1, 'sa284400d0lvppap7dl7kbjh24', 0, 'padawan', 1, '2'),
(97, 'lir', 'Linda Irene Rybank', 4521979865, 207, 'lir@yourpay.io', 0x35363132396437346166653636303863393861386433636530383339333466653865666562363638, '', '', 'pojisdagfpjoi3245lkjsafd', 1, 10, 'm1dkitrofm7hfi4skm2me7m730', 0, 'YouRock', 1, '1'),
(198, 'alh', 'Alexander Haugaard', 4528342620, 216, 'alh', 0x65323163653637316438333565386664343462633831643438393638396361383436383830386337, '', '', 'lkjasdflkj32458u90dvfslkj34250', 1, 1, 'r5mrd0oac6ku5j3sq300119t47', 0, 'Marketing ', 1, '1'),
(1349, 'jub', 'Julie', 4524675150, 215, 'jub@yourpay.io', 0x62356561643139326636353564646463343733343865306666373935353935313539623564396534, 'vjV1MN0owhmxmO5ru2P0MUtoIQvw3uKyOFzAsAZZSlweaBFF.1559734029.', '', 'W8tdLpziUXtIk', 1, 1, '6052qee2ff1f5l5f6pmtrdmeq1', 0, 'Wicket', 1, '1'),
(1556, 'tor', '', 0, 1, 'tor@yourpay.io', 0x39633166363537363835626563323062303335326334393838646434613934666133386266343663, '', '', 'CKjI88pMjILwo', 1, 1, '', 0, '', 0, '');


USE di_payments;

INSERT INTO di_payments.payon_transid (`token`, `transid`) VALUES ('a', '1000000000');

