-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2022 at 05:25 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `outlet`
--

CREATE TABLE `outlet` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `nama_outlet` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `nomor_tlp` varchar(255) DEFAULT NULL,
  `creaetd_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `outlet`
--

INSERT INTO `outlet` (`id`, `id_user`, `nama_outlet`, `alamat`, `nomor_tlp`, `creaetd_at`, `updated_at`) VALUES
(1, 1, 'q-laundry', 'jln pesantren', '081210183090', '2022-09-16 03:03:01', '2022-09-16 03:03:01'),
(2, 2, 'w-laundry', 'jln sukanegara', '081210183090', '2022-09-16 03:05:58', '2022-09-16 03:05:58'),
(3, 3, 'e-laundry', 'jln garuda', '081210183090', '2022-09-16 03:05:58', '2022-09-16 03:05:58');

-- --------------------------------------------------------

--
-- Table structure for table `paket`
--

CREATE TABLE `paket` (
  `id` int(11) NOT NULL,
  `nama_paket` varchar(225) DEFAULT NULL,
  `harga` varchar(225) DEFAULT NULL,
  `satuan` varchar(225) DEFAULT NULL,
  `creaetd_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paket`
--

INSERT INTO `paket` (`id`, `nama_paket`, `harga`, `satuan`, `creaetd_at`, `updated_at`) VALUES
(1, 'Farrel', '10.000', '12', '2022-09-16 03:08:24', '2022-09-16 03:08:24'),
(2, 'A Fatir', '11.000', '13', '2022-09-16 03:08:24', '2022-09-16 03:08:24'),
(3, 'Fatir M', '12.000', '14', '2022-09-16 03:08:24', '2022-09-16 03:08:24');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `no_tlp` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `creaetd_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `id_user`, `no_tlp`, `alamat`, `creaetd_at`, `updated_at`) VALUES
(1, 1, '081273940133', 'jln pesantren', '2022-09-16 03:10:57', '2022-09-16 03:10:57'),
(2, 2, '081274930594', 'jln sukanegara', '2022-09-16 03:10:57', '2022-09-16 03:10:57'),
(3, 3, '081284937488', 'jln garuda', '2022-09-16 03:10:57', '2022-09-16 03:10:57');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(11) NOT NULL,
  `id_pesanan` int(4) DEFAULT NULL,
  `tgl_bayar` date DEFAULT NULL,
  `jumlah_paket` varchar(255) DEFAULT NULL,
  `subtotal` varchar(255) DEFAULT NULL,
  `bukti_transfer` varchar(255) DEFAULT NULL,
  `denda` int(7) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `id_pesanan`, `tgl_bayar`, `jumlah_paket`, `subtotal`, `bukti_transfer`, `denda`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-09-16', '2', '10.000', 'trnsfarrel.png', 5, '2022-09-16 03:14:27', '2022-09-16 03:14:27'),
(2, 2, '2022-09-16', '3', '15.000', 'trnsafatir.png', 8, '2022-09-16 03:14:27', '2022-09-16 03:14:27'),
(3, 3, '2022-09-16', '5', '25.000', 'trnsfatirm.png', 13, '2022-09-16 03:14:27', '2022-09-16 03:14:27');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL,
  `id_user` int(10) DEFAULT NULL,
  `id_outlet` int(10) DEFAULT NULL,
  `id_paket` int(10) DEFAULT NULL,
  `status_pesanan` enum('di proses','selesai') DEFAULT 'di proses',
  `status_pembayaran` enum('Lunas','Belum Lunas') DEFAULT 'Belum Lunas',
  `tanggal_pesanan` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id`, `id_user`, `id_outlet`, `id_paket`, `status_pesanan`, `status_pembayaran`, `tanggal_pesanan`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'selesai', 'Lunas', '2022-09-16', '2022-09-16 03:16:55', '2022-09-16 03:16:55'),
(2, 2, 2, 2, 'selesai', 'Belum Lunas', '2022-09-15', '2022-09-16 03:16:55', '2022-09-16 03:16:55'),
(3, 3, 3, 3, 'di proses', 'Lunas', '2022-09-12', '2022-09-16 03:16:55', '2022-09-16 03:16:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama_paket` varchar(225) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `username` varchar(225) DEFAULT NULL,
  `level` enum('admin','petugas','pelanggan') DEFAULT NULL,
  `email_verified` timestamp NOT NULL DEFAULT current_timestamp(),
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `creaetd_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama_paket`, `email`, `username`, `level`, `email_verified`, `password`, `remember_token`, `creaetd_at`, `updated_at`) VALUES
(1, 'Farrel', 'idnfarrel@gmail.com', 'endagor', 'admin', '2022-09-16 03:23:31', 'siapayangnanya', 'qr3y89wfkjb', '2022-09-16 03:23:31', '2022-09-16 03:23:31'),
(2, 'A Fatir', 'a.fatir@gmail.com', 'akuahmad', 'petugas', '2022-09-16 03:23:31', 'yangnanyasiapa', '893rrhiu89e', '2022-09-16 03:23:31', '2022-09-16 03:23:31'),
(3, 'Fatir M', 'fatir.m@gmail.com', 'akumuhammad', 'pelanggan', '2022-09-16 03:23:31', 'nanyayangisapa', '3r89ijefw8h', '2022-09-16 03:23:31', '2022-09-16 03:23:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_outlet_users` (`id_user`);

--
-- Indexes for table `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pelanggan_users` (`id_user`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pembayaran_pesanan` (`id_pesanan`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pesanan_user` (`id_user`),
  ADD KEY `fk_pesanan_outlet` (`id_outlet`),
  ADD KEY `fk_pesanan_paket` (`id_paket`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `outlet`
--
ALTER TABLE `outlet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `paket`
--
ALTER TABLE `paket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `outlet`
--
ALTER TABLE `outlet`
  ADD CONSTRAINT `fk_outlet_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD CONSTRAINT `fk_pelanggan_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `fk_pembayaran_pesanan` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id`);

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `fk_pesanan_outlet` FOREIGN KEY (`id_outlet`) REFERENCES `outlet` (`id`),
  ADD CONSTRAINT `fk_pesanan_paket` FOREIGN KEY (`id_paket`) REFERENCES `paket` (`id`),
  ADD CONSTRAINT `fk_pesanan_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
