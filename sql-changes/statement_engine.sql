use dinterminal;

create table `mail_templates` (
`mail_id` int,
`title` varchar(255),
`template_id` varchar(255),
`trigger_interval` int
);

alter table `mail_templates`
add primary key (`mail_id`);
COMMIT;

ALTER TABLE `mail_templates`
  MODIFY `mail_id` int NOT NULL AUTO_INCREMENT;
COMMIT;

create table `mail_templates_queries` (
`mail_id` int,
`database` varchar(255),
`table` varchar(255),
`field` varchar(255),
`operator` varchar(255),
`value` varchar(255),
`response_field` varchar(255)
);

alter table `mail_templates_queries`
ADD FOREIGN KEY (mail_id) REFERENCES mail_templates(mail_id);
commit;

insert into `mail_templates` (title,template_id,trigger_interval) values 
('Velkomstmail WEB','a4178890-5efd-4ff3-9520-a289ff8aad63',NULL),
('Velkomstmail POS','d66a8999-e6dd-4638-ade8-24f52ef93b22',NULL);

insert into `mail_templates_queries` (`mail_id`,`database`,`table`,`field`,`operator`,`value`,`response_field`) values 
(1,'dinterminal','customer_cvr','cvr_created','<','43000',NULL),
(1,'dinterminal','customer_cvr','customer_pos','=','0',NULL),
(1,'dinterminal','customer_cvr','psper','!=','77',NULL),
(1,'dinterminal','customer_cvr','psper','!=','140',NULL),
(1,'dinterminal','customer_cvr','psper','!=','1277',NULL),
(1,'dinterminal','customer_cvr','psper','!=','1255',NULL);