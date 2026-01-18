DROP TABLE IF EXISTS `ak47_qb_drugmanagerv2_labprops`;
CREATE TABLE IF NOT EXISTS `ak47_qb_drugmanagerv2_labprops` (
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
