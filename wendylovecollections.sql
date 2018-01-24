-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2016 at 06:21 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wendylovecollections`
--

-- --------------------------------------------------------

--
-- Table structure for table `ospos_app_config`
--

CREATE TABLE IF NOT EXISTS `ospos_app_config` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_app_config`
--

INSERT INTO `ospos_app_config` (`key`, `value`) VALUES
('address', 'Lagos Town - Anaji'),
('barcode_content', 'id'),
('barcode_first_row', 'category'),
('barcode_font', 'Arial'),
('barcode_font_size', '10'),
('barcode_generate_if_empty', '0'),
('barcode_height', '50'),
('barcode_num_in_row', '2'),
('barcode_page_cellspacing', '20'),
('barcode_page_width', '100'),
('barcode_quality', '100'),
('barcode_second_row', 'item_code'),
('barcode_third_row', 'unit_price'),
('barcode_type', 'Code39'),
('barcode_width', '250'),
('company', 'Wendy Love Mothercare  P.O.S'),
('company_logo', ''),
('currency_decimals', '2'),
('currency_side', '0'),
('currency_symbol', 'GHc'),
('dateformat', 'm/d/Y'),
('decimal_point', '.'),
('default_sales_discount', '0'),
('default_tax_rate', '8'),
('email', 'stotwen@yahoo.com'),
('fax', ''),
('invoice_default_comments', 'This is a default comment'),
('invoice_email_message', 'Dear GHcCU, In attachment the receipt for sale GHcINV'),
('invoice_enable', '1'),
('language', 'en'),
('lines_per_page', '25'),
('msg_msg', ''),
('msg_pwd', ''),
('msg_src', ''),
('msg_uid', ''),
('phone', '0208182955'),
('print_bottom_margin', '0'),
('print_footer', '0'),
('print_header', '0'),
('print_left_margin', '0'),
('print_right_margin', '0'),
('print_silently', '1'),
('print_top_margin', '0'),
('quantity_decimals', '0'),
('receipt_show_description', '1'),
('receipt_show_serialnumber', '1'),
('receipt_show_taxes', '0'),
('receipt_show_total_discount', '1'),
('recv_invoice_format', 'GHcCO'),
('return_policy', 'Test'),
('sales_invoice_format', 'GHcCO'),
('tax_decimals', '2'),
('tax_included', '0'),
('thousands_separator', ''),
('timeformat', 'H:i:s'),
('timezone', 'America/Los_Angeles'),
('use_invoice_template', '1'),
('website', '');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_customers`
--

CREATE TABLE IF NOT EXISTS `ospos_customers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `taxable` int(1) NOT NULL DEFAULT '1',
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_customers`
--

INSERT INTO `ospos_customers` (`person_id`, `company_name`, `account_number`, `taxable`, `discount_percent`, `deleted`) VALUES
(2, NULL, NULL, 1, '0.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_employees`
--

CREATE TABLE IF NOT EXISTS `ospos_employees` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_employees`
--

INSERT INTO `ospos_employees` (`username`, `password`, `person_id`, `deleted`) VALUES
('admin', 'c4ca4238a0b923820dcc509a6f75849b', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_giftcards`
--

CREATE TABLE IF NOT EXISTS `ospos_giftcards` (
  `record_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`giftcard_id` int(11) NOT NULL,
  `giftcard_number` int(10) NOT NULL,
  `value` decimal(15,2) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `person_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_grants`
--

CREATE TABLE IF NOT EXISTS `ospos_grants` (
  `permission_id` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_grants`
--

INSERT INTO `ospos_grants` (`permission_id`, `person_id`) VALUES
('config', 1),
('customers', 1),
('employees', 1),
('giftcards', 1),
('items', 1),
('items_stock', 1),
('item_kits', 1),
('receivings', 1),
('receivings_stock', 1),
('reports', 1),
('reports_categories', 1),
('reports_customers', 1),
('reports_discounts', 1),
('reports_employees', 1),
('reports_inventory', 1),
('reports_items', 1),
('reports_payments', 1),
('reports_receivings', 1),
('reports_sales', 1),
('reports_suppliers', 1),
('reports_taxes', 1),
('sales', 1),
('sales_stock', 1),
('suppliers', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_inventory`
--

CREATE TABLE IF NOT EXISTS `ospos_inventory` (
`trans_id` int(11) NOT NULL,
  `trans_items` int(11) NOT NULL DEFAULT '0',
  `trans_user` int(11) NOT NULL DEFAULT '0',
  `trans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_comment` text NOT NULL,
  `trans_location` int(11) NOT NULL,
  `trans_inventory` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_inventory`
--

INSERT INTO `ospos_inventory` (`trans_id`, `trans_items`, `trans_user`, `trans_date`, `trans_comment`, `trans_location`, `trans_inventory`) VALUES
(1, 1, 1, '2016-05-20 07:45:40', 'Manual Edit of Quantity', 1, 3330),
(2, 1, 1, '2016-05-29 08:01:43', 'POS 1', 1, -19),
(3, 1, 1, '2016-07-06 05:57:51', 'POS 2', 1, -2),
(4, 1, 1, '2016-07-06 06:04:09', 'POS 3', 1, -2),
(5, 1, 1, '2016-07-06 03:17:27', 'POS 4', 1, -2),
(6, 1, 1, '2016-07-06 04:06:17', 'POS 5', 1, -1),
(7, 1, 1, '2016-07-06 04:07:42', 'POS 6', 1, -1),
(8, 1, 1, '2016-07-06 17:49:39', 'POS 7', 1, -1),
(9, 1, 1, '2016-07-06 17:53:06', 'POS 8', 1, -1),
(10, 1, 1, '2016-07-06 17:56:02', 'POS 9', 1, -1),
(11, 1, 1, '2016-07-06 17:58:41', 'POS 10', 1, -2),
(12, 1, 1, '2016-07-06 18:00:22', 'POS 11', 1, -1),
(13, 1, 1, '2016-07-06 18:02:01', 'POS 12', 1, -1),
(14, 1, 1, '2016-08-05 13:49:06', '', 1, 44),
(15, 1, 1, '2016-08-05 13:49:34', '', 1, 40),
(16, 1, 1, '2016-08-05 13:49:45', '', 1, -7),
(17, 1, 1, '2016-08-05 13:51:58', 'RECV 1', 1, 1),
(18, 1, 1, '2016-08-05 13:52:39', 'RECV 2', 1, 100),
(19, 1, 1, '2016-08-05 14:01:39', 'POS 13', 1, -8);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_items`
--

CREATE TABLE IF NOT EXISTS `ospos_items` (
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `cost_price` decimal(15,2) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `reorder_level` decimal(15,3) NOT NULL DEFAULT '0.000',
  `receiving_quantity` decimal(15,3) NOT NULL DEFAULT '1.000',
`item_id` int(10) NOT NULL,
  `pic_id` int(10) DEFAULT NULL,
  `allow_alt_description` tinyint(1) NOT NULL,
  `is_serialized` tinyint(1) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `custom1` varchar(25) NOT NULL,
  `custom2` varchar(25) NOT NULL,
  `custom3` varchar(25) NOT NULL,
  `custom4` varchar(25) NOT NULL,
  `custom5` varchar(25) NOT NULL,
  `custom6` varchar(25) NOT NULL,
  `custom7` varchar(25) NOT NULL,
  `custom8` varchar(25) NOT NULL,
  `custom9` varchar(25) NOT NULL,
  `custom10` varchar(25) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_items`
--

INSERT INTO `ospos_items` (`name`, `category`, `supplier_id`, `item_number`, `description`, `cost_price`, `unit_price`, `reorder_level`, `receiving_quantity`, `item_id`, `pic_id`, `allow_alt_description`, `is_serialized`, `deleted`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES
('Mango', 'dkdk', NULL, '9939', 'fdnfndf', '33.00', '333.00', '0.000', '0.000', 1, NULL, 0, 0, 0, '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_items_taxes`
--

CREATE TABLE IF NOT EXISTS `ospos_items_taxes` (
  `item_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_items_taxes`
--

INSERT INTO `ospos_items_taxes` (`item_id`, `name`, `percent`) VALUES
(1, 'dnd', '3.000'),
(1, 'nd', '2.000');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_item_kits`
--

CREATE TABLE IF NOT EXISTS `ospos_item_kits` (
`item_kit_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_item_kit_items`
--

CREATE TABLE IF NOT EXISTS `ospos_item_kit_items` (
  `item_kit_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` decimal(15,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_item_quantities`
--

CREATE TABLE IF NOT EXISTS `ospos_item_quantities` (
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `quantity` decimal(15,3) NOT NULL DEFAULT '0.000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_item_quantities`
--

INSERT INTO `ospos_item_quantities` (`item_id`, `location_id`, `quantity`) VALUES
(1, 1, '3466.000');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_modules`
--

CREATE TABLE IF NOT EXISTS `ospos_modules` (
  `name_lang_key` varchar(255) NOT NULL,
  `desc_lang_key` varchar(255) NOT NULL,
  `sort` int(10) NOT NULL,
  `module_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_modules`
--

INSERT INTO `ospos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES
('module_config', 'module_config_desc', 110, 'config'),
('module_customers', 'module_customers_desc', 10, 'customers'),
('module_employees', 'module_employees_desc', 80, 'employees'),
('module_giftcards', 'module_giftcards_desc', 90, 'giftcards'),
('module_items', 'module_items_desc', 20, 'items'),
('module_item_kits', 'module_item_kits_desc', 30, 'item_kits'),
('module_receivings', 'module_receivings_desc', 60, 'receivings'),
('module_reports', 'module_reports_desc', 50, 'reports'),
('module_sales', 'module_sales_desc', 70, 'sales'),
('module_suppliers', 'module_suppliers_desc', 40, 'suppliers');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_people`
--

CREATE TABLE IF NOT EXISTS `ospos_people` (
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` int(1) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `comments` text NOT NULL,
`person_id` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_people`
--

INSERT INTO `ospos_people` (`first_name`, `last_name`, `gender`, `phone_number`, `email`, `address_1`, `address_2`, `city`, `state`, `zip`, `country`, `comments`, `person_id`) VALUES
('John', 'Doe', NULL, '555-555-5555', 'admin@pappastech.com', 'Address 1', '', '', '', '', '', '', 1),
('John', 'Okafor', 1, '0243348522', 'gadocansey@ymail.com', 'hjjh', 'ffff', '', '', '', '', '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_permissions`
--

CREATE TABLE IF NOT EXISTS `ospos_permissions` (
  `permission_id` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `location_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_permissions`
--

INSERT INTO `ospos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES
('config', 'config', NULL),
('customers', 'customers', NULL),
('employees', 'employees', NULL),
('giftcards', 'giftcards', NULL),
('items', 'items', NULL),
('items_stock', 'items', 1),
('item_kits', 'item_kits', NULL),
('receivings', 'receivings', NULL),
('receivings_stock', 'receivings', 1),
('reports', 'reports', NULL),
('reports_categories', 'reports', NULL),
('reports_customers', 'reports', NULL),
('reports_discounts', 'reports', NULL),
('reports_employees', 'reports', NULL),
('reports_inventory', 'reports', NULL),
('reports_items', 'reports', NULL),
('reports_payments', 'reports', NULL),
('reports_receivings', 'reports', NULL),
('reports_sales', 'reports', NULL),
('reports_suppliers', 'reports', NULL),
('reports_taxes', 'reports', NULL),
('sales', 'sales', NULL),
('sales_stock', 'sales', 1),
('suppliers', 'suppliers', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_receivings`
--

CREATE TABLE IF NOT EXISTS `ospos_receivings` (
  `receiving_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
`receiving_id` int(10) NOT NULL,
  `payment_type` varchar(20) DEFAULT NULL,
  `invoice_number` varchar(32) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_receivings`
--

INSERT INTO `ospos_receivings` (`receiving_time`, `supplier_id`, `employee_id`, `comment`, `receiving_id`, `payment_type`, `invoice_number`) VALUES
('2016-08-05 13:51:57', NULL, 1, '', 1, 'Cash', NULL),
('2016-08-05 13:52:39', NULL, 1, '', 2, 'Cash', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_receivings_items`
--

CREATE TABLE IF NOT EXISTS `ospos_receivings_items` (
  `receiving_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL,
  `quantity_purchased` decimal(15,3) NOT NULL DEFAULT '0.000',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL,
  `receiving_quantity` decimal(15,3) NOT NULL DEFAULT '1.000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_receivings_items`
--

INSERT INTO `ospos_receivings_items` (`receiving_id`, `item_id`, `description`, `serialnumber`, `line`, `quantity_purchased`, `item_cost_price`, `item_unit_price`, `discount_percent`, `item_location`, `receiving_quantity`) VALUES
(1, 1, 'fdnfndf', '', 1, '1.000', '33.00', '33.00', '0.00', 1, '0.000'),
(2, 1, 'fdnfndf', NULL, 1, '100.000', '33.00', '33.00', '0.00', 1, '0.000');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales`
--

CREATE TABLE IF NOT EXISTS `ospos_sales` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `invoice_number` varchar(32) DEFAULT NULL,
`sale_id` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_sales`
--

INSERT INTO `ospos_sales` (`sale_time`, `customer_id`, `employee_id`, `comment`, `invoice_number`, `sale_id`) VALUES
('2016-05-29 08:01:42', NULL, 1, '', NULL, 1),
('2016-07-06 05:57:51', NULL, 1, '', NULL, 2),
('2016-07-06 06:04:09', NULL, 1, '', NULL, 3),
('2016-07-06 03:17:27', NULL, 1, '', NULL, 4),
('2016-07-06 04:06:17', NULL, 1, '', NULL, 5),
('2016-07-06 04:07:41', NULL, 1, '', NULL, 6),
('2016-07-06 17:49:39', NULL, 1, '', NULL, 7),
('2016-07-06 17:53:06', NULL, 1, '', NULL, 8),
('2016-07-06 17:56:02', NULL, 1, '', NULL, 9),
('2016-07-06 17:58:41', NULL, 1, '', NULL, 10),
('2016-07-06 18:00:22', NULL, 1, '', NULL, 11),
('2016-07-06 18:02:01', NULL, 1, '', NULL, 12),
('2016-08-05 14:01:39', NULL, 1, '', NULL, 13);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_items`
--

CREATE TABLE IF NOT EXISTS `ospos_sales_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(15,3) NOT NULL DEFAULT '0.000',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_sales_items`
--

INSERT INTO `ospos_sales_items` (`sale_id`, `item_id`, `description`, `serialnumber`, `line`, `quantity_purchased`, `item_cost_price`, `item_unit_price`, `discount_percent`, `item_location`) VALUES
(1, 1, 'fdnfndf', '', 1, '19.000', '33.00', '333.00', '0.00', 1),
(2, 1, 'fdnfndf', '', 1, '2.000', '33.00', '333.00', '0.00', 1),
(3, 1, 'fdnfndf', '', 1, '2.000', '33.00', '333.00', '0.00', 1),
(4, 1, 'fdnfndf', '', 1, '2.000', '33.00', '333.00', '0.00', 1),
(5, 1, 'fdnfndf', '', 1, '1.000', '33.00', '333.00', '0.00', 1),
(6, 1, 'fdnfndf', '', 1, '1.000', '33.00', '333.00', '0.00', 1),
(7, 1, 'fdnfndf', '', 1, '1.000', '33.00', '333.00', '0.00', 1),
(8, 1, 'fdnfndf', '', 1, '1.000', '33.00', '333.00', '0.00', 1),
(9, 1, 'fdnfndf', '', 1, '1.000', '33.00', '333.00', '0.00', 1),
(10, 1, 'fdnfndf', '', 1, '2.000', '33.00', '333.00', '0.00', 1),
(11, 1, 'fdnfndf', '', 1, '1.000', '33.00', '333.00', '0.00', 1),
(12, 1, 'fdnfndf', '', 1, '1.000', '33.00', '333.00', '0.00', 1),
(13, 1, 'fdnfndf', '', 1, '8.000', '33.00', '333.00', '0.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_items_taxes`
--

CREATE TABLE IF NOT EXISTS `ospos_sales_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_sales_items_taxes`
--

INSERT INTO `ospos_sales_items_taxes` (`sale_id`, `item_id`, `line`, `name`, `percent`) VALUES
(1, 1, 1, 'dnd', '3.000'),
(1, 1, 1, 'nd', '2.000'),
(2, 1, 1, 'dnd', '3.000'),
(2, 1, 1, 'nd', '2.000'),
(3, 1, 1, 'dnd', '3.000'),
(3, 1, 1, 'nd', '2.000'),
(4, 1, 1, 'dnd', '3.000'),
(4, 1, 1, 'nd', '2.000'),
(5, 1, 1, 'dnd', '3.000'),
(5, 1, 1, 'nd', '2.000'),
(6, 1, 1, 'dnd', '3.000'),
(6, 1, 1, 'nd', '2.000'),
(7, 1, 1, 'dnd', '3.000'),
(7, 1, 1, 'nd', '2.000'),
(8, 1, 1, 'dnd', '3.000'),
(8, 1, 1, 'nd', '2.000'),
(9, 1, 1, 'dnd', '3.000'),
(9, 1, 1, 'nd', '2.000'),
(10, 1, 1, 'dnd', '3.000'),
(10, 1, 1, 'nd', '2.000'),
(11, 1, 1, 'dnd', '3.000'),
(11, 1, 1, 'nd', '2.000'),
(12, 1, 1, 'dnd', '3.000'),
(12, 1, 1, 'nd', '2.000'),
(13, 1, 1, 'dnd', '3.000'),
(13, 1, 1, 'nd', '2.000');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_payments`
--

CREATE TABLE IF NOT EXISTS `ospos_sales_payments` (
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_sales_payments`
--

INSERT INTO `ospos_sales_payments` (`sale_id`, `payment_type`, `payment_amount`) VALUES
(1, 'Debit Card', '6643.35'),
(2, 'Cash', '699.30'),
(3, 'Cash', '699.30'),
(4, 'Cash', '1398.60'),
(5, 'Cash', '349.65'),
(6, 'Cash', '349.65'),
(7, 'Cash', '349.65'),
(8, 'Check', '349.65'),
(9, 'Cash', '349.65'),
(10, 'Cash', '699.30'),
(11, 'Cash', '349.65'),
(12, 'Cash', '349.65'),
(13, 'Debit Card', '2797.20');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_suspended`
--

CREATE TABLE IF NOT EXISTS `ospos_sales_suspended` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `invoice_number` varchar(32) DEFAULT NULL,
`sale_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_suspended_items`
--

CREATE TABLE IF NOT EXISTS `ospos_sales_suspended_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(15,3) NOT NULL DEFAULT '0.000',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_suspended_items_taxes`
--

CREATE TABLE IF NOT EXISTS `ospos_sales_suspended_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_suspended_payments`
--

CREATE TABLE IF NOT EXISTS `ospos_sales_suspended_payments` (
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sessions`
--

CREATE TABLE IF NOT EXISTS `ospos_sessions` (
  `id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_sessions`
--

INSERT INTO `ospos_sessions` (`id`, `ip_address`, `data`, `timestamp`) VALUES
('13040e515dc0453a52bef027e2961e96e6a77f95', '::1', 0x5f5f63695f6c6173745f726567656e65726174657c693a313436373835393530363b706572736f6e5f69647c733a313a2231223b636172747c613a313a7b693a313b613a31363a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a353a224d616e676f223b733a31313a226974656d5f6e756d626572223b733a343a2239393339223b733a31313a226465736372697074696f6e223b733a373a2266646e666e6466223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a323b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a383a22333239362e303030223b733a353a227072696365223b733a363a223333332e3030223b733a353a22746f74616c223b733a363a223636362e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a393a223636362e3030303030223b7d7d73616c655f6d6f64657c733a363a2272657475726e223b73616c655f6c6f636174696f6e7c733a313a2231223b637573746f6d65727c693a2d313b7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c733a353a22474863434f223b63617274526563767c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b737570706c6965727c693a2d313b726563765f696e766f6963655f6e756d6265727c733a353a22474863434f223b, 1467859506),
('4dacec5442cdc7e94e5dae8ff706713ea13adbe8', '::1', 0x5f5f63695f6c6173745f726567656e65726174657c693a313436373835373531343b706572736f6e5f69647c733a313a2231223b636172747c613a313a7b693a313b613a31363a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a353a224d616e676f223b733a31313a226974656d5f6e756d626572223b733a343a2239393339223b733a31313a226465736372697074696f6e223b733a373a2266646e666e6466223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a323b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a383a22333239362e303030223b733a353a227072696365223b733a363a223333332e3030223b733a353a22746f74616c223b733a363a223636362e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a393a223636362e3030303030223b7d7d73616c655f6d6f64657c733a343a2273616c65223b73616c655f6c6f636174696f6e7c733a313a2231223b637573746f6d65727c693a2d313b7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c733a353a22474863434f223b63617274526563767c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b737570706c6965727c693a2d313b726563765f696e766f6963655f6e756d6265727c733a353a22474863434f223b, 1467857514),
('531437ee044a4294c5ea3f1d39ba58d544636961', '::1', 0x5f5f63695f6c6173745f726567656e65726174657c693a313436373835333938343b706572736f6e5f69647c733a313a2231223b636172747c613a313a7b693a313b613a31363a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a353a224d616e676f223b733a31313a226974656d5f6e756d626572223b733a343a2239393339223b733a31313a226465736372697074696f6e223b733a373a2266646e666e6466223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a323b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a383a22333239362e303030223b733a353a227072696365223b733a363a223333332e3030223b733a353a22746f74616c223b733a363a223636362e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a393a223636362e3030303030223b7d7d73616c655f6d6f64657c733a343a2273616c65223b73616c655f6c6f636174696f6e7c733a313a2231223b637573746f6d65727c693a2d313b7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c733a353a22474863434f223b63617274526563767c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b737570706c6965727c693a2d313b726563765f696e766f6963655f6e756d6265727c733a353a22474863434f223b, 1467853984),
('5c2c203f93130622c9497f3c89c940adc33579e4', '::1', 0x5f5f63695f6c6173745f726567656e65726174657c693a313437303430343930363b706572736f6e5f69647c733a313a2231223b726563765f6d6f64657c733a373a2272656365697665223b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f73746f636b5f736f757263657c733a313a2231223b, 1470405159),
('5dca8b678006824134c34473f23d9da9ee46bfed', '::1', 0x5f5f63695f6c6173745f726567656e65726174657c693a313437303430343630323b706572736f6e5f69647c733a313a2231223b63617274526563767c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b737570706c6965727c693a2d313b726563765f696e766f6963655f6e756d6265727c733a353a22474863434f223b, 1470404901),
('6675e20d305abe95c4b1eb7cf39c8d66bb589325', '::1', 0x5f5f63695f6c6173745f726567656e65726174657c693a313436373835323333353b706572736f6e5f69647c733a313a2231223b636172747c613a313a7b693a313b613a31363a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a353a224d616e676f223b733a31313a226974656d5f6e756d626572223b733a343a2239393339223b733a31313a226465736372697074696f6e223b733a373a2266646e666e6466223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a383a22333239362e303030223b733a353a227072696365223b733a363a223333332e3030223b733a353a22746f74616c223b733a363a223333332e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a393a223333332e3030303030223b7d7d73616c655f6d6f64657c733a343a2273616c65223b73616c655f6c6f636174696f6e7c733a313a2231223b637573746f6d65727c693a2d313b7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c733a353a22474863434f223b63617274526563767c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b737570706c6965727c693a2d313b726563765f696e766f6963655f6e756d6265727c733a353a22474863434f223b, 1467852555),
('7707942d7c27e2d08a5c1a5330a45d7fe0d09489', '::1', 0x5f5f63695f6c6173745f726567656e65726174657c693a313437303335313139343b, 1470351194),
('83a1e1e5c46e7661690a2b263664ac0e4a29a55c', '::1', 0x5f5f63695f6c6173745f726567656e65726174657c693a313437303430353831343b, 1470405814),
('8f2463cce82935714b3744cbc881e0d486cf5beb', '::1', 0x5f5f63695f6c6173745f726567656e65726174657c693a313436373835333433353b706572736f6e5f69647c733a313a2231223b636172747c613a313a7b693a313b613a31363a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a353a224d616e676f223b733a31313a226974656d5f6e756d626572223b733a343a2239393339223b733a31313a226465736372697074696f6e223b733a373a2266646e666e6466223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a323b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a383a22333239362e303030223b733a353a227072696365223b733a363a223333332e3030223b733a353a22746f74616c223b733a363a223636362e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a393a223636362e3030303030223b7d7d73616c655f6d6f64657c733a343a2273616c65223b73616c655f6c6f636174696f6e7c733a313a2231223b637573746f6d65727c693a2d313b7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c733a353a22474863434f223b63617274526563767c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b737570706c6965727c693a2d313b726563765f696e766f6963655f6e756d6265727c733a353a22474863434f223b, 1467853435),
('9b8e3ced862dbf8c6567c2338e19d24f1d58d6ac', '::1', 0x5f5f63695f6c6173745f726567656e65726174657c693a313436373933313833313b706572736f6e5f69647c733a313a2231223b636172747c613a313a7b693a313b613a31363a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a353a224d616e676f223b733a31313a226974656d5f6e756d626572223b733a343a2239393339223b733a31313a226465736372697074696f6e223b733a373a2266646e666e6466223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a383a22333239362e303030223b733a353a227072696365223b733a363a223333332e3030223b733a353a22746f74616c223b733a363a223333332e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a393a223333332e3030303030223b7d7d73616c655f6d6f64657c733a343a2273616c65223b73616c655f6c6f636174696f6e7c733a313a2231223b637573746f6d65727c693a2d313b7061796d656e74737c613a313a7b733a31303a2244656269742043617264223b613a323a7b733a31323a227061796d656e745f74797065223b733a31303a2244656269742043617264223b733a31343a227061796d656e745f616d6f756e74223b733a363a223334392e3635223b7d7d73616c65735f696e766f6963655f6e756d6265727c733a353a22474863434f223b, 1467931990),
('9f622a81b37649f0780c26f00f837fa87da630e6', '::1', 0x5f5f63695f6c6173745f726567656e65726174657c693a313437303430353231323b706572736f6e5f69647c733a313a2231223b726563765f6d6f64657c733a373a2272656365697665223b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f73746f636b5f736f757263657c733a313a2231223b, 1470405212),
('cf6c2bcc42dd029c960b782d4d1828130122a49f', '::1', 0x5f5f63695f6c6173745f726567656e65726174657c693a313436373835313837353b706572736f6e5f69647c733a313a2231223b, 1467851882),
('e40a1eb1383b049d9455cd7dba50b566ee5a5863', '::1', 0x5f5f63695f6c6173745f726567656e65726174657c693a313437303431313332303b706572736f6e5f69647c733a313a2231223b, 1470411381);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_stock_locations`
--

CREATE TABLE IF NOT EXISTS `ospos_stock_locations` (
`location_id` int(11) NOT NULL,
  `location_name` varchar(255) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_stock_locations`
--

INSERT INTO `ospos_stock_locations` (`location_id`, `location_name`, `deleted`) VALUES
(1, 'stock', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_suppliers`
--

CREATE TABLE IF NOT EXISTS `ospos_suppliers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `agency_name` varchar(255) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ospos_app_config`
--
ALTER TABLE `ospos_app_config`
 ADD PRIMARY KEY (`key`);

--
-- Indexes for table `ospos_customers`
--
ALTER TABLE `ospos_customers`
 ADD UNIQUE KEY `account_number` (`account_number`), ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `ospos_employees`
--
ALTER TABLE `ospos_employees`
 ADD UNIQUE KEY `username` (`username`), ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `ospos_giftcards`
--
ALTER TABLE `ospos_giftcards`
 ADD PRIMARY KEY (`giftcard_id`), ADD UNIQUE KEY `giftcard_number` (`giftcard_number`), ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `ospos_grants`
--
ALTER TABLE `ospos_grants`
 ADD PRIMARY KEY (`permission_id`,`person_id`), ADD KEY `ospos_grants_ibfk_2` (`person_id`);

--
-- Indexes for table `ospos_inventory`
--
ALTER TABLE `ospos_inventory`
 ADD PRIMARY KEY (`trans_id`), ADD KEY `trans_items` (`trans_items`), ADD KEY `trans_user` (`trans_user`), ADD KEY `trans_location` (`trans_location`);

--
-- Indexes for table `ospos_items`
--
ALTER TABLE `ospos_items`
 ADD PRIMARY KEY (`item_id`), ADD UNIQUE KEY `item_number` (`item_number`), ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `ospos_items_taxes`
--
ALTER TABLE `ospos_items_taxes`
 ADD PRIMARY KEY (`item_id`,`name`,`percent`);

--
-- Indexes for table `ospos_item_kits`
--
ALTER TABLE `ospos_item_kits`
 ADD PRIMARY KEY (`item_kit_id`);

--
-- Indexes for table `ospos_item_kit_items`
--
ALTER TABLE `ospos_item_kit_items`
 ADD PRIMARY KEY (`item_kit_id`,`item_id`,`quantity`), ADD KEY `ospos_item_kit_items_ibfk_2` (`item_id`);

--
-- Indexes for table `ospos_item_quantities`
--
ALTER TABLE `ospos_item_quantities`
 ADD PRIMARY KEY (`item_id`,`location_id`), ADD KEY `item_id` (`item_id`), ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `ospos_modules`
--
ALTER TABLE `ospos_modules`
 ADD PRIMARY KEY (`module_id`), ADD UNIQUE KEY `desc_lang_key` (`desc_lang_key`), ADD UNIQUE KEY `name_lang_key` (`name_lang_key`);

--
-- Indexes for table `ospos_people`
--
ALTER TABLE `ospos_people`
 ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `ospos_permissions`
--
ALTER TABLE `ospos_permissions`
 ADD PRIMARY KEY (`permission_id`), ADD KEY `module_id` (`module_id`), ADD KEY `ospos_permissions_ibfk_2` (`location_id`);

--
-- Indexes for table `ospos_receivings`
--
ALTER TABLE `ospos_receivings`
 ADD PRIMARY KEY (`receiving_id`), ADD UNIQUE KEY `invoice_number` (`invoice_number`), ADD KEY `supplier_id` (`supplier_id`), ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `ospos_receivings_items`
--
ALTER TABLE `ospos_receivings_items`
 ADD PRIMARY KEY (`receiving_id`,`item_id`,`line`), ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `ospos_sales`
--
ALTER TABLE `ospos_sales`
 ADD PRIMARY KEY (`sale_id`), ADD UNIQUE KEY `invoice_number` (`invoice_number`), ADD KEY `customer_id` (`customer_id`), ADD KEY `employee_id` (`employee_id`), ADD KEY `sale_time` (`sale_time`);

--
-- Indexes for table `ospos_sales_items`
--
ALTER TABLE `ospos_sales_items`
 ADD PRIMARY KEY (`sale_id`,`item_id`,`line`), ADD KEY `sale_id` (`sale_id`), ADD KEY `item_id` (`item_id`), ADD KEY `item_location` (`item_location`);

--
-- Indexes for table `ospos_sales_items_taxes`
--
ALTER TABLE `ospos_sales_items_taxes`
 ADD PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`), ADD KEY `sale_id` (`sale_id`), ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `ospos_sales_payments`
--
ALTER TABLE `ospos_sales_payments`
 ADD PRIMARY KEY (`sale_id`,`payment_type`), ADD KEY `sale_id` (`sale_id`);

--
-- Indexes for table `ospos_sales_suspended`
--
ALTER TABLE `ospos_sales_suspended`
 ADD PRIMARY KEY (`sale_id`), ADD KEY `customer_id` (`customer_id`), ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `ospos_sales_suspended_items`
--
ALTER TABLE `ospos_sales_suspended_items`
 ADD PRIMARY KEY (`sale_id`,`item_id`,`line`), ADD KEY `sale_id` (`sale_id`), ADD KEY `item_id` (`item_id`), ADD KEY `ospos_sales_suspended_items_ibfk_3` (`item_location`);

--
-- Indexes for table `ospos_sales_suspended_items_taxes`
--
ALTER TABLE `ospos_sales_suspended_items_taxes`
 ADD PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`), ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `ospos_sales_suspended_payments`
--
ALTER TABLE `ospos_sales_suspended_payments`
 ADD PRIMARY KEY (`sale_id`,`payment_type`);

--
-- Indexes for table `ospos_sessions`
--
ALTER TABLE `ospos_sessions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ospos_stock_locations`
--
ALTER TABLE `ospos_stock_locations`
 ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `ospos_suppliers`
--
ALTER TABLE `ospos_suppliers`
 ADD UNIQUE KEY `account_number` (`account_number`), ADD KEY `person_id` (`person_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ospos_giftcards`
--
ALTER TABLE `ospos_giftcards`
MODIFY `giftcard_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ospos_inventory`
--
ALTER TABLE `ospos_inventory`
MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `ospos_items`
--
ALTER TABLE `ospos_items`
MODIFY `item_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ospos_item_kits`
--
ALTER TABLE `ospos_item_kits`
MODIFY `item_kit_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ospos_people`
--
ALTER TABLE `ospos_people`
MODIFY `person_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ospos_receivings`
--
ALTER TABLE `ospos_receivings`
MODIFY `receiving_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ospos_sales`
--
ALTER TABLE `ospos_sales`
MODIFY `sale_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `ospos_sales_suspended`
--
ALTER TABLE `ospos_sales_suspended`
MODIFY `sale_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ospos_stock_locations`
--
ALTER TABLE `ospos_stock_locations`
MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ospos_customers`
--
ALTER TABLE `ospos_customers`
ADD CONSTRAINT `ospos_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`);

--
-- Constraints for table `ospos_employees`
--
ALTER TABLE `ospos_employees`
ADD CONSTRAINT `ospos_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`);

--
-- Constraints for table `ospos_giftcards`
--
ALTER TABLE `ospos_giftcards`
ADD CONSTRAINT `ospos_giftcards_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`);

--
-- Constraints for table `ospos_grants`
--
ALTER TABLE `ospos_grants`
ADD CONSTRAINT `ospos_grants_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `ospos_permissions` (`permission_id`) ON DELETE CASCADE,
ADD CONSTRAINT `ospos_grants_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `ospos_employees` (`person_id`) ON DELETE CASCADE;

--
-- Constraints for table `ospos_inventory`
--
ALTER TABLE `ospos_inventory`
ADD CONSTRAINT `ospos_inventory_ibfk_1` FOREIGN KEY (`trans_items`) REFERENCES `ospos_items` (`item_id`),
ADD CONSTRAINT `ospos_inventory_ibfk_2` FOREIGN KEY (`trans_user`) REFERENCES `ospos_employees` (`person_id`),
ADD CONSTRAINT `ospos_inventory_ibfk_3` FOREIGN KEY (`trans_location`) REFERENCES `ospos_stock_locations` (`location_id`);

--
-- Constraints for table `ospos_items`
--
ALTER TABLE `ospos_items`
ADD CONSTRAINT `ospos_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`);

--
-- Constraints for table `ospos_items_taxes`
--
ALTER TABLE `ospos_items_taxes`
ADD CONSTRAINT `ospos_items_taxes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `ospos_item_kit_items`
--
ALTER TABLE `ospos_item_kit_items`
ADD CONSTRAINT `ospos_item_kit_items_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `ospos_item_kits` (`item_kit_id`) ON DELETE CASCADE,
ADD CONSTRAINT `ospos_item_kit_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `ospos_item_quantities`
--
ALTER TABLE `ospos_item_quantities`
ADD CONSTRAINT `ospos_item_quantities_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
ADD CONSTRAINT `ospos_item_quantities_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `ospos_stock_locations` (`location_id`);

--
-- Constraints for table `ospos_permissions`
--
ALTER TABLE `ospos_permissions`
ADD CONSTRAINT `ospos_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `ospos_modules` (`module_id`) ON DELETE CASCADE,
ADD CONSTRAINT `ospos_permissions_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `ospos_stock_locations` (`location_id`) ON DELETE CASCADE;

--
-- Constraints for table `ospos_receivings`
--
ALTER TABLE `ospos_receivings`
ADD CONSTRAINT `ospos_receivings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
ADD CONSTRAINT `ospos_receivings_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`);

--
-- Constraints for table `ospos_receivings_items`
--
ALTER TABLE `ospos_receivings_items`
ADD CONSTRAINT `ospos_receivings_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
ADD CONSTRAINT `ospos_receivings_items_ibfk_2` FOREIGN KEY (`receiving_id`) REFERENCES `ospos_receivings` (`receiving_id`);

--
-- Constraints for table `ospos_sales`
--
ALTER TABLE `ospos_sales`
ADD CONSTRAINT `ospos_sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
ADD CONSTRAINT `ospos_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `ospos_customers` (`person_id`);

--
-- Constraints for table `ospos_sales_items`
--
ALTER TABLE `ospos_sales_items`
ADD CONSTRAINT `ospos_sales_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
ADD CONSTRAINT `ospos_sales_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`),
ADD CONSTRAINT `ospos_sales_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `ospos_stock_locations` (`location_id`);

--
-- Constraints for table `ospos_sales_items_taxes`
--
ALTER TABLE `ospos_sales_items_taxes`
ADD CONSTRAINT `ospos_sales_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_items` (`sale_id`),
ADD CONSTRAINT `ospos_sales_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`);

--
-- Constraints for table `ospos_sales_payments`
--
ALTER TABLE `ospos_sales_payments`
ADD CONSTRAINT `ospos_sales_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`);

--
-- Constraints for table `ospos_sales_suspended`
--
ALTER TABLE `ospos_sales_suspended`
ADD CONSTRAINT `ospos_sales_suspended_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
ADD CONSTRAINT `ospos_sales_suspended_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `ospos_customers` (`person_id`);

--
-- Constraints for table `ospos_sales_suspended_items`
--
ALTER TABLE `ospos_sales_suspended_items`
ADD CONSTRAINT `ospos_sales_suspended_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
ADD CONSTRAINT `ospos_sales_suspended_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_suspended` (`sale_id`),
ADD CONSTRAINT `ospos_sales_suspended_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `ospos_stock_locations` (`location_id`);

--
-- Constraints for table `ospos_sales_suspended_items_taxes`
--
ALTER TABLE `ospos_sales_suspended_items_taxes`
ADD CONSTRAINT `ospos_sales_suspended_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_suspended_items` (`sale_id`),
ADD CONSTRAINT `ospos_sales_suspended_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`);

--
-- Constraints for table `ospos_sales_suspended_payments`
--
ALTER TABLE `ospos_sales_suspended_payments`
ADD CONSTRAINT `ospos_sales_suspended_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_suspended` (`sale_id`);

--
-- Constraints for table `ospos_suppliers`
--
ALTER TABLE `ospos_suppliers`
ADD CONSTRAINT `ospos_suppliers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
