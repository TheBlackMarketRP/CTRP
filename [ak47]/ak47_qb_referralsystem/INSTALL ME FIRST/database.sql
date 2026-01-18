CREATE TABLE IF NOT EXISTS `referrals` (
  `license` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `referral_code` varchar(50) DEFAULT NULL,
  `referred_by_code` varchar(50) DEFAULT NULL,
  `playtime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`license`),
  UNIQUE KEY `referral_code` (`referral_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE IF NOT EXISTS `referral_rewards_claimed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(100) NOT NULL,
  `reward_id` varchar(50) NOT NULL,
  `claimed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;