-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2024 at 10:15 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tebexserver`
--

-- --------------------------------------------------------

--
-- Table structure for table `kael_fraud`
--

CREATE TABLE `kael_fraud` (
  `m_id` int(11) NOT NULL,
  `m_owner` varchar(255) NOT NULL,
  `m_geni` varchar(255) NOT NULL,
  `m_geni_heading` varchar(255) NOT NULL,
  `m_laptop` varchar(255) NOT NULL,
  `m_laptop_heading` varchar(255) NOT NULL,
  `m_scanner` varchar(255) NOT NULL,
  `m_scanner_heading` varchar(255) NOT NULL,
  `m_printer` varchar(255) NOT NULL,
  `m_printer_heading` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kael_fraud`
--
ALTER TABLE `kael_fraud`
  ADD PRIMARY KEY (`m_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kael_fraud`
--
ALTER TABLE `kael_fraud`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
