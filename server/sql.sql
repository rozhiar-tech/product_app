-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2023 at 07:11 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `products`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `name` varchar(25) NOT NULL,
  `price` int(11) NOT NULL,
  `imagUrl` varchar(1000) NOT NULL,
  `description` varchar(500) NOT NULL,
  `id` int(11) NOT NULL,
  `category` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`name`, `price`, `imagUrl`, `description`, `id`, `category`) VALUES
('aq', 29, 'https://firebasestorage.googleapis.com/v0/b/aqarat-5f021.appspot.com/o/ww.png?alt=media&token=b8b49cc7-f832-4694-9400-88afff250831', 'There are two microphones inside each AirPod, one facing outward at ear level and another at the bottom of the stem. Each AirPod weighs 0.14 oz (4.0 g), and its charging case weighs 1.34 oz (38 g). The AirPods are capable of holding a charge of around five hours.', 4, 'luxury'),
('rozha', 29, 'https://www.topgear.com/sites/default/files/news-listicle/image/2023/01/1.jpeg?w=827&h=465', 'adfDFdsfd', 6, 'cars'),
('baby shampoo', 56, 'https://www.johnsonsbaby.com/sites/jbaby_us_3/files/styles/product_image/public/product-images/jns_381371175024_600ml_00000_1000wx1000h.jpeg', 'Johnson\'s Baby Shampoo with Tear-Free Formula, Shampoo for Baby\'s Delicate Scalp & Skin, Gently Washes Away Dirt & Germs, Paraben-, Phthalate-, Sulfate- & Dye- ...', 8, 'children');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
