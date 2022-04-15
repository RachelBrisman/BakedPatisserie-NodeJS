-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2021 at 11:20 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `358project`
--

-- --------------------------------------------------------

--
-- Table structure for table `authorizedusers`
--

CREATE TABLE `authorizedusers` (
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `userType` tinyint(1) NOT NULL DEFAULT 1,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authorizedusers`
--

INSERT INTO `authorizedusers` (`username`, `password`, `userType`, `userID`) VALUES
('Alice', 'happy123', 1, 1),
('Bob', 'sad456', 1, 2),
('Charlie', 'angry789', 1, 3),
('Daniel', 'great123', 1, 4),
('Ella', 'ok456', 1, 5),
('Fred', 'fine789', 1, 6),
('George', 'upset123', 1, 10),
('Harold', 'jolly456', 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `daysbaked`
--

CREATE TABLE `daysbaked` (
  `day` varchar(10) NOT NULL,
  `prBaked` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daysbaked`
--

INSERT INTO `daysbaked` (`day`, `prBaked`) VALUES
('Friday', 'Chocolate Babka,\r\nCinnamon Babka,\r\nVanilla Babka,\r\nAssorted Rugelach'),
('Monday', 'Chocolate Cupcakes,\r\nVanilla Cupcakes'),
('Sunday', 'Chocolate Chip Cookies,\r\nPeanut Butter Cookies'),
('Thursday', 'Chocolate Cupcakes,\r\nVanilla Cupcakes'),
('Tuesday', 'Chocolate Babka,\r\nCinnamon Babka,\r\nVanilla Babka,\r\nAssorted Rugelach'),
('Wednesday', 'Chocolate Chip Cookies,\r\nPeanut Butter Cookies');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `prAmount` int(11) NOT NULL,
  `prName` varchar(128) NOT NULL,
  `prPrice` decimal(10,2) NOT NULL,
  `prID` int(2) NOT NULL,
  `prKey` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prAmount`, `prName`, `prPrice`, `prID`, `prKey`) VALUES
(6, 'Chocolate Chip Cookies', '5.00', 1, 'ccc'),
(4, 'Chocolate Cupcakes', '4.50', 2, 'cc'),
(4, 'Vanilla Cupcakes', '4.50', 3, 'vc'),
(1, 'Chocolate Babka', '9.00', 4, 'cb'),
(1, 'Cinnamon Babka', '9.00', 5, 'cnb'),
(1, 'Vanilla Babka', '9.00', 6, 'vb'),
(20, 'Assorted Rugelach', '8.00', 7, 'ar'),
(6, 'Peanut Butter Cookies', '4.50', 8, 'pbc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authorizedusers`
--
ALTER TABLE `authorizedusers`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `daysbaked`
--
ALTER TABLE `daysbaked`
  ADD PRIMARY KEY (`day`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authorizedusers`
--
ALTER TABLE `authorizedusers`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `prID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
