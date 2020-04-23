-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2020 at 07:47 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_monitoring`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id_client` int(5) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` int(13) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id_client`, `nama`, `alamat`, `telepon`, `status`) VALUES
(1, 'adc', 'tokyo', 123, 'suplier'),
(2, 'abcd', 'tokyo', 21474836, 'suplier'),
(6, 'abc', 'tokyo', 123, 'customer'),
(8, 'ABC', 'tokyo', 1234, 'customer'),
(9, 'ddd', 'tokyo', 123, 'suplier'),
(10, 'CV. Cinta Mandiri', 'Cikupa, Tangerang Banten', 2147483647, 'suplier');

-- --------------------------------------------------------

--
-- Table structure for table `master_barang`
--

CREATE TABLE `master_barang` (
  `id_barang` int(5) NOT NULL,
  `kode_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `spesifikasi` varchar(50) NOT NULL,
  `jumlah_stok` int(5) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_barang`
--

INSERT INTO `master_barang` (`id_barang`, `kode_barang`, `nama_barang`, `spesifikasi`, `jumlah_stok`, `tanggal`) VALUES
(2, '003', 'Paku', 'Besi', 211, '2020-02-20'),
(4, '001', 'Palu', 'Besiii', 12, '2020-02-10'),
(5, '123456', 'Kunci', 'kunci', 42, '2020-02-04');

-- --------------------------------------------------------

--
-- Table structure for table `surat`
--

CREATE TABLE `surat` (
  `id_surat` int(5) NOT NULL,
  `no_surat` int(10) NOT NULL,
  `kode_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `jumlah_barang` int(10) NOT NULL,
  `nama_suplier` varchar(20) NOT NULL,
  `nama_customer` varchar(20) NOT NULL,
  `tanggal_req` varchar(10) NOT NULL,
  `waktu_req` varchar(10) NOT NULL,
  `tanggal_terima` varchar(10) NOT NULL DEFAULT 'Menunggu',
  `waktu_terima` varchar(10) NOT NULL DEFAULT 'Menunggu',
  `status` varchar(15) NOT NULL,
  `kategori` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat`
--

INSERT INTO `surat` (`id_surat`, `no_surat`, `kode_barang`, `nama_barang`, `jumlah_barang`, `nama_suplier`, `nama_customer`, `tanggal_req`, `waktu_req`, `tanggal_terima`, `waktu_terima`, `status`, `kategori`) VALUES
(3, 1, '001', 'Paku', 20, 'adc', '', '2020-02-17', '01:48:27', '2020-02-04', '05:31:22', 'Di Tolak ', 'SPB'),
(4, 0, '001', 'Paku', 20, 'adc', '', '2020-02-02', '01:43:53', '2020-02-12', '03:55:51', 'Barang Habis', 'ro'),
(6, 0, '$kode_barang', '$nama_barang', 0, '$nama_suplier', '', '$tanggal_r', '$waktu_req', 'Menunggu', 'Menunggu', '$status', '$kate'),
(9, 88, '001', 'Paku', 20, 'adc', '', '2020/02/23', '07:18:22', 'Menunggu', 'Menunggu', '', 'po'),
(10, 133, '001', 'Paku', 20, 'abcd', '', '2020/02/23', '07:19:20', 'Menunggu', 'Menunggu', '', 'po'),
(11, 1, '001', 'Paku', 20, 'ABC', '', '2020/02/25', '07:45:10', 'Menunggu', 'Menunggu', 'terkirim', 'po'),
(12, 1, '001', 'Paku', 20, 'ABC', '', '2020/02/27', '07:46:04', 'Menunggu', 'Menunggu', 'terkirim', 'ro'),
(13, 1, '', 'Paku', 20, 'ABC', '', '2020/02/28', '07:46:34', 'Menunggu', 'Menunggu', 'terkirim', 'ro'),
(14, 88, '001', 'Paku', 20, '', 'abc', '2020/02/21', '07:47:32', '2020-02-15', '07:47:47', 'Barang Habis', 'ro');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_barang`
--

CREATE TABLE `transaksi_barang` (
  `id_transaksi` int(5) NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `jumlah_barang` int(5) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `nama_suplier` varchar(20) NOT NULL,
  `nama_customer` varchar(20) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_barang`
--

INSERT INTO `transaksi_barang` (`id_transaksi`, `kode_barang`, `nama_barang`, `jumlah_barang`, `tanggal_masuk`, `tanggal_keluar`, `nama_suplier`, `nama_customer`, `status`) VALUES
(9, '001', 'Paku', 30, '0000-00-00', '2020-02-03', '', 'abc', 'barang_keluar'),
(10, '001', 'Paku', 20, '2020-02-10', '0000-00-00', 'adc', '', 'barang_masuk'),
(12, '123456', 'Kunci', 20, '2020-02-29', '0000-00-00', 'adc', '', 'barang_masuk'),
(13, '$kode_bara', '$nama_barang', 0, '0000-00-00', '0000-00-00', '$nama_suplier', '', 'barang_masuk'),
(14, '003', 'Paku', 20, '2020-02-06', '0000-00-00', 'adc', '', 'barang_masuk');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(5) NOT NULL,
  `nik` int(20) NOT NULL,
  `nama_lengkap` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nik`, `nama_lengkap`, `username`, `password`, `level`) VALUES
(4, 1, 'admin', 'admin', 'admin', 'admin'),
(5, 1234, 'lisnaa', '', '', 'penanggung_jawab'),
(6, 2, 'purchasing', 'purchasing', 'purchasing', 'purchasing'),
(7, 3, 'sales', 'sales', 'sales', 'sales'),
(8, 4, 'manajer', 'manajer', 'manajer', 'manajer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `master_barang`
--
ALTER TABLE `master_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `surat`
--
ALTER TABLE `surat`
  ADD PRIMARY KEY (`id_surat`);

--
-- Indexes for table `transaksi_barang`
--
ALTER TABLE `transaksi_barang`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `master_barang`
--
ALTER TABLE `master_barang`
  MODIFY `id_barang` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `surat`
--
ALTER TABLE `surat`
  MODIFY `id_surat` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `transaksi_barang`
--
ALTER TABLE `transaksi_barang`
  MODIFY `id_transaksi` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
