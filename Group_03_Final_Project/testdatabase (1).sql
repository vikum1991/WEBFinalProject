-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2024 at 11:46 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `kyototravelguide`
--

CREATE TABLE `kyototravelguide` (
  `Date` date DEFAULT NULL,
  `PlaceName` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kyototravelguide`
--

INSERT INTO `kyototravelguide` (`Date`, `PlaceName`, `Description`) VALUES
('2024-08-03', 'Kinkaku-ji', 'The Golden Pavilion, a Zen Buddhist temple with a stunning gold leaf-covered exterior.'),
('2024-08-04', 'Fushimi Inari Shrine', 'Famous for its thousands of red torii gates that lead up the mountain.'),
('2024-08-05', 'Kiyomizu-dera', 'A historic temple offering panoramic views of Kyoto from its wooden terrace.'),
('2024-08-06', 'Arashiyama Bamboo Grove', 'A picturesque bamboo forest in the Arashiyama district.'),
('2024-08-07', 'Ginkaku-ji', 'The Silver Pavilion, known for its beautiful gardens and serene atmosphere.'),
('2024-08-08', 'Nijo Castle', 'A UNESCO World Heritage Site with beautiful gardens and historic architecture.'),
('2024-08-09', 'Ryoan-ji', 'Famous for its rock garden and Zen Buddhist temple.'),
('2024-08-10', 'Philosopher\'s Path', 'A scenic walkway lined with cherry trees along a canal.'),
('2024-08-11', 'Nishiki Market', 'A bustling food market offering a wide variety of local delicacies.'),
('2024-08-12', 'Heian Shrine', 'Known for its beautiful gardens and impressive red torii gate.'),
('2024-08-13', 'To-ji Temple', 'A historic temple with a five-story pagoda and beautiful gardens.'),
('2024-08-14', 'Kyoto Tower', 'An observation tower offering panoramic views of the city.'),
('2024-08-15', 'Sanjusangendo', 'A temple famous for its 1001 statues of Kannon, the Buddhist goddess of mercy.'),
('2024-08-16', 'Eikan-do Zenrin-ji', 'A temple known for its beautiful autumn leaves and peaceful gardens.'),
('2024-08-17', 'Tofuku-ji Temple', 'Renowned for its Zen gardens and beautiful seasonal landscapes.'),
('2024-08-18', 'Kifune Shrine', 'A mountain shrine known for its picturesque setting and traditional atmosphere.'),
('2024-08-19', 'Shimogamo Shrine', 'A historic shrine located at the confluence of two rivers.'),
('2024-08-20', 'Yasaka Shrine', 'A popular shrine located in the Gion district, known for its festivals.'),
('2024-08-21', 'Sanjusangendo Temple', 'Famous for its long hall and 1001 statues of Kannon.'),
('2024-08-22', 'Kodaiji Temple', 'Known for its beautiful gardens and tea ceremony experience.');

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE `score` (
  `id` int(11) NOT NULL,
  `wins` int(11) NOT NULL,
  `losses` int(11) NOT NULL,
  `ties` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `score`
--

INSERT INTO `score` (`id`, `wins`, `losses`, `ties`) VALUES
(2, 5, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `tskDate` date NOT NULL,
  `tskTime` time NOT NULL,
  `tskName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `tskDate`, `tskTime`, `tskName`) VALUES
(1, '2024-08-01', '09:00:00', 'Fushimi Inari Shrine'),
(2, '2024-08-01', '09:00:00', 'Kinkaku-ji (Golden Pavilion)'),
(3, '2024-08-02', '09:00:00', 'Kiyomizu-dera'),
(4, '2024-08-02', '08:00:00', 'Arashiyama Bamboo Grove'),
(5, '2024-08-03', '17:00:00', 'Gion District'),
(6, '2024-08-03', '08:45:00', 'Nijo Castle'),
(7, '2024-08-04', '08:00:00', 'Philosopher\'s Path'),
(8, '2024-08-04', '09:00:00', 'Kyoto Imperial Palace'),
(9, '2024-08-05', '09:00:00', 'Nishiki Market'),
(10, '2024-08-05', '08:00:00', 'Ryoan-ji'),
(11, '2024-08-06', '09:00:00', 'To-ji Temple'),
(12, '2024-08-06', '10:00:00', 'Fushimi Sake District'),
(13, '2024-08-07', '18:00:00', 'Pontocho Alley'),
(14, '2024-08-07', '00:00:00', 'Yasaka Shrine'),
(15, '2024-08-01', '09:00:00', 'Ninna-ji Temple'),
(16, '2024-08-01', '06:00:00', 'Heian Shrine'),
(17, '2024-08-02', '09:00:00', 'Eikan-do Zenrin-ji'),
(18, '2024-08-02', '08:00:00', 'Sanjusangen-do'),
(19, '2024-08-03', '09:00:00', 'Kyoto Tower'),
(20, '2024-08-03', '09:00:00', 'Tofuku-ji'),
(21, '2024-08-04', '00:00:00', 'Maruyama Park'),
(22, '2024-08-04', '09:30:00', 'Kyoto National Museum'),
(23, '2024-08-05', '09:00:00', 'Daigo-ji'),
(24, '2024-08-05', '09:00:00', 'Katsura Imperial Villa'),
(25, '2024-08-06', '08:30:00', 'Ginkaku-ji (Silver Pavilion)'),
(26, '2024-08-06', '05:00:00', 'Kitano Tenmangu Shrine'),
(27, '2024-08-07', '09:00:00', 'Okochi Sanso Villa'),
(28, '2024-08-07', '08:30:00', 'Nanzen-ji Temple'),
(29, '2024-08-01', '09:00:00', 'Kamo Shrine'),
(30, '2024-08-01', '08:30:00', 'Tofuku-ji Temple'),
(31, '2024-08-02', '10:00:00', 'Kyoto Aquarium'),
(32, '2024-08-02', '10:00:00', 'Kyoto Railway Museum'),
(33, '2024-08-03', '09:00:00', 'Kyoto Botanical Garden'),
(34, '2024-08-03', '06:30:00', 'Shimogamo Shrine'),
(35, '2024-08-04', '08:30:00', 'Enryaku-ji Temple'),
(36, '2024-08-04', '05:30:00', 'Nishi Hongan-ji'),
(37, '2024-08-05', '05:50:00', 'Higashi Hongan-ji'),
(38, '2024-08-05', '09:00:00', 'Shoren-in Temple'),
(39, '2024-08-06', '10:00:00', 'Kyoto International Manga Museum'),
(40, '2024-08-06', '09:00:00', 'Daitoku-ji'),
(41, '2024-08-07', '10:00:00', 'Rurikoin Temple'),
(42, '2024-08-07', '09:00:00', 'Kurama-dera Temple'),
(43, '2024-08-01', '09:00:00', 'Manshu-in Temple'),
(44, '2024-08-01', '08:00:00', 'Yoshimine-dera'),
(45, '2024-08-02', '08:30:00', 'Byodo-in Temple');

-- --------------------------------------------------------

--
-- Table structure for table `testlogin`
--

CREATE TABLE `testlogin` (
  `idno` int(11) NOT NULL,
  `user_fullname` varchar(25) NOT NULL,
  `user_name` varchar(25) NOT NULL,
  `user_password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `testlogin`
--

INSERT INTO `testlogin` (`idno`, `user_fullname`, `user_name`, `user_password`) VALUES
(1000, 'Kasun', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `id` int(11) NOT NULL,
  `subject` varchar(25) NOT NULL,
  `sTime` time NOT NULL,
  `eTime` time NOT NULL,
  `dayOfWeek` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`id`, `subject`, `sTime`, `eTime`, `dayOfWeek`) VALUES
(1, 'Fushimi Inari Shrine', '17:00:00', '09:30:00', 'Monday'),
(2, 'Kinkaku-ji (Golden Pavili', '08:00:00', '17:30:00', 'Tuesday'),
(3, 'Kiyomizu dera', '10:00:00', '17:30:00', 'Wednesday'),
(4, 'Arashiyama Bamboo Grove', '08:00:00', '16:30:00', 'Thursday'),
(5, 'Gion District', '08:00:00', '13:30:00', 'Friday'),
(6, 'Nijo Castle', '09:00:00', '16:30:00', 'Friday'),
(7, 'Philosopher\'s Path', '08:00:00', '09:30:00', 'Saturday'),
(8, 'Kyoto Imperial Palace', '09:00:00', '16:30:00', 'Saturday'),
(9, 'Nishiki Market', '08:00:00', '15:30:00', 'Sunday'),
(10, 'Ryoan-ji', '08:00:00', '17:30:00', 'Sunday'),
(11, 'To-ji Temple', '08:00:00', '15:30:00', 'Monday'),
(12, 'Fushimi Sake District', '08:00:00', '14:30:00', 'Monday'),
(13, 'Pontocho Alley', '09:00:00', '15:30:00', 'Tuesday'),
(14, 'Yasaka Shrine', '08:00:00', '12:00:00', 'Tuesday'),
(15, 'Ninna-ji Temple', '09:15:00', '16:15:00', 'Wednesday'),
(16, 'Heian Shrine', '10:30:00', '13:30:00', 'Wednesday'),
(17, 'Eikan-do Zenrin-ji', '13:00:00', '17:00:00', 'Thursday'),
(18, 'Nanzen-ji Temple', '09:15:00', '15:15:00', 'Thursday'),
(19, 'Kyoto Tower', '16:00:00', '16:30:00', 'Friday'),
(20, 'Sanjusangen-do', '08:00:00', '15:30:00', 'Friday'),
(21, 'Kyoto National Museum', '09:15:00', '16:15:00', 'Saturday'),
(22, 'Daigo-ji', '10:00:00', '16:30:00', 'Saturday'),
(23, 'Katsura Imperial Villa', '13:00:00', '17:00:00', 'Sunday'),
(24, 'Ginkaku-ji (Silver Pavili', '08:15:00', '15:15:00', 'Tuesday'),
(25, 'Okochi Sanso Villa', '09:00:00', '16:30:00', 'Tuesday'),
(26, 'History', '08:00:00', '09:00:00', 'Wednesday'),
(27, 'Math', '09:15:00', '10:15:00', 'Wednesday'),
(28, 'Geography', '10:30:00', '11:30:00', 'Wednesday'),
(29, 'Chemistry', '13:00:00', '14:00:00', 'Wednesday'),
(30, 'Music', '14:15:00', '15:15:00', 'Wednesday'),
(31, 'End of School Day', '16:00:00', '16:30:00', 'Wednesday'),
(40, 'Kinkaku-ji (Golden Pavili', '10:30:00', '11:30:00', 'Friday');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testlogin`
--
ALTER TABLE `testlogin`
  ADD PRIMARY KEY (`idno`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
