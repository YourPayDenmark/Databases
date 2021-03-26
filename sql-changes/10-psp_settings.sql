use dinterminal;

CREATE TABLE `psp_system_settings` (
  `psp_id` int(8) NOT NULL,
  `psp_setting` varchar(255) NOT NULL,
  `psp_value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `psp_system_urls` (
  `pspid` int(7) NOT NULL,
  `psp_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
