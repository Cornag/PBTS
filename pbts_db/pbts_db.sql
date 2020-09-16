-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2020 at 02:40 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pbts_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` smallint(6) NOT NULL COMMENT '== personnel number',
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee_project`
--

CREATE TABLE `employee_project` (
  `employee_id` smallint(6) NOT NULL,
  `project_id` smallint(6) NOT NULL,
  `date` date NOT NULL,
  `working_hours` time NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` smallint(6) NOT NULL,
  `project_name` int(11) NOT NULL,
  `supervisor` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_project`
--
ALTER TABLE `employee_project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_project_employee_id_fkey` (`employee_id`),
  ADD KEY `employee_project_project_id` (`project_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_supervisor_fkey` (`supervisor`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee_project`
--
ALTER TABLE `employee_project`
  ADD CONSTRAINT `employee_project_employee_id_fkey` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_project_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_supervisor_fkey` FOREIGN KEY (`supervisor`) REFERENCES `employee` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
