-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2023 at 02:48 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

CREATE DATABASE IF NOT EXISTS career_search;

use career_search;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `career_search`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `acc_type` int(11) NOT NULL,
  `cname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(225) NOT NULL,
  `hashed_pass` varchar(225) NOT NULL,
  `logo` varchar(225) DEFAULT NULL,
  `created_at` varchar(225) NOT NULL,
  `c_info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `acc_type`, `cname`, `email`, `location`, `address`, `phone`, `hashed_pass`, `logo`, `created_at`, `c_info`) VALUES
(2, 2, 'Skyhive', 'skyhivecore@skyhive.com', 'Benue', '', '08012345678', '5f4dcc3b5aa765d61d8327deb882cf99', '', '1520204563', '');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL,
  `min_req` int(11) NOT NULL,
  `indus` varchar(225) NOT NULL,
  `func_area` varchar(225) NOT NULL,
  `pos` varchar(225) NOT NULL,
  `salary` int(11) NOT NULL,
  `idate` varchar(255) NOT NULL,
  `itime` varchar(255) NOT NULL,
  `ivenue` varchar(255) NOT NULL,
  `iexp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `com_id`, `title`, `description`, `status`, `min_req`, `indus`, `func_area`, `pos`, `salary`, `idate`, `itime`, `ivenue`, `iexp`) VALUES
(3, 2, 'Project Administrator Needed ', 'A project administrator is needed to judge the current ongoing project. ', 1, 5, 'Information Technology', 'Finance', 'Head Supervisor', 10000, '2018-03-13', '03:00', 'NIIT Office', 2),
(4, 2, 'Android Marketer ', 'An IT marketer is required urgently ', 1, 3, 'Marketing', 'Marketing', 'Marketer', 30000, '2018-03-20', '01:07', 'Niit', 2),
(5, 2, 'operator ', 'sdfsdf ', 1, 4, 'Economics', 'money', 'whatever', 50000, '2018-11-28', '09:00', 'here', 2);

-- --------------------------------------------------------

--
-- Table structure for table `job_apply`
--

CREATE TABLE `job_apply` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `invite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_apply`
--

INSERT INTO `job_apply` (`id`, `user_id`, `com_id`, `job_id`, `invite`) VALUES
(2, 12, 2, 1, 1),
(3, 12, 2, 2, 1),
(4, 12, 2, 3, 0),
(5, 12, 2, 4, 0),
(6, 16, 2, 4, 0),
(7, 19, 2, 4, 0),
(8, 19, 2, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resume`
--

CREATE TABLE `resume` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `exp` int(11) DEFAULT NULL,
  `edu` int(11) DEFAULT NULL,
  `fun_areas` varchar(255) DEFAULT NULL,
  `hobbies` varchar(255) DEFAULT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `core_area` varchar(255) DEFAULT NULL,
  `referee` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resume`
--

INSERT INTO `resume` (`id`, `user_id`, `exp`, `edu`, `fun_areas`, `hobbies`, `lang`, `core_area`, `referee`) VALUES
(2, 12, 3, 4, 'web dev, android dev ', 'swimming, dancing, ridding bicycle ', 'english, efik ', 'web development ', ' '),
(3, 14, 7, 7, 'Web dev ', 'Drinking Coffee ', 'English and French ', 'web development ', ' '),
(4, 16, 2, 2, 'web dev ', 'coding ', 'english ', 'web dev ', 'some referees '),
(5, 17, 5, 4, 'PHP, HTML ', 'Coding ', 'PHP ', 'Web Developer ', 'ref@mail.com ');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `acc_type` int(11) NOT NULL,
  `fname` varchar(191) NOT NULL,
  `lname` varchar(191) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `location` varchar(191) NOT NULL,
  `address` text DEFAULT NULL,
  `hashed_pass` varchar(255) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `acc_type`, `fname`, `lname`, `dob`, `location`, `address`, `hashed_pass`, `email`, `phone`, `image`, `created_at`) VALUES
(12, 1, 'benjamin', 'isong', '2018-12-31', 'Adamawa', '', '5f4dcc3b5aa765d61d8327deb882cf99', 'icekidben@gmail.com', '08128039141', '1527001649_.jpg', '1520184306'),
(13, 1, 'james', 'bond', '2005-11-30', 'Anambra', '', '5f4dcc3b5aa765d61d8327deb882cf99', 'menim2007@yahoo.com', '09028404928', '', '1520185368'),
(14, 1, 'kelvin', 'lecturer', '2017-10-29', 'Benue', '', '5f4dcc3b5aa765d61d8327deb882cf99', 'kelvin@gmail.com', '09028404928', '', '1520260273'),
(15, 1, 'favour', 'nkoyo', '1995-01-10', 'Akwa Ibom', '', '5f4dcc3b5aa765d61d8327deb882cf99', 'favour@gmail.com', '07017381163', '', '1521286424'),
(16, 1, 'john', 'doe', '2018-03-15', 'Jigawa', 'some place', 'e10adc3949ba59abbe56e057f20f883e', 'ben@gmail.com', '123456', '1521557085_.jpg', '1521557020'),
(17, 1, 'Kev', 'Kev', '2018-03-13', 'FCT', 'Abuja', '5f4dcc3b5aa765d61d8327deb882cf99', 'tester@mail.com', '09076543218', '1521557167_.jpg', '1521557048'),
(18, 1, 'Okondo', 'Rufus', '1997-12-11', 'Abia', 'Okondo road', '7694ae0fdf085d8fcc0845a42c1a2cad', 'okbrave@gmail.com', '1559288', '1521557357_.jpg', '1521557262'),
(19, 1, 'Benjamin', 'ice', '2018-11-15', 'Abia', 'sdfasfas', '5f4dcc3b5aa765d61d8327deb882cf99', 'ben@ice.com', '56789', '1542147212_.jpg', '1542146893');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_apply`
--
ALTER TABLE `job_apply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resume`
--
ALTER TABLE `resume`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `job_apply`
--
ALTER TABLE `job_apply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resume`
--
ALTER TABLE `resume`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
