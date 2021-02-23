--
-- Database: `dinterminal`
--
USE dinterminal;
-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `api_globals`
--

CREATE TABLE `api_globals` (
  `api_id` int NOT NULL,
  `path` varchar(25) NOT NULL,
  `master_name` varchar(255) NOT NULL,
  `master_description` varchar(255) NOT NULL,
  `enabled` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `api_groups`
--

CREATE TABLE `api_groups` (
  `api_id` int NOT NULL,
  `api_group_id` int NOT NULL DEFAULT '0',
  `api_group_type` varchar(4) NOT NULL,
  `api_method_name` varchar(255) NOT NULL,
  `api_title` varchar(255) NOT NULL,
  `api_description` longtext NOT NULL,
  `enabled` smallint NOT NULL DEFAULT '0',
  `api_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `api_params`
--

CREATE TABLE `api_params` (
  `api_param` int NOT NULL,
  `api_method` int NOT NULL,
  `api_order` int NOT NULL,
  `api_param_path` varchar(50) NOT NULL,
  `api_param_title` varchar(255) NOT NULL,
  `api_param_default` varchar(75) NOT NULL,
  `api_param_descriptor` varchar(255) NOT NULL DEFAULT '',
  `api_param_location` varchar(10) NOT NULL DEFAULT 'query',
  `api_param_required` smallint NOT NULL DEFAULT '1',
  `api_param_type` varchar(25) NOT NULL,
  `enabled` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `api_requests`
--

CREATE TABLE `api_requests` (
  `request_id` bigint NOT NULL,
  `request_function` varchar(20) NOT NULL,
  `request_time` bigint NOT NULL,
  `request_content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `app_data`
--

CREATE TABLE `app_data` (
  `app_id` varchar(50) NOT NULL,
  `merchant_token` varchar(128) NOT NULL,
  `app_key` varchar(50) NOT NULL,
  `app_value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `app_dk_economic_sync`
--

CREATE TABLE `app_dk_economic_sync` (
  `sync_id` int NOT NULL,
  `merchant_token` varchar(64) NOT NULL,
  `payment_id` int NOT NULL,
  `action_id` int NOT NULL,
  `dateid` int NOT NULL,
  `synced` smallint NOT NULL DEFAULT '0',
  `errorCode` varchar(20) NOT NULL,
  `message` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `app_economic_sync`
--

CREATE TABLE `app_economic_sync` (
  `sync_id` int NOT NULL COMMENT 'Auto ID',
  `service` varchar(50) NOT NULL,
  `economic_id` int NOT NULL DEFAULT '25',
  `should_not_sync` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `app_user_invoicing`
--

CREATE TABLE `app_user_invoicing` (
  `invoice_id` int NOT NULL,
  `pricing_id` int NOT NULL,
  `invoice_token` varchar(32) NOT NULL,
  `merchant_token` varchar(64) NOT NULL,
  `invoice_period_start` int NOT NULL,
  `invoice_period_end` int NOT NULL,
  `invoice_amount` int NOT NULL,
  `invoice_currency` int NOT NULL,
  `invoice_paid` smallint NOT NULL DEFAULT '0',
  `invoice_paid_date` int NOT NULL DEFAULT '0',
  `invoice_next_retry` bigint NOT NULL,
  `invoice_added_economic` smallint NOT NULL DEFAULT '0',
  `invoice_paid_economic` smallint NOT NULL DEFAULT '0',
  `invoice_settled_internally` smallint NOT NULL DEFAULT '0' COMMENT 'Have funds been deducted from Merchant Transfer Account to Operational Credit Account'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `app_user_pricing`
--

CREATE TABLE `app_user_pricing` (
  `user_pricing_id` int NOT NULL,
  `merchant_token` varchar(64) NOT NULL,
  `service` varchar(255) NOT NULL,
  `service_text` varchar(255) NOT NULL,
  `single_service` smallint NOT NULL DEFAULT '0' COMMENT 'One time service fee',
  `billing_period` int NOT NULL DEFAULT '1' COMMENT 'Number of months in renewal',
  `billing_vat` int NOT NULL DEFAULT '25',
  `next_billing` bigint NOT NULL,
  `next_amount` varchar(10) NOT NULL,
  `next_currency` int NOT NULL DEFAULT '208',
  `next_stopped` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `bambora_merchants`
--

CREATE TABLE `bambora_merchants` (
  `bambora_id` int NOT NULL,
  `merchant_token` varchar(255) NOT NULL,
  `merchant_id` int NOT NULL,
  `proxy_mid` int NOT NULL,
  `timestamp` bigint NOT NULL,
  `status` smallint NOT NULL,
  `file_confirm_name` varchar(50) NOT NULL,
  `rejection_reason_code` smallint NOT NULL,
  `last_updated` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `bambora_mids`
--

CREATE TABLE `bambora_mids` (
  `mcc` int NOT NULL,
  `bambora_mid` int NOT NULL,
  `method` enum('pos','ecom') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `beta_codes`
--

CREATE TABLE `beta_codes` (
  `betaid` int NOT NULL COMMENT 'BetaID',
  `beta_promotion_id` varchar(20) NOT NULL,
  `issued_time` int NOT NULL DEFAULT '0',
  `used_time` int NOT NULL DEFAULT '0',
  `used` smallint NOT NULL DEFAULT '0',
  `merchantid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `blacklist_merchant_tokens`
--

CREATE TABLE `blacklist_merchant_tokens` (
  `blacklist_id` int NOT NULL,
  `merchant_token` varchar(70) NOT NULL,
  `blacklist_time` bigint NOT NULL,
  `blacklist_reason` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `blog`
--

CREATE TABLE `blog` (
  `blog_id` int NOT NULL COMMENT 'Auto ID',
  `category` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Blog title',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Blog Image',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Blog Content',
  `date` bigint NOT NULL COMMENT 'Blog date as Unixtimestamp',
  `read` int NOT NULL DEFAULT '0' COMMENT 'Times article has been read',
  `active` smallint NOT NULL DEFAULT '0' COMMENT 'IF 1 then active blogpost'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `campaign_codes`
--

CREATE TABLE `campaign_codes` (
  `campaignid` int NOT NULL,
  `campaign_package` int NOT NULL,
  `package_months` int NOT NULL,
  `free_transactions` int NOT NULL DEFAULT '0' COMMENT 'If we are giving free transactions',
  `campaign_code` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `chatbot`
--

CREATE TABLE `chatbot` (
  `communication_string` varchar(20) NOT NULL,
  `timestamp` bigint NOT NULL,
  `answer` varchar(255) NOT NULL,
  `tag` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `company_review`
--

CREATE TABLE `company_review` (
  `ReviewID` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `consumer_data`
--

CREATE TABLE `consumer_data` (
  `consumer_id` bigint NOT NULL,
  `consumer_merchantid` int NOT NULL,
  `creationtime` bigint NOT NULL,
  `consumer_cardno` varchar(255) NOT NULL,
  `consumer_name` varchar(255) NOT NULL,
  `consumer_orders` int NOT NULL COMMENT 'Amount of orders through Yourpay',
  `consumer_ip` bigint NOT NULL COMMENT 'ip2long encoded',
  `consumer_invoice_address` varchar(255) NOT NULL,
  `consumer_invoice_postal` varchar(255) NOT NULL,
  `consumer_invoice_city` varchar(255) NOT NULL,
  `consumer_invoice_country` varchar(255) NOT NULL,
  `consumer_shipping_address` varchar(255) NOT NULL,
  `consumer_shipping_postal` varchar(255) NOT NULL,
  `consumer_shipping_city` varchar(255) NOT NULL,
  `consumer_shipping_country` varchar(255) NOT NULL,
  `partly_match_other_consumerid` int NOT NULL DEFAULT '0' COMMENT 'If set then ID on other consumer that we have a match towards',
  `partly_match_type` varchar(255) NOT NULL COMMENT 'Description on what value that partly matched other customerid'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `consumer_login_sessions_mobile`
--

CREATE TABLE `consumer_login_sessions_mobile` (
  `merchantid` int NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `timestp` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `consumer_names`
--

CREATE TABLE `consumer_names` (
  `nameid` int NOT NULL,
  `consumer_name` varchar(255) NOT NULL,
  `general_age` int NOT NULL,
  `sex` enum('Male','Female','Unknown') NOT NULL DEFAULT 'Unknown'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `country`
--

CREATE TABLE `country` (
  `country_code` int NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `phone_code` varchar(6) NOT NULL,
  `code2` varchar(2) NOT NULL,
  `code3` varchar(3) NOT NULL,
  `country_active` smallint NOT NULL DEFAULT '0',
  `country_flag` varchar(255) NOT NULL,
  `country_lang` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `crawler`
--

CREATE TABLE `crawler` (
  `CrawlerID` int NOT NULL,
  `shaencrypt` char(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `crawler_trustpilot`
--

CREATE TABLE `crawler_trustpilot` (
  `CrawlerID` int NOT NULL,
  `shaencrypt` char(40) NOT NULL,
  `url` varchar(255) NOT NULL,
  `lastview` bigint NOT NULL,
  `lastcatview` bigint NOT NULL DEFAULT '0',
  `reviewpage` smallint NOT NULL DEFAULT '0',
  `users` smallint NOT NULL DEFAULT '0',
  `reviewpagesub` smallint NOT NULL DEFAULT '0',
  `reviews` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `crm_customers`
--

CREATE TABLE `crm_customers` (
  `crmID` int NOT NULL COMMENT 'Unique ID',
  `crmwebsite` varchar(100) NOT NULL COMMENT 'Website',
  `alreadycustomer` smallint NOT NULL DEFAULT '0' COMMENT 'If 1 then already customer',
  `vat` varchar(30) NOT NULL,
  `shopplatform` varchar(20) NOT NULL,
  `dns` varchar(30) NOT NULL,
  `leadowner` int NOT NULL COMMENT 'Lead owner',
  `comments` longtext NOT NULL,
  `callback` bigint NOT NULL COMMENT 'Unix timestamp',
  `state` int NOT NULL DEFAULT '0',
  `contactname` varchar(255) NOT NULL,
  `contactmail` varchar(255) NOT NULL,
  `customer_cvr_state` int NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `crm_dashboard`
--

CREATE TABLE `crm_dashboard` (
  `crm_id` int NOT NULL,
  `user_id` int NOT NULL,
  `crm_element` longtext NOT NULL,
  `crm_active` smallint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `crm_login`
--

CREATE TABLE `crm_login` (
  `user_id` int NOT NULL COMMENT 'UserID',
  `username` varchar(255) NOT NULL COMMENT 'Username',
  `fullname` varchar(255) NOT NULL,
  `mobileno` bigint NOT NULL,
  `localno` int NOT NULL DEFAULT '1',
  `useremail` varchar(255) NOT NULL,
  `pwd` blob NOT NULL COMMENT 'password',
  `pwd2` varchar(60) NOT NULL,
  `pincode` varchar(90) NOT NULL,
  `heystack` varchar(32) NOT NULL COMMENT 'password heystack',
  `sha256` enum('0','1') NOT NULL DEFAULT '0',
  `active` int NOT NULL DEFAULT '1' COMMENT 'If 1 then active',
  `accesslevel` int NOT NULL DEFAULT '1' COMMENT 'Access level 1 = standard, 10 is Directors',
  `session_id` varchar(64) NOT NULL,
  `psp` smallint NOT NULL DEFAULT '0',
  `mobilesec` varchar(30) NOT NULL,
  `added_mailchimp` smallint NOT NULL DEFAULT '0',
  `group_member` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `crm_login_ip`
--

CREATE TABLE `crm_login_ip` (
  `userid` varchar(255) NOT NULL,
  `merchantid` int NOT NULL,
  `ip` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `crm_login_psp`
--

CREATE TABLE `crm_login_psp` (
  `pspid` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_description` longtext NOT NULL,
  `pipedrive_id` int NOT NULL DEFAULT '0',
  `amount_of_merchants` int NOT NULL DEFAULT '0',
  `response` varchar(255) NOT NULL,
  `settlement_days` int NOT NULL DEFAULT '14',
  `merchant_percentage` int NOT NULL DEFAULT '225' COMMENT 'Percentage merchant is paying to Yourpay',
  `partner_kickback` int NOT NULL DEFAULT '0',
  `finders_fee` int NOT NULL DEFAULT '0',
  `finders_fee_currency` int NOT NULL DEFAULT '208',
  `percentage` int NOT NULL DEFAULT '5' COMMENT 'Percentage in Kickback / 100',
  `volume_total` bigint NOT NULL DEFAULT '0' COMMENT 'Total volume on PSP',
  `kickback_total` bigint NOT NULL COMMENT 'Total kickback',
  `kickback_released` bigint NOT NULL COMMENT 'Kickback release',
  `last_kickbackrelease` bigint NOT NULL DEFAULT '0' COMMENT 'Timestamp for last release of kickback',
  `last_updated` bigint NOT NULL DEFAULT '0',
  `deactivated` smallint NOT NULL DEFAULT '0',
  `last_update` int NOT NULL,
  `merchants` int NOT NULL,
  `total_volume` bigint NOT NULL,
  `total_kickback` bigint NOT NULL,
  `total_release` bigint NOT NULL,
  `bank_reg` int NOT NULL,
  `bank_acc` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `crm_login_psp_monthly_data`
--

CREATE TABLE `crm_login_psp_monthly_data` (
  `month_start` bigint NOT NULL,
  `pspid` int NOT NULL,
  `transactions` bigint NOT NULL,
  `volume` bigint NOT NULL,
  `volume_estimated` bigint NOT NULL DEFAULT '0',
  `paid` smallint NOT NULL DEFAULT '0',
  `kickback` bigint NOT NULL,
  `customers` bigint NOT NULL,
  `month_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `crm_login_psp_monthly_data_months`
--

CREATE TABLE `crm_login_psp_monthly_data_months` (
  `month_id` int NOT NULL,
  `month_start` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `crm_login_psp_volume`
--

CREATE TABLE `crm_login_psp_volume` (
  `pspid` int NOT NULL,
  `date_start` bigint NOT NULL,
  `volume_day` bigint NOT NULL,
  `merchants_day` bigint NOT NULL,
  `merchants_total` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `crm_queries`
--

CREATE TABLE `crm_queries` (
  `query_id` int NOT NULL,
  `query_owner` int NOT NULL,
  `query_active` smallint NOT NULL DEFAULT '0',
  `query_name` varchar(255) NOT NULL,
  `query_type` varchar(30) NOT NULL,
  `query_database` varchar(60) NOT NULL,
  `query_content` longtext NOT NULL,
  `query_uid` varchar(80) NOT NULL,
  `query_groups` varchar(80) NOT NULL,
  `query_used` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `curl_ignore_domains`
--

CREATE TABLE `curl_ignore_domains` (
  `ignore_id` int NOT NULL,
  `ignore_domain` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_acquirer`
--

CREATE TABLE `customer_acquirer` (
  `cacquirer_id` int NOT NULL,
  `acquirer` varchar(20) NOT NULL,
  `merchant_token` varchar(64) NOT NULL,
  `activation_time` bigint NOT NULL,
  `active` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_activities`
--

CREATE TABLE `customer_activities` (
  `merchant_token` varchar(96) NOT NULL,
  `activity_id` int NOT NULL,
  `activity_group` int NOT NULL DEFAULT '0' COMMENT 'Activity Group, 1 = Onboarding, 2 = Finance, 3 = Support, 4 = Sales, 10 = Admin',
  `activity_title` varchar(32) NOT NULL,
  `activity_content` longtext CHARACTER SET utf8 COLLATE utf8_danish_ci NOT NULL,
  `activity_type` int NOT NULL,
  `activity_owner` int NOT NULL,
  `activity_attached_id` int NOT NULL,
  `activity_created` bigint NOT NULL,
  `activity_updated` bigint NOT NULL,
  `activity_done` smallint NOT NULL DEFAULT '0',
  `activity_done_stamp` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_agreement`
--

CREATE TABLE `customer_agreement` (
  `agreement` int NOT NULL COMMENT 'AutoID',
  `customer_cvr` varchar(10) NOT NULL COMMENT 'CVR number',
  `merchantid` int NOT NULL,
  `notification_email` varchar(255) NOT NULL COMMENT 'Email where we should sent notifications to',
  `terminal` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `regnr` int NOT NULL,
  `bankreg` bigint NOT NULL,
  `deposit` int NOT NULL COMMENT 'Deposit in lowest currency',
  `paiddeposit` int NOT NULL COMMENT 'Paid deposit in lowest currency'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_agreement_mails`
--

CREATE TABLE `customer_agreement_mails` (
  `MailID` int NOT NULL COMMENT 'Unique Identifier',
  `agreement` int NOT NULL COMMENT 'AgreementID',
  `notification_email` varchar(255) NOT NULL COMMENT 'Notification Email',
  `sent` smallint NOT NULL DEFAULT '0' COMMENT 'If 1 then sent',
  `sent_timestamp` bigint NOT NULL COMMENT 'Unix Timestamp for sent'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_agreement_reviews`
--

CREATE TABLE `customer_agreement_reviews` (
  `review_id` int NOT NULL,
  `review_date` bigint NOT NULL DEFAULT '0',
  `merchantid` int NOT NULL COMMENT 'Test Merchant ID',
  `reviewed_by` smallint NOT NULL COMMENT 'Reviewed by',
  `review_comments` longtext NOT NULL COMMENT 'Comments in regards of performed merchant review',
  `review_actions` longtext NOT NULL,
  `next_review` bigint NOT NULL DEFAULT '0' COMMENT 'Next review in Unixtime'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_app_settings`
--

CREATE TABLE `customer_app_settings` (
  `setting_id` bigint NOT NULL,
  `setting_country` varchar(5) NOT NULL DEFAULT 'da-dk',
  `setting_app` varchar(255) NOT NULL,
  `setting_key` varchar(255) NOT NULL,
  `setting_value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_bankdetails`
--

CREATE TABLE `customer_bankdetails` (
  `merchantid` int NOT NULL COMMENT 'MerchantID',
  `creationdate` bigint NOT NULL COMMENT 'Unixtimestamp for MerchantDetails',
  `bankname` varchar(255) NOT NULL,
  `bankreg` int NOT NULL COMMENT 'BankReg',
  `bankacc` bigint NOT NULL COMMENT 'Bank Account',
  `active` smallint NOT NULL DEFAULT '0' COMMENT 'If this is the active informations',
  `approved` smallint NOT NULL DEFAULT '0' COMMENT 'Approved by YourPay',
  `approvedfile` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_billy`
--

CREATE TABLE `customer_billy` (
  `billyOrg` varchar(255) NOT NULL,
  `ypUser` varchar(65) NOT NULL,
  `ypPass` varchar(65) NOT NULL,
  `billyAcc` varchar(255) NOT NULL,
  `billyAcc2` varchar(255) NOT NULL,
  `access` enum('owner','all') NOT NULL,
  `billyToken` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_complaints`
--

CREATE TABLE `customer_complaints` (
  `complaintid` int NOT NULL COMMENT 'AutoID',
  `complainttag` varchar(12) NOT NULL COMMENT 'Complaint Tagging',
  `complaint_name` varchar(255) NOT NULL,
  `complaint_email` varchar(255) NOT NULL,
  `complaint_phone` varchar(255) NOT NULL,
  `complaint_yourpay_message` longtext NOT NULL,
  `complaint_reason` varchar(255) NOT NULL,
  `complaint_transid` int NOT NULL,
  `complaint_orderid` int NOT NULL,
  `complaint_company_message` longtext NOT NULL,
  `complaint_received` bigint NOT NULL,
  `company_response_time` bigint NOT NULL,
  `company_response_txt` int NOT NULL,
  `yourpay_response` int NOT NULL,
  `yourpay_complaint_response` bigint NOT NULL,
  `closed` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_csv`
--

CREATE TABLE `customer_csv` (
  `id` int NOT NULL,
  `merchant_id` int NOT NULL,
  `url` text NOT NULL,
  `start_period` int NOT NULL,
  `end_period` int NOT NULL,
  `downloads` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_currency`
--

CREATE TABLE `customer_currency` (
  `merchantid` int NOT NULL COMMENT 'MerchantID',
  `currency` int NOT NULL DEFAULT '208' COMMENT '208 = DKK'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_currency_conversions`
--

CREATE TABLE `customer_currency_conversions` (
  `currencyid` int NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_name` varchar(255) NOT NULL,
  `currency_rate` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_cvr`
--

CREATE TABLE `customer_cvr` (
  `Customer_type` smallint NOT NULL DEFAULT '1' COMMENT 'If 0 then Terminals, if 1 then Internet',
  `customer_pos` smallint NOT NULL DEFAULT '0',
  `approved` smallint NOT NULL DEFAULT '0' COMMENT 'If 0 then isn''t CVR approved yet, if 2 then shadow',
  `declined_by` int NOT NULL,
  `declined_time` bigint NOT NULL,
  `testaccount` smallint NOT NULL DEFAULT '0',
  `final_approval` smallint NOT NULL DEFAULT '0' COMMENT 'If 2 then finally approved',
  `final_approval_by` int NOT NULL DEFAULT '0' COMMENT 'Who have finally activated customer',
  `final_approval_time` bigint NOT NULL,
  `documentation_split` smallint NOT NULL DEFAULT '0' COMMENT 'If 1 then documentation needs to be uploaded on Yourpays website',
  `salesperson` int NOT NULL DEFAULT '0',
  `percentage` int NOT NULL DEFAULT '20' COMMENT 'Percentage as promille, note that 15 is 1,5%',
  `alternate_dashboard` int NOT NULL DEFAULT '0',
  `cvr` varchar(64) NOT NULL COMMENT 'Unique Identifier',
  `overall_merchantid` bigint NOT NULL DEFAULT '0',
  `merchantid` bigint NOT NULL,
  `merchantid_prod` bigint NOT NULL COMMENT 'Test merchant ID',
  `payon_merchantid` bigint NOT NULL,
  `cvr_name` varchar(100) NOT NULL COMMENT 'Name of company',
  `dba_name` varchar(50) NOT NULL COMMENT 'Doing Business as name',
  `WDSLcaptureCode` varchar(255) NOT NULL,
  `cvr_created` bigint NOT NULL COMMENT 'Timestamp of creation',
  `cvr_notes` longtext NOT NULL COMMENT 'Notes related to CVR',
  `bankdoc` varchar(255) NOT NULL,
  `moneydoc` varchar(255) NOT NULL COMMENT 'Document for ''Hvidvaskningsloven''',
  `cvrdoc` varchar(255) NOT NULL COMMENT 'Owners of VAT number',
  `salesplace` varchar(255) NOT NULL COMMENT 'Documentation of retail',
  `address` longtext NOT NULL,
  `full_address` longtext NOT NULL,
  `postal` varchar(25) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(255) NOT NULL DEFAULT 'DK',
  `phone` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL COMMENT 'Standard email',
  `startdate` bigint NOT NULL,
  `branche` varchar(75) NOT NULL,
  `employees` varchar(35) NOT NULL,
  `employees_year` int NOT NULL,
  `employees_owners` varchar(10) NOT NULL,
  `state` varchar(35) NOT NULL,
  `shoptype` bigint NOT NULL DEFAULT '0' COMMENT '0 = Undefined',
  `website` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL DEFAULT '',
  `freetransactions` int NOT NULL DEFAULT '25' COMMENT 'Free transactions',
  `risk` varchar(255) NOT NULL,
  `risk_level` varchar(255) NOT NULL,
  `comments_applying` longtext NOT NULL,
  `controlled_address` longtext NOT NULL,
  `valid_address` smallint NOT NULL DEFAULT '0',
  `valid_aml` smallint NOT NULL DEFAULT '0' COMMENT 'If 1 then valid AML',
  `latest_yearreport` varchar(255) NOT NULL,
  `yearly_revenue` bigint NOT NULL,
  `yearly_transactions` varchar(255) NOT NULL,
  `estimated_transactions` bigint NOT NULL,
  `purpose_of_business` longtext NOT NULL,
  `compliance_nature_of_business` smallint NOT NULL DEFAULT '0',
  `compliance_cvr_details` smallint NOT NULL DEFAULT '0',
  `compliance_contactdata` smallint NOT NULL DEFAULT '0',
  `special_risks_of_business` longtext NOT NULL,
  `Politically_exposed_owners` varchar(255) NOT NULL,
  `rolling_reserve` smallint NOT NULL DEFAULT '0',
  `rolling_reserve_amount` int NOT NULL DEFAULT '10',
  `rolling_reserve_period` int NOT NULL DEFAULT '0',
  `further_comments` longtext NOT NULL,
  `subscriptions` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'Subscription transactions',
  `subscriptionscode` varchar(24) NOT NULL,
  `subscriptionscallback` longtext NOT NULL,
  `subscriptions_fee` varchar(5) NOT NULL DEFAULT '0,5',
  `terminal_type` smallint NOT NULL DEFAULT '1' COMMENT '1 = CVC, 2 = 3D, 3 = NO CVC',
  `review_evaluation` bigint NOT NULL,
  `missing_data_last_request` bigint NOT NULL COMMENT 'Used by robot/requestdata.php',
  `send_for_approval_borgun` smallint NOT NULL DEFAULT '0',
  `approved_borgun` smallint NOT NULL DEFAULT '0',
  `send_for_approval_trustpay` smallint NOT NULL DEFAULT '0',
  `send_for_approval_secure_trading` smallint NOT NULL DEFAULT '0' COMMENT 'Sent for Approval - Secure Trading',
  `mcc` int NOT NULL DEFAULT '5999' COMMENT 'MCC code',
  `payon_sender` varchar(92) NOT NULL,
  `payon_merchant` varchar(32) NOT NULL,
  `payon_channel` varchar(92) NOT NULL,
  `payon_institute` varchar(48) NOT NULL,
  `payon_login` varchar(92) NOT NULL,
  `payon_pwd` varchar(92) NOT NULL,
  `payon_secret` varchar(92) NOT NULL,
  `payon_type` varchar(2) NOT NULL DEFAULT 'PA',
  `3ds_payon_sender` varchar(92) NOT NULL,
  `3ds_payon_merchant` varchar(32) NOT NULL,
  `3ds_payon_channel` varchar(32) NOT NULL,
  `3ds_payon_institute` varchar(48) NOT NULL,
  `3ds_payon_login` varchar(92) NOT NULL,
  `3ds_payon_pwd` varchar(92) NOT NULL,
  `3ds_payon_secret` varchar(92) NOT NULL,
  `3ds_payon_type` varchar(2) NOT NULL,
  `institute_status` smallint NOT NULL DEFAULT '0',
  `institute_merchant_number` varchar(15) NOT NULL COMMENT 'ALWAYS 15 CHARS!',
  `institute_id` int NOT NULL DEFAULT '1' COMMENT 'Institute ID from payon_clearing_institutes',
  `institute_acceptor_name` varchar(25) NOT NULL COMMENT 'Often same name as cvr_name',
  `payon_channel_merchantAccountId` varchar(50) NOT NULL,
  `psper` smallint NOT NULL DEFAULT '0',
  `remove_dankart` smallint NOT NULL DEFAULT '0',
  `transaction_review` bigint NOT NULL DEFAULT '0' COMMENT 'Time for next review of transactions',
  `pipedrive_deal_id` int NOT NULL,
  `pipedrive_org_id` int NOT NULL DEFAULT '0',
  `pipedrive_sales_deal_id` bigint NOT NULL DEFAULT '0',
  `pipedrive_bcc_email` varchar(255) NOT NULL,
  `pipedrive_person_id` int NOT NULL DEFAULT '0',
  `pipedrive_deal_reminder` tinyint(1) NOT NULL COMMENT '0 = no reminder sent, 1 = 35 reminder sent, 2 = 75 reminder sent, 3 = 200 reminder sent',
  `pipedrive_deal_reminder_last` bigint NOT NULL DEFAULT '0',
  `pipedrive_deal_update` bigint NOT NULL DEFAULT '0',
  `pricing_plan` int NOT NULL DEFAULT '1',
  `pricing_next_period` bigint NOT NULL DEFAULT '0',
  `pricing_last_payment` bigint NOT NULL DEFAULT '0',
  `pricing_amount` int NOT NULL,
  `payon_threedsecure` smallint NOT NULL DEFAULT '0',
  `all_owners_added` smallint NOT NULL DEFAULT '0' COMMENT '1 = All owners Added',
  `free_volume` bigint NOT NULL DEFAULT '0',
  `free_volume_used` bigint NOT NULL DEFAULT '0',
  `daily_settlement_period` int NOT NULL DEFAULT '7',
  `daily_settlement_type` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'If 1 then Multiple settlements per day - one per order',
  `settlement_method` int NOT NULL DEFAULT '103' COMMENT '103 = Daily, 104 = Weekly, 105 = Monthly, 106 = Yearly (Check Pipedrive for updates on this)',
  `settlement_priority` smallint NOT NULL DEFAULT '0',
  `settlements_on_hold` smallint NOT NULL DEFAULT '0',
  `settlements_on_reason` smallint NOT NULL DEFAULT '99' COMMENT 'Reason why the settlements have been blocked',
  `billy_lev_id` varchar(32) NOT NULL,
  `billy_acc_id` varchar(32) NOT NULL,
  `billy_api_key` varchar(40) NOT NULL,
  `general_dl_info` varchar(32) NOT NULL,
  `economic_dl_info` varchar(128) NOT NULL,
  `dinero_dl_info` varchar(128) NOT NULL,
  `billy_dl_info` varchar(128) NOT NULL,
  `payment_lang` varchar(5) NOT NULL,
  `signature_key` varchar(255) NOT NULL,
  `MerchantComments` longtext NOT NULL,
  `setup_call_support` smallint NOT NULL DEFAULT '0' COMMENT 'If 1 - task needs to be created for setting up this merchant, 2 - task is resolved and sales have been informed',
  `setup_call_pipedrive_id` bigint NOT NULL DEFAULT '0' COMMENT 'Pipedrive Activity ID for setup',
  `setup_call_pipedrive_id_sales` int NOT NULL DEFAULT '0' COMMENT 'ActivityID from Sales Pipedrive - used for mirroring',
  `credorax_connected_merchantid` varchar(155) NOT NULL,
  `lyoness_merchantid` int NOT NULL,
  `merchant_token` varchar(70) NOT NULL,
  `payworks_merchantIdentifier` varchar(255) NOT NULL,
  `payworks_merchantSecretKey` varchar(255) NOT NULL,
  `test_payworks_merchantIdentifier` varchar(255) NOT NULL,
  `test_payworks_merchantSecretKey` varchar(255) NOT NULL,
  `merchant_debt_state` bigint NOT NULL COMMENT 'This field defines if the merchant have any debt towards Yourpay',
  `merchant_debt_review` bigint NOT NULL DEFAULT '0' COMMENT 'Last time Merchant was reviewed if had any debt',
  `resursbank_userid` varchar(255) NOT NULL,
  `resursbank_pwd` varchar(255) NOT NULL,
  `resursbank_active` smallint NOT NULL DEFAULT '0',
  `viabill_active` smallint NOT NULL DEFAULT '0',
  `viabill_api` longtext NOT NULL,
  `economic_user_id` varchar(255) NOT NULL,
  `economic_secret` varchar(255) NOT NULL,
  `customer_approved_terms` bigint NOT NULL,
  `trustpilot_reviews` smallint NOT NULL DEFAULT '0' COMMENT 'Stop trustpilot reviews from being sent out',
  `termsandconditions` smallint NOT NULL DEFAULT '0' COMMENT 'If terms and conditions is available on site',
  `mail_with_merchantdetails` smallint NOT NULL DEFAULT '0' COMMENT 'CAN BE DEPRECATED AT 1st of January 2018',
  `subscriptions_activated` smallint NOT NULL DEFAULT '0' COMMENT 'Is set to 1 when the merchant have visited our Subscription section',
  `enhanced_security` smallint NOT NULL DEFAULT '0',
  `flag_bank` tinyint(1) NOT NULL DEFAULT '0',
  `flag_info` tinyint(1) NOT NULL DEFAULT '0',
  `flag_personal` tinyint(1) NOT NULL DEFAULT '0',
  `flag_verified` tinyint(1) NOT NULL DEFAULT '0',
  `audittrail` longtext NOT NULL,
  `document_key` varchar(12) NOT NULL,
  `document_token` varchar(120) NOT NULL,
  `marketplace_instant_approval` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_cvr_audit`
--

CREATE TABLE `customer_cvr_audit` (
  `audit_id` int NOT NULL,
  `audit_completed` smallint NOT NULL,
  `merchantid` int NOT NULL,
  `audit_companyname` smallint NOT NULL,
  `audit_owners` smallint NOT NULL,
  `audit_website_active` smallint NOT NULL,
  `audit_website_terms` smallint NOT NULL,
  `audit_website_products` smallint NOT NULL,
  `audit_website_purchase` smallint NOT NULL,
  `audit_website_yourpay_paymentmethod` smallint NOT NULL,
  `audit_website_vat` smallint NOT NULL,
  `audit_first_timestamp` bigint NOT NULL,
  `audit_second_timestamp` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_data_collection`
--

CREATE TABLE `customer_data_collection` (
  `collection_id` bigint NOT NULL,
  `merchant_token` varchar(64) NOT NULL,
  `collection` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_domains`
--

CREATE TABLE `customer_domains` (
  `DomainID` bigint NOT NULL,
  `merchantid` bigint NOT NULL,
  `website` varchar(255) NOT NULL,
  `terms` smallint NOT NULL DEFAULT '0',
  `terms_url` varchar(255) NOT NULL,
  `privacy` smallint NOT NULL DEFAULT '0',
  `privacy_url` varchar(255) NOT NULL,
  `company` smallint NOT NULL DEFAULT '0',
  `company_url` varchar(255) NOT NULL,
  `contact` smallint NOT NULL DEFAULT '0',
  `contact_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_expected_revenue`
--

CREATE TABLE `customer_expected_revenue` (
  `recenueID` int NOT NULL COMMENT 'AutoID',
  `customer_cvr` varchar(10) NOT NULL COMMENT 'Customer CVR',
  `customer_date` bigint NOT NULL COMMENT 'Date for expected Revenue',
  `customer_revenue` int NOT NULL COMMENT 'revenue in Ã˜re'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_external_epay`
--

CREATE TABLE `customer_external_epay` (
  `merchantid` int NOT NULL COMMENT 'MerchantID',
  `pbs_forretningsid` varchar(10) NOT NULL,
  `webservice_password` longtext NOT NULL,
  `percentage` int NOT NULL DEFAULT '10',
  `amount` int NOT NULL DEFAULT '50000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_fee`
--

CREATE TABLE `customer_fee` (
  `merchantid` int NOT NULL COMMENT 'MerchantID',
  `cardtype` int NOT NULL COMMENT 'CardID',
  `cardfee` int NOT NULL COMMENT 'Cardfee in lowest possible',
  `transactiondays` int NOT NULL DEFAULT '14'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_files`
--

CREATE TABLE `customer_files` (
  `merchantid` int NOT NULL COMMENT 'merchantid',
  `registered` bigint NOT NULL COMMENT 'Timestamp of file',
  `type` int NOT NULL DEFAULT '0' COMMENT 'File Type',
  `filename` varchar(255) NOT NULL COMMENT 'File name',
  `approved` bigint NOT NULL DEFAULT '0',
  `approved_by` smallint NOT NULL DEFAULT '0',
  `handled_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_files_type`
--

CREATE TABLE `customer_files_type` (
  `type_id` int NOT NULL,
  `type_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_fx_seal`
--

CREATE TABLE `customer_fx_seal` (
  `merchant_token` varchar(50) NOT NULL,
  `merchant_seal_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_important_notifications`
--

CREATE TABLE `customer_important_notifications` (
  `notification_id` int NOT NULL,
  `merchantid` bigint NOT NULL,
  `notification_title` varchar(50) NOT NULL,
  `notification_content` longtext NOT NULL,
  `notification_read` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_invoices`
--

CREATE TABLE `customer_invoices` (
  `invoiceID` bigint NOT NULL COMMENT 'AutoID',
  `merchantid` int NOT NULL COMMENT 'merchantid',
  `amount` int NOT NULL COMMENT 'Amount in DKK',
  `creationtime` bigint NOT NULL COMMENT 'Unix Timestamp',
  `paid` bigint NOT NULL COMMENT 'Timestamp for payment',
  `invoicetype` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 = Credit, 1 = Invoice',
  `invoicetext` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_lead`
--

CREATE TABLE `customer_lead` (
  `leadid` int NOT NULL,
  `shadow` smallint NOT NULL DEFAULT '1' COMMENT 'if 1 then haven''t the website been reviewed by the automated platform',
  `touches_by_robot` smallint NOT NULL DEFAULT '0',
  `shop_shadow` smallint NOT NULL DEFAULT '1' COMMENT 'If 1 then is it a shadow which shopsystem that have been used. We have not yet tested it, and have not yet put any result in shoptype',
  `converted` smallint NOT NULL DEFAULT '0' COMMENT '0 if not converted, 1 if converted',
  `merchantid` bigint NOT NULL DEFAULT '0' COMMENT 'If this lead already is registered at Yourpay, then give it the MerchantID',
  `salesperson` int NOT NULL DEFAULT '0',
  `cvr` varchar(10) NOT NULL COMMENT 'Unique Identifier',
  `cvr_name` varchar(50) NOT NULL COMMENT 'Name of company',
  `contactname` varchar(255) NOT NULL,
  `address` longtext NOT NULL,
  `country` varchar(255) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `alt_phone` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL COMMENT 'Standard email',
  `branche` varchar(75) NOT NULL,
  `employees` varchar(35) NOT NULL,
  `shoptype` varchar(255) NOT NULL DEFAULT '' COMMENT '0 = Undefined, 1 = magento, 2 = prestashop',
  `website` varchar(255) NOT NULL,
  `followup` bigint NOT NULL DEFAULT '0',
  `notes` longtext NOT NULL,
  `tp_reviews` bigint NOT NULL,
  `tp_rating` bigint NOT NULL,
  `followup_status` smallint NOT NULL DEFAULT '1' COMMENT 'if 1 then active, if 0 then inactive',
  `in_pipedrive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_lev`
--

CREATE TABLE `customer_lev` (
  `merchantid` int NOT NULL,
  `kreditor_id` varchar(32) NOT NULL,
  `group_id` int NOT NULL,
  `active` tinyint(1) NOT NULL,
  `address` varchar(64) NOT NULL,
  `phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_logins`
--

CREATE TABLE `customer_logins` (
  `LoginID` int(7) NOT NULL COMMENT 'AutoID',
  `customer_cvr` int(7) NOT NULL COMMENT 'Customer CVR',
  `merchantid` int(12) NOT NULL,
  `active` smallint(1) NOT NULL DEFAULT '1' COMMENT 'If 1 then Login Active',
  `username` varchar(255) NOT NULL COMMENT 'Email as Login',
  `upassword` varchar(255) NOT NULL COMMENT 'SHA1 encoded password',
  `secret` varchar(10) NOT NULL,
  `pincode` varchar(90) NOT NULL,
  `uemail` varchar(45) NOT NULL,
  `phoneno` varchar(50) NOT NULL,
  `first_name` varchar(40) NOT NULL DEFAULT '',
  `last_name` varchar(40) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `logo` varchar(30) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `twofactor` smallint(1) NOT NULL DEFAULT '1' COMMENT 'Two factor login',
  `session_id` varchar(30) NOT NULL,
  `session_lastused` bigint(12) NOT NULL,
  `user_img` varchar(255) NOT NULL COMMENT 'User Image',
  `latestlogin` bigint(12) NOT NULL COMMENT 'Latest Login Timestamp',
  `access_rights` varchar(255) NOT NULL,
  `logintype` enum('0','1') NOT NULL COMMENT '0 for Manually, 1 for 1-click-login',
  `clicklink` varchar(60) NOT NULL,
  `terminal_pwd` varchar(10) NOT NULL,
  `stdpwd` smallint(1) NOT NULL DEFAULT '1',
  `verified` smallint(1) NOT NULL DEFAULT '0',
  `added_to_mailchimp` smallint(1) NOT NULL DEFAULT '0',
  `email_optout` smallint(1) NOT NULL DEFAULT '0' COMMENT 'Optout of our marketing mails',
  `updated_mailchimp` bigint(12) NOT NULL DEFAULT '0',
  `country_code` varchar(5) NOT NULL DEFAULT 'da-dk',
  `language_code` varchar(5) NOT NULL,
  `reset_token` text NOT NULL COMMENT 'Token used to validate password resetting',
  `row_last_updated` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_logins_activity`
--

CREATE TABLE `customer_logins_activity` (
  `activityid` int NOT NULL COMMENT 'Unique Identifier',
  `LoginID` int NOT NULL COMMENT 'Login ID',
  `page` varchar(35) NOT NULL,
  `actiondone` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_logins_apppassword`
--

CREATE TABLE `customer_logins_apppassword` (
  `password_id` int NOT NULL,
  `LoginID` int NOT NULL,
  `password` varchar(255) NOT NULL,
  `expiry_timestamp` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_login_sessions`
--

CREATE TABLE `customer_login_sessions` (
  `uid` int NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `timestp` bigint NOT NULL COMMENT 'Unix timestamp'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_login_session_details`
--

CREATE TABLE `customer_login_session_details` (
  `details_id` int NOT NULL,
  `login_id` int NOT NULL,
  `detail_key` varchar(50) NOT NULL,
  `detail_value` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_overview`
--

CREATE TABLE `customer_overview` (
  `merchantid` int NOT NULL,
  `debitor_id` varchar(32) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `group_id` int NOT NULL,
  `address` varchar(64) NOT NULL,
  `phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_owners`
--

CREATE TABLE `customer_owners` (
  `OwnerFileID` int NOT NULL,
  `merchantid` int NOT NULL,
  `creationdate` bigint NOT NULL,
  `uploaded` bigint NOT NULL,
  `handled` bigint NOT NULL,
  `datatype` int NOT NULL,
  `pep` smallint NOT NULL DEFAULT '0' COMMENT 'Political Exposed Person',
  `company_role` varchar(255) NOT NULL,
  `owner_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_danish_ci NOT NULL,
  `owner_address` varchar(255) NOT NULL,
  `owner_postal` varchar(10) NOT NULL DEFAULT '0',
  `owner_city` varchar(255) NOT NULL,
  `owner_country` varchar(255) NOT NULL DEFAULT 'Danmark',
  `owner_date_of_birth` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `verified` smallint NOT NULL DEFAULT '0',
  `owner_share` varchar(5) NOT NULL DEFAULT '0',
  `approved_by` int NOT NULL,
  `requested_by` int NOT NULL,
  `document_key` varchar(32) NOT NULL,
  `document_token` varchar(121) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_owner_types`
--

CREATE TABLE `customer_owner_types` (
  `type_id` int NOT NULL,
  `type_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_payment_download`
--

CREATE TABLE `customer_payment_download` (
  `id` int NOT NULL,
  `merchantid` int NOT NULL,
  `begin` int NOT NULL,
  `end` int NOT NULL,
  `price` smallint NOT NULL,
  `downloads` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_payon`
--

CREATE TABLE `customer_payon` (
  `channelID` int NOT NULL,
  `production` smallint NOT NULL DEFAULT '1' COMMENT '1 if production MerchantID',
  `merchantid` bigint NOT NULL,
  `minimum_amount` int NOT NULL DEFAULT '0',
  `maximum_amount` bigint NOT NULL DEFAULT '9999999',
  `currency` int NOT NULL DEFAULT '208',
  `max_per_month` bigint NOT NULL DEFAULT '999999900',
  `current_month` bigint NOT NULL DEFAULT '0',
  `payon_sender` varchar(64) NOT NULL,
  `payon_channel` varchar(64) NOT NULL,
  `payon_login` varchar(64) NOT NULL,
  `payon_pwd` varchar(64) NOT NULL,
  `payon_secret` varchar(64) NOT NULL,
  `payon_type` varchar(64) NOT NULL DEFAULT 'CC.PA',
  `clearingInstitute` varchar(64) NOT NULL,
  `payon_mcc` varchar(4) NOT NULL DEFAULT '0',
  `payon_threedsecure` smallint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_payon_psp`
--

CREATE TABLE `customer_payon_psp` (
  `pspid` int NOT NULL COMMENT 'Auto ID',
  `demo` smallint NOT NULL DEFAULT '0',
  `pspname` varchar(25) NOT NULL,
  `payonid` varchar(64) NOT NULL,
  `clearingInstitute` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_productionunits`
--

CREATE TABLE `customer_productionunits` (
  `cvr` varchar(15) NOT NULL,
  `pnumber` varchar(15) NOT NULL,
  `valid_since` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_products`
--

CREATE TABLE `customer_products` (
  `product_id` int NOT NULL COMMENT 'AutoID',
  `group_id` int NOT NULL COMMENT 'Product Group ID',
  `merchantid` int NOT NULL COMMENT 'MerchantID',
  `product_title` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_price` int NOT NULL,
  `product_active` smallint NOT NULL,
  `product_barcode` varchar(255) NOT NULL,
  `product_no` varchar(35) NOT NULL,
  `product_buyprice` int NOT NULL,
  `product_unit` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_products_groups`
--

CREATE TABLE `customer_products_groups` (
  `group_id` int NOT NULL COMMENT 'Group ID',
  `group_name` varchar(255) NOT NULL,
  `group_active` smallint NOT NULL DEFAULT '0' COMMENT 'If 1 then active group',
  `merchantid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_product_stock_decrease`
--

CREATE TABLE `customer_product_stock_decrease` (
  `decrease_id` int NOT NULL,
  `completed` smallint NOT NULL DEFAULT '0',
  `merchantid` int NOT NULL,
  `product_name` longtext NOT NULL,
  `product_price` longtext NOT NULL,
  `product_amount` int NOT NULL DEFAULT '0',
  `timestamp` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_special_design`
--

CREATE TABLE `customer_special_design` (
  `merchantid` int NOT NULL,
  `merchantid_prod` int NOT NULL,
  `design_type` int NOT NULL DEFAULT '1',
  `custom_css` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_subscriptions`
--

CREATE TABLE `customer_subscriptions` (
  `subscription_id` int NOT NULL,
  `merchant_id` int NOT NULL,
  `ccrg_id` varchar(14) NOT NULL,
  `time_created` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_supportemails`
--

CREATE TABLE `customer_supportemails` (
  `merchantid` int NOT NULL COMMENT 'MerchantID',
  `customer_email` varchar(255) NOT NULL COMMENT 'Unique customer email for support of merchant'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_touched`
--

CREATE TABLE `customer_touched` (
  `customer_cvr` varchar(10) NOT NULL COMMENT 'Customer CVR/CPR',
  `touchedby` varchar(100) NOT NULL COMMENT 'Touched by',
  `timestamp` bigint NOT NULL COMMENT 'Unix Timestamp',
  `touchnote` longtext NOT NULL COMMENT 'Touch Note'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_touches`
--

CREATE TABLE `customer_touches` (
  `merchantid` int NOT NULL COMMENT 'MerchantID',
  `timestamp` bigint NOT NULL COMMENT 'Unix Timestamp',
  `Action` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_transfer_accounts`
--

CREATE TABLE `customer_transfer_accounts` (
  `accountid` bigint NOT NULL,
  `creationtime` bigint NOT NULL,
  `merchantid` bigint NOT NULL,
  `currency` int NOT NULL DEFAULT '208',
  `settlement_currency` int NOT NULL DEFAULT '208',
  `account_state` bigint NOT NULL,
  `account_activated` smallint NOT NULL DEFAULT '0' COMMENT 'If 1 then updated with production merchantid',
  `account_invoices` smallint NOT NULL DEFAULT '0' COMMENT 'If 1 = Payout account is used for Invoice Payments from Partners (Visma, Billy etc.)',
  `account_amount` bigint NOT NULL DEFAULT '0',
  `account_adjustment_status` bigint NOT NULL DEFAULT '0' COMMENT 'Volume merchant owe to Yourpay in refunds and chargebacks',
  `account_amount_last_updated` bigint NOT NULL DEFAULT '0' COMMENT 'Used by register_correct_account_volume',
  `account_total_capture` bigint NOT NULL DEFAULT '0',
  `account_total_settlement` bigint NOT NULL DEFAULT '0',
  `account_total_tax` bigint NOT NULL DEFAULT '0' COMMENT 'Total fee paid through accountid',
  `account_adjustments` int NOT NULL COMMENT 'Chargebacks, fee etc.',
  `refund_amount_calculated` int NOT NULL DEFAULT '0',
  `refund_amount_total` bigint NOT NULL DEFAULT '0',
  `merchant_total_debt` bigint NOT NULL DEFAULT '0' COMMENT 'Merchants total debt towards Yourpay',
  `account_reserve` bigint NOT NULL,
  `country` varchar(255) NOT NULL,
  `IBAN` varchar(255) NOT NULL,
  `biccode` varchar(12) NOT NULL,
  `bankname` varchar(255) NOT NULL,
  `bankreg` bigint NOT NULL,
  `bankacc` bigint NOT NULL,
  `recalculate_period` bigint NOT NULL COMMENT 'Recalculate account volume after specific timestamp',
  `recalculate_status` int NOT NULL DEFAULT '0' COMMENT 'If recalculate process is ongoing',
  `last_releasedate` bigint NOT NULL DEFAULT '0',
  `last_updated` bigint NOT NULL DEFAULT '0',
  `reviewed_date` smallint NOT NULL DEFAULT '0' COMMENT 'Is being used by temp.correct.payment.import',
  `verified_ctpe` smallint NOT NULL DEFAULT '0',
  `activation_code` varchar(8) NOT NULL,
  `activation_amount` int NOT NULL DEFAULT '19',
  `document_key` varchar(255) NOT NULL,
  `document_token` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `deals_registered_won`
--

CREATE TABLE `deals_registered_won` (
  `deal_id` int NOT NULL,
  `deal_value` longtext NOT NULL,
  `deal_timestamp` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `deployments_performed`
--

CREATE TABLE `deployments_performed` (
  `deployment_id` int NOT NULL,
  `deployment_file` varchar(255) NOT NULL,
  `deployment_timestamp` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `documentation_code_example`
--

CREATE TABLE `documentation_code_example` (
  `example_id` int NOT NULL,
  `entities_id` int NOT NULL,
  `language` varchar(255) NOT NULL,
  `codeexample` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `documentation_entities`
--

CREATE TABLE `documentation_entities` (
  `entities_id` int NOT NULL,
  `documentation_id` int NOT NULL,
  `order_id` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `documentation_titles`
--

CREATE TABLE `documentation_titles` (
  `documentation_id` int NOT NULL,
  `documentation_title` varchar(255) NOT NULL,
  `teaser` varchar(255) NOT NULL,
  `url` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `documents`
--

CREATE TABLE `documents` (
  `document_id` int NOT NULL,
  `document_title` varchar(255) NOT NULL,
  `document_file` varchar(255) NOT NULL,
  `document_owner` int NOT NULL,
  `document_uploaded` bigint NOT NULL,
  `document_approved` bigint NOT NULL,
  `document_group` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `documents_groups`
--

CREATE TABLE `documents_groups` (
  `doc_group_id` int NOT NULL,
  `doc_group_title` varchar(255) NOT NULL,
  `group_users` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `jobs`
--

CREATE TABLE `jobs` (
  `jobid` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `teaser` longtext NOT NULL,
  `text` longtext NOT NULL,
  `active` smallint NOT NULL DEFAULT '1',
  `fulltime` smallint NOT NULL DEFAULT '0',
  `orderBy` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `lead_database`
--

CREATE TABLE `lead_database` (
  `domain` varchar(255) NOT NULL,
  `shop_platform` varchar(255) NOT NULL,
  `added` bigint NOT NULL,
  `imported_into_pipedrive` smallint NOT NULL DEFAULT '0',
  `updated_with_info_in_pipedrive` smallint NOT NULL DEFAULT '0',
  `pipedrive_deal_id` int NOT NULL DEFAULT '0',
  `country` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `MailQueue`
--

CREATE TABLE `MailQueue` (
  `MailID` int NOT NULL COMMENT 'Auto ID',
  `MailSender` varchar(255) NOT NULL DEFAULT 'robot@yourpay.io' COMMENT 'If we doesn''t know who the Sender is, then just insert robot',
  `MailReceiver` varchar(255) NOT NULL DEFAULT 'support@yourpay.dk' COMMENT 'If we doesn''t know who the Receiver is, then just insert support',
  `MailSubject` varchar(255) NOT NULL DEFAULT '' COMMENT 'Mail Subject',
  `MailBody` longtext NOT NULL COMMENT 'Mail Body',
  `MailCategory` varchar(45) NOT NULL,
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sendaftertime` bigint NOT NULL DEFAULT '0',
  `sent` int NOT NULL DEFAULT '0' COMMENT 'If not 0 then sent, if 2 then sent through PHP Mail',
  `ready_to_send` enum('0','1') NOT NULL COMMENT 'If ready to send is zero then don''t send the email',
  `MailFile` varchar(255) NOT NULL,
  `MailFile2` varchar(255) NOT NULL,
  `plain` enum('0','1') NOT NULL COMMENT 'If 0 then send as HTML',
  `merchantnumber` int NOT NULL,
  `mail_bcc` varchar(50) NOT NULL,
  `verify_activated` smallint NOT NULL DEFAULT '0' COMMENT 'Only send mail if merchant is activated',
  `imported_pipedrive` smallint NOT NULL DEFAULT '0',
  `template` smallint NOT NULL DEFAULT '0',
  `template_id` varchar(255) NOT NULL,
  `placeholders` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `MailSMSQueue`
--

CREATE TABLE `MailSMSQueue` (
  `sms_id` int NOT NULL,
  `billable` smallint NOT NULL DEFAULT '0',
  `billed` smallint NOT NULL DEFAULT '0',
  `merchant_token` varchar(64) NOT NULL,
  `sms_receiver` int NOT NULL,
  `sms_text` longtext NOT NULL,
  `sms_replacer` longtext NOT NULL,
  `senttime` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `mail_template`
--

CREATE TABLE `mail_template` (
  `id` int NOT NULL,
  `preferred_wrapper` varchar(255) NOT NULL,
  `country_code` varchar(5) NOT NULL DEFAULT 'da-dk',
  `template_title` varchar(255) NOT NULL,
  `template_subject` varchar(255) NOT NULL,
  `template` text NOT NULL,
  `owner` int NOT NULL,
  `created` int NOT NULL,
  `updater` int NOT NULL,
  `last_updated` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `mail_trigger_mails`
--

CREATE TABLE `mail_trigger_mails` (
  `mail_id` bigint NOT NULL,
  `trigger_id` bigint NOT NULL DEFAULT '0',
  `template_id` varchar(255) NOT NULL,
  `merchant_token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `mail_wrapper`
--

CREATE TABLE `mail_wrapper` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `wrapper` text NOT NULL,
  `in_not_in` varchar(6) NOT NULL DEFAULT 'in',
  `owner` int NOT NULL,
  `created` int NOT NULL,
  `updater` int NOT NULL,
  `last_updated` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `manual_adjustments`
--

CREATE TABLE `manual_adjustments` (
  `adjustment_id` int NOT NULL,
  `accountid` int NOT NULL,
  `dateid` int NOT NULL,
  `amount` int NOT NULL,
  `internal_note` longtext NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `maxtel`
--

CREATE TABLE `maxtel` (
  `phone_reg` bigint NOT NULL,
  `container` longtext NOT NULL,
  `registered` int NOT NULL,
  `seconds` int NOT NULL,
  `pipedrive` int NOT NULL,
  `merchantid` int NOT NULL,
  `cardno_first` int NOT NULL,
  `cardno_last` int NOT NULL,
  `phone_from` bigint NOT NULL,
  `phone_to` bigint NOT NULL,
  `external` bigint NOT NULL,
  `start_time` bigint NOT NULL,
  `connect_time` bigint NOT NULL,
  `end_time` bigint NOT NULL,
  `id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `merchant_logos`
--

CREATE TABLE `merchant_logos` (
  `merchant_token` varchar(255) NOT NULL,
  `logo` longtext NOT NULL,
  `viabill` smallint NOT NULL DEFAULT '0' COMMENT 'Is logo sent to Viabill'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `merchant_outgoing_transactions`
--

CREATE TABLE `merchant_outgoing_transactions` (
  `ImportID` bigint NOT NULL,
  `date_of_transaction` bigint NOT NULL,
  `date_of_payment` bigint NOT NULL,
  `date_of_release` bigint NOT NULL,
  `internal_descriptor` varchar(255) NOT NULL,
  `external_descriptor` varchar(255) NOT NULL,
  `transfered_amount` bigint NOT NULL,
  `banked_statement` bigint NOT NULL,
  `transfered_currency` int NOT NULL DEFAULT '208',
  `import_accepted` smallint NOT NULL DEFAULT '0' COMMENT '-1 = Deleted, 0 = Not handled, 1 = Accepted, 2 = Pending Review',
  `merchantid` int NOT NULL,
  `dateid` int NOT NULL,
  `navision_imported` smallint NOT NULL DEFAULT '0',
  `finance_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `merchant_outgoing_transactions_verification`
--

CREATE TABLE `merchant_outgoing_transactions_verification` (
  `date` varchar(255) NOT NULL,
  `belob` varchar(255) NOT NULL,
  `saldo` varchar(255) NOT NULL,
  `afsenderkonto` varchar(255) NOT NULL,
  `overfbelob` varchar(255) NOT NULL,
  `tekst` varchar(255) NOT NULL,
  `tekstmodtager` varchar(255) NOT NULL,
  `overftype` varchar(255) NOT NULL,
  `betalingsident` varchar(255) NOT NULL,
  `endtoend` varchar(255) NOT NULL,
  `kreditorreference` varchar(255) NOT NULL,
  `modtagerkonto` varchar(255) NOT NULL,
  `supplerendetekst` varchar(255) NOT NULL,
  `test` varchar(255) NOT NULL,
  `checked` smallint NOT NULL DEFAULT '0',
  `v_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `merchant_refunds_accounts`
--

CREATE TABLE `merchant_refunds_accounts` (
  `refund_id` int NOT NULL,
  `payment_id` int NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `accountid` bigint NOT NULL,
  `date_id` int NOT NULL,
  `amount` bigint NOT NULL,
  `currency` int NOT NULL,
  `datetime` bigint NOT NULL,
  `merchantid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `merchant_transfer_accounts_daily_overview`
--

CREATE TABLE `merchant_transfer_accounts_daily_overview` (
  `dateid` bigint NOT NULL,
  `accountid` int NOT NULL,
  `captured_amount` int NOT NULL,
  `captured_amount_converted` bigint NOT NULL DEFAULT '0',
  `captured_fee` int NOT NULL,
  `chargeback_amount` int NOT NULL DEFAULT '0',
  `released_amount` int NOT NULL,
  `refund_amount` int NOT NULL DEFAULT '0',
  `refund_amount_total` bigint NOT NULL DEFAULT '0',
  `manual_adjustments` int NOT NULL DEFAULT '0',
  `daily_percentage` int NOT NULL DEFAULT '225',
  `daily_settlement_period` int NOT NULL DEFAULT '14',
  `date_start` bigint NOT NULL,
  `date_end` bigint NOT NULL,
  `date_expected_release` bigint NOT NULL DEFAULT '0',
  `manually_corrected` int NOT NULL DEFAULT '0',
  `daily_percentage_correction` smallint NOT NULL DEFAULT '0',
  `conversionrate` varchar(10) NOT NULL DEFAULT '0',
  `verified_outgoing` smallint NOT NULL DEFAULT '0',
  `special_settlementflow` smallint NOT NULL DEFAULT '0' COMMENT '1 = Settlement done manually through alternative flow - otherwise standard settlement flow',
  `unique_code` varchar(25) NOT NULL DEFAULT '' COMMENT 'Unique Code used for Payouts'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `mysql_check`
--

CREATE TABLE `mysql_check` (
  `last_time` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Slaves checkup table - 60 seconds behind, they shut down.';

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `navision_exports`
--

CREATE TABLE `navision_exports` (
  `exports_id` bigint NOT NULL,
  `export_time` bigint NOT NULL,
  `export_file` varchar(255) NOT NULL,
  `export_started` smallint NOT NULL DEFAULT '0',
  `export_done` smallint NOT NULL DEFAULT '0',
  `export_startdate` bigint NOT NULL DEFAULT '0',
  `export_enddate` bigint NOT NULL DEFAULT '0',
  `only_fees` varchar(3) NOT NULL,
  `only_settlements` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `navision_review`
--

CREATE TABLE `navision_review` (
  `bilagsnr` varchar(255) NOT NULL,
  `finanskontonr` varchar(255) NOT NULL,
  `beskrivelse` varchar(255) NOT NULL,
  `belob` varchar(255) NOT NULL,
  `modkontotype` varchar(255) NOT NULL,
  `modkonto` int NOT NULL,
  `dateid` int NOT NULL,
  `AutoID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int NOT NULL COMMENT 'Unique Identifier',
  `email` varchar(255) NOT NULL,
  `registered` bigint NOT NULL COMMENT 'Time for registration',
  `reg_ip` bigint NOT NULL COMMENT 'IP for registration'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `new_website_blog`
--

CREATE TABLE `new_website_blog` (
  `blog_id` int NOT NULL,
  `blog_title` varchar(255) NOT NULL,
  `blog_written` bigint NOT NULL,
  `author` varchar(255) NOT NULL,
  `author_email` varchar(255) NOT NULL,
  `blog_content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `onboarding_data_searcher`
--

CREATE TABLE `onboarding_data_searcher` (
  `searcher_id` int NOT NULL,
  `merchant_token` varchar(128) NOT NULL,
  `search_type` int NOT NULL COMMENT 'What data are we actually searching for',
  `search_completed` smallint NOT NULL DEFAULT '0' COMMENT 'Set for 1 if data was identified',
  `searcher_url_id` int NOT NULL COMMENT 'ID for URL upon where the data we needed was found'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `onboarding_data_searcher_url`
--

CREATE TABLE `onboarding_data_searcher_url` (
  `searcher_url_id` int NOT NULL,
  `searcher_id` int NOT NULL COMMENT 'Connected Searcher ID',
  `searcher_url_reviewed` smallint NOT NULL DEFAULT '0' COMMENT 'Set for 1 if URL have been reviewed for the data we needed',
  `searcher_url_request_time` int NOT NULL COMMENT 'Unixtimestamp for when the url was requested searched through',
  `searcher_url_url` varchar(255) NOT NULL,
  `searcher_url_identified_data` smallint NOT NULL DEFAULT '0' COMMENT 'If the data we looked for was found on this URL'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `onboarding_pipedrive_activities`
--

CREATE TABLE `onboarding_pipedrive_activities` (
  `act_id` int NOT NULL,
  `activity_id` bigint NOT NULL,
  `sales_activity_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `onboarding_pipedrive_notes`
--

CREATE TABLE `onboarding_pipedrive_notes` (
  `note_id` bigint NOT NULL,
  `sales_note_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payment_download`
--

CREATE TABLE `payment_download` (
  `id` int NOT NULL,
  `merchant_id` int NOT NULL,
  `type` varchar(24) NOT NULL,
  `fields` text NOT NULL,
  `emails` text NOT NULL,
  `file_type` varchar(12) NOT NULL,
  `time_start` int NOT NULL,
  `time_end` int NOT NULL,
  `email_sent` tinyint(1) NOT NULL,
  `rows` int NOT NULL,
  `rows_processed` int NOT NULL,
  `time_started` int NOT NULL,
  `time_finished` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payment_link`
--

CREATE TABLE `payment_link` (
  `id` int NOT NULL,
  `merchant_id` int NOT NULL,
  `type` int NOT NULL DEFAULT '1' COMMENT '1 = email, 2 = sms',
  `disabled_link` smallint NOT NULL DEFAULT '0',
  `ccrg` smallint NOT NULL DEFAULT '0',
  `order_id` text NOT NULL,
  `alternate_orderid` varchar(64) NOT NULL,
  `currency_id` smallint NOT NULL,
  `amount` int NOT NULL,
  `flag_fee` tinyint(1) NOT NULL COMMENT '0 = merchant pays the fee, 1 = customer pays the fee',
  `flag_subscription` smallint NOT NULL DEFAULT '0',
  `subscription_amount` int NOT NULL,
  `subscription_total` int NOT NULL,
  `subscription_interest` varchar(11) NOT NULL COMMENT 'Daily interest',
  `mail_sender` text NOT NULL,
  `mail_receiver` text NOT NULL,
  `mail_subject` text NOT NULL,
  `mail_body` text NOT NULL,
  `time_registered` int NOT NULL,
  `time_sent` int NOT NULL,
  `time_paid` int NOT NULL,
  `hashed_link` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payment_links_templates`
--

CREATE TABLE `payment_links_templates` (
  `merchant_token` varchar(100) NOT NULL,
  `template_id` int NOT NULL,
  `template_active` smallint NOT NULL DEFAULT '1',
  `template_language` varchar(5) NOT NULL DEFAULT 'da-dk',
  `template_title` varchar(50) NOT NULL,
  `template_consumer_fee` smallint NOT NULL DEFAULT '0',
  `message_title` varchar(255) NOT NULL,
  `message_content` longtext NOT NULL,
  `template_sms_sender` varchar(50) NOT NULL,
  `template_email_sender` varchar(50) NOT NULL,
  `template_link_text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payon_clearing_institutes`
--

CREATE TABLE `payon_clearing_institutes` (
  `institute_id` int NOT NULL,
  `payon_institute_id` varchar(255) NOT NULL,
  `institute_name` varchar(255) NOT NULL,
  `acquiring_insitution_code` varchar(10) NOT NULL DEFAULT '0',
  `acquirer_country_code` int NOT NULL,
  `acceptor_data` text NOT NULL COMMENT 'Card acceptor city|Merchant Post Code|Merchant State Code|Sub-merchant City|Sub-merchant Post Code|Sub-merchant State Code',
  `transaction_category` varchar(9) NOT NULL DEFAULT 'ANY',
  `credit_sender_address` varchar(75) NOT NULL,
  `terminal_id` varchar(15) NOT NULL DEFAULT 'PAYON001',
  `acceptor_country` varchar(25) NOT NULL DEFAULT 'Denmark',
  `authorization_type` varchar(25) NOT NULL DEFAULT 'FINAL_AUTHORIZATION'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pdf_customers`
--

CREATE TABLE `pdf_customers` (
  `pdf_id` bigint NOT NULL,
  `merchantid` bigint NOT NULL COMMENT 'MerchantID',
  `request_time` bigint NOT NULL,
  `printed_time` bigint NOT NULL,
  `file_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pipedrive_activities`
--

CREATE TABLE `pipedrive_activities` (
  `pipedrive_dealid` bigint NOT NULL,
  `pipedrive_mcc` smallint NOT NULL DEFAULT '0',
  `pipedrive_fa` smallint NOT NULL DEFAULT '0',
  `pipedrive_pending_mid` bigint NOT NULL DEFAULT '0',
  `pipedrive_payworks` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pipedrive_deals`
--

CREATE TABLE `pipedrive_deals` (
  `pipedrive_dealid` int NOT NULL,
  `merchantid` int NOT NULL,
  `pipedrive_last_update` bigint NOT NULL,
  `yourpay_next_update` bigint NOT NULL,
  `pipedrive_owner` int NOT NULL DEFAULT '792251'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pipedrive_organisations`
--

CREATE TABLE `pipedrive_organisations` (
  `pipedrive_orgid` int NOT NULL,
  `pipedrive_company_id` int NOT NULL,
  `organisations_name` varchar(100) NOT NULL,
  `country` int NOT NULL DEFAULT '208',
  `address` varchar(50) NOT NULL,
  `vat` bigint NOT NULL,
  `phoneno` varchar(30) NOT NULL,
  `contact_email` varchar(75) NOT NULL,
  `update_time_pipedrive` bigint NOT NULL,
  `yourpay_next_update` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `plugins`
--

CREATE TABLE `plugins` (
  `plugin_id` int NOT NULL,
  `plugin_identifier` varchar(16) NOT NULL,
  `plugin_name` varchar(255) NOT NULL,
  `plugin_description` longtext NOT NULL,
  `plugin_added` bigint NOT NULL,
  `plugin_use` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `plugins_containers`
--

CREATE TABLE `plugins_containers` (
  `plugin_id` int NOT NULL,
  `plugin_container_key` varchar(255) NOT NULL,
  `plugin_container_content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `plugins_containers_merchants`
--

CREATE TABLE `plugins_containers_merchants` (
  `plugin_id` int NOT NULL,
  `merchant_token` varchar(255) NOT NULL,
  `plugin_container_key` varchar(255) NOT NULL,
  `plugin_container_content` longtext NOT NULL,
  `encoded` enum('no','base64') NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `plugin_installed`
--

CREATE TABLE `plugin_installed` (
  `id` int NOT NULL,
  `shop_name` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `module_version` varchar(255) NOT NULL,
  `cms` varchar(255) NOT NULL,
  `cms_version` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pricing_plans`
--

CREATE TABLE `pricing_plans` (
  `pricing_id` int NOT NULL,
  `pipedrive_stage_id` int NOT NULL DEFAULT '35',
  `price_currency` int NOT NULL DEFAULT '208',
  `price_title` varchar(255) NOT NULL,
  `price_descriptor` varchar(255) NOT NULL,
  `setup_fee` int NOT NULL,
  `monthly_fee` int NOT NULL,
  `monthly_free_transactions` int NOT NULL,
  `transaction_fee` int NOT NULL,
  `fraud_detector` enum('3D Secure','3D Secure + Fraud Fighter','Fraud Detector') NOT NULL DEFAULT '3D Secure',
  `acquiring_fee` int NOT NULL,
  `support` int NOT NULL,
  `show_model` smallint NOT NULL DEFAULT '0',
  `important` smallint NOT NULL DEFAULT '0',
  `country` varchar(5) NOT NULL DEFAULT 'da-dk',
  `psper` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `products`
--

CREATE TABLE `products` (
  `product_id` int NOT NULL COMMENT 'Product ID',
  `product_code` varchar(25) NOT NULL COMMENT 'Product Code',
  `product_name` varchar(35) NOT NULL COMMENT 'Product Name',
  `product_description` longtext NOT NULL,
  `product_price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `products_features`
--

CREATE TABLE `products_features` (
  `features_id` int NOT NULL COMMENT 'Auto ID',
  `product_id` int NOT NULL COMMENT 'Product ID',
  `feature_code` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `products_sync_attributes`
--

CREATE TABLE `products_sync_attributes` (
  `attribute_id` bigint NOT NULL,
  `unique_id` int NOT NULL,
  `attribute_name` varchar(255) NOT NULL,
  `attribute_content` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `products_sync_product`
--

CREATE TABLE `products_sync_product` (
  `unique_id` int NOT NULL,
  `merchant_token` varchar(64) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `product_type` enum('simple','variant','subscription') NOT NULL DEFAULT 'simple',
  `product_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `product_pricing` int NOT NULL,
  `product_currency` int NOT NULL DEFAULT '208',
  `last_syncronized` bigint NOT NULL,
  `status` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `questions`
--

CREATE TABLE `questions` (
  `qid` int NOT NULL COMMENT 'Auto ID',
  `title` varchar(255) NOT NULL,
  `question` longtext NOT NULL,
  `answer` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `questions_groups`
--

CREATE TABLE `questions_groups` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `rebilling_customer_products`
--

CREATE TABLE `rebilling_customer_products` (
  `rebilling_products_id` int NOT NULL,
  `merchantid` int NOT NULL,
  `subscriptioncode` varchar(14) NOT NULL,
  `amount` int NOT NULL,
  `amount_year` int NOT NULL DEFAULT '0',
  `perioddate` int NOT NULL,
  `perioddate_yearly` varchar(3) NOT NULL DEFAULT '0',
  `callbackurl` longtext NOT NULL,
  `descriptor` varchar(255) NOT NULL,
  `active` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `resursbank_getpaymentmethods`
--

CREATE TABLE `resursbank_getpaymentmethods` (
  `merchant_token` varchar(255) NOT NULL,
  `months` int NOT NULL DEFAULT '12',
  `aop` smallint NOT NULL DEFAULT '1',
  `lang` varchar(3) NOT NULL DEFAULT 'da',
  `id` varchar(50) NOT NULL,
  `descriptor` varchar(255) NOT NULL,
  `min_limit` int NOT NULL,
  `max_limit` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `customerType` varchar(255) NOT NULL,
  `specificType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `resursbank_getpaymentmethods_legal_links`
--

CREATE TABLE `resursbank_getpaymentmethods_legal_links` (
  `merchant_token` varchar(255) NOT NULL,
  `lang` varchar(2) NOT NULL DEFAULT 'da',
  `id` varchar(255) NOT NULL,
  `legal_id` int NOT NULL,
  `endUserDescription` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `reviewlist`
--

CREATE TABLE `reviewlist` (
  `reviewid` int NOT NULL COMMENT 'Review ID',
  `merchantid` int NOT NULL,
  `total_score` varchar(6) NOT NULL,
  `total_reviews` int NOT NULL,
  `unixtime` bigint NOT NULL,
  `unixtime_ofday` bigint NOT NULL,
  `source` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `robots`
--

CREATE TABLE `robots` (
  `robot_id` int NOT NULL,
  `robot_name` varchar(255) NOT NULL DEFAULT '',
  `robot_response` bigint NOT NULL DEFAULT '0' COMMENT 'last response from robot',
  `robot_group` smallint NOT NULL DEFAULT '0' COMMENT 'is robot part of a group of robots',
  `robot_response_text` longtext NOT NULL,
  `robot_url` varchar(255) NOT NULL DEFAULT '',
  `orderby` int NOT NULL DEFAULT '0',
  `timebetween` int NOT NULL DEFAULT '600',
  `in_use` smallint NOT NULL DEFAULT '0',
  `last_used` varchar(60) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `robots_group`
--

CREATE TABLE `robots_group` (
  `robot_group_id` int NOT NULL DEFAULT '0',
  `robot_group_name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `robot_actions`
--

CREATE TABLE `robot_actions` (
  `actionid` int NOT NULL,
  `robot_name` varchar(255) NOT NULL,
  `robot_status` smallint NOT NULL DEFAULT '0' COMMENT '1  = Positive',
  `robot_text_status` varchar(255) NOT NULL,
  `robot_timestamp` bigint NOT NULL DEFAULT '0' COMMENT 'Unix timestamp'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `robot_verify_data_on_website`
--

CREATE TABLE `robot_verify_data_on_website` (
  `merchantid` bigint NOT NULL,
  `identifer` varchar(12) NOT NULL,
  `identified_time` bigint NOT NULL,
  `identified_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `robot_verify_data_on_website_url_identificators`
--

CREATE TABLE `robot_verify_data_on_website_url_identificators` (
  `identificator_id` int NOT NULL,
  `merchantid` int NOT NULL,
  `attached_identificator_id` int NOT NULL,
  `identificator_url` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `secure_trading_merchants`
--

CREATE TABLE `secure_trading_merchants` (
  `secure_id` bigint NOT NULL,
  `merchant_token` varchar(64) NOT NULL,
  `sitereference` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `server_usage`
--

CREATE TABLE `server_usage` (
  `usage_id` int NOT NULL,
  `server_name` varchar(20) NOT NULL,
  `file_uri` varchar(255) NOT NULL,
  `lastused` bigint NOT NULL DEFAULT '0',
  `removed_database_access` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table used while re-factoring to ensure non-sql server access accross different servers. Can be deleted in Summer 2020';

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `settlement_holidays`
--

CREATE TABLE `settlement_holidays` (
  `holiday_id` int NOT NULL,
  `unixtimestamp` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `shortly_logger`
--

CREATE TABLE `shortly_logger` (
  `logger_id` int NOT NULL,
  `container` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `sql_debug_log`
--

CREATE TABLE `sql_debug_log` (
  `id` int NOT NULL,
  `query_or_error` text NOT NULL,
  `time_created` int NOT NULL,
  `query_time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `sql_error_logger`
--

CREATE TABLE `sql_error_logger` (
  `uri` varchar(255) NOT NULL,
  `sqlquery` longtext NOT NULL,
  `timeoferror` bigint NOT NULL,
  `resolved` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `stl_mids`
--

CREATE TABLE `stl_mids` (
  `stl_id` int NOT NULL,
  `stl_reference` varchar(16) NOT NULL,
  `stl_mcc` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `subscriptions_contacts`
--

CREATE TABLE `subscriptions_contacts` (
  `subscriber_id` int NOT NULL,
  `merchant_token` varchar(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(50) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `customer_postal` varchar(255) NOT NULL,
  `customer_city` varchar(255) NOT NULL,
  `customer_country` varchar(255) NOT NULL DEFAULT 'Danmark',
  `customer_conditions` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `subscriptions_dunning`
--

CREATE TABLE `subscriptions_dunning` (
  `dunning_id` int NOT NULL,
  `type` smallint NOT NULL COMMENT '0 = Check availablility, 1 = check reservation, 2 = full transaction',
  `global_header_footer` smallint NOT NULL DEFAULT '0',
  `action` smallint NOT NULL COMMENT '0 = Nothing, 1 = email, 2 = sms, 3 = both',
  `merchant_token` varchar(255) NOT NULL,
  `dunning_day` int NOT NULL,
  `dunning_timeofday` int NOT NULL,
  `dunning_email_title` longtext NOT NULL,
  `dunning_email_text` longtext CHARACTER SET utf8 COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `subscriptions_interest`
--

CREATE TABLE `subscriptions_interest` (
  `interest_id` int NOT NULL,
  `subscription_id` int NOT NULL,
  `daily_interest` varchar(8) NOT NULL,
  `total_amount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `subscriptions_invoices`
--

CREATE TABLE `subscriptions_invoices` (
  `invoice_id` int NOT NULL,
  `subscription_id` int NOT NULL,
  `merchant_token` varchar(100) NOT NULL,
  `invoice_state` int NOT NULL,
  `invoice_amount` int NOT NULL,
  `invoice_last_retry` bigint NOT NULL,
  `invoice_capture_time` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `subscriptions_plan`
--

CREATE TABLE `subscriptions_plan` (
  `id` int NOT NULL,
  `merchant_token` varchar(255) NOT NULL,
  `plan_state` int NOT NULL,
  `plan_name` varchar(12) NOT NULL,
  `plan_currency` int NOT NULL DEFAULT '208',
  `plan_price` int NOT NULL,
  `plan_price_signup` int NOT NULL,
  `plan_trial` int NOT NULL,
  `plan_trial_type` int NOT NULL DEFAULT '1',
  `plan_period` int NOT NULL,
  `plan_period_type` int NOT NULL,
  `billing_cycles` int NOT NULL,
  `billing_period` int NOT NULL,
  `billing_period_type` int NOT NULL DEFAULT '1',
  `termination_notice_time` int NOT NULL DEFAULT '7',
  `termination_notice_time_type` int NOT NULL DEFAULT '1',
  `subscribe_period_start` int NOT NULL DEFAULT '0',
  `subscribe_period_end` int NOT NULL,
  `period_running_initial` int NOT NULL,
  `period_running_eol` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `subscriptions_products`
--

CREATE TABLE `subscriptions_products` (
  `product_id` int NOT NULL,
  `merchant_token` varchar(50) NOT NULL,
  `product_title` varchar(50) NOT NULL,
  `product_teaser` varchar(255) NOT NULL,
  `product_description` longtext NOT NULL,
  `product_currency` int NOT NULL DEFAULT '208',
  `product_price_signup` int NOT NULL,
  `product_price` int NOT NULL,
  `product_period` int NOT NULL,
  `product_image` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `subscriptions_subscriptions`
--

CREATE TABLE `subscriptions_subscriptions` (
  `subscription_id` int NOT NULL,
  `merchant_token` varchar(100) NOT NULL,
  `subscription_token` varchar(16) NOT NULL,
  `payment_frame` longtext NOT NULL,
  `subscription_callbackurl` longtext NOT NULL,
  `subscription_state` smallint NOT NULL DEFAULT '1',
  `subscription_contact` int NOT NULL,
  `subscription_product` int NOT NULL,
  `subscription_orderid` varchar(255) NOT NULL,
  `subscription_price` varchar(11) NOT NULL,
  `subscription_price_signup` int NOT NULL,
  `subscription_period` int NOT NULL,
  `subscription_creation_time` bigint NOT NULL,
  `subscription_last_renewal` bigint NOT NULL,
  `subscription_next_renewal` bigint NOT NULL,
  `short_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `system_errors`
--

CREATE TABLE `system_errors` (
  `errorid` int NOT NULL COMMENT 'SystemID',
  `errortext` longtext NOT NULL,
  `solved` smallint NOT NULL DEFAULT '0' COMMENT 'If Solved then 1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `terminals`
--

CREATE TABLE `terminals` (
  `TerminalID` int NOT NULL COMMENT 'AutoID',
  `psp` int NOT NULL DEFAULT '0' COMMENT 'If terminal is handed out to PSP',
  `terminal_identifier` varchar(50) NOT NULL,
  `terminal_model` varchar(50) NOT NULL,
  `TerminalType` varchar(50) NOT NULL COMMENT 'Terminal Type',
  `PN` varchar(50) NOT NULL COMMENT 'PN for Terminal',
  `Term` varchar(30) NOT NULL COMMENT 'Term ID',
  `creationdate` bigint NOT NULL,
  `totaldeposit` int NOT NULL COMMENT 'Deposit Value',
  `deposittoday` int NOT NULL COMMENT 'Actual Deposit today',
  `merchantIdentifier` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `terminals_settings`
--

CREATE TABLE `terminals_settings` (
  `terminal_id` int NOT NULL,
  `setting_type` varchar(50) NOT NULL,
  `setting_value` varchar(50) NOT NULL,
  `settings_timestamp` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `terrorlist`
--

CREATE TABLE `terrorlist` (
  `ter_id` int NOT NULL,
  `name` blob NOT NULL,
  `added` bigint NOT NULL,
  `added_by` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `toturials`
--

CREATE TABLE `toturials` (
  `toturialid` int NOT NULL COMMENT 'AutoID',
  `name` varchar(35) NOT NULL COMMENT 'Title of Toturial',
  `teaser` longtext NOT NULL,
  `lang` varchar(5) NOT NULL DEFAULT 'da-dk' COMMENT 'Language',
  `country_code` int NOT NULL DEFAULT '208',
  `content` longtext NOT NULL COMMENT 'Longtext',
  `active` smallint NOT NULL DEFAULT '0' COMMENT 'If 1 then active',
  `lastmodified` bigint NOT NULL COMMENT 'Last modified in Unix'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `tracking`
--

CREATE TABLE `tracking` (
  `session_id` varchar(255) NOT NULL,
  `pageurl` longtext NOT NULL,
  `ip2long` bigint NOT NULL,
  `unixtime` bigint NOT NULL,
  `trackingtype` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `transactions`
--

CREATE TABLE `transactions` (
  `TransID` bigint NOT NULL COMMENT 'AutoID',
  `AgreementID` bigint NOT NULL COMMENT 'Connected to AgreementID',
  `TerminalID` int NOT NULL COMMENT 'TerminalID',
  `TransferDate` bigint NOT NULL COMMENT 'Unix Timestamp for TransferDate',
  `ReceiveDate` varchar(11) NOT NULL COMMENT 'Bank Receive Date',
  `BankDate` varchar(11) NOT NULL COMMENT 'Bank Content Date',
  `TransferText` varchar(255) NOT NULL COMMENT 'Full TransferText',
  `TerminalType` varchar(6) NOT NULL COMMENT 'DKFLX',
  `TerminalDate` date NOT NULL COMMENT 'Date of Transaction',
  `fullamount` bigint NOT NULL COMMENT 'Full TransactionAmount',
  `feeamount` int NOT NULL COMMENT 'FeeForDinTerminal',
  `depositfee` int NOT NULL COMMENT 'DepositFee',
  `onaccount` bigint NOT NULL COMMENT 'On Bank Account when Transaction was received',
  `handeled` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'If 1 then is the transaction sent to Payout',
  `approved` smallint NOT NULL DEFAULT '0' COMMENT 'If 1 Then is the payment approved and ready to be paid out',
  `deleted` smallint NOT NULL DEFAULT '0' COMMENT 'If 1 then error happend in row',
  `mailid` bigint NOT NULL COMMENT 'Exported to MailID'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `transaction_touches`
--

CREATE TABLE `transaction_touches` (
  `TouchID` bigint NOT NULL COMMENT 'AutoID',
  `time` bigint NOT NULL COMMENT 'Timestamp',
  `TransID` bigint NOT NULL COMMENT 'TransactionID',
  `admin_id` int NOT NULL COMMENT 'Administrator ID',
  `action` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `translate`
--

CREATE TABLE `translate` (
  `TranslateID` bigint NOT NULL COMMENT 'AutoID',
  `Texture` longtext NOT NULL COMMENT 'Text in local language',
  `lang` varchar(5) NOT NULL DEFAULT 'da-dk' COMMENT 'Language',
  `Translation` longtext NOT NULL COMMENT 'Local Translation',
  `TranslationID` int NOT NULL,
  `lastused` bigint NOT NULL,
  `en-gb` smallint NOT NULL,
  `nb-no` smallint NOT NULL DEFAULT '0',
  `se-se` smallint NOT NULL DEFAULT '0',
  `sk-sk` smallint NOT NULL DEFAULT '0',
  `de-de` smallint NOT NULL DEFAULT '0',
  `nl-nl` smallint NOT NULL DEFAULT '0',
  `fr-fr` smallint NOT NULL DEFAULT '0',
  `pl-pl` smallint NOT NULL DEFAULT '0',
  `ru-ru` smallint NOT NULL DEFAULT '0',
  `ro-ro` smallint NOT NULL DEFAULT '0',
  `es-es` smallint NOT NULL DEFAULT '0',
  `fo-fo` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `translate_langs`
--

CREATE TABLE `translate_langs` (
  `TranslateID` int NOT NULL COMMENT 'TranslateID',
  `language` varchar(5) NOT NULL DEFAULT 'en' COMMENT 'Language',
  `text` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `translations`
--

CREATE TABLE `translations` (
  `translateid` int NOT NULL,
  `text` longtext NOT NULL,
  `original_text` longtext NOT NULL,
  `language` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `unitests`
--

CREATE TABLE `unitests` (
  `uni_id` int NOT NULL COMMENT 'Automated ID',
  `uni_title` varchar(255) NOT NULL,
  `uni_url` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 = failed, 1 = success',
  `timestp` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `unitest_results`
--

CREATE TABLE `unitest_results` (
  `result_id` int NOT NULL,
  `completed` int NOT NULL,
  `failed` int NOT NULL,
  `timestp` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `user_token_logging`
--

CREATE TABLE `user_token_logging` (
  `log_id` int NOT NULL COMMENT 'Token Log',
  `token` varchar(255) NOT NULL,
  `url` longtext NOT NULL,
  `timestp` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `viabill_logger`
--

CREATE TABLE `viabill_logger` (
  `id` int NOT NULL,
  `container` longtext NOT NULL,
  `checked` int NOT NULL DEFAULT '0',
  `transferred` int NOT NULL DEFAULT '0',
  `log_state` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `webservice_logger`
--

CREATE TABLE `webservice_logger` (
  `serviceid` int NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `functionrequest` varchar(255) NOT NULL,
  `container` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `yourpark_car`
--

CREATE TABLE `yourpark_car` (
  `id` int NOT NULL,
  `numberplate` varchar(7) NOT NULL,
  `country` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `yourpark_country`
--

CREATE TABLE `yourpark_country` (
  `id` int NOT NULL,
  `country` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `yourpark_parking`
--

CREATE TABLE `yourpark_parking` (
  `id` int NOT NULL,
  `numberplate` int NOT NULL,
  `start_timestamp` int NOT NULL,
  `end_timestamp` int NOT NULL,
  `zone_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `yourpark_parking_meter`
--

CREATE TABLE `yourpark_parking_meter` (
  `id` int NOT NULL,
  `company` varchar(30) NOT NULL,
  `time_expiration` int NOT NULL,
  `country` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `yourpark_zones`
--

CREATE TABLE `yourpark_zones` (
  `zone_id` int NOT NULL,
  `company` varchar(30) NOT NULL,
  `expiretime` int NOT NULL,
  `country_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `api_globals`
--
ALTER TABLE `api_globals`
  ADD PRIMARY KEY (`api_id`);

--
-- Indeks for tabel `api_groups`
--
ALTER TABLE `api_groups`
  ADD PRIMARY KEY (`api_id`);

--
-- Indeks for tabel `api_params`
--
ALTER TABLE `api_params`
  ADD PRIMARY KEY (`api_param`);

--
-- Indeks for tabel `api_requests`
--
ALTER TABLE `api_requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `request_time` (`request_time`),
  ADD KEY `request_id` (`request_id`);

--
-- Indeks for tabel `app_dk_economic_sync`
--
ALTER TABLE `app_dk_economic_sync`
  ADD PRIMARY KEY (`sync_id`),
  ADD UNIQUE KEY `action_id` (`action_id`);

--
-- Indeks for tabel `app_economic_sync`
--
ALTER TABLE `app_economic_sync`
  ADD PRIMARY KEY (`sync_id`);

--
-- Indeks for tabel `app_user_invoicing`
--
ALTER TABLE `app_user_invoicing`
  ADD PRIMARY KEY (`invoice_id`),
  ADD UNIQUE KEY `invoice_id` (`invoice_id`);

--
-- Indeks for tabel `app_user_pricing`
--
ALTER TABLE `app_user_pricing`
  ADD PRIMARY KEY (`user_pricing_id`);

--
-- Indeks for tabel `bambora_merchants`
--
ALTER TABLE `bambora_merchants`
  ADD PRIMARY KEY (`bambora_id`),
  ADD KEY `status` (`status`);

--
-- Indeks for tabel `bambora_mids`
--
ALTER TABLE `bambora_mids`
  ADD UNIQUE KEY `bambora_mid` (`bambora_mid`);

--
-- Indeks for tabel `beta_codes`
--
ALTER TABLE `beta_codes`
  ADD PRIMARY KEY (`betaid`);

--
-- Indeks for tabel `blacklist_merchant_tokens`
--
ALTER TABLE `blacklist_merchant_tokens`
  ADD PRIMARY KEY (`blacklist_id`);

--
-- Indeks for tabel `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`blog_id`);

--
-- Indeks for tabel `campaign_codes`
--
ALTER TABLE `campaign_codes`
  ADD PRIMARY KEY (`campaignid`);

--
-- Indeks for tabel `chatbot`
--
ALTER TABLE `chatbot`
  ADD KEY `communication_string` (`communication_string`),
  ADD KEY `answer_shortner` (`tag`),
  ADD KEY `Answers` (`communication_string`,`tag`);

--
-- Indeks for tabel `company_review`
--
ALTER TABLE `company_review`
  ADD PRIMARY KEY (`ReviewID`),
  ADD KEY `ReviewID` (`ReviewID`);

--
-- Indeks for tabel `consumer_data`
--
ALTER TABLE `consumer_data`
  ADD PRIMARY KEY (`consumer_id`);

--
-- Indeks for tabel `consumer_names`
--
ALTER TABLE `consumer_names`
  ADD PRIMARY KEY (`nameid`);

--
-- Indeks for tabel `country`
--
ALTER TABLE `country`
  ADD UNIQUE KEY `country_code` (`country_code`);

--
-- Indeks for tabel `crawler`
--
ALTER TABLE `crawler`
  ADD PRIMARY KEY (`CrawlerID`),
  ADD KEY `shaencrypt` (`shaencrypt`),
  ADD KEY `shaencrypt_2` (`shaencrypt`);

--
-- Indeks for tabel `crawler_trustpilot`
--
ALTER TABLE `crawler_trustpilot`
  ADD PRIMARY KEY (`CrawlerID`),
  ADD UNIQUE KEY `shaencrypt_6` (`shaencrypt`),
  ADD KEY `shaencrypt` (`shaencrypt`),
  ADD KEY `url` (`url`),
  ADD KEY `url_2` (`url`,`lastview`),
  ADD KEY `url_3` (`url`,`users`),
  ADD KEY `url_4` (`url`),
  ADD KEY `shaencrypt_2` (`shaencrypt`),
  ADD KEY `CrawlerID` (`CrawlerID`),
  ADD KEY `shaencrypt_3` (`shaencrypt`),
  ADD KEY `shaencrypt_4` (`shaencrypt`,`url`,`lastview`),
  ADD KEY `lastview` (`lastview`,`reviewpage`),
  ADD KEY `users` (`users`),
  ADD KEY `url_5` (`url`,`users`),
  ADD KEY `shaencrypt_5` (`shaencrypt`,`url`,`lastview`,`reviewpage`,`users`);

--
-- Indeks for tabel `crm_customers`
--
ALTER TABLE `crm_customers`
  ADD PRIMARY KEY (`crmID`);

--
-- Indeks for tabel `crm_dashboard`
--
ALTER TABLE `crm_dashboard`
  ADD PRIMARY KEY (`crm_id`);

--
-- Indeks for tabel `crm_login`
--
ALTER TABLE `crm_login`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks for tabel `crm_login_psp`
--
ALTER TABLE `crm_login_psp`
  ADD PRIMARY KEY (`pspid`),
  ADD KEY `pspid` (`pspid`);

--
-- Indeks for tabel `crm_login_psp_monthly_data`
--
ALTER TABLE `crm_login_psp_monthly_data`
  ADD KEY `month_id` (`month_id`);

--
-- Indeks for tabel `crm_login_psp_monthly_data_months`
--
ALTER TABLE `crm_login_psp_monthly_data_months`
  ADD PRIMARY KEY (`month_id`);

--
-- Indeks for tabel `crm_queries`
--
ALTER TABLE `crm_queries`
  ADD PRIMARY KEY (`query_id`);

--
-- Indeks for tabel `customer_acquirer`
--
ALTER TABLE `customer_acquirer`
  ADD PRIMARY KEY (`cacquirer_id`),
  ADD KEY `merchant_token` (`merchant_token`);

--
-- Indeks for tabel `customer_activities`
--
ALTER TABLE `customer_activities`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indeks for tabel `customer_agreement`
--
ALTER TABLE `customer_agreement`
  ADD PRIMARY KEY (`agreement`);

--
-- Indeks for tabel `customer_agreement_mails`
--
ALTER TABLE `customer_agreement_mails`
  ADD UNIQUE KEY `MailID` (`MailID`);

--
-- Indeks for tabel `customer_agreement_reviews`
--
ALTER TABLE `customer_agreement_reviews`
  ADD PRIMARY KEY (`review_id`);

--
-- Indeks for tabel `customer_app_settings`
--
ALTER TABLE `customer_app_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indeks for tabel `customer_complaints`
--
ALTER TABLE `customer_complaints`
  ADD PRIMARY KEY (`complaintid`);

--
-- Indeks for tabel `customer_csv`
--
ALTER TABLE `customer_csv`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `customer_currency_conversions`
--
ALTER TABLE `customer_currency_conversions`
  ADD PRIMARY KEY (`currency_code`);

--
-- Indeks for tabel `customer_cvr`
--
ALTER TABLE `customer_cvr`
  ADD PRIMARY KEY (`merchantid`),
  ADD UNIQUE KEY `merchant_token` (`merchant_token`),
  ADD KEY `cvr_name` (`cvr_name`),
  ADD KEY `psper` (`psper`),
  ADD KEY `merchantid_prod` (`merchantid_prod`),
  ADD KEY `merchantid_prod_2` (`merchantid_prod`),
  ADD KEY `overall_merchantid` (`overall_merchantid`),
  ADD KEY `approved` (`approved`),
  ADD KEY `CopyToCustomer` (`approved`,`overall_merchantid`),
  ADD KEY `phone` (`phone`),
  ADD KEY `cvr_created` (`cvr_created`);
ALTER TABLE `customer_cvr` ADD FULLTEXT KEY `CVRIndex` (`cvr`);
ALTER TABLE `customer_cvr` ADD FULLTEXT KEY `FullIndex` (`cvr_name`,`cvr_notes`,`address`);

--
-- Indeks for tabel `customer_cvr_audit`
--
ALTER TABLE `customer_cvr_audit`
  ADD PRIMARY KEY (`audit_id`);

--
-- Indeks for tabel `customer_data_collection`
--
ALTER TABLE `customer_data_collection`
  ADD PRIMARY KEY (`collection_id`);

--
-- Indeks for tabel `customer_domains`
--
ALTER TABLE `customer_domains`
  ADD PRIMARY KEY (`DomainID`);

--
-- Indeks for tabel `customer_expected_revenue`
--
ALTER TABLE `customer_expected_revenue`
  ADD PRIMARY KEY (`recenueID`);

--
-- Indeks for tabel `customer_important_notifications`
--
ALTER TABLE `customer_important_notifications`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indeks for tabel `customer_invoices`
--
ALTER TABLE `customer_invoices`
  ADD PRIMARY KEY (`invoiceID`);

--
-- Indeks for tabel `customer_lead`
--
ALTER TABLE `customer_lead`
  ADD PRIMARY KEY (`leadid`),
  ADD KEY `merchantid` (`merchantid`);
ALTER TABLE `customer_lead` ADD FULLTEXT KEY `CVRIndex` (`cvr`);
ALTER TABLE `customer_lead` ADD FULLTEXT KEY `FullIndex` (`cvr_name`,`address`);

--
-- Indeks for tabel `customer_lev`
--
ALTER TABLE `customer_lev`
  ADD PRIMARY KEY (`merchantid`,`kreditor_id`);

--
-- Indeks for tabel `customer_logins`
--
ALTER TABLE `customer_logins`
  ADD PRIMARY KEY (`LoginID`),
  ADD KEY `merchantid` (`merchantid`),
  ADD KEY `username` (`username`);

--
-- Indeks for tabel `customer_logins_activity`
--
ALTER TABLE `customer_logins_activity`
  ADD PRIMARY KEY (`activityid`);

--
-- Indeks for tabel `customer_logins_apppassword`
--
ALTER TABLE `customer_logins_apppassword`
  ADD PRIMARY KEY (`password_id`);

--
-- Indeks for tabel `customer_login_session_details`
--
ALTER TABLE `customer_login_session_details`
  ADD PRIMARY KEY (`details_id`);

--
-- Indeks for tabel `customer_overview`
--
ALTER TABLE `customer_overview`
  ADD PRIMARY KEY (`merchantid`,`debitor_id`);

--
-- Indeks for tabel `customer_owners`
--
ALTER TABLE `customer_owners`
  ADD PRIMARY KEY (`OwnerFileID`),
  ADD KEY `CopySub` (`merchantid`,`datatype`,`creationdate`);

--
-- Indeks for tabel `customer_payment_download`
--
ALTER TABLE `customer_payment_download`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merchantid` (`merchantid`);

--
-- Indeks for tabel `customer_payon`
--
ALTER TABLE `customer_payon`
  ADD PRIMARY KEY (`channelID`);

--
-- Indeks for tabel `customer_payon_psp`
--
ALTER TABLE `customer_payon_psp`
  ADD PRIMARY KEY (`pspid`);

--
-- Indeks for tabel `customer_products`
--
ALTER TABLE `customer_products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indeks for tabel `customer_products_groups`
--
ALTER TABLE `customer_products_groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Indeks for tabel `customer_product_stock_decrease`
--
ALTER TABLE `customer_product_stock_decrease`
  ADD PRIMARY KEY (`decrease_id`);

--
-- Indeks for tabel `customer_subscriptions`
--
ALTER TABLE `customer_subscriptions`
  ADD PRIMARY KEY (`subscription_id`),
  ADD KEY `merchant_id` (`merchant_id`),
  ADD KEY `ccrg_id` (`ccrg_id`);

--
-- Indeks for tabel `customer_supportemails`
--
ALTER TABLE `customer_supportemails`
  ADD UNIQUE KEY `customer_email` (`customer_email`);

--
-- Indeks for tabel `customer_transfer_accounts`
--
ALTER TABLE `customer_transfer_accounts`
  ADD PRIMARY KEY (`accountid`),
  ADD KEY `accountid` (`accountid`),
  ADD KEY `merchantid` (`merchantid`),
  ADD KEY `accountid_2` (`accountid`),
  ADD KEY `CopyCustomer` (`merchantid`,`account_state`),
  ADD KEY `CopyCustomer2` (`merchantid`,`account_state`,`account_activated`);

--
-- Indeks for tabel `deals_registered_won`
--
ALTER TABLE `deals_registered_won`
  ADD PRIMARY KEY (`deal_id`);

--
-- Indeks for tabel `deployments_performed`
--
ALTER TABLE `deployments_performed`
  ADD PRIMARY KEY (`deployment_id`);

--
-- Indeks for tabel `documentation_code_example`
--
ALTER TABLE `documentation_code_example`
  ADD PRIMARY KEY (`example_id`);

--
-- Indeks for tabel `documentation_entities`
--
ALTER TABLE `documentation_entities`
  ADD PRIMARY KEY (`entities_id`);

--
-- Indeks for tabel `documentation_titles`
--
ALTER TABLE `documentation_titles`
  ADD PRIMARY KEY (`documentation_id`);

--
-- Indeks for tabel `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`document_id`);

--
-- Indeks for tabel `documents_groups`
--
ALTER TABLE `documents_groups`
  ADD PRIMARY KEY (`doc_group_id`);

--
-- Indeks for tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`jobid`);

--
-- Indeks for tabel `lead_database`
--
ALTER TABLE `lead_database`
  ADD UNIQUE KEY `domain` (`domain`);

--
-- Indeks for tabel `MailQueue`
--
ALTER TABLE `MailQueue`
  ADD PRIMARY KEY (`MailID`);

--
-- Indeks for tabel `MailSMSQueue`
--
ALTER TABLE `MailSMSQueue`
  ADD PRIMARY KEY (`sms_id`);

--
-- Indeks for tabel `mail_template`
--
ALTER TABLE `mail_template`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `mail_trigger_mails`
--
ALTER TABLE `mail_trigger_mails`
  ADD PRIMARY KEY (`mail_id`);

--
-- Indeks for tabel `mail_wrapper`
--
ALTER TABLE `mail_wrapper`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `manual_adjustments`
--
ALTER TABLE `manual_adjustments`
  ADD PRIMARY KEY (`adjustment_id`);

--
-- Indeks for tabel `maxtel`
--
ALTER TABLE `maxtel`
  ADD PRIMARY KEY (`phone_reg`),
  ADD KEY `StartSeconds` (`seconds`,`start_time`),
  ADD KEY `seconds` (`seconds`),
  ADD KEY `start_time` (`start_time`);

--
-- Indeks for tabel `merchant_outgoing_transactions`
--
ALTER TABLE `merchant_outgoing_transactions`
  ADD PRIMARY KEY (`ImportID`),
  ADD KEY `import_accepted` (`import_accepted`),
  ADD KEY `date_of_transaction` (`date_of_transaction`),
  ADD KEY `date_of_transaction_2` (`date_of_transaction`),
  ADD KEY `date_of_payment` (`date_of_payment`),
  ADD KEY `date_of_release` (`date_of_release`),
  ADD KEY `import_accepted_2` (`import_accepted`),
  ADD KEY `external_descriptor` (`external_descriptor`),
  ADD KEY `internal_descriptor` (`internal_descriptor`);

--
-- Indeks for tabel `merchant_outgoing_transactions_verification`
--
ALTER TABLE `merchant_outgoing_transactions_verification`
  ADD PRIMARY KEY (`v_id`);

--
-- Indeks for tabel `merchant_refunds_accounts`
--
ALTER TABLE `merchant_refunds_accounts`
  ADD PRIMARY KEY (`refund_id`);

--
-- Indeks for tabel `merchant_transfer_accounts_daily_overview`
--
ALTER TABLE `merchant_transfer_accounts_daily_overview`
  ADD PRIMARY KEY (`dateid`),
  ADD KEY `date_start` (`date_start`),
  ADD KEY `unique_code` (`unique_code`);

--
-- Indeks for tabel `navision_exports`
--
ALTER TABLE `navision_exports`
  ADD PRIMARY KEY (`exports_id`);

--
-- Indeks for tabel `navision_review`
--
ALTER TABLE `navision_review`
  ADD PRIMARY KEY (`AutoID`);

--
-- Indeks for tabel `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `new_website_blog`
--
ALTER TABLE `new_website_blog`
  ADD PRIMARY KEY (`blog_id`);

--
-- Indeks for tabel `onboarding_data_searcher`
--
ALTER TABLE `onboarding_data_searcher`
  ADD PRIMARY KEY (`searcher_id`);

--
-- Indeks for tabel `onboarding_data_searcher_url`
--
ALTER TABLE `onboarding_data_searcher_url`
  ADD PRIMARY KEY (`searcher_url_id`);

--
-- Indeks for tabel `onboarding_pipedrive_activities`
--
ALTER TABLE `onboarding_pipedrive_activities`
  ADD PRIMARY KEY (`act_id`);

--
-- Indeks for tabel `payment_download`
--
ALTER TABLE `payment_download`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `payment_link`
--
ALTER TABLE `payment_link`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `payment_links_templates`
--
ALTER TABLE `payment_links_templates`
  ADD PRIMARY KEY (`template_id`);

--
-- Indeks for tabel `payon_clearing_institutes`
--
ALTER TABLE `payon_clearing_institutes`
  ADD PRIMARY KEY (`institute_id`),
  ADD UNIQUE KEY `payon_institute_id` (`payon_institute_id`);

--
-- Indeks for tabel `pdf_customers`
--
ALTER TABLE `pdf_customers`
  ADD PRIMARY KEY (`pdf_id`);

--
-- Indeks for tabel `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`plugin_id`),
  ADD UNIQUE KEY `plugin_identifier` (`plugin_identifier`);

--
-- Indeks for tabel `plugin_installed`
--
ALTER TABLE `plugin_installed`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `pricing_plans`
--
ALTER TABLE `pricing_plans`
  ADD PRIMARY KEY (`pricing_id`);

--
-- Indeks for tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indeks for tabel `products_features`
--
ALTER TABLE `products_features`
  ADD PRIMARY KEY (`features_id`);

--
-- Indeks for tabel `products_sync_attributes`
--
ALTER TABLE `products_sync_attributes`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Indeks for tabel `products_sync_product`
--
ALTER TABLE `products_sync_product`
  ADD PRIMARY KEY (`unique_id`);

--
-- Indeks for tabel `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`qid`);

--
-- Indeks for tabel `questions_groups`
--
ALTER TABLE `questions_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `rebilling_customer_products`
--
ALTER TABLE `rebilling_customer_products`
  ADD PRIMARY KEY (`rebilling_products_id`);

--
-- Indeks for tabel `reviewlist`
--
ALTER TABLE `reviewlist`
  ADD PRIMARY KEY (`reviewid`);

--
-- Indeks for tabel `robots`
--
ALTER TABLE `robots`
  ADD PRIMARY KEY (`robot_id`);

--
-- Indeks for tabel `robot_actions`
--
ALTER TABLE `robot_actions`
  ADD PRIMARY KEY (`actionid`);

--
-- Indeks for tabel `robot_verify_data_on_website_url_identificators`
--
ALTER TABLE `robot_verify_data_on_website_url_identificators`
  ADD PRIMARY KEY (`identificator_id`);

--
-- Indeks for tabel `secure_trading_merchants`
--
ALTER TABLE `secure_trading_merchants`
  ADD PRIMARY KEY (`secure_id`);

--
-- Indeks for tabel `server_usage`
--
ALTER TABLE `server_usage`
  ADD PRIMARY KEY (`usage_id`);

--
-- Indeks for tabel `settlement_holidays`
--
ALTER TABLE `settlement_holidays`
  ADD PRIMARY KEY (`holiday_id`);

--
-- Indeks for tabel `shortly_logger`
--
ALTER TABLE `shortly_logger`
  ADD PRIMARY KEY (`logger_id`);

--
-- Indeks for tabel `sql_debug_log`
--
ALTER TABLE `sql_debug_log`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `stl_mids`
--
ALTER TABLE `stl_mids`
  ADD PRIMARY KEY (`stl_id`);

--
-- Indeks for tabel `subscriptions_contacts`
--
ALTER TABLE `subscriptions_contacts`
  ADD PRIMARY KEY (`subscriber_id`);

--
-- Indeks for tabel `subscriptions_dunning`
--
ALTER TABLE `subscriptions_dunning`
  ADD PRIMARY KEY (`dunning_id`);

--
-- Indeks for tabel `subscriptions_interest`
--
ALTER TABLE `subscriptions_interest`
  ADD PRIMARY KEY (`interest_id`);

--
-- Indeks for tabel `subscriptions_invoices`
--
ALTER TABLE `subscriptions_invoices`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indeks for tabel `subscriptions_plan`
--
ALTER TABLE `subscriptions_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `subscriptions_products`
--
ALTER TABLE `subscriptions_products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indeks for tabel `subscriptions_subscriptions`
--
ALTER TABLE `subscriptions_subscriptions`
  ADD PRIMARY KEY (`subscription_id`);

--
-- Indeks for tabel `system_errors`
--
ALTER TABLE `system_errors`
  ADD PRIMARY KEY (`errorid`);

--
-- Indeks for tabel `terminals`
--
ALTER TABLE `terminals`
  ADD PRIMARY KEY (`TerminalID`),
  ADD UNIQUE KEY `PN` (`PN`);

--
-- Indeks for tabel `terrorlist`
--
ALTER TABLE `terrorlist`
  ADD PRIMARY KEY (`ter_id`);

--
-- Indeks for tabel `toturials`
--
ALTER TABLE `toturials`
  ADD PRIMARY KEY (`toturialid`);

--
-- Indeks for tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`TransID`);

--
-- Indeks for tabel `transaction_touches`
--
ALTER TABLE `transaction_touches`
  ADD PRIMARY KEY (`TouchID`);

--
-- Indeks for tabel `translate`
--
ALTER TABLE `translate`
  ADD PRIMARY KEY (`TranslateID`),
  ADD KEY `en-gb` (`en-gb`,`nb-no`,`se-se`,`sk-sk`,`de-de`,`nl-nl`,`fr-fr`,`pl-pl`,`ru-ru`,`ro-ro`,`es-es`);
ALTER TABLE `translate` ADD FULLTEXT KEY `Texture` (`Texture`);
ALTER TABLE `translate` ADD FULLTEXT KEY `TextureLang` (`Texture`,`lang`);

--
-- Indeks for tabel `unitests`
--
ALTER TABLE `unitests`
  ADD PRIMARY KEY (`uni_id`);

--
-- Indeks for tabel `unitest_results`
--
ALTER TABLE `unitest_results`
  ADD PRIMARY KEY (`result_id`);

--
-- Indeks for tabel `user_token_logging`
--
ALTER TABLE `user_token_logging`
  ADD PRIMARY KEY (`log_id`);

--
-- Indeks for tabel `viabill_logger`
--
ALTER TABLE `viabill_logger`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `webservice_logger`
--
ALTER TABLE `webservice_logger`
  ADD PRIMARY KEY (`serviceid`);

--
-- Indeks for tabel `yourpark_car`
--
ALTER TABLE `yourpark_car`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numberplate_country` (`numberplate`,`country`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indeks for tabel `yourpark_country`
--
ALTER TABLE `yourpark_country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `country` (`country`);

--
-- Indeks for tabel `yourpark_parking`
--
ALTER TABLE `yourpark_parking`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `yourpark_zones`
--
ALTER TABLE `yourpark_zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `api_globals`
--
ALTER TABLE `api_globals`
  MODIFY `api_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `api_groups`
--
ALTER TABLE `api_groups`
  MODIFY `api_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `api_params`
--
ALTER TABLE `api_params`
  MODIFY `api_param` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `api_requests`
--
ALTER TABLE `api_requests`
  MODIFY `request_id` bigint NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `app_dk_economic_sync`
--
ALTER TABLE `app_dk_economic_sync`
  MODIFY `sync_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `app_economic_sync`
--
ALTER TABLE `app_economic_sync`
  MODIFY `sync_id` int NOT NULL AUTO_INCREMENT COMMENT 'Auto ID';

--
-- Tilføj AUTO_INCREMENT i tabel `app_user_invoicing`
--
ALTER TABLE `app_user_invoicing`
  MODIFY `invoice_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `app_user_pricing`
--
ALTER TABLE `app_user_pricing`
  MODIFY `user_pricing_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `bambora_merchants`
--
ALTER TABLE `bambora_merchants`
  MODIFY `bambora_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `beta_codes`
--
ALTER TABLE `beta_codes`
  MODIFY `betaid` int NOT NULL AUTO_INCREMENT COMMENT 'BetaID';

--
-- Tilføj AUTO_INCREMENT i tabel `blacklist_merchant_tokens`
--
ALTER TABLE `blacklist_merchant_tokens`
  MODIFY `blacklist_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `blog`
--
ALTER TABLE `blog`
  MODIFY `blog_id` int NOT NULL AUTO_INCREMENT COMMENT 'Auto ID';

--
-- Tilføj AUTO_INCREMENT i tabel `campaign_codes`
--
ALTER TABLE `campaign_codes`
  MODIFY `campaignid` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `company_review`
--
ALTER TABLE `company_review`
  MODIFY `ReviewID` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `consumer_data`
--
ALTER TABLE `consumer_data`
  MODIFY `consumer_id` bigint NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `crawler`
--
ALTER TABLE `crawler`
  MODIFY `CrawlerID` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `crawler_trustpilot`
--
ALTER TABLE `crawler_trustpilot`
  MODIFY `CrawlerID` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `crm_customers`
--
ALTER TABLE `crm_customers`
  MODIFY `crmID` int NOT NULL AUTO_INCREMENT COMMENT 'Unique ID';

--
-- Tilføj AUTO_INCREMENT i tabel `crm_dashboard`
--
ALTER TABLE `crm_dashboard`
  MODIFY `crm_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `crm_login`
--
ALTER TABLE `crm_login`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT COMMENT 'UserID';

--
-- Tilføj AUTO_INCREMENT i tabel `crm_login_psp`
--
ALTER TABLE `crm_login_psp`
  MODIFY `pspid` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `crm_login_psp_monthly_data_months`
--
ALTER TABLE `crm_login_psp_monthly_data_months`
  MODIFY `month_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `crm_queries`
--
ALTER TABLE `crm_queries`
  MODIFY `query_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_acquirer`
--
ALTER TABLE `customer_acquirer`
  MODIFY `cacquirer_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_activities`
--
ALTER TABLE `customer_activities`
  MODIFY `activity_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_agreement`
--
ALTER TABLE `customer_agreement`
  MODIFY `agreement` int NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `customer_agreement_reviews`
--
ALTER TABLE `customer_agreement_reviews`
  MODIFY `review_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_app_settings`
--
ALTER TABLE `customer_app_settings`
  MODIFY `setting_id` bigint NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_complaints`
--
ALTER TABLE `customer_complaints`
  MODIFY `complaintid` int NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `customer_csv`
--
ALTER TABLE `customer_csv`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_cvr_audit`
--
ALTER TABLE `customer_cvr_audit`
  MODIFY `audit_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_data_collection`
--
ALTER TABLE `customer_data_collection`
  MODIFY `collection_id` bigint NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_domains`
--
ALTER TABLE `customer_domains`
  MODIFY `DomainID` bigint NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_expected_revenue`
--
ALTER TABLE `customer_expected_revenue`
  MODIFY `recenueID` int NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `customer_important_notifications`
--
ALTER TABLE `customer_important_notifications`
  MODIFY `notification_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_invoices`
--
ALTER TABLE `customer_invoices`
  MODIFY `invoiceID` bigint NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `customer_lead`
--
ALTER TABLE `customer_lead`
  MODIFY `leadid` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_logins`
--
ALTER TABLE `customer_logins`
  MODIFY `LoginID` int NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `customer_logins_activity`
--
ALTER TABLE `customer_logins_activity`
  MODIFY `activityid` int NOT NULL AUTO_INCREMENT COMMENT 'Unique Identifier';

--
-- Tilføj AUTO_INCREMENT i tabel `customer_logins_apppassword`
--
ALTER TABLE `customer_logins_apppassword`
  MODIFY `password_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_login_session_details`
--
ALTER TABLE `customer_login_session_details`
  MODIFY `details_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_owners`
--
ALTER TABLE `customer_owners`
  MODIFY `OwnerFileID` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_payment_download`
--
ALTER TABLE `customer_payment_download`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_payon`
--
ALTER TABLE `customer_payon`
  MODIFY `channelID` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_payon_psp`
--
ALTER TABLE `customer_payon_psp`
  MODIFY `pspid` int NOT NULL AUTO_INCREMENT COMMENT 'Auto ID';

--
-- Tilføj AUTO_INCREMENT i tabel `customer_products`
--
ALTER TABLE `customer_products`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `customer_products_groups`
--
ALTER TABLE `customer_products_groups`
  MODIFY `group_id` int NOT NULL AUTO_INCREMENT COMMENT 'Group ID';

--
-- Tilføj AUTO_INCREMENT i tabel `customer_product_stock_decrease`
--
ALTER TABLE `customer_product_stock_decrease`
  MODIFY `decrease_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_subscriptions`
--
ALTER TABLE `customer_subscriptions`
  MODIFY `subscription_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_transfer_accounts`
--
ALTER TABLE `customer_transfer_accounts`
  MODIFY `accountid` bigint NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `deals_registered_won`
--
ALTER TABLE `deals_registered_won`
  MODIFY `deal_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `deployments_performed`
--
ALTER TABLE `deployments_performed`
  MODIFY `deployment_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `documentation_code_example`
--
ALTER TABLE `documentation_code_example`
  MODIFY `example_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `documentation_entities`
--
ALTER TABLE `documentation_entities`
  MODIFY `entities_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `documentation_titles`
--
ALTER TABLE `documentation_titles`
  MODIFY `documentation_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `documents`
--
ALTER TABLE `documents`
  MODIFY `document_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `documents_groups`
--
ALTER TABLE `documents_groups`
  MODIFY `doc_group_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `jobid` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `MailQueue`
--
ALTER TABLE `MailQueue`
  MODIFY `MailID` int NOT NULL AUTO_INCREMENT COMMENT 'Auto ID';

--
-- Tilføj AUTO_INCREMENT i tabel `MailSMSQueue`
--
ALTER TABLE `MailSMSQueue`
  MODIFY `sms_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `mail_template`
--
ALTER TABLE `mail_template`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `mail_trigger_mails`
--
ALTER TABLE `mail_trigger_mails`
  MODIFY `mail_id` bigint NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `mail_wrapper`
--
ALTER TABLE `mail_wrapper`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `manual_adjustments`
--
ALTER TABLE `manual_adjustments`
  MODIFY `adjustment_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `maxtel`
--
ALTER TABLE `maxtel`
  MODIFY `phone_reg` bigint NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `merchant_outgoing_transactions`
--
ALTER TABLE `merchant_outgoing_transactions`
  MODIFY `ImportID` bigint NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `merchant_outgoing_transactions_verification`
--
ALTER TABLE `merchant_outgoing_transactions_verification`
  MODIFY `v_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `merchant_refunds_accounts`
--
ALTER TABLE `merchant_refunds_accounts`
  MODIFY `refund_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `merchant_transfer_accounts_daily_overview`
--
ALTER TABLE `merchant_transfer_accounts_daily_overview`
  MODIFY `dateid` bigint NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `navision_exports`
--
ALTER TABLE `navision_exports`
  MODIFY `exports_id` bigint NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `navision_review`
--
ALTER TABLE `navision_review`
  MODIFY `AutoID` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Unique Identifier';

--
-- Tilføj AUTO_INCREMENT i tabel `new_website_blog`
--
ALTER TABLE `new_website_blog`
  MODIFY `blog_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `onboarding_data_searcher`
--
ALTER TABLE `onboarding_data_searcher`
  MODIFY `searcher_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `onboarding_data_searcher_url`
--
ALTER TABLE `onboarding_data_searcher_url`
  MODIFY `searcher_url_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `onboarding_pipedrive_activities`
--
ALTER TABLE `onboarding_pipedrive_activities`
  MODIFY `act_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `payment_download`
--
ALTER TABLE `payment_download`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `payment_link`
--
ALTER TABLE `payment_link`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `payment_links_templates`
--
ALTER TABLE `payment_links_templates`
  MODIFY `template_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `payon_clearing_institutes`
--
ALTER TABLE `payon_clearing_institutes`
  MODIFY `institute_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `pdf_customers`
--
ALTER TABLE `pdf_customers`
  MODIFY `pdf_id` bigint NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `plugins`
--
ALTER TABLE `plugins`
  MODIFY `plugin_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `plugin_installed`
--
ALTER TABLE `plugin_installed`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `pricing_plans`
--
ALTER TABLE `pricing_plans`
  MODIFY `pricing_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT COMMENT 'Product ID';

--
-- Tilføj AUTO_INCREMENT i tabel `products_features`
--
ALTER TABLE `products_features`
  MODIFY `features_id` int NOT NULL AUTO_INCREMENT COMMENT 'Auto ID';

--
-- Tilføj AUTO_INCREMENT i tabel `products_sync_attributes`
--
ALTER TABLE `products_sync_attributes`
  MODIFY `attribute_id` bigint NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `products_sync_product`
--
ALTER TABLE `products_sync_product`
  MODIFY `unique_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `questions`
--
ALTER TABLE `questions`
  MODIFY `qid` int NOT NULL AUTO_INCREMENT COMMENT 'Auto ID';

--
-- Tilføj AUTO_INCREMENT i tabel `questions_groups`
--
ALTER TABLE `questions_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `rebilling_customer_products`
--
ALTER TABLE `rebilling_customer_products`
  MODIFY `rebilling_products_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `reviewlist`
--
ALTER TABLE `reviewlist`
  MODIFY `reviewid` int NOT NULL AUTO_INCREMENT COMMENT 'Review ID';

--
-- Tilføj AUTO_INCREMENT i tabel `robots`
--
ALTER TABLE `robots`
  MODIFY `robot_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `robot_actions`
--
ALTER TABLE `robot_actions`
  MODIFY `actionid` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `robot_verify_data_on_website_url_identificators`
--
ALTER TABLE `robot_verify_data_on_website_url_identificators`
  MODIFY `identificator_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `secure_trading_merchants`
--
ALTER TABLE `secure_trading_merchants`
  MODIFY `secure_id` bigint NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `server_usage`
--
ALTER TABLE `server_usage`
  MODIFY `usage_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `settlement_holidays`
--
ALTER TABLE `settlement_holidays`
  MODIFY `holiday_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `shortly_logger`
--
ALTER TABLE `shortly_logger`
  MODIFY `logger_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `sql_debug_log`
--
ALTER TABLE `sql_debug_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `stl_mids`
--
ALTER TABLE `stl_mids`
  MODIFY `stl_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `subscriptions_contacts`
--
ALTER TABLE `subscriptions_contacts`
  MODIFY `subscriber_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `subscriptions_dunning`
--
ALTER TABLE `subscriptions_dunning`
  MODIFY `dunning_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `subscriptions_interest`
--
ALTER TABLE `subscriptions_interest`
  MODIFY `interest_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `subscriptions_invoices`
--
ALTER TABLE `subscriptions_invoices`
  MODIFY `invoice_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `subscriptions_plan`
--
ALTER TABLE `subscriptions_plan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `subscriptions_products`
--
ALTER TABLE `subscriptions_products`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `subscriptions_subscriptions`
--
ALTER TABLE `subscriptions_subscriptions`
  MODIFY `subscription_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `system_errors`
--
ALTER TABLE `system_errors`
  MODIFY `errorid` int NOT NULL AUTO_INCREMENT COMMENT 'SystemID';

--
-- Tilføj AUTO_INCREMENT i tabel `terminals`
--
ALTER TABLE `terminals`
  MODIFY `TerminalID` int NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `terrorlist`
--
ALTER TABLE `terrorlist`
  MODIFY `ter_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `toturials`
--
ALTER TABLE `toturials`
  MODIFY `toturialid` int NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `TransID` bigint NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `transaction_touches`
--
ALTER TABLE `transaction_touches`
  MODIFY `TouchID` bigint NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `translate`
--
ALTER TABLE `translate`
  MODIFY `TranslateID` bigint NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `unitests`
--
ALTER TABLE `unitests`
  MODIFY `uni_id` int NOT NULL AUTO_INCREMENT COMMENT 'Automated ID';

--
-- Tilføj AUTO_INCREMENT i tabel `unitest_results`
--
ALTER TABLE `unitest_results`
  MODIFY `result_id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `user_token_logging`
--
ALTER TABLE `user_token_logging`
  MODIFY `log_id` int NOT NULL AUTO_INCREMENT COMMENT 'Token Log';

--
-- Tilføj AUTO_INCREMENT i tabel `viabill_logger`
--
ALTER TABLE `viabill_logger`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `webservice_logger`
--
ALTER TABLE `webservice_logger`
  MODIFY `serviceid` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `yourpark_car`
--
ALTER TABLE `yourpark_car`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `yourpark_parking`
--
ALTER TABLE `yourpark_parking`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `yourpark_parking`
--
ALTER TABLE `yourpark_parking`
  ADD CONSTRAINT `yourpark_parking_ibfk_1` FOREIGN KEY (`id`) REFERENCES `yourpark_car` (`id`) ON UPDATE CASCADE;

--
-- Begrænsninger for tabel `yourpark_zones`
--
ALTER TABLE `yourpark_zones`
  ADD CONSTRAINT `yourpark_zones_ibfk_1` FOREIGN KEY (`zone_id`) REFERENCES `yourpark_parking` (`id`) ON UPDATE CASCADE;
