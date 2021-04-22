
USE `dinterminal`;


CREATE TABLE `user_login_psp` (
  `password` varchar(255) NOT NULL,
  `secret` varchar(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `pspid` int(11) DEFAULT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_token_expiry` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `user_login_psp` (`password`, `name`, `phone`, `email`, `user_id`, `session_id`, `language`, `pspid`, `reset_token`, `reset_token_expiry`, `secret`) VALUES
('', NULL, NULL, '', 1000000,  NULL, NULL, NULL, NULL, NULL, '');
​

ALTER TABLE `user_login_psp`
  ADD PRIMARY KEY (`user_id`);
COMMIT;
ALTER TABLE `user_login_psp`
    MODIFY `user_id` INT(11) NOT NULL AUTO_INCREMENT;
COMMIT;
