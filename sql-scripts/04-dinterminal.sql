-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Vært: aurora-1.cluster-czl14h06ail9.eu-west-1.rds.amazonaws.com
-- Genereringstid: 12. 05 2020 kl. 13:31:34
-- Serverversion: 5.6.10
-- PHP-version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dinterminal`
--

-- --------------------------------------------------------
USE dinterminal;
--
-- Struktur-dump for tabellen `api_globals`
--

CREATE TABLE `api_globals` (
  `api_id` int(7) NOT NULL DEFAULT '0',
  `path` varchar(25) NOT NULL DEFAULT '',
  `master_name` varchar(255) NOT NULL DEFAULT '',
  `master_description` varchar(255) NOT NULL DEFAULT '',
  `enabled` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `api_groups`
--

CREATE TABLE `api_groups` (
  `api_id` int(7) NOT NULL  DEFAULT '0',
  `api_group_id` int(7) NOT NULL DEFAULT '0',
  `api_group_type` varchar(4) NOT NULL DEFAULT '',
  `api_method_name` varchar(255) NOT NULL DEFAULT '',
  `api_title` varchar(255) NOT NULL DEFAULT '',
  `api_description` longtext NOT NULL DEFAULT '',
  `enabled` smallint(1) NOT NULL DEFAULT '0',
  `api_path` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `api_params`
--

CREATE TABLE `api_params` (
  `api_param` int(7) NOT NULL DEFAULT '0',
  `api_method` int(7) NOT NULL DEFAULT '0',
  `api_order` int(7) NOT NULL DEFAULT '0',
  `api_param_path` varchar(50) NOT NULL DEFAULT '',
  `api_param_title` varchar(255) NOT NULL DEFAULT '',
  `api_param_default` varchar(75) NOT NULL DEFAULT '',
  `api_param_descriptor` varchar(255) NOT NULL DEFAULT '',
  `api_param_location` varchar(10) NOT NULL DEFAULT 'query',
  `api_param_required` smallint(1) NOT NULL DEFAULT '1',
  `api_param_type` varchar(25) NOT NULL DEFAULT '',
  `enabled` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `api_requests`
--

CREATE TABLE `api_requests` (
  `request_id` bigint(10) NOT NULL DEFAULT '0',
  `request_function` varchar(20) NOT NULL DEFAULT '',
  `request_time` bigint(10) NOT NULL DEFAULT '0',
  `request_content` longtext NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `app_data`
--

CREATE TABLE `app_data` (
  `app_id` varchar(50) NOT NULL DEFAULT '',
  `merchant_token` varchar(128) NOT NULL DEFAULT '',
  `app_key` varchar(50) NOT NULL DEFAULT '',
  `app_value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `app_dk_economic_sync`
--

CREATE TABLE `app_dk_economic_sync` (
  `sync_id` int(12) NOT NULL DEFAULT '0',
  `merchant_token` varchar(64) NOT NULL DEFAULT '',
  `payment_id` int(12) NOT NULL DEFAULT '0',
  `action_id` int(10) NOT NULL DEFAULT '0',
  `dateid` int(12) NOT NULL DEFAULT '0',
  `synced` smallint(1) NOT NULL DEFAULT '0',
  `errorCode` varchar(20) NOT NULL DEFAULT '',
  `message` longtext NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `app_economic_sync`
--

CREATE TABLE `app_economic_sync` (
  `sync_id` int(7) NOT NULL COMMENT 'Auto ID',
  `service` varchar(50) NOT NULL DEFAULT '',
  `economic_id` int(5) NOT NULL DEFAULT '25',
  `should_not_sync` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `app_user_invoicing`
--

CREATE TABLE `app_user_invoicing` (
  `invoice_id` int(11) NOT NULL DEFAULT '0',
  `pricing_id` int(6) NOT NULL DEFAULT '0',
  `invoice_token` varchar(32) NOT NULL DEFAULT '',
  `merchant_token` varchar(64) NOT NULL DEFAULT '',
  `invoice_period_start` int(12) NOT NULL DEFAULT '0',
  `invoice_period_end` int(12) NOT NULL DEFAULT '0',
  `invoice_amount` int(10) NOT NULL DEFAULT '0',
  `invoice_currency` int(3) NOT NULL DEFAULT '0',
  `invoice_paid` smallint(1) NOT NULL DEFAULT '0',
  `invoice_paid_date` int(8) NOT NULL DEFAULT '0',
  `invoice_next_retry` bigint(12) NOT NULL DEFAULT '0',
  `invoice_added_economic` smallint(4) NOT NULL DEFAULT '0',
  `invoice_paid_economic` smallint(1) NOT NULL DEFAULT '0',
  `invoice_settled_internally` smallint(1) NOT NULL DEFAULT '0' COMMENT 'Have funds been deducted from Merchant Transfer Account to Operational Credit Account'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `app_user_pricing`
--

CREATE TABLE `app_user_pricing` (
  `user_pricing_id` int(8) NOT NULL DEFAULT '0',
  `merchant_token` varchar(64) NOT NULL DEFAULT '',
  `service` varchar(255) NOT NULL DEFAULT '',
  `service_text` varchar(255) NOT NULL DEFAULT '',
  `single_service` smallint(1) NOT NULL DEFAULT '0' COMMENT 'One time service fee',
  `billing_period` int(2) NOT NULL DEFAULT '1' COMMENT 'Number of months in renewal',
  `billing_vat` int(2) NOT NULL DEFAULT '25',
  `next_billing` bigint(12) NOT NULL DEFAULT '0',
  `next_amount` varchar(10) NOT NULL DEFAULT '',
  `next_currency` int(3) NOT NULL DEFAULT '208',
  `next_stopped` int(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `bambora_merchants`
--

CREATE TABLE `bambora_merchants` (
  `bambora_id` int(11) NOT NULL DEFAULT '0',
  `merchant_token` varchar(255) NOT NULL DEFAULT '',
  `merchant_id` int(10) NOT NULL DEFAULT '0',
  `proxy_mid` int(8) NOT NULL DEFAULT '0',
  `timestamp` bigint(12) NOT NULL DEFAULT '0',
  `status` smallint(1) NOT NULL DEFAULT '0',
  `file_confirm_name` varchar(50) NOT NULL DEFAULT '',
  `rejection_reason_code` smallint(2) NOT NULL DEFAULT '0',
  `last_updated` bigint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `bambora_mids`
--

CREATE TABLE `bambora_mids` (
  `mcc` int(7) NOT NULL DEFAULT '0',
  `bambora_mid` int(10) NOT NULL DEFAULT '0',
  `method` enum('pos','ecom') NOT NULL DEFAULT 'pos'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `bambora_mids` (`mcc`, `bambora_mid`, `method`) VALUES ('1', '0', 'pos');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `beta_codes`
--

CREATE TABLE `beta_codes` (
  `betaid` int(7) NOT NULL COMMENT 'BetaID' DEFAULT '0',
  `beta_promotion_id` varchar(20) NOT NULL DEFAULT '',
  `issued_time` int(12) NOT NULL DEFAULT '0',
  `used_time` int(12) NOT NULL DEFAULT '0',
  `used` smallint(1) NOT NULL DEFAULT '0',
  `merchantid` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `blog`
--

CREATE TABLE `blog` (
  `blog_id` int(7) NOT NULL COMMENT 'Auto ID' DEFAULT '0',
  `category` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Blog title' DEFAULT '',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Blog Image' DEFAULT '',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Blog Content' DEFAULT '',
  `date` bigint(12) NOT NULL COMMENT 'Blog date as Unixtimestamp' DEFAULT '0',
  `read` int(5) NOT NULL DEFAULT '0' COMMENT 'Times article has been read' DEFAULT '0',
  `active` smallint(1) NOT NULL DEFAULT '0' COMMENT 'IF 1 then active blogpost' DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `campaign_codes`
--

CREATE TABLE `campaign_codes` (
  `campaignid` int(7) NOT NULL DEFAULT '0',
  `campaign_package` int(7) NOT NULL DEFAULT '0',
  `package_months` int(3) NOT NULL DEFAULT '0',
  `free_transactions` int(4) NOT NULL DEFAULT '0' COMMENT 'If we are giving free transactions',
  `campaign_code` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `chatbot`
--

CREATE TABLE `chatbot` (
  `communication_string` varchar(20) NOT NULL DEFAULT '',
  `timestamp` bigint(12) NOT NULL DEFAULT '0',
  `answer` varchar(255) NOT NULL DEFAULT '',
  `tag` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `company_review`
--

CREATE TABLE `company_review` (
  `ReviewID` int(5) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '0',
  `phone` int(8) NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `website` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `consumer_data`
--

CREATE TABLE `consumer_data` (
  `consumer_id` bigint(12) NOT NULL DEFAULT '0',
  `consumer_merchantid` int(10) NOT NULL DEFAULT '0',
  `creationtime` bigint(12) NOT NULL DEFAULT '0',
  `consumer_cardno` varchar(255) NOT NULL DEFAULT '',
  `consumer_name` varchar(255) NOT NULL DEFAULT '',
  `consumer_orders` int(5) NOT NULL COMMENT 'Amount of orders through Yourpay' DEFAULT '0',
  `consumer_ip` bigint(12) NOT NULL COMMENT 'ip2long encoded' DEFAULT '0',
  `consumer_invoice_address` varchar(255) NOT NULL DEFAULT '',
  `consumer_invoice_postal` varchar(255) NOT NULL DEFAULT '',
  `consumer_invoice_city` varchar(255) NOT NULL DEFAULT '',
  `consumer_invoice_country` varchar(255) NOT NULL DEFAULT '',
  `consumer_shipping_address` varchar(255) NOT NULL DEFAULT '',
  `consumer_shipping_postal` varchar(255) NOT NULL DEFAULT '',
  `consumer_shipping_city` varchar(255) NOT NULL DEFAULT '',
  `consumer_shipping_country` varchar(255) NOT NULL DEFAULT '',
  `partly_match_other_consumerid` int(6) NOT NULL DEFAULT '0' COMMENT 'If set then ID on other consumer that we have a match towards',
  `partly_match_type` varchar(255) NOT NULL COMMENT 'Description on what value that partly matched other customerid' DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `consumer_login_sessions_mobile`
--

CREATE TABLE `consumer_login_sessions_mobile` (
  `merchantid` int(8) NOT NULL DEFAULT '0',
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `timestp` bigint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `consumer_names`
--

CREATE TABLE `consumer_names` (
  `nameid` int(50) NOT NULL DEFAULT '0',
  `consumer_name` varchar(255) NOT NULL DEFAULT '',
  `general_age` int(3) NOT NULL DEFAULT '0',
  `sex` enum('Male','Female','Unknown') NOT NULL DEFAULT 'Unknown'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `country`
--

CREATE TABLE `country` (
  `country_code` int(3) NOT NULL DEFAULT '0',
  `country_name` varchar(255) NOT NULL DEFAULT '',
  `phone_code` varchar(6) NOT NULL DEFAULT '',
  `code2` varchar(2) NOT NULL DEFAULT '',
  `code3` varchar(3) NOT NULL DEFAULT '',
  `country_active` smallint(1) NOT NULL DEFAULT '0',
  `country_flag` varchar(255) NOT NULL DEFAULT '',
  `country_lang` varchar(5) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `crawler`
--

CREATE TABLE `crawler` (
  `CrawlerID` int(7) NOT NULL DEFAULT '0',
  `shaencrypt` char(40) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `crawler_trustpilot`
--

CREATE TABLE `crawler_trustpilot` (
  `CrawlerID` int(7) NOT NULL DEFAULT '0',
  `shaencrypt` char(40) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `lastview` bigint(12) NOT NULL DEFAULT '0',
  `lastcatview` bigint(12) NOT NULL DEFAULT '0',
  `reviewpage` smallint(1) NOT NULL DEFAULT '0',
  `users` smallint(1) NOT NULL DEFAULT '0',
  `reviewpagesub` smallint(1) NOT NULL DEFAULT '0',
  `reviews` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `crm_customers`
--

CREATE TABLE `crm_customers` (
  `crmID` int(7) NOT NULL COMMENT 'Unique ID' DEFAULT '0',
  `crmwebsite` varchar(100) NOT NULL COMMENT 'Website' DEFAULT '',
  `alreadycustomer` smallint(1) NOT NULL DEFAULT '0' COMMENT 'If 1 then already customer',
  `vat` varchar(30) NOT NULL DEFAULT '',
  `shopplatform` varchar(20) NOT NULL DEFAULT '',
  `dns` varchar(30) NOT NULL DEFAULT '',
  `leadowner` int(3) NOT NULL COMMENT 'Lead owner' DEFAULT '0',
  `comments` longtext NOT NULL DEFAULT '',
  `callback` bigint(12) NOT NULL COMMENT 'Unix timestamp' DEFAULT '0',
  `state` int(2) NOT NULL DEFAULT '0',
  `contactname` varchar(255) NOT NULL DEFAULT '',
  `contactmail` varchar(255) NOT NULL DEFAULT '',
  `customer_cvr_state` int(1) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `crm_login`
--

CREATE TABLE `crm_login` (
  `user_id` int(6) NOT NULL COMMENT 'UserID' DEFAULT '0',
  `username` varchar(255) NOT NULL COMMENT 'Username' DEFAULT '',
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `mobileno` bigint(10) NOT NULL DEFAULT '0',
  `localno` int(4) NOT NULL DEFAULT '1',
  `useremail` varchar(255) NOT NULL DEFAULT '',
  `pwd` blob NOT NULL COMMENT 'password' DEFAULT '',
  `pwd2` varchar(60) NOT NULL DEFAULT '',
  `sha256` int(1) NOT NULL DEFAULT '0',
  `pincode` varchar(90) NOT NULL DEFAULT '',
  `heystack` varchar(32) NOT NULL COMMENT 'password heystack' DEFAULT '',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT 'If 1 then active',
  `accesslevel` int(1) NOT NULL DEFAULT '1' COMMENT 'Access level 1 = standard, 10 is Directors',
  `session_id` varchar(64) NOT NULL DEFAULT '',
  `psp` smallint(1) NOT NULL DEFAULT '0',
  `mobilesec` varchar(30) NOT NULL DEFAULT '',
  `added_mailchimp` smallint(1) NOT NULL DEFAULT '0',
  `group_member` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `crm_login_ip`
--

CREATE TABLE `crm_login_ip` (
  `userid` varchar(255) NOT NULL DEFAULT '',
  `merchantid` int(12) NOT NULL DEFAULT '0',
  `ip` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `crm_login_psp`
--

CREATE TABLE `crm_login_psp` (
  `pspid` int(2) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `short_description` longtext NOT NULL DEFAULT '',
  `pipedrive_id` int(10) NOT NULL DEFAULT '0',
  `amount_of_merchants` int(3) NOT NULL DEFAULT '0',
  `response` varchar(255) NOT NULL DEFAULT '',
  `settlement_days` int(3) NOT NULL DEFAULT '14',
  `merchant_percentage` int(4) NOT NULL DEFAULT '225' COMMENT 'Percentage merchant is paying to Yourpay',
  `partner_kickback` int(3) NOT NULL DEFAULT '0',
  `finders_fee` int(3) NOT NULL DEFAULT '0',
  `finders_fee_currency` int(3) NOT NULL DEFAULT '208',
  `percentage` int(2) NOT NULL DEFAULT '5' COMMENT 'Percentage in Kickback / 100',
  `volume_total` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Total volume on PSP',
  `kickback_total` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Total kickback',
  `kickback_released` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Kickback release',
  `last_kickbackrelease` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Timestamp for last release of kickback',
  `last_updated` bigint(12) NOT NULL DEFAULT '0',
  `deactivated` smallint(1) NOT NULL DEFAULT '0',
  `last_update` int(11) NOT NULL DEFAULT '0',
  `merchants` int(8) NOT NULL DEFAULT '0',
  `total_volume` bigint(12) NOT NULL DEFAULT '0',
  `total_kickback` bigint(12) NOT NULL DEFAULT '0',
  `total_release` bigint(12) NOT NULL DEFAULT '0',
  `bank_reg` int(4) NOT NULL DEFAULT '0',
  `bank_acc` int(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `crm_login_psp_monthly_data`
--

CREATE TABLE `crm_login_psp_monthly_data` (
  `month_start` bigint(12) NOT NULL DEFAULT '0',
  `pspid` int(7) NOT NULL DEFAULT '0',
  `transactions` bigint(12) NOT NULL DEFAULT '0',
  `volume` bigint(12) NOT NULL DEFAULT '0',
  `volume_estimated` bigint(10) NOT NULL DEFAULT '0',
  `paid` smallint(1) NOT NULL DEFAULT '0',
  `kickback` bigint(12) NOT NULL DEFAULT '0',
  `customers` bigint(12) NOT NULL DEFAULT '0',
  `month_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `crm_login_psp_monthly_data_months`
--

CREATE TABLE `crm_login_psp_monthly_data_months` (
  `month_id` int(7) NOT NULL DEFAULT '0',
  `month_start` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `crm_login_psp_volume`
--

CREATE TABLE `crm_login_psp_volume` (
  `pspid` int(6) NOT NULL DEFAULT '0',
  `date_start` bigint(12) NOT NULL DEFAULT '0',
  `volume_day` bigint(12) NOT NULL DEFAULT '0',
  `merchants_day` bigint(12) NOT NULL DEFAULT '0',
  `merchants_total` bigint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `curl_ignore_domains`
--

CREATE TABLE `curl_ignore_domains` (
  `ignore_id` int(7) NOT NULL DEFAULT '0',
  `ignore_domain` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_acquirer`
--

CREATE TABLE `customer_acquirer` (
  `cacquirer_id` int(6) NOT NULL DEFAULT '0',
  `acquirer` varchar(20) NOT NULL DEFAULT '',
  `merchant_token` varchar(64) NOT NULL DEFAULT '',
  `activation_time` bigint(12) NOT NULL DEFAULT '0',
  `active` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_activities`
--

CREATE TABLE `customer_activities` (
  `merchant_token` varchar(96) NOT NULL DEFAULT '',
  `activity_id` int(10) NOT NULL DEFAULT '0',
  `activity_group` int(2) NOT NULL DEFAULT '0' COMMENT 'Activity Group, 1 = Onboarding, 2 = Finance, 3 = Support, 4 = Sales, 10 = Admin',
  `activity_title` varchar(32) NOT NULL DEFAULT '',
  `activity_content` longtext CHARACTER SET utf8 COLLATE utf8_danish_ci NOT NULL DEFAULT '',
  `activity_type` int(1) NOT NULL DEFAULT '0',
  `activity_owner` int(11) NOT NULL DEFAULT '0',
  `activity_attached_id` int(10) NOT NULL DEFAULT '0',
  `activity_created` bigint(12) NOT NULL DEFAULT '0',
  `activity_updated` bigint(12) NOT NULL DEFAULT '0',
  `activity_done` smallint(1) NOT NULL DEFAULT '0',
  `activity_done_stamp` bigint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_agreement`
--

CREATE TABLE `customer_agreement` (
  `agreement` int(5) NOT NULL COMMENT 'AutoID',
  `customer_cvr` varchar(10) NOT NULL COMMENT 'CVR number',
  `merchantid` int(12) NOT NULL DEFAULT '0',
  `notification_email` varchar(255) NOT NULL COMMENT 'Email where we should sent notifications to',
  `terminal` int(2) NOT NULL DEFAULT '0',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `regnr` int(4) NOT NULL DEFAULT '0',
  `bankreg` bigint(10) NOT NULL DEFAULT '0',
  `deposit` int(8) NOT NULL COMMENT 'Deposit in lowest currency' DEFAULT '0',
  `paiddeposit` int(8) NOT NULL COMMENT 'Paid deposit in lowest currency' DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_agreement_mails`
--

CREATE TABLE `customer_agreement_mails` (
  `MailID` int(7) NOT NULL COMMENT 'Unique Identifier' DEFAULT '0',
  `agreement` int(7) NOT NULL COMMENT 'AgreementID' DEFAULT '0',
  `notification_email` varchar(255) NOT NULL COMMENT 'Notification Email' DEFAULT '',
  `sent` smallint(1) NOT NULL DEFAULT '0' COMMENT 'If 1 then sent',
  `sent_timestamp` bigint(12) NOT NULL COMMENT 'Unix Timestamp for sent' DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_agreement_reviews`
--

CREATE TABLE `customer_agreement_reviews` (
  `review_id` int(7) NOT NULL DEFAULT '0',
  `review_date` bigint(12) NOT NULL DEFAULT '0',
  `merchantid` int(8) NOT NULL COMMENT 'Test Merchant ID' DEFAULT '0',
  `reviewed_by` smallint(4) NOT NULL COMMENT 'Reviewed by' DEFAULT '0',
  `review_comments` longtext NOT NULL COMMENT 'Comments in regards of performed merchant review' DEFAULT '',
  `review_actions` longtext NOT NULL DEFAULT '',
  `next_review` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Next review in Unixtime'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_app_settings`
--

CREATE TABLE `customer_app_settings` (
  `setting_id` bigint(12) NOT NULL DEFAULT '0',
  `setting_country` varchar(5) NOT NULL DEFAULT 'da-dk',
  `setting_app` varchar(255) NOT NULL DEFAULT '',
  `setting_key` varchar(255) NOT NULL DEFAULT '',
  `setting_value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_bankdetails`
--

CREATE TABLE `customer_bankdetails` (
  `merchantid` int(12) NOT NULL COMMENT 'MerchantID' DEFAULT '0',
  `creationdate` bigint(12) NOT NULL COMMENT 'Unixtimestamp for MerchantDetails' DEFAULT '0',
  `bankname` varchar(255) NOT NULL DEFAULT '',
  `bankreg` int(4) NOT NULL COMMENT 'BankReg' DEFAULT '0',
  `bankacc` bigint(12) NOT NULL COMMENT 'Bank Account' DEFAULT '0',
  `active` smallint(1) NOT NULL DEFAULT '0' COMMENT 'If this is the active informations',
  `approved` smallint(1) NOT NULL DEFAULT '0' COMMENT 'Approved by YourPay',
  `approvedfile` varchar(75) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_billy`
--

CREATE TABLE `customer_billy` (
  `billyOrg` varchar(255) NOT NULL DEFAULT '',
  `ypUser` varchar(65) NOT NULL DEFAULT '',
  `ypPass` varchar(65) NOT NULL DEFAULT '',
  `billyAcc` varchar(255) NOT NULL DEFAULT '',
  `billyAcc2` varchar(255) NOT NULL DEFAULT '',
  `access` enum('owner','all') NOT NULL DEFAULT 'all',
  `billyToken` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_complaints`
--

CREATE TABLE `customer_complaints` (
  `complaintid` int(12) NOT NULL COMMENT 'AutoID' DEFAULT '0',
  `complainttag` varchar(12) NOT NULL COMMENT 'Complaint Tagging' DEFAULT '',
  `complaint_name` varchar(255) NOT NULL DEFAULT '',
  `complaint_email` varchar(255) NOT NULL DEFAULT '',
  `complaint_phone` varchar(255) NOT NULL DEFAULT '',
  `complaint_yourpay_message` longtext NOT NULL DEFAULT '',
  `complaint_reason` varchar(255) NOT NULL DEFAULT '',
  `complaint_transid` int(11) NOT NULL DEFAULT '0',
  `complaint_orderid` int(11) NOT NULL DEFAULT '0',
  `complaint_company_message` longtext NOT NULL DEFAULT '',
  `complaint_received` bigint(12) NOT NULL DEFAULT '0',
  `company_response_time` bigint(12) NOT NULL DEFAULT '0',
  `company_response_txt` int(5) NOT NULL DEFAULT '0',
  `yourpay_response` int(5) NOT NULL DEFAULT '0',
  `yourpay_complaint_response` bigint(12) NOT NULL DEFAULT '0',
  `closed` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_csv`
--

CREATE TABLE `customer_csv` (
  `id` int(11) NOT NULL DEFAULT '0',
  `merchant_id` int(11) NOT NULL DEFAULT '0',
  `url` text NOT NULL DEFAULT '',
  `start_period` int(11) NOT NULL DEFAULT '0',
  `end_period` int(11) NOT NULL DEFAULT '0',
  `downloads` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_currency`
--

CREATE TABLE `customer_currency` (
  `merchantid` int(7) NOT NULL COMMENT 'MerchantID' DEFAULT '0',
  `currency` int(3) NOT NULL DEFAULT '208' COMMENT '208 = DKK'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_currency_conversions`
--

CREATE TABLE `customer_currency_conversions` (
  `currencyid` int(3) NOT NULL DEFAULT '0',
  `currency_code` varchar(3) NOT NULL DEFAULT '',
  `currency_name` varchar(255) NOT NULL DEFAULT '',
  `currency_rate` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_cvr`
--


CREATE TABLE `customer_cvr` (
  `Customer_type` smallint(1) NOT NULL DEFAULT '1' COMMENT 'If 0 then Terminals, if 1 then Internet',
  `customer_pos` smallint(1) NOT NULL DEFAULT '0',
  `approved` smallint(1) NOT NULL DEFAULT '0' COMMENT 'If 0 then isn''t CVR approved yet, if 2 then shadow',
  `declined_by` int(3) NOT NULL DEFAULT '0',
  `declined_time` bigint(12) NOT NULL DEFAULT '0',
  `testaccount` smallint(1) NOT NULL DEFAULT '0',
  `final_approval` smallint(1) NOT NULL DEFAULT '0' COMMENT 'If 2 then finally approved',
  `final_approval_by` int(3) NOT NULL DEFAULT '0' COMMENT 'Who have finally activated customer',
  `final_approval_time` bigint(12) NOT NULL DEFAULT '0',
  `documentation_split` smallint(1) NOT NULL DEFAULT '0' COMMENT 'If 1 then documentation needs to be uploaded on Yourpays website',
  `salesperson` int(7) NOT NULL DEFAULT '0',
  `percentage` int(3) NOT NULL DEFAULT '20' COMMENT 'Percentage as promille, note that 15 is 1,5%',
  `alternate_dashboard` int(1) NOT NULL DEFAULT '0',
  `cvr` varchar(64) NOT NULL COMMENT 'Unique Identifier',
  `overall_merchantid` bigint(12) NOT NULL DEFAULT '0',
  `merchantid` bigint(12) NOT NULL DEFAULT '0',
  `merchantid_prod` bigint(12) NOT NULL COMMENT 'Test merchant ID',
  `payon_merchantid` bigint(20) NOT NULL DEFAULT '0',
  `cvr_name` varchar(100) NOT NULL DEFAULT '' COMMENT 'Name of company',
  `dba_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'Doing Business as name',
  `WDSLcaptureCode` varchar(255) NOT NULL DEFAULT '',
  `cvr_created` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Timestamp of creation',
  `cvr_notes` longtext NOT NULL DEFAULT '' COMMENT 'Notes related to CVR',
  `bankdoc` varchar(255) NOT NULL DEFAULT '',
  `moneydoc` varchar(255) NOT NULL DEFAULT '' COMMENT 'Document for ''Hvidvaskningsloven''',
  `cvrdoc` varchar(255) NOT NULL DEFAULT '' COMMENT 'Owners of VAT number',
  `salesplace` varchar(255) NOT NULL DEFAULT '' COMMENT 'Documentation of retail',
  `address` longtext NOT NULL DEFAULT '',
  `full_address` longtext NOT NULL DEFAULT '',
  `postal` varchar(25) NOT NULL DEFAULT '',
  `city` varchar(50) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT 'DK',
  `phone` varchar(25) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT 'Standard email',
  `startdate` bigint(12) NOT NULL DEFAULT '0',
  `branche` varchar(75) NOT NULL DEFAULT '',
  `employees` varchar(35) NOT NULL DEFAULT '',
  `employees_year` int(4) NOT NULL DEFAULT '0',
  `employees_owners` varchar(10) NOT NULL DEFAULT '',
  `state` varchar(35) NOT NULL DEFAULT '',
  `shoptype` varchar(255) NOT NULL DEFAULT '0' COMMENT '0 = Undefined',
  `website` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `freetransactions` int(3) NOT NULL DEFAULT '25' COMMENT 'Free transactions',
  `risk` varchar(255) NOT NULL DEFAULT '',
  `risk_level` varchar(255) NOT NULL DEFAULT '',
  `comments_applying` longtext NOT NULL DEFAULT '',
  `controlled_address` longtext NOT NULL DEFAULT '',
  `valid_address` smallint(1) NOT NULL DEFAULT '0',
  `valid_aml` smallint(1) NOT NULL DEFAULT '0' COMMENT 'If 1 then valid AML',
  `latest_yearreport` varchar(255) NOT NULL DEFAULT '',
  `yearly_revenue` bigint(12) NOT NULL DEFAULT '0',
  `yearly_transactions` varchar(255) NOT NULL DEFAULT '',
  `estimated_transactions` bigint(12) NOT NULL DEFAULT '0',
  `purpose_of_business` longtext NOT NULL DEFAULT '',
  `compliance_nature_of_business` smallint(1) NOT NULL DEFAULT '0',
  `compliance_cvr_details` smallint(1) NOT NULL DEFAULT '0',
  `compliance_contactdata` smallint(1) NOT NULL DEFAULT '0',
  `special_risks_of_business` longtext NOT NULL DEFAULT '',
  `Politically_exposed_owners` varchar(255) NOT NULL DEFAULT '',
  `rolling_reserve` smallint(1) NOT NULL DEFAULT '0',
  `rolling_reserve_amount` int(3) NOT NULL DEFAULT '10',
  `rolling_reserve_period` int(11) NOT NULL DEFAULT '0',
  `further_comments` longtext NOT NULL DEFAULT '',
  `subscriptions` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'Subscription transactions',
  `subscriptionscode` varchar(24) NOT NULL DEFAULT '',
  `subscriptionscallback` longtext NOT NULL DEFAULT '',
  `subscriptions_fee` varchar(5) NOT NULL DEFAULT '0,5',
  `terminal_type` smallint(1) NOT NULL DEFAULT '1' COMMENT '1 = CVC, 2 = 3D, 3 = NO CVC',
  `review_evaluation` bigint(12) NOT NULL DEFAULT '0',
  `missing_data_last_request` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Used by robot/requestdata.php',
  `send_for_approval_borgun` smallint(1) NOT NULL DEFAULT '0',
  `approved_borgun` smallint(1) NOT NULL DEFAULT '0',
  `send_for_approval_trustpay` smallint(1) NOT NULL DEFAULT '0',
  `send_for_approval_secure_trading` smallint(1) NOT NULL DEFAULT '0' COMMENT 'Sent for Approval - Secure Trading',
  `mcc` int(5) NOT NULL DEFAULT '5999' COMMENT 'MCC code',
  `payon_sender` varchar(92) NOT NULL DEFAULT '',
  `payon_merchant` varchar(32) NOT NULL DEFAULT '',
  `payon_channel` varchar(92) NOT NULL DEFAULT '',
  `payon_institute` varchar(48) NOT NULL DEFAULT '',
  `payon_login` varchar(92) NOT NULL DEFAULT '',
  `payon_pwd` varchar(92) NOT NULL DEFAULT '',
  `payon_secret` varchar(92) NOT NULL DEFAULT '',
  `payon_type` varchar(2) NOT NULL DEFAULT 'PA',
  `3ds_payon_sender` varchar(92) NOT NULL DEFAULT '',
  `3ds_payon_merchant` varchar(32) NOT NULL DEFAULT '',
  `3ds_payon_channel` varchar(32) NOT NULL DEFAULT '',
  `3ds_payon_institute` varchar(48) NOT NULL DEFAULT '',
  `3ds_payon_login` varchar(92) NOT NULL DEFAULT '',
  `3ds_payon_pwd` varchar(92) NOT NULL DEFAULT '',
  `3ds_payon_secret` varchar(92) NOT NULL DEFAULT '',
  `3ds_payon_type` varchar(2) NOT NULL DEFAULT '',
  `institute_status` smallint(1) NOT NULL DEFAULT '0',
  `institute_merchant_number` varchar(15) NOT NULL DEFAULT '' COMMENT 'ALWAYS 15 CHARS!',
  `institute_id` int(1) NOT NULL DEFAULT '1' COMMENT 'Institute ID from payon_clearing_institutes',
  `institute_acceptor_name` varchar(25) NOT NULL DEFAULT '' COMMENT 'Often same name as cvr_name',
  `payon_channel_merchantAccountId` varchar(50) NOT NULL DEFAULT '',
  `psper` smallint(1) NOT NULL DEFAULT '0',
  `remove_dankart` smallint(1) NOT NULL DEFAULT '0',
  `transaction_review` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Time for next review of transactions',
  `pipedrive_deal_id` int(8) NOT NULL DEFAULT '0',
  `pipedrive_org_id` int(7) NOT NULL DEFAULT '0',
  `pipedrive_sales_deal_id` bigint(7) NOT NULL DEFAULT '0',
  `pipedrive_bcc_email` varchar(255) NOT NULL DEFAULT '',
  `pipedrive_person_id` int(7) NOT NULL DEFAULT '0',
  `pipedrive_deal_reminder` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = no reminder sent, 1 = 35 reminder sent, 2 = 75 reminder sent, 3 = 200 reminder sent',
  `pipedrive_deal_reminder_last` bigint(12) NOT NULL DEFAULT '0',
  `pipedrive_deal_update` bigint(12) NOT NULL DEFAULT '0',
  `pricing_plan` int(7) NOT NULL DEFAULT '1',
  `pricing_next_period` bigint(12) NOT NULL DEFAULT '0',
  `pricing_last_payment` bigint(12) NOT NULL DEFAULT '0',
  `pricing_amount` int(11) NOT NULL DEFAULT '0',
  `payon_threedsecure` smallint(1) NOT NULL DEFAULT '0',
  `all_owners_added` smallint(1) NOT NULL DEFAULT '0' COMMENT '1 = All owners Added',
  `free_volume` bigint(12) NOT NULL DEFAULT '0',
  `free_volume_used` bigint(12) NOT NULL DEFAULT '0',
  `daily_settlement_period` int(3) NOT NULL DEFAULT '7',
  `daily_settlement_type` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'If 1 then Multiple settlements per day - one per order',
  `settlement_method` int(3) NOT NULL DEFAULT '103' COMMENT '103 = Daily, 104 = Weekly, 105 = Monthly, 106 = Yearly (Check Pipedrive for updates on this)',
  `settlement_priority` smallint(1) NOT NULL DEFAULT '0',
  `settlements_on_hold` smallint(1) NOT NULL DEFAULT '0',
  `settlements_on_reason` smallint(2) NOT NULL DEFAULT '99' COMMENT 'Reason why the settlements have been blocked',
  `billy_lev_id` varchar(32) NOT NULL DEFAULT '',
  `billy_acc_id` varchar(32) NOT NULL DEFAULT '',
  `billy_api_key` varchar(40) NOT NULL DEFAULT '',
  `general_dl_info` varchar(32) NOT NULL DEFAULT '',
  `economic_dl_info` varchar(128) NOT NULL DEFAULT '',
  `dinero_dl_info` varchar(128) NOT NULL DEFAULT '',
  `billy_dl_info` varchar(128) NOT NULL DEFAULT '',
  `payment_lang` varchar(5) NOT NULL DEFAULT '',
  `signature_key` varchar(255) NOT NULL DEFAULT '',
  `MerchantComments` longtext NOT NULL DEFAULT '',
  `setup_call_support` smallint(1) NOT NULL DEFAULT '0' COMMENT 'If 1 - task needs to be created for setting up this merchant, 2 - task is resolved and sales have been informed',
  `setup_call_pipedrive_id` bigint(10) NOT NULL DEFAULT '0' COMMENT 'Pipedrive Activity ID for setup',
  `setup_call_pipedrive_id_sales` int(8) NOT NULL DEFAULT '0' COMMENT 'ActivityID from Sales Pipedrive - used for mirroring',
  `credorax_connected_merchantid` varchar(155) NOT NULL DEFAULT '',
  `lyoness_merchantid` int(8) NOT NULL DEFAULT '0',
  `merchant_token` varchar(70) NOT NULL DEFAULT '',
  `payworks_merchantIdentifier` varchar(255) NOT NULL DEFAULT '',
  `payworks_merchantSecretKey` varchar(255) NOT NULL DEFAULT '',
  `test_payworks_merchantIdentifier` varchar(255) NOT NULL DEFAULT '',
  `test_payworks_merchantSecretKey` varchar(255) NOT NULL DEFAULT '',
  `merchant_debt_state` bigint(15) NOT NULL DEFAULT '0' COMMENT 'This field defines if the merchant have any debt towards Yourpay',
  `merchant_debt_review` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Last time Merchant was reviewed if had any debt',
  `resursbank_userid` varchar(255) NOT NULL DEFAULT '',
  `resursbank_pwd` varchar(255) NOT NULL DEFAULT '',
  `resursbank_active` smallint(1) NOT NULL DEFAULT '0',
  `viabill_active` smallint(1) NOT NULL DEFAULT '0',
  `viabill_api` varchar(255) NOT NULL DEFAULT '',
  `economic_user_id` varchar(255) NOT NULL DEFAULT '',
  `economic_secret` varchar(255) NOT NULL DEFAULT '',
  `customer_approved_terms` bigint(12) NOT NULL DEFAULT '0',
  `trustpilot_reviews` smallint(1) NOT NULL DEFAULT '0' COMMENT 'Stop trustpilot reviews from being sent out',
  `termsandconditions` smallint(1) NOT NULL DEFAULT '0' COMMENT 'If terms and conditions is available on site',
  `mail_with_merchantdetails` smallint(1) NOT NULL DEFAULT '0' COMMENT 'CAN BE DEPRECATED AT 1st of January 2018',
  `subscriptions_activated` smallint(1) NOT NULL DEFAULT '0' COMMENT 'Is set to 1 when the merchant have visited our Subscription section',
  `enhanced_security` smallint(1) NOT NULL DEFAULT '0',
  `flag_bank` tinyint(1) NOT NULL DEFAULT '0',
  `flag_info` tinyint(1) NOT NULL DEFAULT '0',
  `flag_personal` tinyint(1) NOT NULL DEFAULT '0',
  `flag_verified` tinyint(1) NOT NULL DEFAULT '0',
  `audittrail` longtext NOT NULL DEFAULT '',
  `document_key` varchar(12) NOT NULL DEFAULT '',
  `document_token` varchar(120) NOT NULL DEFAULT ''
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_cvr_audit`
--

CREATE TABLE `customer_cvr_audit` (
  `audit_id` int(8) NOT NULL DEFAULT '0',
  `audit_completed` smallint(1) NOT NULL DEFAULT '0',
  `merchantid` int(255) NOT NULL DEFAULT '0',
  `audit_companyname` smallint(1) NOT NULL DEFAULT '0',
  `audit_owners` smallint(1) NOT NULL DEFAULT '0',
  `audit_website_active` smallint(1) NOT NULL DEFAULT '0',
  `audit_website_terms` smallint(1) NOT NULL DEFAULT '0',
  `audit_website_products` smallint(1) NOT NULL DEFAULT '0',
  `audit_website_purchase` smallint(1) NOT NULL DEFAULT '0',
  `audit_website_yourpay_paymentmethod` smallint(1) NOT NULL DEFAULT '0',
  `audit_website_vat` smallint(1) NOT NULL DEFAULT '0',
  `audit_first_timestamp` bigint(12) NOT NULL DEFAULT '0',
  `audit_second_timestamp` bigint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_data_collection`
--

CREATE TABLE `customer_data_collection` (
  `collection_id` bigint(12) NOT NULL DEFAULT '0',
  `merchant_token` varchar(64) NOT NULL DEFAULT '',
  `collection` longtext NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_domains`
--

CREATE TABLE `customer_domains` (
  `DomainID` bigint(9) NOT NULL DEFAULT '0',
  `merchantid` bigint(12) NOT NULL DEFAULT '0',
  `website` varchar(255) NOT NULL DEFAULT '',
  `terms` smallint(1) NOT NULL DEFAULT '0',
  `terms_url` varchar(255) NOT NULL DEFAULT '',
  `privacy` smallint(1) NOT NULL DEFAULT '0',
  `privacy_url` varchar(255) NOT NULL DEFAULT '',
  `company` smallint(1) NOT NULL DEFAULT '0',
  `company_url` varchar(255) NOT NULL DEFAULT '',
  `contact` smallint(1) NOT NULL DEFAULT '0',
  `contact_url` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_expected_revenue`
--

CREATE TABLE `customer_expected_revenue` (
  `recenueID` int(8) NOT NULL COMMENT 'AutoID' DEFAULT '0',
  `customer_cvr` varchar(10) NOT NULL COMMENT 'Customer CVR' DEFAULT '',
  `customer_date` bigint(12) NOT NULL COMMENT 'Date for expected Revenue' DEFAULT '0',
  `customer_revenue` int(8) NOT NULL COMMENT 'revenue in Øre' DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_external_epay`
--

CREATE TABLE `customer_external_epay` (
  `merchantid` int(10) NOT NULL COMMENT 'MerchantID' DEFAULT '0',
  `pbs_forretningsid` varchar(10) NOT NULL DEFAULT '',
  `webservice_password` longtext NOT NULL DEFAULT '',
  `percentage` int(11) NOT NULL DEFAULT '10',
  `amount` int(8) NOT NULL DEFAULT '50000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_fee`
--

CREATE TABLE `customer_fee` (
  `merchantid` int(9) NOT NULL COMMENT 'MerchantID' DEFAULT '0',
  `cardtype` int(2) NOT NULL COMMENT 'CardID' DEFAULT '0',
  `cardfee` int(3) NOT NULL COMMENT 'Cardfee in lowest possible' DEFAULT '225',
  `transactiondays` int(3) NOT NULL DEFAULT '14'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_files`
--

CREATE TABLE `customer_files` (
  `merchantid` int(7) NOT NULL COMMENT 'merchantid' DEFAULT '0',
  `registered` bigint(12) NOT NULL COMMENT 'Timestamp of file' DEFAULT '0',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT 'File Type',
  `filename` varchar(255) NOT NULL COMMENT 'File name' DEFAULT '',
  `approved` bigint(12) NOT NULL DEFAULT '0',
  `approved_by` smallint(1) NOT NULL DEFAULT '0',
  `handled_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_files_type`
--

CREATE TABLE `customer_files_type` (
  `type_id` int(2) NOT NULL DEFAULT '0',
  `type_name` varchar(40) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_fx_seal`
--

CREATE TABLE `customer_fx_seal` (
  `merchant_token` varchar(50) NOT NULL DEFAULT '',
  `merchant_seal_id` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_important_notifications`
--

CREATE TABLE `customer_important_notifications` (
  `notification_id` int(11) NOT NULL DEFAULT '0',
  `merchantid` bigint(12) NOT NULL DEFAULT '0',
  `notification_title` varchar(50) NOT NULL DEFAULT '',
  `notification_content` longtext NOT NULL DEFAULT '',
  `notification_read` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_invoices`
--

CREATE TABLE `customer_invoices` (
  `invoiceID` bigint(12) NOT NULL COMMENT 'AutoID' DEFAULT '0',
  `merchantid` int(10) NOT NULL COMMENT 'merchantid' DEFAULT '0',
  `amount` int(8) NOT NULL COMMENT 'Amount in DKK' DEFAULT '0',
  `creationtime` bigint(12) NOT NULL COMMENT 'Unix Timestamp' DEFAULT '0',
  `paid` bigint(12) NOT NULL COMMENT 'Timestamp for payment' DEFAULT '0',
  `invoicetype` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 = Credit, 1 = Invoice',
  `invoicetext` longtext NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_lead`
--

CREATE TABLE `customer_lead` (
  `leadid` int(7) NOT NULL DEFAULT '0',
  `shadow` smallint(1) NOT NULL DEFAULT '1' COMMENT 'if 1 then haven''t the website been reviewed by the automated platform',
  `touches_by_robot` smallint(1) NOT NULL DEFAULT '0',
  `shop_shadow` smallint(1) NOT NULL DEFAULT '1' COMMENT 'If 1 then is it a shadow which shopsystem that have been used. We have not yet tested it, and have not yet put any result in shoptype',
  `converted` smallint(1) NOT NULL DEFAULT '0' COMMENT '0 if not converted, 1 if converted',
  `merchantid` bigint(12) NOT NULL DEFAULT '0' COMMENT 'If this lead already is registered at Yourpay, then give it the MerchantID',
  `salesperson` int(7) NOT NULL DEFAULT '0',
  `cvr` varchar(10) NOT NULL COMMENT 'Unique Identifier' DEFAULT '',
  `cvr_name` varchar(50) NOT NULL COMMENT 'Name of company' DEFAULT '',
  `contactname` varchar(255) NOT NULL DEFAULT '',
  `address` longtext NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(25) NOT NULL DEFAULT '',
  `alt_phone` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL COMMENT 'Standard email' DEFAULT '',
  `branche` varchar(75) NOT NULL DEFAULT '',
  `employees` varchar(35) NOT NULL DEFAULT '',
  `shoptype` varchar(255) NOT NULL DEFAULT '' COMMENT '0 = Undefined, 1 = magento, 2 = prestashop',
  `website` varchar(255) NOT NULL DEFAULT '',
  `followup` bigint(12) NOT NULL DEFAULT '0',
  `notes` longtext NOT NULL DEFAULT '',
  `tp_reviews` bigint(12) NOT NULL DEFAULT '0',
  `tp_rating` bigint(12) NOT NULL DEFAULT '0',
  `followup_status` smallint(1) NOT NULL DEFAULT '1' COMMENT 'if 1 then active, if 0 then inactive',
  `in_pipedrive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_lev`
--

CREATE TABLE `customer_lev` (
  `merchantid` int(11) NOT NULL DEFAULT '0',
  `kreditor_id` varchar(32) NOT NULL DEFAULT '',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `address` varchar(64) NOT NULL DEFAULT '',
  `phone` varchar(12) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_logins`
--

CREATE TABLE `customer_logins` (
  `LoginID` int(7) NOT NULL COMMENT 'AutoID' DEFAULT '0',
  `customer_cvr` int(7) NOT NULL COMMENT 'Customer CVR' DEFAULT '0',
  `merchantid` int(12) NOT NULL DEFAULT '0',
  `active` smallint(1) NOT NULL DEFAULT '1' COMMENT 'If 1 then Login Active' DEFAULT '0',
  `username` varchar(255) NOT NULL COMMENT 'Email as Login' DEFAULT '',
  `upassword` varchar(64) NOT NULL COMMENT 'SHA1 encoded password' DEFAULT '',
  `secret` varchar(10) NOT NULL COMMENT 'SHA salt' DEFAULT '',
  `pincode` varchar(90) NOT NULL DEFAULT '',
  `uemail` varchar(45) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(30) NOT NULL  DEFAULT '',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `twofactor` smallint(1) NOT NULL DEFAULT '1' COMMENT 'Two factor login',
  `session_id` varchar(30) NOT NULL DEFAULT '',
  `session_lastused` bigint(12) NOT NULL DEFAULT '0',
  `user_img` varchar(10) NOT NULL DEFAULT '' COMMENT 'User Image',
  `latestlogin` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Latest Login Timestamp',
  `access_rights` varchar(255) NOT NULL DEFAULT '',
  `logintype` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 for Manually, 1 for 1-click-login',
  `clicklink` varchar(60) NOT NULL DEFAULT '',
  `terminal_pwd` varchar(10) NOT NULL DEFAULT '',
  `stdpwd` smallint(1) NOT NULL DEFAULT '1',
  `verified` smallint(1) NOT NULL DEFAULT '0',
  `added_to_mailchimp` smallint(1) NOT NULL DEFAULT '0',
  `language_code` varchar(5) NOT NULL DEFAULT '',
  `reset_token`  varchar(255) NOT NULL DEFAULT '' COMMENT 'Token used to validate password resetting',
  `row_last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_logins_activity`
--

CREATE TABLE `customer_logins_activity` (
  `activityid` int(7) NOT NULL COMMENT 'Unique Identifier' DEFAULT '0',
  `LoginID` int(7) NOT NULL COMMENT 'Login ID' DEFAULT '0',
  `page` varchar(35) NOT NULL DEFAULT '',
  `actiondone` varchar(35) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_logins_apppassword`
--

CREATE TABLE `customer_logins_apppassword` (
  `password_id` int(6) NOT NULL DEFAULT '0',
  `LoginID` int(6) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL DEFAULT '',
  `expiry_timestamp` bigint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_login_sessions`
--

CREATE TABLE `customer_login_sessions` (
  `uid` int(10) NOT NULL DEFAULT '0',
  `session_id` varchar(255) NOT NULL DEFAULT '',
  `timestp` bigint(12) NOT NULL COMMENT 'Unix timestamp' DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_login_session_details`
--

CREATE TABLE `customer_login_session_details` (
  `details_id` int(7) NOT NULL DEFAULT '0',
  `login_id` int(7) NOT NULL DEFAULT '0',
  `detail_key` varchar(50) NOT NULL DEFAULT '',
  `detail_value` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_overview`
--

CREATE TABLE `customer_overview` (
  `merchantid` int(11) NOT NULL DEFAULT '0',
  `debitor_id` varchar(32) NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `address` varchar(64) NOT NULL DEFAULT '',
  `phone` varchar(12) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_owners`
--

CREATE TABLE `customer_owners` (
  `OwnerFileID` int(7) NOT NULL DEFAULT '0',
  `merchantid` int(7) NOT NULL DEFAULT '0',
  `creationdate` bigint(12) NOT NULL DEFAULT '0',
  `uploaded` bigint(12) NOT NULL DEFAULT '0',
  `handled` bigint(12) NOT NULL DEFAULT '0',
  `datatype` int(2) NOT NULL DEFAULT '0',
  `company_role` varchar(255) NOT NULL DEFAULT '',
  `owner_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_danish_ci NOT NULL DEFAULT '',
  `owner_address` varchar(255) NOT NULL DEFAULT '',
  `owner_postal` varchar(10) NOT NULL DEFAULT '0',
  `owner_city` varchar(255) NOT NULL DEFAULT '',
  `owner_country` varchar(255) NOT NULL DEFAULT 'Danmark',
  `owner_date_of_birth` varchar(255) NOT NULL DEFAULT '',
  `file` varchar(255) NOT NULL DEFAULT '',
  `verified` smallint(1) NOT NULL DEFAULT '0',
  `owner_share` varchar(5) NOT NULL DEFAULT '0',
  `approved_by` int(5) NOT NULL DEFAULT '0',
  `requested_by` int(7) NOT NULL DEFAULT '0',
  `document_key` varchar(32) NOT NULL DEFAULT '',
  `document_token` varchar(121) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_owner_types`
--

CREATE TABLE `customer_owner_types` (
  `type_id` int(2) NOT NULL DEFAULT '0',
  `type_name` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_payment_download`
--

CREATE TABLE `customer_payment_download` (
  `id` int(11) NOT NULL DEFAULT '0',
  `merchantid` int(11) NOT NULL DEFAULT '0',
  `begin` int(11) NOT NULL DEFAULT '0',
  `end` int(11) NOT NULL DEFAULT '0',
  `price` smallint(6) NOT NULL DEFAULT '0',
  `downloads` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_payon`
--

CREATE TABLE `customer_payon` (
  `channelID` int(8) NOT NULL DEFAULT '0',
  `production` smallint(1) NOT NULL DEFAULT '1' COMMENT '1 if production MerchantID',
  `merchantid` bigint(12) NOT NULL DEFAULT '0',
  `minimum_amount` int(11) NOT NULL DEFAULT '0',
  `maximum_amount` bigint(12) NOT NULL DEFAULT '9999999',
  `currency` int(3) NOT NULL DEFAULT '208',
  `max_per_month` bigint(12) NOT NULL DEFAULT '999999900',
  `current_month` bigint(12) NOT NULL DEFAULT '0',
  `payon_sender` varchar(64) NOT NULL DEFAULT '',
  `payon_channel` varchar(64) NOT NULL DEFAULT '',
  `payon_login` varchar(64) NOT NULL DEFAULT '',
  `payon_pwd` varchar(64) NOT NULL DEFAULT '',
  `payon_secret` varchar(64) NOT NULL DEFAULT '',
  `payon_type` varchar(64) NOT NULL DEFAULT 'CC.PA',
  `clearingInstitute` varchar(64) NOT NULL DEFAULT '',
  `payon_mcc` varchar(4) NOT NULL DEFAULT '0',
  `payon_threedsecure` smallint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_payon_psp`
--

CREATE TABLE `customer_payon_psp` (
  `pspid` int(7) NOT NULL COMMENT 'Auto ID',
  `demo` smallint(1) NOT NULL DEFAULT '0',
  `pspname` varchar(25) NOT NULL DEFAULT '',
  `payonid` varchar(64) NOT NULL DEFAULT '',
  `clearingInstitute` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_productionunits`
--

CREATE TABLE `customer_productionunits` (
  `cvr` varchar(15) NOT NULL DEFAULT '',
  `pnumber` varchar(15) NOT NULL DEFAULT '',
  `valid_since` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_products`
--

CREATE TABLE `customer_products` (
  `product_id` int(7) NOT NULL DEFAULT '0' COMMENT 'AutoID',
  `group_id` int(7) NOT NULL DEFAULT '0' COMMENT 'Product Group ID',
  `merchantid` int(8) NOT NULL DEFAULT '0' COMMENT 'MerchantID',
  `product_title` varchar(255) NOT NULL DEFAULT '',
  `product_image` varchar(255) NOT NULL DEFAULT '',
  `product_price` int(6) NOT NULL DEFAULT '0',
  `product_active` smallint(1) NOT NULL DEFAULT '0',
  `product_barcode` varchar(255) NOT NULL DEFAULT '',
  `product_no` varchar(35) NOT NULL DEFAULT '',
  `product_buyprice` int(11) NOT NULL DEFAULT '0',
  `product_unit` varchar(12) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_products_groups`
--

CREATE TABLE `customer_products_groups` (
  `group_id` int(7) NOT NULL DEFAULT '0' COMMENT 'Group ID',
  `group_name` varchar(255) NOT NULL DEFAULT '',
  `group_active` smallint(1) NOT NULL DEFAULT '0' COMMENT 'If 1 then active group',
  `merchantid` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_product_stock_decrease`
--

CREATE TABLE `customer_product_stock_decrease` (
  `decrease_id` int(7) NOT NULL DEFAULT '0',
  `completed` smallint(1) NOT NULL DEFAULT '0',
  `merchantid` int(7) NOT NULL DEFAULT '0',
  `product_name` longtext NOT NULL DEFAULT '',
  `product_price` longtext NOT NULL DEFAULT '',
  `product_amount` int(3) NOT NULL DEFAULT '0',
  `timestamp` bigint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_special_design`
--

CREATE TABLE `customer_special_design` (
  `merchantid` int(9) NOT NULL DEFAULT '0',
  `merchantid_prod` int(9) NOT NULL DEFAULT '0',
  `design_type` int(2) NOT NULL DEFAULT '1',
  `custom_css` longtext NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_subscriptions`
--

CREATE TABLE `customer_subscriptions` (
  `subscription_id` int(7) NOT NULL DEFAULT '0',
  `merchant_id` int(12) NOT NULL DEFAULT '0',
  `ccrg_id` varchar(14) NOT NULL DEFAULT '',
  `time_created` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_supportemails`
--

CREATE TABLE `customer_supportemails` (
  `merchantid` int(7) NOT NULL DEFAULT '0' COMMENT 'MerchantID',
  `customer_email` varchar(255) NOT NULL DEFAULT '' COMMENT 'Unique customer email for support of merchant'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_touched`
--

CREATE TABLE `customer_touched` (
  `customer_cvr` varchar(10) NOT NULL DEFAULT '' COMMENT 'Customer CVR/CPR',
  `touchedby` varchar(100) NOT NULL DEFAULT '' COMMENT 'Touched by',
  `timestamp` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Unix Timestamp',
  `touchnote` longtext NOT NULL DEFAULT '' COMMENT 'Touch Note'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_touches`
--

CREATE TABLE `customer_touches` (
  `merchantid` int(8) NOT NULL DEFAULT '0' COMMENT 'MerchantID',
  `timestamp` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Unix Timestamp',
  `Action` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `customer_transfer_accounts`
--

CREATE TABLE `customer_transfer_accounts` (
  `accountid` bigint(12) NOT NULL DEFAULT '0',
  `creationtime` bigint(12) NOT NULL DEFAULT '0',
  `merchantid` bigint(12) NOT NULL DEFAULT '0',
  `currency` int(3) NOT NULL DEFAULT '208',
  `settlement_currency` int(3) NOT NULL DEFAULT '208',
  `account_state` bigint(12) NOT NULL  DEFAULT '0',
  `account_activated` smallint(1) NOT NULL DEFAULT '0' COMMENT 'If 1 then updated with production merchantid',
  `account_invoices` smallint(1) NOT NULL DEFAULT '0' COMMENT 'If 1 = Payout account is used for Invoice Payments from Partners (Visma, Billy etc.)',
  `account_amount` bigint(12) NOT NULL DEFAULT '0',
  `account_adjustment_status` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Volume merchant owe to Yourpay in refunds and chargebacks',
  `account_amount_last_updated` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Used by register_correct_account_volume',
  `account_total_capture` bigint(12) NOT NULL DEFAULT '0',
  `account_total_settlement` bigint(12) NOT NULL DEFAULT '0',
  `account_total_tax` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Total fee paid through accountid',
  `account_adjustments` int(11) NOT NULL DEFAULT '0' COMMENT 'Chargebacks, fee etc.',
  `refund_amount_calculated` int(7) NOT NULL DEFAULT '0',
  `refund_amount_total` bigint(20) NOT NULL DEFAULT '0',
  `merchant_total_debt` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Merchants total debt towards Yourpay',
  `account_reserve` bigint(12) NOT NULL DEFAULT '0',
  `country` varchar(255) NOT NULL DEFAULT '',
  `IBAN` varchar(255) NOT NULL DEFAULT '',
  `biccode` varchar(12) NOT NULL DEFAULT '',
  `bankname` varchar(255) NULL DEFAULT '',
  `bankreg` bigint(6) NOT NULL DEFAULT '0',
  `bankacc` bigint(12) NOT NULL DEFAULT '0',
  `recalculate_period` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Recalculate account volume after specific timestamp',
  `recalculate_status` int(1) NOT NULL DEFAULT '0' COMMENT 'If recalculate process is ongoing',
  `last_releasedate` bigint(12) NOT NULL DEFAULT '0',
  `last_updated` bigint(12) NOT NULL DEFAULT '0',
  `reviewed_date` smallint(1) NOT NULL DEFAULT '0' COMMENT 'Is being used by temp.correct.payment.import',
  `verified_ctpe` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `deals_registered_won`
--

CREATE TABLE `deals_registered_won` (
  `deal_id` int(11) NOT NULL DEFAULT '0',
  `deal_value` longtext NOT NULL DEFAULT '',
  `deal_timestamp` bigint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `documentation_code_example`
--

CREATE TABLE `documentation_code_example` (
  `example_id` int(7) NOT NULL DEFAULT '0',
  `entities_id` int(7) NOT NULL DEFAULT '0',
  `language` varchar(255) NOT NULL DEFAULT '',
  `codeexample` longtext NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `documentation_entities`
--

CREATE TABLE `documentation_entities` (
  `entities_id` int(7) NOT NULL DEFAULT '0',
  `documentation_id` int(7) NOT NULL DEFAULT '0',
  `order_id` int(7) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `content` longtext NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `documentation_titles`
--

CREATE TABLE `documentation_titles` (
  `documentation_id` int(7) NOT NULL DEFAULT '0',
  `documentation_title` varchar(255) NOT NULL DEFAULT '',
  `teaser` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(75) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `documents`
--

CREATE TABLE `documents` (
  `document_id` int(7) NOT NULL DEFAULT '0',
  `document_title` varchar(255) NOT NULL DEFAULT '',
  `document_file` varchar(255) NOT NULL DEFAULT '',
  `document_owner` int(7) NOT NULL DEFAULT '0',
  `document_uploaded` bigint(12) NOT NULL DEFAULT '0',
  `document_approved` bigint(12) NOT NULL DEFAULT '0',
  `document_group` int(7) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `documents_groups`
--

CREATE TABLE `documents_groups` (
  `doc_group_id` int(7) NOT NULL DEFAULT '0',
  `doc_group_title` varchar(255) NOT NULL DEFAULT '',
  `group_users` longtext NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `jobs`
--

CREATE TABLE `jobs` (
  `jobid` int(5) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `teaser` longtext NOT NULL DEFAULT '',
  `text` longtext NOT NULL DEFAULT '',
  `active` smallint(1) NOT NULL DEFAULT '0' DEFAULT '1',
  `fulltime` smallint(1) NOT NULL DEFAULT '0' DEFAULT '0',
  `orderBy` smallint(2) NOT NULL DEFAULT '0' DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `lead_database`
--

CREATE TABLE `lead_database` (
  `domain` varchar(255) NOT NULL DEFAULT '',
  `shop_platform` varchar(255) NOT NULL DEFAULT '',
  `added` bigint(12) NOT NULL DEFAULT '0',
  `imported_into_pipedrive` smallint(1) NOT NULL DEFAULT '0',
  `updated_with_info_in_pipedrive` smallint(1) NOT NULL DEFAULT '0',
  `pipedrive_deal_id` int(10) NOT NULL DEFAULT '0',
  `country` varchar(255) NOT NULL DEFAULT '',
  `company` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `MailQueue`
--

CREATE TABLE `MailQueue` (
  `MailID` int(5) NOT NULL DEFAULT '0' COMMENT 'Auto ID',
  `MailSender` varchar(255) NOT NULL DEFAULT 'robot@yourpay.io' COMMENT 'If we doesn''t know who the Sender is, then just insert robot',
  `MailReceiver` varchar(255) NOT NULL DEFAULT 'support@yourpay.dk' COMMENT 'If we doesn''t know who the Receiver is, then just insert support',
  `MailSubject` varchar(255) NOT NULL DEFAULT '' COMMENT 'Mail Subject',
  `MailBody` longtext NOT NULL DEFAULT '' COMMENT 'Mail Body',
  `MailCategory` varchar(45) NOT NULL DEFAULT '',
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sendaftertime` bigint(12) NOT NULL DEFAULT '0',
  `sent` int(12) NOT NULL DEFAULT '0' COMMENT 'If not 0 then sent, if 2 then sent through PHP Mail',
  `ready_to_send` enum('0','1') NOT NULL COMMENT 'If ready to send is zero then don''t send the email',
  `MailFile` varchar(255) NOT NULL DEFAULT '',
  `MailFile2` varchar(255) NOT NULL DEFAULT '',
  `plain` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'If 0 then send as HTML',
  `merchantnumber` int(7) NOT NULL DEFAULT '0',
  `mail_bcc` varchar(50) NOT NULL DEFAULT '',
  `verify_activated` smallint(1) NOT NULL DEFAULT '0' COMMENT 'Only send mail if merchant is activated',
  `imported_pipedrive` smallint(1) NOT NULL DEFAULT '0',
  `template` smallint(1) NOT NULL DEFAULT '0',
  `template_id` varchar(255) NOT NULL DEFAULT '',
  `placeholders` longtext NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `MailSMSQueue`
--

CREATE TABLE `MailSMSQueue` (
  `sms_id` int(7) NOT NULL DEFAULT '0',
  `billable` smallint(1) NOT NULL DEFAULT '0',
  `billed` smallint(1) NOT NULL DEFAULT '0',
  `merchant_token` varchar(64) NOT NULL DEFAULT '',
  `sms_receiver` int(8) NOT NULL DEFAULT '0',
  `sms_text` longtext NOT NULL DEFAULT '',
  `sms_replacer` longtext NOT NULL DEFAULT '',
  `senttime` bigint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `mail_template`
--

CREATE TABLE `mail_template` (
  `id` int(11) NOT NULL DEFAULT '0',
  `preferred_wrapper` int(7) NOT NULL DEFAULT '0',
  `country_code` varchar(5) NOT NULL DEFAULT 'da-dk',
  `template_title` varchar(255) NOT NULL DEFAULT '',
  `template_subject` varchar(255) NOT NULL DEFAULT '',
  `template` text NOT NULL DEFAULT '',
  `owner` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `updater` int(11) NOT NULL DEFAULT '0',
  `last_updated` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `mail_wrapper`
--

CREATE TABLE `mail_wrapper` (
  `id` int(11) NOT NULL DEFAULT '0',
  `wrapper` text NOT NULL DEFAULT '',
  `owner` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `updater` int(11) NOT NULL DEFAULT '0',
  `last_updated` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `manual_adjustments`
--

CREATE TABLE `manual_adjustments` (
  `adjustment_id` int(7) NOT NULL DEFAULT '0',
  `accountid` int(7) NOT NULL DEFAULT '0',
  `dateid` int(7) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `internal_note` longtext NOT NULL DEFAULT '',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `maxtel`
--

CREATE TABLE `maxtel` (
  `phone_reg` bigint(12) NOT NULL DEFAULT '0',
  `container` longtext NOT NULL DEFAULT '',
  `registered` int(11) NOT NULL DEFAULT '0',
  `seconds` int(11) NOT NULL DEFAULT '0',
  `pipedrive` int(11) NOT NULL DEFAULT '0',
  `merchantid` int(11) NOT NULL DEFAULT '0',
  `cardno_first` int(6) NOT NULL DEFAULT '0',
  `cardno_last` int(4) NOT NULL DEFAULT '0',
  `phone_from` bigint(10) NOT NULL DEFAULT '0',
  `phone_to` bigint(10) NOT NULL DEFAULT '0',
  `external` bigint(10) NOT NULL DEFAULT '0',
  `start_time` bigint(12) NOT NULL DEFAULT '0',
  `connect_time` bigint(12) NOT NULL DEFAULT '0',
  `end_time` bigint(12) NOT NULL DEFAULT '0',
  `id` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `merchant_logos`
--

CREATE TABLE `merchant_logos` (
  `merchant_token` varchar(255) NOT NULL DEFAULT '',
  `logo` longtext NOT NULL DEFAULT '',
  `viabill` smallint(1) NOT NULL DEFAULT '0' COMMENT 'Is logo sent to Viabill'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `merchant_outgoing_transactions`
--

CREATE TABLE `merchant_outgoing_transactions` (
  `ImportID` bigint(12) NOT NULL DEFAULT '0',
  `date_of_transaction` bigint(12) NOT NULL DEFAULT '0',
  `date_of_payment` bigint(12) NOT NULL DEFAULT '0',
  `date_of_release` bigint(12) NOT NULL DEFAULT '0',
  `internal_descriptor` varchar(255) NOT NULL DEFAULT '',
  `external_descriptor` varchar(255) NOT NULL DEFAULT '',
  `transfered_amount` bigint(10) NOT NULL DEFAULT '0',
  `banked_statement` bigint(12) NOT NULL DEFAULT '0',
  `transfered_currency` int(3) NOT NULL DEFAULT '208',
  `import_accepted` smallint(1) NOT NULL DEFAULT '0' COMMENT '-1 = Deleted, 0 = Not handled, 1 = Accepted, 2 = Pending Review',
  `merchantid` int(12) NOT NULL DEFAULT '0',
  `dateid` int(7) NOT NULL DEFAULT '0',
  `navision_imported` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `merchant_outgoing_transactions_verification`
--

CREATE TABLE `merchant_outgoing_transactions_verification` (
  `date` varchar(255) NOT NULL DEFAULT '',
  `belob` varchar(255) NOT NULL DEFAULT '',
  `saldo` varchar(255) NOT NULL DEFAULT '',
  `afsenderkonto` varchar(255) NOT NULL DEFAULT '',
  `overfbelob` varchar(255) NOT NULL DEFAULT '',
  `tekst` varchar(255) NOT NULL DEFAULT '',
  `tekstmodtager` varchar(255) NOT NULL DEFAULT '',
  `overftype` varchar(255) NOT NULL DEFAULT '',
  `betalingsident` varchar(255) NOT NULL DEFAULT '',
  `endtoend` varchar(255) NOT NULL DEFAULT '',
  `kreditorreference` varchar(255) NOT NULL DEFAULT '',
  `modtagerkonto` varchar(255) NOT NULL DEFAULT '',
  `supplerendetekst` varchar(255) NOT NULL DEFAULT '',
  `test` varchar(255) NOT NULL DEFAULT '',
  `checked` smallint(1) NOT NULL DEFAULT '0',
  `v_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `merchant_refunds_accounts`
--

CREATE TABLE `merchant_refunds_accounts` (
  `refund_id` int(7) NOT NULL DEFAULT '0',
  `payment_id` int(7) NOT NULL DEFAULT '0',
  `order_id` varchar(255) NOT NULL DEFAULT '',
  `accountid` bigint(7) NOT NULL DEFAULT '0',
  `date_id` int(7) NOT NULL DEFAULT '0',
  `amount` bigint(7) NOT NULL DEFAULT '0',
  `currency` int(5) NOT NULL DEFAULT '0',
  `datetime` bigint(12) NOT NULL DEFAULT '0',
  `merchantid` int(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `merchant_transfer_accounts_daily_overview`
--

CREATE TABLE `merchant_transfer_accounts_daily_overview` (
  `dateid` bigint(12) NOT NULL DEFAULT '0',
  `accountid` int(6) NOT NULL DEFAULT '0',
  `captured_amount` int(8) NOT NULL DEFAULT '0',
  `captured_amount_converted` bigint(12) NOT NULL DEFAULT '0',
  `captured_fee` int(8) NOT NULL DEFAULT '0',
  `chargeback_amount` int(20) NOT NULL DEFAULT '0',
  `released_amount` int(8) NOT NULL DEFAULT '0',
  `refund_amount` int(7) NOT NULL DEFAULT '0',
  `refund_amount_total` bigint(12) NOT NULL DEFAULT '0',
  `manual_adjustments` int(10) NOT NULL DEFAULT '0',
  `daily_percentage` int(3) NOT NULL DEFAULT '225',
  `daily_settlement_period` int(3) NOT NULL DEFAULT '14',
  `date_start` bigint(12) NOT NULL DEFAULT '0',
  `date_end` bigint(12) NOT NULL DEFAULT '0',
  `date_expected_release` bigint(12) NOT NULL DEFAULT '0',
  `manually_corrected` int(1) NOT NULL DEFAULT '0',
  `daily_percentage_correction` smallint(1) NOT NULL DEFAULT '0',
  `conversionrate` varchar(10) NOT NULL DEFAULT '0',
  `verified_outgoing` smallint(1) NOT NULL DEFAULT '0',
  `special_settlementflow` smallint(1) NOT NULL DEFAULT '0' COMMENT '1 = Settlement done manually through alternative flow - otherwise standard settlement flow',
  `unique_code` varchar(25) NOT NULL DEFAULT '' COMMENT 'Unique Code used for Payouts'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `mysql_check`
--

CREATE TABLE `mysql_check` (
  `last_time` bigint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Slaves checkup table - 60 seconds behind, they shut down.';

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `navision_exports`
--

CREATE TABLE `navision_exports` (
  `exports_id` bigint(12) NOT NULL DEFAULT '0',
  `export_time` bigint(12) NOT NULL DEFAULT '0',
  `export_file` varchar(255) NOT NULL DEFAULT '',
  `export_started` smallint(1) NOT NULL DEFAULT '0',
  `export_done` smallint(1) NOT NULL DEFAULT '0',
  `export_startdate` bigint(12) NOT NULL DEFAULT '0',
  `export_enddate` bigint(12) NOT NULL DEFAULT '0',
  `only_fees` varchar(3) NOT NULL DEFAULT '',
  `only_settlements` varchar(2) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `navision_review`
--

CREATE TABLE `navision_review` (
  `bilagsnr` varchar(255) NOT NULL DEFAULT '',
  `finanskontonr` varchar(255) NOT NULL DEFAULT '',
  `beskrivelse` varchar(255) NOT NULL DEFAULT '',
  `belob` varchar(255) NOT NULL DEFAULT '',
  `modkontotype` varchar(255) NOT NULL DEFAULT '',
  `modkonto` int(10) NOT NULL DEFAULT '0',
  `dateid` int(10) NOT NULL DEFAULT '0',
  `AutoID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int(5) NOT NULL DEFAULT '0' COMMENT 'Unique Identifier',
  `email` varchar(255) NOT NULL DEFAULT '',
  `registered` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Time for registration',
  `reg_ip` bigint(12) NOT NULL DEFAULT '0' COMMENT 'IP for registration'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `new_website_blog`
--

CREATE TABLE `new_website_blog` (
  `blog_id` int(7) NOT NULL DEFAULT '0',
  `blog_title` varchar(255) NOT NULL DEFAULT '',
  `blog_written` bigint(12) NOT NULL DEFAULT '0',
  `author` varchar(255) NOT NULL DEFAULT '',
  `author_email` varchar(255) NOT NULL DEFAULT '',
  `blog_content` longtext NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `onboarding_data_searcher`
--

CREATE TABLE `onboarding_data_searcher` (
  `searcher_id` int(12) NOT NULL DEFAULT '0',
  `merchant_token` varchar(128) NOT NULL DEFAULT '',
  `search_type` int(1) NOT NULL DEFAULT '0' COMMENT 'What data are we actually searching for',
  `search_completed` smallint(1) NOT NULL DEFAULT '0' COMMENT 'Set for 1 if data was identified',
  `searcher_url_id` int(12) NOT NULL DEFAULT '0' COMMENT 'ID for URL upon where the data we needed was found'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `onboarding_data_searcher_url`
--

CREATE TABLE `onboarding_data_searcher_url` (
  `searcher_url_id` int(12) NOT NULL DEFAULT '0',
  `searcher_id` int(12) NOT NULL DEFAULT '0' COMMENT 'Connected Searcher ID',
  `searcher_url_reviewed` smallint(1) NOT NULL DEFAULT '0' COMMENT 'Set for 1 if URL have been reviewed for the data we needed',
  `searcher_url_request_time` int(12) NOT NULL DEFAULT '0' COMMENT 'Unixtimestamp for when the url was requested searched through',
  `searcher_url_url` varchar(255) NOT NULL DEFAULT '',
  `searcher_url_identified_data` smallint(1) NOT NULL DEFAULT '0' COMMENT 'If the data we looked for was found on this URL'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `onboarding_pipedrive_activities`
--

CREATE TABLE `onboarding_pipedrive_activities` (
  `act_id` int(11) NOT NULL DEFAULT '0',
  `activity_id` bigint(8) NOT NULL DEFAULT '0',
  `sales_activity_id` bigint(8) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `onboarding_pipedrive_notes`
--

CREATE TABLE `onboarding_pipedrive_notes` (
  `note_id` bigint(8) NOT NULL DEFAULT '0',
  `sales_note_id` bigint(8) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payment_download`
--

CREATE TABLE `payment_download` (
  `id` int(11) NOT NULL DEFAULT '0',
  `merchant_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(24) NOT NULL DEFAULT '',
  `fields` text NOT NULL DEFAULT '',
  `emails` text NOT NULL DEFAULT '',
  `file_type` varchar(12) NOT NULL DEFAULT '',
  `time_start` int(11) NOT NULL DEFAULT '0',
  `time_end` int(11) NOT NULL DEFAULT '0',
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `rows` int(11) NOT NULL DEFAULT '0',
  `rows_processed` int(11) NOT NULL DEFAULT '0',
  `time_started` int(11) NOT NULL DEFAULT '0',
  `time_finished` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payment_link`
--

CREATE TABLE `payment_link` (
  `id` int(11) NOT NULL DEFAULT '0',
  `merchant_id` int(11) NOT NULL DEFAULT '0',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '1 = email, 2 = sms',
  `disabled_link` smallint(1) NOT NULL DEFAULT '0',
  `ccrg` smallint(1) NOT NULL DEFAULT '0',
  `order_id` text NOT NULL DEFAULT '',
  `alternate_orderid` varchar(64) NOT NULL DEFAULT '',
  `currency_id` smallint(3) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `flag_fee` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = merchant pays the fee, 1 = customer pays the fee',
  `flag_subscription` smallint(1) NOT NULL DEFAULT '0',
  `subscription_amount` int(10) NOT NULL DEFAULT '0',
  `subscription_total` int(10) NOT NULL DEFAULT '0',
  `subscription_interest` varchar(11) NOT NULL DEFAULT '' COMMENT 'Daily interest',
  `mail_sender` text NOT NULL DEFAULT '',
  `mail_receiver` text NOT NULL DEFAULT '',
  `mail_subject` text NOT NULL DEFAULT '',
  `mail_body` text NOT NULL DEFAULT '',
  `time_registered` int(11) NOT NULL DEFAULT '0',
  `time_sent` int(11) NOT NULL DEFAULT '0',
  `time_paid` int(11) NOT NULL DEFAULT '0',
  `hashed_link` varchar(16) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payment_links_templates`
--

CREATE TABLE `payment_links_templates` (
  `merchant_token` varchar(100) NOT NULL DEFAULT '',
  `template_id` int(4) NOT NULL DEFAULT '0',
  `template_active` smallint(1) NOT NULL DEFAULT '1',
  `template_language` varchar(5) NOT NULL DEFAULT 'da-dk',
  `template_title` varchar(50) NOT NULL DEFAULT '',
  `template_consumer_fee` smallint(1) NOT NULL DEFAULT '0',
  `message_title` varchar(255) NOT NULL DEFAULT '',
  `message_content` longtext NOT NULL DEFAULT '',
  `template_sms_sender` varchar(50) NOT NULL DEFAULT '',
  `template_email_sender` varchar(50) NOT NULL DEFAULT '',
  `template_link_text` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `payon_clearing_institutes`
--

CREATE TABLE `payon_clearing_institutes` (
  `institute_id` int(7) NOT NULL DEFAULT '0',
  `payon_institute_id` varchar(255) NOT NULL DEFAULT '',
  `institute_name` varchar(255) NOT NULL DEFAULT '',
  `acquiring_insitution_code` varchar(10) NOT NULL DEFAULT '0',
  `acquirer_country_code` int(2) NOT NULL DEFAULT '0',
  `acceptor_data` text NOT NULL DEFAULT '' COMMENT 'Card acceptor city|Merchant Post Code|Merchant State Code|Sub-merchant City|Sub-merchant Post Code|Sub-merchant State Code',
  `transaction_category` varchar(9) NOT NULL DEFAULT 'ANY',
  `credit_sender_address` varchar(75) NOT NULL DEFAULT '',
  `terminal_id` varchar(15) NOT NULL DEFAULT 'PAYON001',
  `acceptor_country` varchar(25) NOT NULL DEFAULT 'Denmark',
  `authorization_type` varchar(25) NOT NULL DEFAULT 'FINAL_AUTHORIZATION'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pdf_customers`
--

CREATE TABLE `pdf_customers` (
  `pdf_id` bigint(12) NOT NULL DEFAULT '0',
  `merchantid` bigint(9) NOT NULL DEFAULT '0' COMMENT 'MerchantID',
  `request_time` bigint(12) NOT NULL DEFAULT '0',
  `printed_time` bigint(12) NOT NULL DEFAULT '0',
  `file_id` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pipedrive_activities`
--

CREATE TABLE `pipedrive_activities` (
  `pipedrive_dealid` bigint(12) NOT NULL DEFAULT '0',
  `pipedrive_mcc` smallint(1) NOT NULL DEFAULT '0',
  `pipedrive_fa` smallint(1) NOT NULL DEFAULT '0',
  `pipedrive_pending_mid` bigint(12) NOT NULL DEFAULT '0',
  `pipedrive_payworks` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pipedrive_deals`
--

CREATE TABLE `pipedrive_deals` (
  `pipedrive_dealid` int(7) NOT NULL DEFAULT '0',
  `merchantid` int(10) NOT NULL DEFAULT '0',
  `pipedrive_last_update` bigint(12) NOT NULL DEFAULT '0',
  `yourpay_next_update` bigint(12) NOT NULL DEFAULT '0',
  `pipedrive_owner` int(7) NOT NULL DEFAULT '792251'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pipedrive_organisations`
--

CREATE TABLE `pipedrive_organisations` (
  `pipedrive_orgid` int(11) NOT NULL DEFAULT '0',
  `pipedrive_company_id` int(20) NOT NULL DEFAULT '0',
  `organisations_name` varchar(100) NOT NULL DEFAULT '',
  `country` int(3) NOT NULL DEFAULT '208',
  `address` varchar(50) NOT NULL DEFAULT '',
  `vat` bigint(10) NOT NULL DEFAULT '0',
  `phoneno` varchar(30) NOT NULL DEFAULT '',
  `contact_email` varchar(75) NOT NULL DEFAULT '',
  `update_time_pipedrive` bigint(12) NOT NULL DEFAULT '0',
  `yourpay_next_update` bigint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `plugins`
--

CREATE TABLE `plugins` (
  `plugin_id` int(3) NOT NULL DEFAULT '0',
  `plugin_identifier` varchar(16) NOT NULL DEFAULT '',
  `plugin_name` varchar(255) NOT NULL DEFAULT '',
  `plugin_description` longtext NOT NULL DEFAULT '',
  `plugin_added` bigint(12) NOT NULL DEFAULT '0',
  `plugin_use` bigint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `plugins_containers`
--

CREATE TABLE `plugins_containers` (
  `plugin_id` int(10) NOT NULL DEFAULT '0',
  `plugin_container_key` varchar(255) NOT NULL DEFAULT '',
  `plugin_container_content` longtext NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `plugins_containers_merchants`
--

CREATE TABLE `plugins_containers_merchants` (
  `plugin_id` int(10) NOT NULL DEFAULT '0',
  `merchant_token` varchar(255) NOT NULL DEFAULT '',
  `plugin_container_key` varchar(255) NOT NULL DEFAULT '',
  `plugin_container_content` longtext NOT NULL DEFAULT '',
  `encoded` enum('no','base64') NOT NULL DEFAULT 'no',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `plugin_installed`
--

CREATE TABLE `plugin_installed` (
  `id` int(11) NOT NULL DEFAULT '0',
  `shop_name` varchar(255) NOT NULL DEFAULT '',
  `module` varchar(255) NOT NULL DEFAULT '',
  `module_version` varchar(255) NOT NULL DEFAULT '',
  `cms` varchar(255) NOT NULL DEFAULT '',
  `cms_version` varchar(255) NOT NULL DEFAULT '',
  `domain` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pricing_plans`
--

CREATE TABLE `pricing_plans` (
  `pricing_id` int(7) NOT NULL DEFAULT '0',
  `pipedrive_stage_id` int(7) NOT NULL DEFAULT '35',
  `price_currency` int(3) NOT NULL DEFAULT '208',
  `price_title` varchar(255) NOT NULL DEFAULT '',
  `price_descriptor` varchar(255) NOT NULL DEFAULT '',
  `setup_fee` int(5) NOT NULL DEFAULT '0',
  `monthly_fee` int(6) NOT NULL DEFAULT '0',
  `monthly_free_transactions` int(7) NOT NULL DEFAULT '0',
  `transaction_fee` int(3) NOT NULL DEFAULT '0',
  `fraud_detector` enum('3D Secure','3D Secure + Fraud Fighter','Fraud Detector') NOT NULL DEFAULT '3D Secure',
  `acquiring_fee` int(5) NOT NULL DEFAULT '0',
  `support` int(5) NOT NULL DEFAULT '0',
  `show_model` smallint(1) NOT NULL DEFAULT '0',
  `important` smallint(1) NOT NULL DEFAULT '0',
  `country` varchar(5) NOT NULL DEFAULT 'da-dk',
  `psper` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `products`
--

CREATE TABLE `products` (
  `product_id` int(5) NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `product_code` varchar(25) NOT NULL DEFAULT '' COMMENT 'Product Code',
  `product_name` varchar(35) NOT NULL DEFAULT '' COMMENT 'Product Name',
  `product_description` longtext NOT NULL DEFAULT '',
  `product_price` int(7) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `products_features`
--

CREATE TABLE `products_features` (
  `features_id` int(7) NOT NULL DEFAULT '0' COMMENT 'Auto ID',
  `product_id` int(7) NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `feature_code` varchar(25) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `products_sync_attributes`
--

CREATE TABLE `products_sync_attributes` (
  `attribute_id` bigint(12) NOT NULL DEFAULT '0',
  `unique_id` int(10) NOT NULL DEFAULT '0',
  `attribute_name` varchar(255) NOT NULL DEFAULT '',
  `attribute_content` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `products_sync_product`
--

CREATE TABLE `products_sync_product` (
  `unique_id` int(11) NOT NULL DEFAULT '0',
  `merchant_token` varchar(64) NOT NULL DEFAULT '',
  `product_id` varchar(255) NOT NULL DEFAULT '',
  `sku` varchar(255) NOT NULL DEFAULT '',
  `product_type` enum('simple','variant','subscription') NOT NULL DEFAULT 'simple',
  `product_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `product_pricing` int(10) NOT NULL DEFAULT '0',
  `product_currency` int(3) NOT NULL DEFAULT '208',
  `last_syncronized` bigint(12) NOT NULL DEFAULT '0',
  `status` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `questions`
--

CREATE TABLE `questions` (
  `qid` int(7) NOT NULL DEFAULT '0' COMMENT 'Auto ID',
  `title` varchar(255) NOT NULL DEFAULT '',
  `question` longtext NOT NULL DEFAULT '',
  `answer` longtext NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `questions_groups`
--

CREATE TABLE `questions_groups` (
  `id` int(7) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `rebilling_customer_products`
--

CREATE TABLE `rebilling_customer_products` (
  `rebilling_products_id` int(8) NOT NULL DEFAULT '0',
  `merchantid` int(8) NOT NULL DEFAULT '0',
  `subscriptioncode` varchar(14) NOT NULL DEFAULT '',
  `amount` int(8) NOT NULL DEFAULT '0',
  `amount_year` int(10) NOT NULL DEFAULT '0',
  `perioddate` int(10) NOT NULL DEFAULT '0',
  `perioddate_yearly` varchar(3) NOT NULL DEFAULT '0',
  `callbackurl` longtext NOT NULL DEFAULT '',
  `descriptor` varchar(255) NOT NULL DEFAULT '',
  `active` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `resursbank_getpaymentmethods`
--

CREATE TABLE `resursbank_getpaymentmethods` (
  `merchant_token` varchar(255) NOT NULL DEFAULT '',
  `months` int(3) NOT NULL DEFAULT '12',
  `aop` smallint(1) NOT NULL DEFAULT '1',
  `lang` varchar(3) NOT NULL DEFAULT 'da',
  `id` varchar(50) NOT NULL DEFAULT '',
  `descriptor` varchar(255) NOT NULL DEFAULT '',
  `min_limit` int(10) NOT NULL DEFAULT '0',
  `max_limit` int(10) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `customerType` varchar(255) NOT NULL DEFAULT '',
  `specificType` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `resursbank_getpaymentmethods_legal_links`
--

CREATE TABLE `resursbank_getpaymentmethods_legal_links` (
  `merchant_token` varchar(255) NOT NULL DEFAULT '',
  `lang` varchar(2) NOT NULL DEFAULT 'da',
  `id` varchar(255) NOT NULL DEFAULT '',
  `legal_id` int(3) NOT NULL DEFAULT '0',
  `endUserDescription` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `reviewlist`
--

CREATE TABLE `reviewlist` (
  `reviewid` int(7) NOT NULL DEFAULT '0' COMMENT 'Review ID',
  `merchantid` int(8) NOT NULL DEFAULT '0',
  `total_score` varchar(6) NOT NULL DEFAULT '',
  `total_reviews` int(6) NOT NULL DEFAULT '0',
  `unixtime` bigint(12) NOT NULL DEFAULT '0',
  `unixtime_ofday` bigint(12) NOT NULL DEFAULT '0',
  `source` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `robots`
--

CREATE TABLE `robots` (
  `robot_id` int(7) NOT NULL DEFAULT '0',
  `robot_name` varchar(255) NOT NULL DEFAULT '',
  `robot_response` bigint(12) NOT NULL DEFAULT '0' COMMENT 'last response from robot',
  `robot_group` smallint(1) NOT NULL DEFAULT '0' COMMENT 'is robot part of a group of robots',
  `robot_response_text` longtext NOT NULL DEFAULT '',
  `robot_url` varchar(255) NOT NULL DEFAULT '',
  `orderby` int(2) NOT NULL DEFAULT '0',
  `timebetween` int(8) NOT NULL DEFAULT '0' DEFAULT '600'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `robots_group`
--

CREATE TABLE `robots_group` (
  `robot_group_id` int(7) NOT NULL DEFAULT '0',
  `robot_group_name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `robot_actions`
--

CREATE TABLE `robot_actions` (
  `actionid` int(7) NOT NULL DEFAULT '0',
  `robot_name` varchar(255) NOT NULL DEFAULT '',
  `robot_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '1  = Positive',
  `robot_text_status` varchar(255) NOT NULL DEFAULT '',
  `robot_timestamp` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Unix timestamp'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `robot_verify_data_on_website`
--

CREATE TABLE `robot_verify_data_on_website` (
  `merchantid` bigint(8) NOT NULL DEFAULT '0',
  `identifer` varchar(12) NOT NULL DEFAULT '',
  `identified_time` bigint(12) NOT NULL DEFAULT '0',
  `identified_url` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `robot_verify_data_on_website_url_identificators`
--

CREATE TABLE `robot_verify_data_on_website_url_identificators` (
  `identificator_id` int(12) NOT NULL DEFAULT '0',
  `merchantid` int(8) NOT NULL DEFAULT '0',
  `attached_identificator_id` int(12) NOT NULL DEFAULT '0',
  `identificator_url` longtext NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `secure_trading_merchants`
--

CREATE TABLE `secure_trading_merchants` (
  `secure_id` bigint(12) NOT NULL DEFAULT '0',
  `merchant_token` varchar(64) NOT NULL DEFAULT '',
  `sitereference` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `server_usage`
--

CREATE TABLE `server_usage` (
  `usage_id` int(11) NOT NULL DEFAULT '0',
  `server_name` varchar(20) NOT NULL DEFAULT '',
  `file_uri` varchar(255) NOT NULL DEFAULT '',
  `lastused` bigint(12) NOT NULL DEFAULT '0',
  `removed_database_access` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table used while re-factoring to ensure non-sql server access accross different servers. Can be deleted in Summer 2020';

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `settlement_holidays`
--

CREATE TABLE `settlement_holidays` (
  `holiday_id` int(3) NOT NULL DEFAULT '0',
  `unixtimestamp` bigint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `shortly_logger`
--

CREATE TABLE `shortly_logger` (
  `logger_id` int(11) NOT NULL DEFAULT '0',
  `container` longtext NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `sql_debug_log`
--

CREATE TABLE `sql_debug_log` (
  `id` int(11) NOT NULL DEFAULT '0',
  `query_or_error` text NOT NULL DEFAULT '',
  `time_created` int(11) NOT NULL DEFAULT '0',
  `query_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `sql_error_logger`
--

CREATE TABLE `sql_error_logger` (
  `uri` varchar(255) NOT NULL DEFAULT '',
  `sqlquery` longtext NOT NULL DEFAULT '',
  `timeoferror` bigint(12) NOT NULL DEFAULT '0',
  `resolved` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `subscriptions_contacts`
--

CREATE TABLE `subscriptions_contacts` (
  `subscriber_id` int(8) NOT NULL DEFAULT '0',
  `merchant_token` varchar(255) NOT NULL DEFAULT '',
  `customer_name` varchar(255) NOT NULL DEFAULT '',
  `customer_email` varchar(255) NOT NULL DEFAULT '',
  `customer_phone` varchar(50) NOT NULL DEFAULT '',
  `customer_address` varchar(255) NOT NULL DEFAULT '',
  `customer_postal` varchar(255) NOT NULL DEFAULT '',
  `customer_city` varchar(255) NOT NULL DEFAULT '',
  `customer_country` varchar(255) NOT NULL DEFAULT 'Danmark',
  `customer_conditions` longtext NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `subscriptions_dunning`
--

CREATE TABLE `subscriptions_dunning` (
  `dunning_id` int(11) NOT NULL DEFAULT '0',
  `type` smallint(1) NOT NULL DEFAULT '0' COMMENT '0 = Check availablility, 1 = check reservation, 2 = full transaction',
  `global_header_footer` smallint(1) NOT NULL DEFAULT '0',
  `action` smallint(1) NOT NULL DEFAULT '0' COMMENT '0 = Nothing, 1 = email, 2 = sms, 3 = both',
  `merchant_token` varchar(255) NOT NULL DEFAULT '',
  `dunning_day` int(5) NOT NULL DEFAULT '0',
  `dunning_timeofday` int(5) NOT NULL DEFAULT '0',
  `dunning_email_title` longtext NOT NULL DEFAULT '',
  `dunning_email_text` longtext CHARACTER SET utf8 COLLATE utf8_danish_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `subscriptions_interest`
--

CREATE TABLE `subscriptions_interest` (
  `interest_id` int(6) NOT NULL DEFAULT '0',
  `subscription_id` int(6) NOT NULL DEFAULT '0',
  `daily_interest` varchar(8) NOT NULL DEFAULT '',
  `total_amount` int(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `subscriptions_invoices`
--

CREATE TABLE `subscriptions_invoices` (
  `invoice_id` int(8) NOT NULL DEFAULT '0',
  `subscription_id` int(8) NOT NULL DEFAULT '0',
  `merchant_token` varchar(100) NOT NULL DEFAULT '',
  `invoice_state` int(5) NOT NULL DEFAULT '0',
  `invoice_amount` int(8) NOT NULL DEFAULT '0',
  `invoice_last_retry` bigint(12) NOT NULL DEFAULT '0',
  `invoice_capture_time` bigint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `subscriptions_products`
--

CREATE TABLE `subscriptions_products` (
  `product_id` int(11) NOT NULL DEFAULT '0',
  `merchant_token` varchar(50) NOT NULL DEFAULT '',
  `product_title` varchar(50) NOT NULL DEFAULT '',
  `product_teaser` varchar(255) NOT NULL DEFAULT '',
  `product_description` longtext NOT NULL DEFAULT '',
  `product_currency` int(3) NOT NULL DEFAULT '208',
  `product_price_signup` int(5) NOT NULL DEFAULT '0',
  `product_price` int(10) NOT NULL DEFAULT '0',
  `product_period` int(12) NOT NULL DEFAULT '0',
  `product_image` blob NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `subscriptions_subscriptions`
--

CREATE TABLE `subscriptions_subscriptions` (
  `subscription_id` int(11) NOT NULL DEFAULT '0',
  `merchant_token` varchar(100) NOT NULL DEFAULT '',
  `subscription_token` varchar(16) NOT NULL DEFAULT '',
  `payment_frame` longtext NOT NULL DEFAULT '',
  `subscription_callbackurl` longtext NOT NULL DEFAULT '',
  `subscription_state` smallint(1) NOT NULL DEFAULT '1',
  `subscription_contact` int(11) NOT NULL DEFAULT '0',
  `subscription_product` int(11) NOT NULL DEFAULT '0',
  `subscription_orderid` varchar(255) NOT NULL DEFAULT '',
  `subscription_price` varchar(11) NOT NULL DEFAULT '',
  `subscription_price_signup` int(11) NOT NULL DEFAULT '0',
  `subscription_period` int(11) NOT NULL DEFAULT '0',
  `subscription_creation_time` bigint(12) NOT NULL DEFAULT '0',
  `subscription_last_renewal` bigint(12) NOT NULL DEFAULT '0',
  `subscription_next_renewal` bigint(12) NOT NULL DEFAULT '0',
  `short_id` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `system_errors`
--

CREATE TABLE `system_errors` (
  `errorid` int(7) NOT NULL DEFAULT '0' COMMENT 'SystemID',
  `errortext` longtext NOT NULL DEFAULT '',
  `solved` smallint(1) NOT NULL DEFAULT '0' COMMENT 'If Solved then 1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `terminals`
--

CREATE TABLE `terminals` (
  `TerminalID` int(5) NOT NULL DEFAULT '0' COMMENT 'AutoID',
  `psp` int(5) NOT NULL DEFAULT '0' COMMENT 'If terminal is handed out to PSP',
  `terminal_identifier` varchar(50) NOT NULL DEFAULT '',
  `terminal_model` varchar(50) NOT NULL DEFAULT '',
  `TerminalType` varchar(50) NOT NULL DEFAULT '' COMMENT 'Terminal Type',
  `PN` varchar(50) NOT NULL DEFAULT '' COMMENT 'PN for Terminal',
  `Term` varchar(30) NOT NULL DEFAULT '' COMMENT 'Term ID',
  `creationdate` bigint(12) NOT NULL DEFAULT '0',
  `totaldeposit` int(10) NOT NULL DEFAULT '0' COMMENT 'Deposit Value',
  `deposittoday` int(10) NOT NULL DEFAULT '0' COMMENT 'Actual Deposit today',
  `merchantIdentifier` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `terminals_settings`
--

CREATE TABLE `terminals_settings` (
  `terminal_id` int(11) NOT NULL DEFAULT '0',
  `setting_type` varchar(50) NOT NULL DEFAULT '',
  `setting_value` varchar(50) NOT NULL DEFAULT '',
  `settings_timestamp` bigint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `terrorlist`
--

CREATE TABLE `terrorlist` (
  `ter_id` int(7) NOT NULL DEFAULT '0',
  `name` blob NOT NULL DEFAULT '',
  `added` bigint(12) NOT NULL DEFAULT '0',
  `added_by` bigint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `toturials`
--

CREATE TABLE `toturials` (
  `toturialid` int(3) NOT NULL DEFAULT '0' COMMENT 'AutoID',
  `name` varchar(35) NOT NULL DEFAULT '' COMMENT 'Title of Toturial',
  `teaser` longtext NOT NULL DEFAULT '',
  `lang` varchar(5) NOT NULL DEFAULT 'da-dk' COMMENT 'Language',
  `country_code` int(3) NOT NULL DEFAULT '208',
  `content` longtext NOT NULL DEFAULT '' COMMENT 'Longtext',
  `active` smallint(1) NOT NULL DEFAULT '0' COMMENT 'If 1 then active',
  `lastmodified` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Last modified in Unix'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `tracking`
--

CREATE TABLE `tracking` (
  `session_id` varchar(255) NOT NULL DEFAULT '',
  `pageurl` longtext NOT NULL DEFAULT '',
  `ip2long` bigint(12) NOT NULL DEFAULT '0',
  `unixtime` bigint(12) NOT NULL DEFAULT '0',
  `trackingtype` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `transactions`
--

CREATE TABLE `transactions` (
  `TransID` bigint(12) NOT NULL DEFAULT '0' COMMENT 'AutoID',
  `AgreementID` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Connected to AgreementID',
  `TerminalID` int(2) NOT NULL DEFAULT '0' COMMENT 'TerminalID',
  `TransferDate` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Unix Timestamp for TransferDate',
  `ReceiveDate` varchar(11) NOT NULL DEFAULT '' COMMENT 'Bank Receive Date',
  `BankDate` varchar(11) NOT NULL DEFAULT '' COMMENT 'Bank Content Date',
  `TransferText` varchar(255) NOT NULL DEFAULT '' COMMENT 'Full TransferText',
  `TerminalType` varchar(6) NOT NULL DEFAULT '' COMMENT 'DKFLX',
  `TerminalDate` date NOT NULL COMMENT 'Date of Transaction',
  `fullamount` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Full TransactionAmount',
  `feeamount` int(10) NOT NULL DEFAULT '0' COMMENT 'FeeForDinTerminal',
  `depositfee` int(10) NOT NULL DEFAULT '0' COMMENT 'DepositFee',
  `onaccount` bigint(12) NOT NULL DEFAULT '0' COMMENT 'On Bank Account when Transaction was received',
  `handeled` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'If 1 then is the transaction sent to Payout',
  `approved` smallint(1) NOT NULL DEFAULT '0' COMMENT 'If 1 Then is the payment approved and ready to be paid out',
  `deleted` smallint(1) NOT NULL DEFAULT '0' COMMENT 'If 1 then error happend in row',
  `mailid` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Exported to MailID'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `transaction_touches`
--

CREATE TABLE `transaction_touches` (
  `TouchID` bigint(12) NOT NULL DEFAULT '0' COMMENT 'AutoID',
  `time` bigint(12) NOT NULL DEFAULT '0' COMMENT 'Timestamp',
  `TransID` bigint(12) NOT NULL DEFAULT '0' COMMENT 'TransactionID',
  `admin_id` int(5) NOT NULL DEFAULT '0' COMMENT 'Administrator ID',
  `action` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `translate`
--

CREATE TABLE `translate` (
  `TranslateID` bigint(5) NOT NULL DEFAULT '0' COMMENT 'AutoID',
  `Texture` longtext NOT NULL DEFAULT '' COMMENT 'Text in local language',
  `lang` varchar(5) NOT NULL DEFAULT 'da-dk' COMMENT 'Language',
  `Translation` longtext NOT NULL DEFAULT '' COMMENT 'Local Translation',
  `TranslationID` int(5) NOT NULL DEFAULT '0',
  `lastused` bigint(12) NOT NULL DEFAULT '0',
  `en-gb` smallint(1) NOT NULL DEFAULT '0',
  `nb-no` smallint(1) NOT NULL DEFAULT '0',
  `se-se` smallint(1) NOT NULL DEFAULT '0',
  `sk-sk` smallint(1) NOT NULL DEFAULT '0',
  `de-de` smallint(1) NOT NULL DEFAULT '0',
  `nl-nl` smallint(1) NOT NULL DEFAULT '0',
  `fr-fr` smallint(1) NOT NULL DEFAULT '0',
  `pl-pl` smallint(1) NOT NULL DEFAULT '0',
  `ru-ru` smallint(1) NOT NULL DEFAULT '0',
  `ro-ro` smallint(1) NOT NULL DEFAULT '0',
  `es-es` smallint(1) NOT NULL DEFAULT '0',
  `fo-fo` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `translate_langs`
--

CREATE TABLE `translate_langs` (
  `TranslateID` int(7) NOT NULL DEFAULT '0' COMMENT 'TranslateID',
  `language` varchar(5) NOT NULL DEFAULT '' DEFAULT 'en' COMMENT 'Language',
  `text` longtext NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `translations`
--

CREATE TABLE `translations` (
  `translateid` int(7) NOT NULL DEFAULT '0',
  `text` longtext NOT NULL DEFAULT '',
  `original_text` longtext NOT NULL DEFAULT '',
  `language` varchar(5) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `unitests`
--

CREATE TABLE `unitests` (
  `uni_id` int(7) NOT NULL DEFAULT '0' COMMENT 'Automated ID',
  `uni_title` varchar(255) NOT NULL DEFAULT '',
  `uni_url` varchar(255) NOT NULL DEFAULT '',
  `status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 = failed, 1 = success',
  `timestp` bigint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `unitest_results`
--

CREATE TABLE `unitest_results` (
  `result_id` int(11) NOT NULL DEFAULT '0',
  `completed` int(7) NOT NULL DEFAULT '0',
  `failed` int(7) NOT NULL DEFAULT '0',
  `timestp` bigint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `user_token_logging`
--

CREATE TABLE `user_token_logging` (
  `log_id` int(7) NOT NULL DEFAULT '0' COMMENT 'Token Log',
  `token` varchar(255) NOT NULL DEFAULT '',
  `url` longtext NOT NULL DEFAULT '',
  `timestp` bigint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `viabill_logger`
--

CREATE TABLE `viabill_logger` (
  `id` int(5) NOT NULL DEFAULT '0',
  `container` longtext NOT NULL DEFAULT '',
  `checked` int(11) NOT NULL DEFAULT '0',
  `transferred` int(11) NOT NULL DEFAULT '0',
  `log_state` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `webservice_logger`
--

CREATE TABLE `webservice_logger` (
  `serviceid` int(7) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `functionrequest` varchar(255) NOT NULL DEFAULT '',
  `container` longtext NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `yourpark_car`
--

CREATE TABLE `yourpark_car` (
  `id` int(11) NOT NULL DEFAULT '0',
  `numberplate` varchar(7) NOT NULL DEFAULT '',
  `country` varchar(11) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `yourpark_country`
--

CREATE TABLE `yourpark_country` (
  `id` int(11) NOT NULL DEFAULT '0',
  `country` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `yourpark_parking`
--

CREATE TABLE `yourpark_parking` (
  `id` int(11) NOT NULL DEFAULT '0',
  `numberplate` int(7) NOT NULL DEFAULT '0',
  `start_timestamp` int(11) NOT NULL DEFAULT '0',
  `end_timestamp` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `yourpark_parking_meter`
--

CREATE TABLE `yourpark_parking_meter` (
  `id` int(11) NOT NULL DEFAULT '0',
  `company` varchar(30) NOT NULL DEFAULT '',
  `time_expiration` int(11) NOT NULL DEFAULT '0',
  `country` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `yourpark_zones`
--

CREATE TABLE `yourpark_zones` (
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `company` varchar(30) NOT NULL DEFAULT '',
  `expiretime` int(11) NOT NULL DEFAULT '0',
  `country_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE blacklist_merchant_tokens (
blacklist_id int(12) NOT NULL DEFAULT '0',
merchant_token varchar(70) NOT NULL DEFAULT '',
blacklist_time bigint(12) NOT NULL DEFAULT '0',
blacklist_reason varchar(120) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE blacklist_merchant_tokens
ADD PRIMARY KEY (blacklist_id);
ALTER TABLE blacklist_merchant_tokens
MODIFY blacklist_id int(12) NOT NULL AUTO_INCREMENT;

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
  ADD UNIQUE KEY `merchant_token` (`merchant_token`);

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
  ADD KEY `merchantid` (`merchantid`);

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
  MODIFY `api_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `api_groups`
--
ALTER TABLE `api_groups`
  MODIFY `api_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `api_params`
--
ALTER TABLE `api_params`
  MODIFY `api_param` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `api_requests`
--
ALTER TABLE `api_requests`
  MODIFY `request_id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `app_dk_economic_sync`
--
ALTER TABLE `app_dk_economic_sync`
  MODIFY `sync_id` int(12) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `app_economic_sync`
--
ALTER TABLE `app_economic_sync`
  MODIFY `sync_id` int(7) NOT NULL AUTO_INCREMENT COMMENT 'Auto ID';

--
-- Tilføj AUTO_INCREMENT i tabel `app_user_invoicing`
--
ALTER TABLE `app_user_invoicing`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `app_user_pricing`
--
ALTER TABLE `app_user_pricing`
  MODIFY `user_pricing_id` int(8) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `bambora_merchants`
--
ALTER TABLE `bambora_merchants`
  MODIFY `bambora_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `beta_codes`
--
ALTER TABLE `beta_codes`
  MODIFY `betaid` int(7) NOT NULL AUTO_INCREMENT COMMENT 'BetaID';

--
-- Tilføj AUTO_INCREMENT i tabel `blog`
--
ALTER TABLE `blog`
  MODIFY `blog_id` int(7) NOT NULL AUTO_INCREMENT COMMENT 'Auto ID';

--
-- Tilføj AUTO_INCREMENT i tabel `campaign_codes`
--
ALTER TABLE `campaign_codes`
  MODIFY `campaignid` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `company_review`
--
ALTER TABLE `company_review`
  MODIFY `ReviewID` int(5) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `consumer_data`
--
ALTER TABLE `consumer_data`
  MODIFY `consumer_id` bigint(12) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `crawler`
--
ALTER TABLE `crawler`
  MODIFY `CrawlerID` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `crawler_trustpilot`
--
ALTER TABLE `crawler_trustpilot`
  MODIFY `CrawlerID` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `crm_customers`
--
ALTER TABLE `crm_customers`
  MODIFY `crmID` int(7) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID';

--
-- Tilføj AUTO_INCREMENT i tabel `crm_login`
--
ALTER TABLE `crm_login`
  MODIFY `user_id` int(6) NOT NULL AUTO_INCREMENT COMMENT 'UserID';

--
-- Tilføj AUTO_INCREMENT i tabel `crm_login_psp`
--
ALTER TABLE `crm_login_psp`
  MODIFY `pspid` int(2) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `crm_login_psp_monthly_data_months`
--
ALTER TABLE `crm_login_psp_monthly_data_months`
  MODIFY `month_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_acquirer`
--
ALTER TABLE `customer_acquirer`
  MODIFY `cacquirer_id` int(6) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_activities`
--
ALTER TABLE `customer_activities`
  MODIFY `activity_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_agreement`
--
ALTER TABLE `customer_agreement`
  MODIFY `agreement` int(5) NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `customer_agreement_reviews`
--
ALTER TABLE `customer_agreement_reviews`
  MODIFY `review_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_app_settings`
--
ALTER TABLE `customer_app_settings`
  MODIFY `setting_id` bigint(12) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_complaints`
--
ALTER TABLE `customer_complaints`
  MODIFY `complaintid` int(12) NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `customer_csv`
--
ALTER TABLE `customer_csv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_cvr_audit`
--
ALTER TABLE `customer_cvr_audit`
  MODIFY `audit_id` int(8) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_data_collection`
--
ALTER TABLE `customer_data_collection`
  MODIFY `collection_id` bigint(12) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_domains`
--
ALTER TABLE `customer_domains`
  MODIFY `DomainID` bigint(9) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_expected_revenue`
--
ALTER TABLE `customer_expected_revenue`
  MODIFY `recenueID` int(8) NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `customer_important_notifications`
--
ALTER TABLE `customer_important_notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_invoices`
--
ALTER TABLE `customer_invoices`
  MODIFY `invoiceID` bigint(12) NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `customer_lead`
--
ALTER TABLE `customer_lead`
  MODIFY `leadid` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_logins`
--
ALTER TABLE `customer_logins`
  MODIFY `LoginID` int(7) NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `customer_logins_activity`
--
ALTER TABLE `customer_logins_activity`
  MODIFY `activityid` int(7) NOT NULL AUTO_INCREMENT COMMENT 'Unique Identifier';

--
-- Tilføj AUTO_INCREMENT i tabel `customer_logins_apppassword`
--
ALTER TABLE `customer_logins_apppassword`
  MODIFY `password_id` int(6) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_login_session_details`
--
ALTER TABLE `customer_login_session_details`
  MODIFY `details_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_owners`
--
ALTER TABLE `customer_owners`
  MODIFY `OwnerFileID` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_payment_download`
--
ALTER TABLE `customer_payment_download`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_payon`
--
ALTER TABLE `customer_payon`
  MODIFY `channelID` int(8) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_payon_psp`
--
ALTER TABLE `customer_payon_psp`
  MODIFY `pspid` int(7) NOT NULL AUTO_INCREMENT COMMENT 'Auto ID';

--
-- Tilføj AUTO_INCREMENT i tabel `customer_products`
--
ALTER TABLE `customer_products`
  MODIFY `product_id` int(7) NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `customer_products_groups`
--
ALTER TABLE `customer_products_groups`
  MODIFY `group_id` int(7) NOT NULL AUTO_INCREMENT COMMENT 'Group ID';

--
-- Tilføj AUTO_INCREMENT i tabel `customer_product_stock_decrease`
--
ALTER TABLE `customer_product_stock_decrease`
  MODIFY `decrease_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_subscriptions`
--
ALTER TABLE `customer_subscriptions`
  MODIFY `subscription_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `customer_transfer_accounts`
--
ALTER TABLE `customer_transfer_accounts`
  MODIFY `accountid` bigint(12) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `deals_registered_won`
--
ALTER TABLE `deals_registered_won`
  MODIFY `deal_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `documentation_code_example`
--
ALTER TABLE `documentation_code_example`
  MODIFY `example_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `documentation_entities`
--
ALTER TABLE `documentation_entities`
  MODIFY `entities_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `documentation_titles`
--
ALTER TABLE `documentation_titles`
  MODIFY `documentation_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `documents`
--
ALTER TABLE `documents`
  MODIFY `document_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `documents_groups`
--
ALTER TABLE `documents_groups`
  MODIFY `doc_group_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `jobid` int(5) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `MailQueue`
--
ALTER TABLE `MailQueue`
  MODIFY `MailID` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Auto ID';

--
-- Tilføj AUTO_INCREMENT i tabel `MailSMSQueue`
--
ALTER TABLE `MailSMSQueue`
  MODIFY `sms_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `mail_template`
--
ALTER TABLE `mail_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `mail_wrapper`
--
ALTER TABLE `mail_wrapper`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `manual_adjustments`
--
ALTER TABLE `manual_adjustments`
  MODIFY `adjustment_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `maxtel`
--
ALTER TABLE `maxtel`
  MODIFY `phone_reg` bigint(12) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `merchant_outgoing_transactions`
--
ALTER TABLE `merchant_outgoing_transactions`
  MODIFY `ImportID` bigint(12) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `merchant_outgoing_transactions_verification`
--
ALTER TABLE `merchant_outgoing_transactions_verification`
  MODIFY `v_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `merchant_refunds_accounts`
--
ALTER TABLE `merchant_refunds_accounts`
  MODIFY `refund_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `merchant_transfer_accounts_daily_overview`
--
ALTER TABLE `merchant_transfer_accounts_daily_overview`
  MODIFY `dateid` bigint(12) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `navision_exports`
--
ALTER TABLE `navision_exports`
  MODIFY `exports_id` bigint(12) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `navision_review`
--
ALTER TABLE `navision_review`
  MODIFY `AutoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Unique Identifier';

--
-- Tilføj AUTO_INCREMENT i tabel `new_website_blog`
--
ALTER TABLE `new_website_blog`
  MODIFY `blog_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `onboarding_data_searcher`
--
ALTER TABLE `onboarding_data_searcher`
  MODIFY `searcher_id` int(12) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `onboarding_data_searcher_url`
--
ALTER TABLE `onboarding_data_searcher_url`
  MODIFY `searcher_url_id` int(12) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `onboarding_pipedrive_activities`
--
ALTER TABLE `onboarding_pipedrive_activities`
  MODIFY `act_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `payment_download`
--
ALTER TABLE `payment_download`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `payment_link`
--
ALTER TABLE `payment_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `payment_links_templates`
--
ALTER TABLE `payment_links_templates`
  MODIFY `template_id` int(4) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `payon_clearing_institutes`
--
ALTER TABLE `payon_clearing_institutes`
  MODIFY `institute_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `pdf_customers`
--
ALTER TABLE `pdf_customers`
  MODIFY `pdf_id` bigint(12) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `plugins`
--
ALTER TABLE `plugins`
  MODIFY `plugin_id` int(3) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `plugin_installed`
--
ALTER TABLE `plugin_installed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `pricing_plans`
--
ALTER TABLE `pricing_plans`
  MODIFY `pricing_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Product ID';

--
-- Tilføj AUTO_INCREMENT i tabel `products_features`
--
ALTER TABLE `products_features`
  MODIFY `features_id` int(7) NOT NULL AUTO_INCREMENT COMMENT 'Auto ID';

--
-- Tilføj AUTO_INCREMENT i tabel `products_sync_attributes`
--
ALTER TABLE `products_sync_attributes`
  MODIFY `attribute_id` bigint(12) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `products_sync_product`
--
ALTER TABLE `products_sync_product`
  MODIFY `unique_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `questions`
--
ALTER TABLE `questions`
  MODIFY `qid` int(7) NOT NULL AUTO_INCREMENT COMMENT 'Auto ID';

--
-- Tilføj AUTO_INCREMENT i tabel `questions_groups`
--
ALTER TABLE `questions_groups`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `rebilling_customer_products`
--
ALTER TABLE `rebilling_customer_products`
  MODIFY `rebilling_products_id` int(8) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `reviewlist`
--
ALTER TABLE `reviewlist`
  MODIFY `reviewid` int(7) NOT NULL AUTO_INCREMENT COMMENT 'Review ID';

--
-- Tilføj AUTO_INCREMENT i tabel `robots`
--
ALTER TABLE `robots`
  MODIFY `robot_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `robot_actions`
--
ALTER TABLE `robot_actions`
  MODIFY `actionid` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `robot_verify_data_on_website_url_identificators`
--
ALTER TABLE `robot_verify_data_on_website_url_identificators`
  MODIFY `identificator_id` int(12) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `secure_trading_merchants`
--
ALTER TABLE `secure_trading_merchants`
  MODIFY `secure_id` bigint(12) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `server_usage`
--
ALTER TABLE `server_usage`
  MODIFY `usage_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `settlement_holidays`
--
ALTER TABLE `settlement_holidays`
  MODIFY `holiday_id` int(3) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `shortly_logger`
--
ALTER TABLE `shortly_logger`
  MODIFY `logger_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `sql_debug_log`
--
ALTER TABLE `sql_debug_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `subscriptions_contacts`
--
ALTER TABLE `subscriptions_contacts`
  MODIFY `subscriber_id` int(8) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `subscriptions_dunning`
--
ALTER TABLE `subscriptions_dunning`
  MODIFY `dunning_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `subscriptions_interest`
--
ALTER TABLE `subscriptions_interest`
  MODIFY `interest_id` int(6) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `subscriptions_invoices`
--
ALTER TABLE `subscriptions_invoices`
  MODIFY `invoice_id` int(8) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `subscriptions_products`
--
ALTER TABLE `subscriptions_products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `subscriptions_subscriptions`
--
ALTER TABLE `subscriptions_subscriptions`
  MODIFY `subscription_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `system_errors`
--
ALTER TABLE `system_errors`
  MODIFY `errorid` int(7) NOT NULL AUTO_INCREMENT COMMENT 'SystemID';

--
-- Tilføj AUTO_INCREMENT i tabel `terminals`
--
ALTER TABLE `terminals`
  MODIFY `TerminalID` int(5) NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `terrorlist`
--
ALTER TABLE `terrorlist`
  MODIFY `ter_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `toturials`
--
ALTER TABLE `toturials`
  MODIFY `toturialid` int(3) NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `TransID` bigint(12) NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `transaction_touches`
--
ALTER TABLE `transaction_touches`
  MODIFY `TouchID` bigint(12) NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `translate`
--
ALTER TABLE `translate`
  MODIFY `TranslateID` bigint(5) NOT NULL AUTO_INCREMENT COMMENT 'AutoID';

--
-- Tilføj AUTO_INCREMENT i tabel `unitests`
--
ALTER TABLE `unitests`
  MODIFY `uni_id` int(7) NOT NULL AUTO_INCREMENT COMMENT 'Automated ID';

--
-- Tilføj AUTO_INCREMENT i tabel `unitest_results`
--
ALTER TABLE `unitest_results`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `user_token_logging`
--
ALTER TABLE `user_token_logging`
  MODIFY `log_id` int(7) NOT NULL AUTO_INCREMENT COMMENT 'Token Log';

--
-- Tilføj AUTO_INCREMENT i tabel `viabill_logger`
--
ALTER TABLE `viabill_logger`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `webservice_logger`
--
ALTER TABLE `webservice_logger`
  MODIFY `serviceid` int(7) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `yourpark_car`
--
ALTER TABLE `yourpark_car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `yourpark_parking`
--
ALTER TABLE `yourpark_parking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `yourpark_parking`
--
ALTER TABLE `yourpark_parking`
  ADD CONSTRAINT `yourpark_parking_ibfk_1` FOREIGN KEY (`id`) REFERENCES `yourpark_car` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Begrænsninger for tabel `yourpark_zones`
--
ALTER TABLE `yourpark_zones`
  ADD CONSTRAINT `yourpark_zones_ibfk_1` FOREIGN KEY (`zone_id`) REFERENCES `yourpark_parking` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
--Tilføj in_use kolone i tabel robots
--
ALTER TABLE `robots`
  ADD in_use int NOT NULL DEFAULT 0;

--
--Tilføj last_used kolone i tabel robots
--
ALTER TABLE `robots`
  ADD last_used int NOT NULL DEFAULT 0;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
