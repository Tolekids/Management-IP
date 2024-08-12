-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2024 at 05:40 PM
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
-- Database: `db_member`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_member`
--

CREATE TABLE `tbl_member` (
  `id_member` varchar(8) NOT NULL,
  `tanggal_upload` date NOT NULL,
  `jenis_pilot` enum('user','admin','alex') NOT NULL,
  `ip` varchar(16) NOT NULL,
  `perangkat` enum('up','down') NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `domain` varchar(50) NOT NULL,
  `nama_perangkat` varchar(255) NOT NULL,
  `foto_profil` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_member`
--

INSERT INTO `tbl_member` (`id_member`, `tanggal_upload`, `jenis_pilot`, `ip`, `perangkat`, `keterangan`, `domain`, `nama_perangkat`, `foto_profil`) VALUES
('ID-00001', '2024-07-31', 'alex', '172.168.1.2', 'up', 'Untuk IP mikrotik', 'bondowosokab', '0743483432', '0b8c2a14ca8b0028e6ef6c654ef6c63beae41b36.png'),
('ID-00002', '2024-08-07', 'alex', '172.65.23.88', 'up', 'IP digunakan untuk CCR', '-', '0854', 'fe87467f901ed3cd9db11f2c5d0ea6f4d2d33259.png'),
('ID-00003', '2024-08-12', '', '192.123.123.123', 'up', 'adsasd', 'asd', '91238', 'a22a2d2a0c426092b2eb329316586cc416a25923.png'),
('ID-00004', '2024-08-07', '', 'asd', 'up', 'asd', 'asd', '123', 'c171f52dd2cde136ee0f94d061c334aaf71025ba.png'),
('ID-00005', '2024-08-09', '', 'asd', 'up', 'asd', 'asd', '123', 'a61e8d9997313d0eaf6e53455f1ae0b91fd4f653.png'),
('ID-00006', '2024-08-09', 'user', '192.168.1.1', 'up', 'IP yang digunakan', 'bokab', '', '82578aabb6e15cd8353a55ec1fd17c8b68866a7e.png'),
('ID-00007', '2024-08-23', 'user', '192.168.223.494', 'up', 'IP yang di gunakan Untuk ccr', 'bokab', '', 'b65c97da067ccfb36ae86c870e709b2ab6366b3d.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `password`) VALUES
(1, 'admin', 'password'),
(2, 'user', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_member`
--
ALTER TABLE `tbl_member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
