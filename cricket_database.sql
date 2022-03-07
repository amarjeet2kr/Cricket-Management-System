-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2022 at 08:14 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cricket_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `match_id` int(11) NOT NULL,
  `team1_id` int(11) NOT NULL,
  `team2_id` int(11) NOT NULL,
  `match_date` date DEFAULT NULL,
  `stadium_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`match_id`, `team1_id`, `team2_id`, `match_date`, `stadium_id`) VALUES
(33333, 22222, 22223, '2022-01-03', 55555),
(33334, 22224, 22225, '2022-01-04', 55556),
(33335, 22225, 22226, '2022-01-05', 55557),
(33336, 22227, 22226, '2022-01-06', 55557),
(33337, 22222, 22225, '2022-01-07', 55558),
(33338, 22223, 22226, '2022-01-08', 55559);

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `phone_no` bigint(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `since` date DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`player_id`, `name`, `address`, `phone_no`, `dob`, `role`, `since`, `salary`, `team_id`) VALUES
(11111, 'MS Dhoniii', 'Chennai', 9658326542, '1975-01-12', 'Wicket Keeper', '2010-01-06', 10000000, 22222),
(11112, 'Jadeja', 'Chennaii', 5326457632, '2015-01-06', 'All Rounder', '2019-01-08', 800000, 22222),
(11113, 'Mohin Alii', 'Chennai', 8657653254, '1978-01-11', 'All Ronder', '2015-01-14', 80000000, 22222),
(11114, 'Virat Kholi', 'Bangalore', 9865732546, '1988-01-19', 'Batsman', '2003-01-14', 170000000, 22223),
(11115, 'Devdutt Padikkal', 'Bangalore', 9865325325, '1994-01-12', 'Left-Handed Batsman', '2015-01-13', 120000000, 22223);

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `match_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `scores` int(11) DEFAULT NULL,
  `result` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`match_id`, `team_id`, `scores`, `result`) VALUES
(33333, 22222, 175, 'Won'),
(33333, 22223, 170, 'Lost'),
(33334, 22224, 165, 'Lost'),
(33334, 22225, 166, 'Won'),
(33335, 22225, 221, 'Won'),
(33335, 22226, 215, 'Lost');

-- --------------------------------------------------------

--
-- Table structure for table `stadium`
--

CREATE TABLE `stadium` (
  `stadium_id` int(11) NOT NULL,
  `stadium_name` varchar(255) NOT NULL,
  `stadium_location` varchar(255) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stadium`
--

INSERT INTO `stadium` (`stadium_id`, `stadium_name`, `stadium_location`, `capacity`) VALUES
(55555, 'M. Chinnaswamy Stadium', 'Bangalore', 40000),
(55556, 'Eden Gardens', 'Kolkata', 80000),
(55557, 'Narendra Modi Stadium', 'Ahmedabad', 132000),
(55558, 'Rajiv Gandhi International Cricket Stadium', 'Hyderabad', 55000),
(55559, 'Wanderers Stadium', 'Mumbai', 33000),
(55560, 'Green Park Stadium', 'Kanpur', 33000);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `team_id` int(11) NOT NULL,
  `team_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`team_id`, `team_name`) VALUES
(22222, 'Chennai Super King'),
(22225, 'Delhi Capitals'),
(22226, 'Goa Assocation'),
(22227, 'Lucknow Franchise'),
(22224, 'Mumbai Indians'),
(22223, 'Royal Challengers ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`match_id`),
  ADD KEY `stadium_id` (`stadium_id`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD KEY `match_id` (`match_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `stadium`
--
ALTER TABLE `stadium`
  ADD PRIMARY KEY (`stadium_id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`team_id`),
  ADD UNIQUE KEY `team_name` (`team_name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`stadium_id`) REFERENCES `stadium` (`stadium_id`) ON DELETE SET NULL;

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE SET NULL;

--
-- Constraints for table `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `scores_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
