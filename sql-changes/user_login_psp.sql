
USE `dinterminal`;


CREATE TABLE `user_login_psp` (
  `password` varchar(255) NOT NULL,
  `secret` varchar(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `session_id` varchar(255) DEFAULT NULL,
  `access_rights` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `pspid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `user_login_psp`
  ADD PRIMARY KEY (`user_id`);
COMMIT;
