/*
Staging Tables for the Magento SQL to Shopify API
 */

-- Create syntax for TABLE 'shopify_customer'
DROP TABLE IF EXISTS `shopify_customer`;
CREATE TABLE `shopify_customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shopify_id` int(20) DEFAULT NULL,
  `magento_id` int(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `accepts_marketing` smallint(1) DEFAULT '1',
  `tags` varchar(255) DEFAULT '',
  `note` text,
  `tax_exempt` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'shopify_customer_address'
DROP TABLE IF EXISTS `shopify_customer_address`;
CREATE TABLE `shopify_customer_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `phone_ext` varchar(10) DEFAULT '',
  `phone_idx` int(11) DEFAULT '0',
  `is_default` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'shopify_customer_fix'
DROP TABLE IF EXISTS `shopify_customer_fix`;
CREATE TABLE `shopify_customer_fix` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `duplicate_email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `final_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'shopify_customer_metafield'
DROP TABLE IF EXISTS `shopify_customer_metafield`;
CREATE TABLE `shopify_customer_metafield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `key` varchar(50) DEFAULT NULL,
  `namespace` varchar(50) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `value_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'shopify_log'
DROP TABLE IF EXISTS `shopify_log`;
CREATE TABLE `shopify_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `data` TEXT DEFAULT NULL,
  `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `email` (`object`, `key`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'shopify_product'
DROP TABLE IF EXISTS `shopify_product`;
CREATE TABLE `shopify_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shopify_id` int(20) DEFAULT NULL,
  `magento_id` int(20) DEFAULT NULL,
  `handle` varchar(255) DEFAULT '',
  `title` varchar(255) DEFAULT '',
  `body_html` TEXT DEFAULT '',
  `metafields_global_title_tag` varchar(255) DEFAULT '',
  `metafields_global_description_tag` TEXT DEFAULT '',
  `vendor` varchar(255) DEFAULT '',
  `product_type` varchar(255) DEFAULT '',
  `published` tinyint(1) DEFAULT 0,
  `published_at` DATETIME DEFAULT NULL,
  `published_scope` varchar(50) DEFAULT NULL,
  `tags` varchar(255) DEFAULT '',
  `note` text,
  `tax_exempt` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'shopify_product_image'
DROP TABLE IF EXISTS `shopify_product_image`;
CREATE TABLE `shopify_product_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT 0,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `handle` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'shopify_product_metafield'
DROP TABLE IF EXISTS `shopify_product_metafield`;
CREATE TABLE `shopify_product_metafield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) DEFAULT NULL,
  `key` varchar(50) DEFAULT NULL,
  `namespace` varchar(50) DEFAULT NULL,
  `value` TEXT DEFAULT NULL,
  `value_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `handle` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'shopify_product_variant'
DROP TABLE IF EXISTS `shopify_product_variant`;
CREATE TABLE `shopify_product_variant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) DEFAULT NULL,
  `fulfillment_service` varchar(50) DEFAULT 'manual',
  `inventory_management` varchar(50) DEFAULT 'shopify',
  `price` decimal(10,2) DEFAULT 0,
  `requires_shipping` tinyint(1) DEFAULT 1,
  `sku` varchar(255) DEFAULT NULL,
  `taxable` tinyint(1) DEFAULT 1,
  `weight` DECIMAL(6,3) DEFAULT NULL,
  `weight_unit` varchar(10) DEFAULT 'lb',
  PRIMARY KEY (`id`),
  KEY `handle` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;