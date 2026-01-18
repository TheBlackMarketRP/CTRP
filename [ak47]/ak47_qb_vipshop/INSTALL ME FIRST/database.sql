DROP TABLE IF EXISTS `vip_crate_items`;
CREATE TABLE IF NOT EXISTS `vip_crate_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `label` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL COMMENT 'e.g., common_crate, rare_crate',
  `crate_type` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 1,
  `chance` int(11) NOT NULL DEFAULT 10,
  `img` varchar(255) DEFAULT NULL,
  `metadata` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

DROP TABLE IF EXISTS `vip_give_coin_history`;
CREATE TABLE IF NOT EXISTS `vip_give_coin_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_identifier` varchar(100) DEFAULT NULL,
  `admin_name` varchar(100) DEFAULT NULL,
  `target_identifier` varchar(100) DEFAULT NULL,
  `target_name` varchar(100) DEFAULT NULL,
  `amount_given` int(11) NOT NULL DEFAULT 0,
  `given_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

DROP TABLE IF EXISTS `vip_packages`;
CREATE TABLE IF NOT EXISTS `vip_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `discount` int(11) DEFAULT 0,
  `amount` int(11) DEFAULT 1,
  `img` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `metadata` text DEFAULT NULL,
  `stats` text DEFAULT NULL,
  `items` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `vip_players`;
CREATE TABLE IF NOT EXISTS `vip_players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `vcoin` int(11) NOT NULL DEFAULT 0,
  `last_daily_claim` bigint(20) NOT NULL DEFAULT 0,
  `daily_reward_queue` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `vip_purchase_history`;
CREATE TABLE IF NOT EXISTS `vip_purchase_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_identifier` varchar(60) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `package_id` int(11) NOT NULL,
  `package_label` varchar(255) NOT NULL,
  `package_category` varchar(50) NOT NULL,
  `price_paid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `purchase_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `vip_redeem_codes`;
CREATE TABLE IF NOT EXISTS `vip_redeem_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `coin_amount` int(11) NOT NULL DEFAULT 0,
  `is_claimed` tinyint(1) NOT NULL DEFAULT 0,
  `claimed_by_identifier` varchar(100) DEFAULT NULL,
  `claimed_by_name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `claimed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

DROP TABLE IF EXISTS `vip_settings`;
CREATE TABLE IF NOT EXISTS `vip_settings` (
  `setting_key` varchar(50) NOT NULL,
  `setting_value` text NOT NULL,
  PRIMARY KEY (`setting_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DELETE FROM `vip_settings`;
INSERT INTO `vip_settings` (`setting_key`, `setting_value`) VALUES
  ('crateSettings', '[{"imageName":"common","description":"Contains a variety of common items, with a small chance for something better.","price":200,"id":"common_crate","name":"Common Crate"},{"imageName":"uncommon","description":"A higher chance for uncommon items and useful gear.","price":300,"id":"uncommon_crate","name":"Uncommon Crate"},{"imageName":"rare","description":"Guaranteed to contain at least one rare item or better.","price":400,"id":"rare_crate","name":"Rare Crate"},{"imageName":"epic","description":"A great chance for epic vehicles and powerful weapons.","price":500,"id":"epic_crate","name":"Epic Crate"},{"imageName":"legendary","description":"The best of the best. Contains the most exclusive and legendary items.","price":600,"id":"legendary_crate","name":"Legendary Crate"}]'),
  ('dailyCrateSelection', '["common_crate","uncommon_crate","epic_crate"]'),
  ('popularItems', '[]'),
  ('specialOffer', '{"description":"Check out this limited-time offer. Grab it while it\'s hot!","link":"https://menanak47.tebex.io/","title":"SPECIAL OFFER","price":"600","subtitle":"UP TO 40%"}');
