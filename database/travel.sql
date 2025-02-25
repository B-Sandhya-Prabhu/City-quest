-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2024 at 10:04 AM
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
-- Database: `travel`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(10) NOT NULL,
  `ffirst` varchar(20) NOT NULL,
  `flast` varchar(20) NOT NULL,
  `femail` varchar(30) NOT NULL,
  `city` varchar(20) NOT NULL,
  `fphone` int(15) NOT NULL,
  `fdesti` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `ffirst`, `flast`, `femail`, `city`, `fphone`, `fdesti`) VALUES
(1, 'Ganesh', 'Naik', 'ganeshravinaik2001@gmail.com', 'Honnavar', 2147483647, 'Goa'),
(2, 'kiran', 'Naik', 'kirannaik1@gmail.com', 'Honnavar', 845868956, 'Mumbai'),
(7, 'Ganesh', 'Naik', 'ganeshravinaik2001@gmail.com', 'Honnavar', 2147483647, 'Mysore'),
(8, 'Hitesh', 'HT', 'hitesh45jk@gmail.com', 'Udupi', 458696561, 'Kerala'),
(9, 'Ganesh', 'Naik', 'ganeshravinaik2001@gmail.com', 'Honnavar', 2147483647, 'Kerala'),
(10, 'Ganesh', 'Naik', 'ganeshravinaik2001@gmail.com', 'Honnavar', 2147483647, 'India Gate'),
(11, 'Gajanan', 'Bhat', 'gajabhat@gmail.com', 'Kumta', 2147483647, 'Mysore'),
(12, 'Ganesh', 'Naik', 'ganeshravinaik2001@gmail.com', 'Honnavar', 2147483647, 'Kerala'),
(13, 'priya', 'mr', 'priya@gmail.com', 'puttur', 1234567891, 'udupi'),
(14, 'shivalika', 'p', 'shivalika@gmail.com', 'kundapur', 2147483647, 'falls'),
(15, 'dharmi', 'bhut', 'dharmi@gmail.com', 'rajkot', 1234567891, 'udupi'),
(16, 'disha', 'rai', 'disha@gmail.com', 'mangalore', 2147483647, 'goa');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `city` varchar(10) NOT NULL,
  `phone` bigint(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `fname`, `password`, `email`, `city`, `phone`) VALUES
(34, 'admin', 'Adm12345', 'admintms@gmail.com', 'Honnavar', 8971046276),
(51, 'Ganesh', 'Gane1234', 'ganeshravinaik2001@gmail.com', 'Honnavar', 8971046276),
(72, 'Aditya', 'Adi12389', 'adityag45@gmail.com', 'Manglore', 8574968283),
(73, 'Gajanan', 'GAjju700', 'gajabhat@gmail.com', 'Kumta', 7984768581),
(74, 'Kiran', 'AJkiran1', 'kiranaj56@gmail.com', 'Honnavar', 7586949199),
(75, 'Prasad', 'Pra23444', 'prasad24@gmail.com', 'Honnavar', 7485961256),
(76, 'Mahesh', 'Mahi1233', 'maheshmm@gmail.com', 'Kumta', 9978488656),
(78, 'Nishchay', 'Nishi789', 'nishibhatt234@gmail.com', 'Udupi', 7485961236),
(79, 'sandhya', 'Sandhya1', 'sandyaprabhu33@gmail.com', 'Puttur', 9980724497);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `feedbk` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `email`, `feedbk`) VALUES
(1, 'joy', 'joy123@gmail.com', 'good website'),
(2, 'amar', 'amar56@gmail.com', 'nice website'),
(3, 'adam', 'adamgray@gmail.com', 'your website looks good and nice user interface'),
(4, 'adam', 'adamgray@gmail.com', 'your website looks good and nice user interface'),
(5, 'arjun', 'arjun45@gmal.com', 'good website'),
(6, 'Hitesh', 'hitesh43jk@gmai.com', 'its good website nice user interface'),
(7, 'kiran', 'kiran35@gmail.com', 'this is a good website'),
(8, 'chiru', 'chiru@gmail.com', 'good '),
(9, 'shivalika', 'shiv@gmail.com', 'hello '),
(10, 'dharmi', 'dharmi@gmail.com', 'hii chiru'),
(11, 'sandhya', 'sandya@gmail.com', 'hellooo'),
(12, 'John Doe', 'johndoe@example.com', 'Great service!');

--
-- Triggers `feedback`
--
DELIMITER $$
CREATE TRIGGER `after_feedback_insert` AFTER INSERT ON `feedback` FOR EACH ROW BEGIN
  INSERT INTO `feedback_log` (`feedback_id`, `action`) 
  VALUES (NEW.id, 'Feedback Inserted');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `feedback_log`
--

CREATE TABLE `feedback_log` (
  `log_id` int(10) NOT NULL,
  `feedback_id` int(10) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback_log`
--

INSERT INTO `feedback_log` (`log_id`, `feedback_id`, `action`, `timestamp`) VALUES
(1, 12, 'Feedback Inserted', '2024-12-30 07:48:09');

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `hid` int(10) NOT NULL,
  `hname` varchar(20) NOT NULL,
  `hphone` varchar(15) NOT NULL,
  `hcity` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`hid`, `hname`, `hphone`, `hcity`) VALUES
(1, 'Taj Hotel', '78869565', 'Mumbai'),
(2, 'Hotel High', '78869565', 'Benglore');

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

CREATE TABLE `information` (
  `pname` varchar(30) NOT NULL,
  `pdescription` varchar(10000) NOT NULL,
  `pi_main` varchar(1000) NOT NULL,
  `pi1` varchar(1000) NOT NULL,
  `pi2` varchar(1000) NOT NULL,
  `pi3` varchar(1000) NOT NULL,
  `package` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `information`
--

INSERT INTO `information` (`pname`, `pdescription`, `pi_main`, `pi1`, `pi2`, `pi3`, `package`) VALUES
('Udupi', 'Udupi is known for its temple and its unique cuisine. The Udupi Sri Krishna Temple is one of the most famous religious sites in the region, attracting devotees from across India. The city is also renowned for its beaches, with Malpe Beach being a popular tourist destination. Udupi is well-known for its traditional South Indian food, particularly the famous Udupi cuisine that is served worldwide.', 'images//destination//udupi.png', 'images//destination//udupi2.jpg', 'images//destination//udupi3.jpg', 'images//destination//udupi4.jpg', 5000),
('KRS Dam', 'Krishna Raja Sagara (KRS) Dam, located near the city of Mysore, is a popular tourist spot offering a picturesque view of the dam and the surrounding landscape. The dam is situated on the Kaveri River and is surrounded by lush green fields, making it a perfect getaway spot for nature lovers and those seeking tranquility.', 'images//destination//krsdam.png', 'images//destination//krsdam2.jpg', 'images//destination//krsdam3.jpg', 'images//destination//krsdam4.jpg', 7000),
('Mysore', 'Mysore Palace, a symbol of the grandeur and legacy of the Wodeyar dynasty, is a major attraction in the city. Mysore is famous for its rich cultural heritage, historical sites, and colorful festivals. The Mysore Zoo and Chamundeshwari Temple also contribute to the city\'s fame, making it a must-visit destination for history and culture enthusiasts.', 'images//destination//mysore1.jpg', 'images//destination//mysore2.jpg', 'images//destination//mysore3.jpg', 'images//destination//mysore4.jpg', 9000),
('Mandalpatti', 'Mandalpatti is a scenic hilltop located near Madikeri in Coorg. The place is famous for its breathtaking views of the surrounding hills and valleys. It offers opportunities for trekking and adventure activities, making it a popular destination for nature lovers and adventure enthusiasts.', 'images//destination//mandalpatti.png', 'images//destination//mandalpatti2.jpg', 'images//destination//mandalpatti3.jpg', 'images//destination//mandalpatti4.jpg', 6000),
('Badami', 'Badami, once the capital of the Chalukya dynasty, is known for its rock-cut temples and ancient ruins. The town is surrounded by beautiful hills and is famous for its historical significance and the Badami caves, which are carved into the hillsides. It’s an excellent destination for history buffs and adventure seekers alike.', 'images//destination//badami.png', 'images//destination//badami2.jpg', 'images//destination//badami3.jpg', 'images//destination//badami4.jpg', 8000),
('Varanga', 'Varanga is a quaint village located in the Udupi district, known for its picturesque landscapes and tranquil atmosphere. The place is famous for its ancient temples, including the Varanga Jain Temple, and is a great spot for those looking to explore the spiritual and natural beauty of Karnataka.', 'images//destination//varanga.png', 'images//destination//varanga2.jpg', 'images//destination//varanga3.jpg', 'images//destination//varanga4.jpg', 4000),
('Hampi', 'Hampi, a UNESCO World Heritage site, is famous for its ancient temples, ruins, and historical landmarks. The town was once the capital of the Vijayanagara Empire and is now a popular tourist destination due to its impressive historical and architectural significance.', 'images//destination//hampi1.jpg', 'images//destination//hampi2.jpg', 'images//destination//hampi3.jpg', 'images//destination//hampi4.jpg', 12000),
('Gokarna', 'Gokarna is a small coastal town in Karnataka, known for its serene beaches and spiritual significance. The Om Beach and Kudle Beach attract beach lovers and those looking for a peaceful retreat. It’s also home to the famous Gokarna Temple, making it a perfect blend of nature and spirituality.', 'images//destination//gokarna.png', 'images//destination//gokarna2.jpg', 'images//destination//gokarna3.jpg', 'images//destination//gokarna4.jpg', 10000),
('Chunchi Falls', 'Chunchi Falls is a scenic waterfall located in the Kanakapura district. The falls are surrounded by lush green forests and offer a peaceful escape from the hustle and bustle of city life. It is a popular destination for nature lovers and adventure enthusiasts who enjoy hiking and exploring the outdoors.', 'images//destination//chunchi_falls.png', 'images//destination//chunchi_falls2.jpg', 'images//destination//chunchi_falls3.jpg', 'images//destination//chunchi_falls4.jpg', 3000),
('Vijayanagara', 'Vijayanagara is an ancient city and the capital of the Vijayanagara Empire. It is known for its historical ruins and temples that showcase the architectural brilliance of the empire. The city\'s most famous attractions include the Virupaksha Temple and the Hampi ruins.', 'images//destination//vijayanagara.png', 'images//destination//vijayanagara2.jpg', 'images//destination//vijayanagara3.jpg', 'images//destination//vijayanagara4.jpg', 15000),
('Asthoor Tomb', 'Asthoor Tomb, located in the coastal town of Mangalore, is an important historical site. It is known for its unique architectural design and is a popular spot for those interested in history and heritage.', 'images//destination//asthoor.png', 'images//destination//asthoor2.jpg', 'images//destination//asthoor3.jpg', 'images//destination//asthoor4.jpg', 7000);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `user` varchar(10) NOT NULL,
  `pass` varchar(10) NOT NULL,
  `date_time` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`user`, `pass`, `date_time`) VALUES
('adii', '784596', '2021-01-20 05:56:33am'),
('anusha', '45789656', '2021-01-20 06:06:24am'),
('adii', '123456', '2021-01-20 08:15:18am'),
('gaja', '12356', '2021-01-22 10:13:22am'),
('gaja', '123456', '2021-01-24 06:40:56am'),
('nishchay', 'nishi123', '2021-01-24 07:09:22am'),
('mahesh', '12345mn', '2021-01-24 07:10:00am'),
('admin', 'ad123', '2021-01-24 07:10:24am'),
('admin', 'ad123', '2021-01-25 05:54:18am'),
('admin', 'ad123', '2021-01-25 06:07:10am'),
('admin', 'ad123', '2021-01-25 06:09:19am'),
('admin', 'ad123', '2021-01-27 01:30:47pm'),
('admin', 'ad123', '2021-01-29 09:23:58am'),
('Gajanan', 'GAjju700', '2021-01-30 06:13:16pm'),
('Ganesh', 'Gane1234', '2021-01-30 06:24:15pm'),
('admin', 'ad123', '2021-06-08 04:11:53pm'),
('admin', 'ad123', '2021-09-19 03:24:26pm'),
('admin', 'ad123', '2021-09-19 04:41:06pm'),
('Ganesh', 'Gane1234', '2024-12-26 11:15:45am'),
('Ganesh', 'Gane1234', '2024-12-26 11:19:50am'),
('Ganesh', 'Gane1234', '2024-12-26 11:32:45am'),
('Ganesh', 'Gane1234', '2024-12-26 04:20:25pm'),
('Ganesh', 'Gane1234', '2024-12-27 06:01:02am'),
('Ganesh', 'Gane1234', '2024-12-27 12:19:29pm'),
('Ganesh', 'Gane1234', '2024-12-28 05:06:26pm'),
('Ganesh', 'Gane1234', '2024-12-28 05:25:01pm'),
('Aditya', 'Adi12389', '2024-12-28 05:36:36pm'),
('Aditya', 'Adi12389', '2024-12-28 05:38:19pm'),
('sandhya', 'Sandhya1', '2024-12-30 06:44:13am');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `pid` int(10) NOT NULL,
  `pname` varchar(20) NOT NULL,
  `pcity` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`pid`, `pname`, `pcity`) VALUES
(1, 'Tajmahal', 'Agra'),
(2, 'Beach', 'Goa'),
(3, 'India Gate', 'Delhi'),
(4, 'Kerala Beach', 'Kerala'),
(5, 'Mysore Palace', 'Mysore'),
(6, 'Ladakh', 'Ladakh India');

-- --------------------------------------------------------

--
-- Table structure for table `travel.login`
--

CREATE TABLE `travel.login` (
  `user` varchar(10) NOT NULL,
  `pass` varchar(10) NOT NULL,
  `date_time` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `travel_agent`
--

CREATE TABLE `travel_agent` (
  `aid` int(10) NOT NULL,
  `afname` varchar(20) NOT NULL,
  `aemail` varchar(30) NOT NULL,
  `aphone` int(15) NOT NULL,
  `acity` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `travel_agent`
--

INSERT INTO `travel_agent` (`aid`, `afname`, `aemail`, `aphone`, `acity`) VALUES
(1, 'amar', 'amarraj123@gmail.com', 85749646, 'Mandya'),
(2, 'akhil', 'akhil23@gmai.com', 45968678, 'Manglore'),
(3, 'kiran', 'kiru34@gmail.com', 78969665, 'Mysore');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fname` (`fname`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback_log`
--
ALTER TABLE `feedback_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`hid`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `travel_agent`
--
ALTER TABLE `travel_agent`
  ADD PRIMARY KEY (`aid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `feedback_log`
--
ALTER TABLE `feedback_log`
  MODIFY `log_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `hid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `pid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `travel_agent`
--
ALTER TABLE `travel_agent`
  MODIFY `aid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
