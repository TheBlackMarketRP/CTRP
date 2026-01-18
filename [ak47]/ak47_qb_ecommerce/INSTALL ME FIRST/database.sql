DROP TABLE IF EXISTS `ak47_qb_ecommerce`;
CREATE TABLE IF NOT EXISTS `ak47_qb_ecommerce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `owner` varchar(100) NOT NULL,
  `owner_identifier` varchar(100) NOT NULL,
  `location` text DEFAULT NULL,
  `location_name` varchar(255) DEFAULT NULL,
  `show_blip` tinyint(1) DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `is_active` int(2) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `ak47_qb_ecommerce_categories`;
CREATE TABLE IF NOT EXISTS `ak47_qb_ecommerce_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_by_shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `ak47_qb_ecommerce_employees`;
CREATE TABLE IF NOT EXISTS `ak47_qb_ecommerce_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `identifier` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `perms` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `ak47_qb_ecommerce_employees_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `ak47_qb_ecommerce` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `ak47_qb_ecommerce_orders`;
CREATE TABLE IF NOT EXISTS `ak47_qb_ecommerce_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `customer_identifier` varchar(100) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `items` text NOT NULL,
  `total` int(11) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Pending Pickup',
  `action_by` varchar(50) DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'pickup',
  `delivery_location` text DEFAULT NULL,
  `delivery_street` text DEFAULT NULL,
  `customer_phone_number` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`),
  CONSTRAINT `ak47_qb_ecommerce_orders_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `ak47_qb_ecommerce` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `ak47_qb_ecommerce_products`;
CREATE TABLE IF NOT EXISTS `ak47_qb_ecommerce_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `item_id` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `image` varchar(512) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `ak47_qb_ecommerce_products_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `ak47_qb_ecommerce` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;