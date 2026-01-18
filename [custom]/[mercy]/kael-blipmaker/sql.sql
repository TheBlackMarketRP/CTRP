-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2026 at 09:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qbcore_35b6c6`
--

-- --------------------------------------------------------

--
-- Table structure for table `kael_blip`
--

CREATE TABLE `kael_blip` (
  `id` int(11) NOT NULL,
  `b_coords` longtext NOT NULL,
  `b_icon` varchar(255) DEFAULT NULL,
  `b_size` varchar(255) DEFAULT NULL,
  `b_color` varchar(255) DEFAULT NULL,
  `b_shortrange` varchar(111) DEFAULT NULL,
  `b_radius` varchar(255) DEFAULT NULL,
  `b_radius_color` varchar(255) DEFAULT NULL,
  `b_alpha` varchar(255) DEFAULT NULL,
  `b_text` varchar(255) NOT NULL,
  `b_flash` varchar(111) DEFAULT NULL,
  `b_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kael_blip`
--
ALTER TABLE `kael_blip`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kael_blip`
--
ALTER TABLE `kael_blip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
