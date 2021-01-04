USE dinterminal;

INSERT INTO `customer_transfer_accounts` (`accountid`, `creationtime`, `merchantid`, `currency`, `settlement_currency`, `account_state`, `account_activated`, `account_invoices`, `account_amount`, `account_adjustment_status`, `account_amount_last_updated`, `account_total_capture`, `account_total_settlement`, `account_total_tax`, `account_adjustments`, `refund_amount_calculated`, `refund_amount_total`, `merchant_total_debt`, `account_reserve`, `country`, `IBAN`, `biccode`, `bankname`, `bankreg`, `bankacc`, `recalculate_period`, `recalculate_status`, `last_releasedate`, `last_updated`, `reviewed_date`, `verified_ctpe`, `activation_code`, `activation_amount`, `document_key`, `document_token`) VALUES
(10, 1595239215, 9003, 208, 208, 1, 1, 0, 0, 143803, 1609468770, 6037100, -5033626, 82771, 859671, 0, -5033626, 0, 0, 'Denmark', '', '', 'Arbejdernes Landsbank', 5342, 12345678, 0, 0, 1610064000, 0, 0, 0, '', 19, '', '');
INSERT INTO `merchant_transfer_accounts_daily_overview` (`dateid`, `accountid`, `captured_amount`, `captured_amount_converted`, `captured_fee`, `chargeback_amount`, `released_amount`, `refund_amount`, `refund_amount_total`, `manual_adjustments`, `daily_percentage`, `daily_settlement_period`, `date_start`, `date_end`, `date_expected_release`, `manually_corrected`, `daily_percentage_correction`, `conversionrate`, `verified_outgoing`, `special_settlementflow`, `unique_code`) VALUES
(178200, 10, 729250, 0, 10574, 0, 0, 718676, 0, 0, 145, 7, 1595203200, 1595289599, 1595808000, 0, 0, '1', 0, 0, 'AAAKJ7J4cd3e9S'),
(178492, 10, 207250, 0, 3005, 0, -204245, 0, 0, 0, 145, 7, 1595289600, 1595375999, 1595894400, 0, 0, '1', 0, 0, 'AAA5zJttqLdB4Yj2'),
(179405, 10, 205000, 0, 2973, 0, -202027, 0, 0, 0, 145, 7, 1595721600, 1595807999, 1596412800, 0, 0, '1', 0, 0, 'AAAOGzgMfXIxGuz8'),
(179586, 10, 205000, 0, 2973, 0, -202027, 0, 0, 0, 145, 7, 1595808000, 1595894399, 1596412800, 0, 0, '1', 0, 0, 'AAAOYH4ycsjQh90w'),
(179925, 10, 490100, 0, 7106, 0, -482994, 0, 0, 0, 145, 7, 1595894400, 1595980799, 1596499200, 0, 0, '1', 0, 0, 'AAAjSNFycOrwaXg'),
(180749, 10, 205000, 0, 2973, 0, 0, 58224, 0, 0, 145, 7, 1596153600, 1596239999, 1596758400, 0, 0, '1', 0, 0, 'AAAf5mLkPxQn5ScJ'),
(182109, 10, 317000, 0, 4597, 0, -312403, 0, 0, 0, 145, 7, 1596672000, 1596758399, 1597276800, 0, 0, '1', 0, 0, 'AAAXHD8NLuR4qtVW'),
(183028, 10, 353600, 0, 5127, 0, -348473, 0, 0, 0, 145, 7, 1597104000, 1597190399, 1597708800, 0, 0, '1', 0, 0, 'AAAmn06PiZn6K2X'),
(184446, 10, 245000, 0, 3553, 0, -241447, 0, 0, 0, 145, 7, 1597622400, 1597708799, 1598227200, 0, 0, '1', 0, 0, 'AAAZx8IeOvPCFPwR'),
(186721, 10, 245000, 0, 3553, 0, -241447, 0, 0, 0, 145, 7, 1598400000, 1598486399, 1599004800, 0, 0, '1', 0, 0, 'AAAvuqqNVL2jajbZ'),
(187890, 10, 345000, 0, 5003, 0, -339997, 0, 0, 0, 145, 7, 1598832000, 1598918399, 1599436800, 0, 0, '1', 0, 0, 'AAA9c33aeeWkYtbL'),
(194001, 10, 161000, 0, 2335, 0, -158665, 0, 0, 0, 145, 7, 1600732800, 1600819199, 1601337600, 0, 0, '1', 0, 0, 'AAAhtdySoCBg462V'),
(194747, 10, 44000, 0, 638, 0, -43362, 0, 0, 0, 145, 7, 1601078400, 1601164799, 1601856000, 0, 0, '1', 0, 0, 'AAALeM2E8oH8Uaf3'),
(196013, 10, 239000, 0, 3536, 0, -235464, 0, 0, 0, 145, 7, 1601596800, 1601683199, 1602201600, 0, 0, '1', 0, 0, 'AAAHfU45UCiRE7DY'),
(200614, 10, 35775, 0, 519, 0, -35256, 0, 0, 0, 145, 7, 1603670400, 1603756799, 1604275200, 0, 0, '1', 0, 0, 'AAA2fFGrpIVNTak'),
(201049, 10, 245000, 0, 3553, 0, -241447, 0, 0, 0, 145, 7, 1603843200, 1603929599, 1604448000, 0, 0, '1', 0, 0, 'AAAoQVG9Fq7HZqA'),
(201553, 10, 480200, 0, 7159, 0, -473041, 0, 0, 0, 145, 7, 1603929600, 1604015999, 1604534400, 0, 0, '1', 0, 0, 'AAApcIWvkndejVt5'),
(202716, 10, 77700, 0, 1127, 0, -76573, 0, 0, 0, 145, 7, 1604361600, 1604447999, 1604966400, 0, 0, '1', 0, 0, 'AAAhTHFvwT7wubCW'),
(203989, 10, 200000, 0, 1070, 0, -198930, 0, 0, 0, 145, 7, 1604966400, 1605052799, 1605571200, 0, 0, '1', 0, 0, 'AAADjN0UTGMnyWJY'),
(204403, 10, 600750, 0, 8711, 0, -592039, 0, 0, 0, 145, 7, 1605139200, 1605225599, 1605744000, 0, 0, '1', 0, 0, 'AAA528AOAgzGcgIA'),
(208115, 10, 61475, 0, 891, 0, -60584, 0, 0, 0, 145, 7, 1606780800, 1606867199, 1607385600, 0, 0, '1', 0, 0, 'AAAkHi6EpRUE6SrE'),
(209390, 10, 345000, 0, 1795, 0, -343205, 0, 0, 0, 145, 7, 1607299200, 1607385599, 1607904000, 0, 0, '1', 0, 0, 'AAALBsZE8iU72csx'),
(216063, 10, 492250, 0, 4859, 0, -142391, 345000, 0, 0, 145, 7, 1608076800, 1608163199, 1608681600, 0, 0, '1', 0, 0, 'AAA0d4jFrf9gHVIf'),
(216903, 10, 245000, 0, 1295, 0, 0, 0, 0, 0, 145, 7, 1608508800, 1608595199, 1609718400, 0, 0, '1', 0, 0, 'AAAx8XNAesGFhKGQ'),
(217869, 10, 250900, 0, 1325, 0, 0, 0, 0, 0, 145, 7, 1609200000, 1609286399, 1610064000, 0, 0, '1', 0, 0, 'AAAPHxhhKzx6ZP2b'),
(218641, 10, 102500, 0, 653, 0, 0, 0, 0, 0, 145, 7, 1609718400, 1609804799, 1610323200, 0, 0, '1', 0, 0, 'AAAsiQskpbvUZ8Kg');

