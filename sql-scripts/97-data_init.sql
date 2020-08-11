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
(1440, 'pkm', '', 4561503709, 211, 'pkm%40yourpay.io', 0x64623630383436653939313064353961313061303934643565333961646631373865623766363163, '', '', 'geivbhRDXI5pe', 1, 10, 'fo1t67nenm29g09266a72nr4k0', 0, 'Panda', 1, '2'),
(1421, 'eej', '', 4521491689, 1, 'eej%40yourpay.io', 0x66663466313136363933636362383732646333356139616361343462333032613133373462396138, '', '', 'g6nnQn359oUuG', 1, 1, 'sa284400d0lvppap7dl7kbjh24', 0, 'padawan', 1, '2'),
(1470, 'lir', '', 0, 1, 'lir%40yourpay.io', 0x30313130323165346131363331343564396538343738303134383330646364353866663535623839, '', '', 'yY7ZbXDCdswMF', 1, 1, '', 1370, '', 1, ''),
(1524, 'alh', '', 0, 1, 'alh@yourpay.io', 0x64306137623837373134383835343338613232303434643665643936366561626138373939356535, '', '', '7yBRKCgSZmpku', 1, 1, '', 1420, '', 1, ''),
(1525, 'jub', '', 0, 1, 'jub@yourpay.io', 0x63633964353765663063393130613437333463396238613439326665616531323239663861313437, '', '', 'bXdjjhYkZyJd5', 1, 1, '', 1421, '', 1, '');


USE di_payments;

INSERT INTO di_payments.payon_transid (`token`, `transid`) VALUES ('a', '1000000000');

