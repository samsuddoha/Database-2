-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2022 at 01:29 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel`
--

-- --------------------------------------------------------

--
-- Table structure for table `assign_route`
--

CREATE TABLE `assign_route` (
  `ar_id` int(11) NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `r_id` int(11) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `journey_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assign_route`
--

INSERT INTO `assign_route` (`ar_id`, `driver_id`, `r_id`, `bus_id`, `journey_date`) VALUES
(1, 1, 1, 1, '2019-11-15'),
(2, 2, 2, 2, '2019-11-15'),
(3, 4, 2, 4, '2019-11-23'),
(4, 3, 4, 3, '2019-11-18');

-- --------------------------------------------------------

--
-- Table structure for table `book_ticket`
--

CREATE TABLE `book_ticket` (
  `t_id` int(11) NOT NULL,
  `passenger_id` int(11) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `journey_date` date DEFAULT NULL,
  `seat_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_ticket`
--

INSERT INTO `book_ticket` (`t_id`, `passenger_id`, `bus_id`, `route_id`, `journey_date`, `seat_no`) VALUES
(1, 1, 3, 1, '2019-11-15', 'A3'),
(2, 2, 3, 2, '2019-11-15', 'A4'),
(3, 3, 3, 1, '2019-11-15', 'A8'),
(4, 4, 3, 1, '2019-11-15', 'B4');

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `bus_id` int(11) NOT NULL,
  `bus_name` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`bus_id`, `bus_name`, `model`) VALUES
(1, 'Hanif', 'volvo'),
(2, 'Nabil', 'scania'),
(3, 'Alam', 'volvo'),
(4, 'SR', 'sarkar');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `d_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `license_no` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`d_id`, `name`, `gender`, `email`, `phone`, `license_no`) VALUES
(1, 'Habib', 'male', 'habib@gmail.com', '0198398409', 'A125679'),
(2, 'Kamal', 'male', 'kamal@gmail.com', '01374577567', 'A125622'),
(3, 'Nabab', 'male', 'nabab@gmail.com', '01983984409', 'A12534'),
(4, 'Kamal', 'male', 'kamal@gmail.com', '01374877567', 'BA125679');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `p_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`p_id`, `first_name`, `last_name`, `gender`, `email`, `phone`) VALUES
(1, 'nasir', 'Hossain', 'male', 'nasir@gmail.com', '01900987654'),
(2, 'azim', 'Uddin', 'male', 'azim@gmail.com', '09876262636'),
(3, 'bina', 'Kabir', 'female', 'bina@gmail.com', '01933987654'),
(4, 'aslam', 'Khan', 'male', 'aslam@gmail.com', '09876262636');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `bus_id` int(11) NOT NULL,
  `amount` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `passenger_id`, `bus_id`, `amount`) VALUES
(1, 4, 3, '500.00'),
(2, 2, 1, '500.00');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `r_id` int(11) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`r_id`, `source`, `destination`) VALUES
(1, 'dhaka', 'chittagong'),
(2, 'khulna', 'barisal'),
(3, 'dhaka', 'rangpur'),
(4, 'khulna', 'sylhet');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assign_route`
--
ALTER TABLE `assign_route`
  ADD PRIMARY KEY (`ar_id`),
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `bus_id` (`bus_id`),
  ADD KEY `r_id` (`r_id`);

--
-- Indexes for table `book_ticket`
--
ALTER TABLE `book_ticket`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `passenger_id` (`passenger_id`),
  ADD KEY `bus_id` (`bus_id`),
  ADD KEY `ar_id` (`route_id`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`bus_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `bus_id` (`bus_id`),
  ADD KEY `passenger_id` (`passenger_id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`r_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assign_route`
--
ALTER TABLE `assign_route`
  MODIFY `ar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `book_ticket`
--
ALTER TABLE `book_ticket`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `bus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assign_route`
--
ALTER TABLE `assign_route`
  ADD CONSTRAINT `assign_route_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`d_id`),
  ADD CONSTRAINT `assign_route_ibfk_2` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`bus_id`),
  ADD CONSTRAINT `assign_route_ibfk_3` FOREIGN KEY (`r_id`) REFERENCES `route` (`r_id`);

--
-- Constraints for table `book_ticket`
--
ALTER TABLE `book_ticket`
  ADD CONSTRAINT `book_ticket_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`p_id`),
  ADD CONSTRAINT `book_ticket_ibfk_2` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`bus_id`),
  ADD CONSTRAINT `book_ticket_ibfk_3` FOREIGN KEY (`route_id`) REFERENCES `assign_route` (`ar_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`bus_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`p_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
