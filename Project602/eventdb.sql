-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2024 at 06:48 PM
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
-- Database: `eventdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `state` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `ticket` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `type`, `latitude`, `longitude`, `date`, `time`, `state`, `description`, `ticket`) VALUES
(1, 'Annual Marathon', 'Sports Games', '5.5320823', '100.4683964', '2024-07-14', '10:00:00', 'Penang', 'A city-wide marathon attracting runners of all levels to compete and promote fitness.', 'RM 30'),
(2, 'Spring Music Festival', 'Festival', '5.5320944', '100.468396', '2024-07-14', '10:00:00', 'Penang', 'A festival celebrating the arrival of spring with live music, food vendors, and craft stalls.', 'None'),
(3, 'Black Friday Extravaganza', 'Sale', '1.5533', '110.3592', '2024-07-16', '11:00:00', 'Sarawak', 'A major sale event with significant discounts across various retail stores, both in-store and online.', 'None'),
(4, 'Community Basketball Tournament', 'Sports Games', '3.0738', '101.5183', '2024-07-25', '10:00:00', 'Selangor', 'A basketball tournament featuring teams from local communities competing for the championship.', 'RM 15'),
(5, 'Summer Beach Festival', 'Festival', '4.8221869', '99.9713904', '2024-08-03', '09:00:00', 'Perak', 'A festival held at the beach with live music, games, and food stalls to celebrate summer.', 'None'),
(6, ' Youth Soccer League Finals', 'Sports Games', '5.3302', '103.1408', '2024-08-06', '10:00:00', 'Terengganu', 'The final matches of the youth soccer league, determining the league champions.', 'None'),
(7, 'Holiday Super Sale', 'Sale', '2.7251', '101.9376', '2024-08-08', '10:00:00', 'Negeri Sembilan', 'A holiday-themed sale offering special discounts on gifts, decorations, and festive items.\r\n', 'None'),
(10, 'Beach Clean-Up Drive', 'Community Service', '5.9804', '116.0735', '2024-10-21', '08:00:00', 'Sabah', 'Join us for a community-driven Beach Clean-Up Drive to help preserve our beautiful coastline and protect marine life by removing litter and debris.', 'None'),
(11, 'Penang Food Festival', 'Festival', '5.4141', '100.3288', '2024-08-10', '10:00:00', 'Penang', 'A celebration of local cuisine and street food.', 'None'),
(12, 'Kuala Lumpur Marathon', 'Sports', '3.1390', '101.6869', '2024-09-20', '06:00:00', 'Kuala Lumpur', 'Annual marathon event in the heart of the city.', 'RM 50'),
(13, 'Historical Tour', 'Tour', '2.1896', '102.2501', '2024-07-30', '09:00:00', 'Melaka', 'Guided tour of historical sites in Melaka.', 'RM 20'),
(14, 'Sabah Cultural Dance', 'Cultural', '5.9804', '116.0735', '2024-08-15', '18:00:00', 'Sabah', 'Performance showcasing traditional dances of Sabah.', 'RM 10'),
(15, 'Sarawak Music Festival', 'Music', '1.5533', '110.3592', '2024-09-05', '20:00:00', 'Sarawak', 'Music festival featuring local and international artists.', 'RM 70'),
(16, 'Perak Night Market', 'Market', '4.5921', '101.0901', '2024-07-25', '19:00:00', 'Perak', 'A vibrant night market with local goods and street food.', 'None'),
(17, 'Art Exhibition', 'Exhibition', '1.4927', '103.7414', '2024-08-18', '10:00:00', 'Johor', 'Exhibition of contemporary art by local artists.', 'RM 25'),
(18, 'Terengganu Kite Festival', 'Festival', '5.3294', '103.1370', '2024-09-10', '08:00:00', 'Terengganu', 'A festival celebrating traditional kite flying.', 'RM 10'),
(19, 'Batik Workshop', 'Workshop', '6.1254', '102.2386', '2024-07-28', '14:00:00', 'Kelantan', 'Workshop on traditional batik making.', 'RM 25'),
(20, 'Pahang Jungle Trekking', 'Adventure', '3.8126', '103.3256', '2024-08-12', '07:00:00', 'Pahang', 'Guided jungle trekking adventure in Pahang.', 'RM 30'),
(21, 'Tech Expo', 'Exhibition', '3.0738', '101.5183', '2024-10-12', '09:00:00', 'Selangor', 'Exhibition showcasing the latest technology and innovations.', 'None'),
(22, 'Food Fair', 'Festival', '2.7258', '101.9378', '2024-08-22', '11:00:00', 'Negeri Sembilan', 'A fair celebrating traditional and modern cuisine.', 'None'),
(23, 'Art Carnival', 'Carnival', '5.4164', '100.3327', '2024-09-15', '10:00:00', 'Penang', 'A carnival featuring local art and craft.', 'RM 10'),
(24, 'Sabah Wildlife Safari', 'Tour', '5.9765', '116.0713', '2024-10-05', '06:00:00', 'Sabah', 'A safari tour showcasing Sabah’s wildlife.', 'RM 35'),
(25, 'Sarawak Heritage Walk', 'Tour', '1.5545', '110.3566', '2024-08-29', '07:00:00', 'Sarawak', 'A walking tour of heritage sites in Sarawak.', 'RM 15'),
(26, 'River Cruise', 'Tour', '4.5975', '101.0757', '2024-09-21', '17:00:00', 'Perak', 'A scenic river cruise showcasing Perak’s natural beauty.', 'RM 45'),
(27, 'Bike Week', 'Festival', '1.4927', '103.7444', '2024-10-03', '09:00:00', 'Johor', 'A festival for bike enthusiasts with exhibitions and rides.', 'None'),
(28, 'Terengganu Sea Turtle Conservation', 'Workshop', '5.3139', '103.1327', '2024-09-13', '08:00:00', 'Terengganu', 'A workshop on sea turtle conservation efforts.', 'RM 10'),
(29, 'Traditional Music Night', 'Music', '6.1238', '102.2382', '2024-08-27', '19:00:00', 'Kelantan', 'A night of traditional music performances.', 'RM 15'),
(30, 'Pahang Adventure Race', 'Sports', '3.8168', '103.3260', '2024-09-18', '08:00:00', 'Pahang', 'An adventure race through the jungles and rivers of Pahang.', 'RM 20'),
(31, 'Kuala Lumpur Fashion Week', 'Fashion', '3.1467', '101.6952', '2024-10-09', '18:00:00', 'Kuala Lumpur', 'A showcase of the latest fashion trends.', 'None'),
(32, 'Craft Fair', 'Fair', '3.0755', '101.5218', '2024-09-12', '10:00:00', 'Selangor', 'A fair showcasing traditional and modern crafts.', 'None'),
(33, 'Negeri Sembilan Cultural Festival', 'Festival', '2.7259', '101.9372', '2024-08-30', '09:00:00', 'Negeri Sembilan', 'A festival celebrating the culture of Negeri Sembilan.', 'None'),
(34, 'International Marathon', 'Sports', '5.4154', '100.3288', '2024-11-20', '06:00:00', 'Penang', 'An international marathon event.', 'RM 50'),
(35, 'Fishing Competition', 'Competition', '5.9767', '116.0730', '2024-11-02', '07:00:00', 'Sabah', 'A fishing competition for amateurs and professionals.', 'RM 25'),
(36, 'Sarawak Food and Craft Bazaar', 'Bazaar', '1.5532', '110.3500', '2024-10-18', '09:00:00', 'Sarawak', 'A bazaar featuring local food and crafts.', 'None'),
(37, 'Adventure Camp', 'Adventure', '4.5968', '101.0832', '2024-11-10', '08:00:00', 'Perak', 'A camp for adventure activities like hiking and rafting.', 'RM 45'),
(38, 'International Boat Show', 'Exhibition', '1.4929', '103.7465', '2024-11-23', '10:00:00', 'Johor', 'An exhibition showcasing boats and marine equipment.', 'RM 20'),
(39, 'Kelantan Food Festival', 'Festival', '6.1214', '102.2399', '2024-11-19', '10:00:00', 'Kelantan', 'A festival celebrating traditional Kelantanese cuisine.', 'None'),
(40, 'Eco Run', 'Sports', '3.8185', '103.3219', '2024-10-07', '07:00:00', 'Pahang', 'An eco-friendly running event promoting environmental awareness.', 'RM 30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
