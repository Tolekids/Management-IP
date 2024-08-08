-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Agu 2024 pada 04.08
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

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
-- Struktur dari tabel `tbl_member`
--

CREATE TABLE `tbl_member` (
  `id_member` varchar(8) NOT NULL,
  `tanggal_upload` date NOT NULL,
  `jenis_pilot` enum('user','admin','alex') NOT NULL,
  `ip` varchar(50) NOT NULL,
  `perangkat` enum('up','down') NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `domain` varchar(50) NOT NULL,
  `whatsapp` varchar(13) NOT NULL,
  `foto_profil` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_member`
--

INSERT INTO `tbl_member` (`id_member`, `tanggal_upload`, `jenis_pilot`, `ip`, `perangkat`, `keterangan`, `domain`, `whatsapp`, `foto_profil`) VALUES
('ID-00001', '2024-07-31', 'alex', '172.168.1.2', 'up', 'Untuk IP mikrotik', 'bondowosokab', '0743483432', '0b8c2a14ca8b0028e6ef6c654ef6c63beae41b36.png'),
('ID-00002', '2024-08-07', 'alex', '172.65.23.88', 'up', 'IP digunakan untuk CCR', '-', '0854', 'fe87467f901ed3cd9db11f2c5d0ea6f4d2d33259.png');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_member`
--
ALTER TABLE `tbl_member`
  ADD PRIMARY KEY (`id_member`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
