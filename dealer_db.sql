-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2014 at 10:18 AM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dealer_db`
--
CREATE DATABASE IF NOT EXISTS `dealer_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dealer_db`;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `name`, `content`, `thumbnail`) VALUES
(2, 'Event No 4', 'Keterangan No 4', '2014/01/03/20140103_091320_8584.png'),
(3, 'Event No 3', 'Keterangan No 3', '2014/01/03/20140103_091331_2588.png'),
(4, 'Event No 2', 'Keterangan No 2', '2014/01/03/20140103_095419_8451.png'),
(5, 'Event No 1', 'Keterangan No 1', '2014/01/03/20140103_095434_2579.png');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `penjualan_id` int(11) NOT NULL,
  `no` varchar(5) NOT NULL,
  `rupiah_angka` int(11) NOT NULL,
  `rupiah_text` longtext NOT NULL,
  `pengantar` varchar(255) NOT NULL,
  `penerima` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `date_print` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `penjualan_id`, `no`, `rupiah_angka`, `rupiah_text`, `pengantar`, `penerima`, `content`, `date_print`) VALUES
(2, 11, '00001', 250000, 'Dua Ratus Ribu Rupiah 2', 'Saya', 2, '', '2014-01-02'),
(3, 0, '00002', 300000, 'Tiga Ratus Ribu Rupiah', 'Orangnya', 2, '125487', '2014-01-02');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_angsuran`
--

CREATE TABLE IF NOT EXISTS `jenis_angsuran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `jenis_angsuran`
--

INSERT INTO `jenis_angsuran` (`id`, `name`) VALUES
(1, '12 Bulan'),
(2, '24 Bulan'),
(3, '36 Bulan');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_leasing`
--

CREATE TABLE IF NOT EXISTS `jenis_leasing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `jenis_leasing`
--

INSERT INTO `jenis_leasing` (`id`, `name`) VALUES
(6, 'WOW'),
(4, 'FIF'),
(3, 'ADIRA');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_pembayaran`
--

CREATE TABLE IF NOT EXISTS `jenis_pembayaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jenis_pembayaran`
--

INSERT INTO `jenis_pembayaran` (`id`, `name`) VALUES
(1, 'Tunai'),
(2, 'Kredit');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_unit`
--

CREATE TABLE IF NOT EXISTS `jenis_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `jenis_unit`
--

INSERT INTO `jenis_unit` (`id`, `name`) VALUES
(13, 'Blade'),
(9, 'Vario'),
(8, 'Revo'),
(12, 'Scoopy'),
(10, 'Beat');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_waktu_kredit`
--

CREATE TABLE IF NOT EXISTS `jenis_waktu_kredit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `jenis_waktu_kredit`
--

INSERT INTO `jenis_waktu_kredit` (`id`, `name`) VALUES
(2, '3 Bulan'),
(3, '6 Bulan'),
(4, '1 Tahun'),
(5, '2 Tahun'),
(6, '3 Tahun');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_warna`
--

CREATE TABLE IF NOT EXISTS `jenis_warna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `jenis_warna`
--

INSERT INTO `jenis_warna` (`id`, `name`) VALUES
(1, 'Hitam'),
(2, 'Biru Tua'),
(3, 'Orange'),
(4, 'Putih Hitam');

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE IF NOT EXISTS `kendaraan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `penjualan_id` int(11) NOT NULL,
  `jenis_unit_id` int(11) NOT NULL,
  `jenis_warna_id` int(11) NOT NULL,
  `stock_date` date NOT NULL,
  `stock_update` int(11) NOT NULL,
  `stock_total` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`id`, `penjualan_id`, `jenis_unit_id`, `jenis_warna_id`, `stock_date`, `stock_update`, `stock_total`) VALUES
(1, 0, 13, 2, '2013-12-24', 5, 5),
(9, 0, 13, 2, '2013-12-24', -1, 3),
(8, 0, 13, 2, '2013-12-24', -1, 4),
(10, 0, 13, 2, '2013-12-24', -1, 2),
(11, 0, 13, 2, '2013-12-25', -1, 1),
(12, 0, 13, 2, '2013-12-25', -1, 0),
(13, 0, 13, 2, '2013-12-25', 2, 2),
(14, 8, 13, 2, '2013-12-25', -1, 1),
(15, 9, 13, 2, '2013-12-25', -1, 0),
(16, 0, 13, 2, '2013-12-25', 5, 5),
(17, 10, 13, 2, '2013-12-25', -1, 4),
(18, 11, 13, 2, '2013-12-26', -1, 3),
(19, 12, 13, 2, '2014-01-02', -1, 2),
(20, 0, 12, 2, '2014-01-03', 5, 5),
(21, 13, 12, 2, '2014-01-03', -1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `page_static`
--

CREATE TABLE IF NOT EXISTS `page_static` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `desc` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `page_static`
--

INSERT INTO `page_static` (`id`, `name`, `alias`, `desc`) VALUES
(16, '1', '1', '3');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE IF NOT EXISTS `penjualan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `user_delivery_id` int(11) NOT NULL,
  `jenis_unit_id` int(11) NOT NULL,
  `jenis_warna_id` int(11) NOT NULL,
  `jenis_leasing_id` int(11) NOT NULL,
  `jenis_angsuran_id` int(11) NOT NULL,
  `jenis_pembayaran_id` int(11) NOT NULL,
  `status_penjualan_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `name` varchar(255) NOT NULL,
  `nik` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `birth_date` date NOT NULL,
  `birth_place` varchar(255) NOT NULL,
  `address` longtext NOT NULL,
  `price_otr` int(11) NOT NULL,
  `price_angsuran` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `dp_customer` int(11) NOT NULL,
  `dp_gross` int(11) NOT NULL,
  `sub` int(11) NOT NULL,
  `is_deliver` int(11) NOT NULL,
  `with_ktp` int(11) NOT NULL,
  `with_gesek` int(11) NOT NULL,
  `with_bast` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `sales_id`, `admin_id`, `user_delivery_id`, `jenis_unit_id`, `jenis_warna_id`, `jenis_leasing_id`, `jenis_angsuran_id`, `jenis_pembayaran_id`, `status_penjualan_id`, `order_date`, `name`, `nik`, `phone`, `birth_date`, `birth_place`, `address`, `price_otr`, `price_angsuran`, `discount`, `dp_customer`, `dp_gross`, `sub`, `is_deliver`, `with_ktp`, `with_gesek`, `with_bast`) VALUES
(2, 2, 2, 2, 13, 2, 4, 1, 2, 2, '2013-12-24', 'Pembeli No 1', 'NIK temp', '0341', '2013-12-15', '', '', 0, 0, 0, 1000000, 100000, 0, 1, 0, 0, 0),
(3, 2, 2, 0, 13, 2, 4, 1, 2, 3, '2013-12-25', 'Pembeli No 1', 'NIK temp', '0341', '2013-12-15', '', '', 0, 0, 0, 1000000, 100000, 0, 0, 0, 0, 0),
(4, 2, 2, 0, 13, 2, 4, 1, 2, 3, '2013-12-25', 'Pembeli No 1', 'NIK temp', '0341', '2013-12-15', '', '', 0, 0, 0, 1000000, 100000, 0, 0, 0, 0, 0),
(5, 2, 2, 2, 13, 2, 4, 1, 2, 2, '2013-12-25', 'Pembeli No 1', 'NIK temp', '0341', '2013-12-15', '', '', 0, 0, 0, 1000000, 100000, 0, 1, 0, 0, 0),
(6, 2, 2, 2, 13, 2, 4, 1, 2, 2, '2013-12-25', 'Pembeli No 1', 'NIK temp', '0341', '2013-12-15', '', '', 0, 0, 0, 1000000, 100000, 0, 1, 0, 0, 0),
(7, 2, 2, 0, 13, 2, 4, 1, 2, 3, '2013-12-25', 'Pembeli No 1', 'NIK temp', '0341', '2013-12-15', '', '', 0, 0, 0, 1000000, 100000, 0, 0, 0, 0, 0),
(8, 2, 2, 2, 13, 2, 4, 1, 2, 2, '2013-12-25', 'Pembeli No 1', 'NIK temp', '0341', '2013-12-15', '', '', 0, 0, 0, 1000000, 100000, 0, 1, 0, 0, 0),
(9, 2, 2, 2, 13, 2, 4, 1, 2, 2, '2013-12-25', 'Pembeli No 1', 'NIK temp', '0341', '2013-12-15', '', '', 0, 0, 0, 1000000, 100000, 0, 1, 0, 0, 0),
(10, 2, 2, 2, 13, 2, 4, 1, 2, 2, '2013-12-25', 'Pembeli No 1', 'NIK temp', '0341', '2013-12-15', '', '', 0, 0, 0, 1000000, 100000, 0, 1, 0, 0, 0),
(11, 2, 2, 2, 13, 2, 4, 0, 1, 2, '2013-12-26', 'Pembeli No 12', 'NIK temp', '0341', '2013-12-15', '', '', 0, 0, 0, 1000000, 100000, 0, 1, 0, 0, 0),
(12, 2, 2, 0, 13, 2, 0, 0, 1, 2, '2014-01-02', 'Sales 1', '-', '0341', '2014-01-02', 'Malang', '-', 0, 0, 0, 0, 0, 0, 0, 1, 1, 1),
(13, 2, 2, 2, 12, 2, 0, 0, 1, 2, '2014-01-03', 'Namanya', '01258', '-', '2014-01-03', 'Malang', '-', 0, 0, 0, 0, 0, 0, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE IF NOT EXISTS `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `schedule_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `name`, `location`, `schedule_time`) VALUES
(4, 'Meeting Mingguan', 'Bengkel', '2014-01-15 11:00:00'),
(5, 'Meeting Bulanan', 'Bengkel', '2014-01-31 10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `status_penjualan`
--

CREATE TABLE IF NOT EXISTS `status_penjualan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `status_penjualan`
--

INSERT INTO `status_penjualan` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Diterima'),
(3, 'Ditolak');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fullname` varchar(100) NOT NULL,
  `passwd` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `register_date` datetime NOT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_type_id`, `email`, `fullname`, `passwd`, `address`, `thumbnail`, `register_date`, `is_active`) VALUES
(2, 1, 'her0satr@yahoo.com', 'Herry', 'fe30fa79056939db8cbe99c8d601de74', '-', '2013/12/26/20131226_103710_8567.png', '2013-10-17 03:17:56', 1),
(4, 1, 'mail@mail.com', '12345', '', '3', '', '2013-12-17 06:02:58', 1),
(6, 1, 'suekarea@yahoo.com', 'suekarea', '1621a5dc746d5d19665ed742b2ef9736', '-', '', '2013-12-19 18:59:27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE IF NOT EXISTS `user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `name`) VALUES
(1, 'Administrator'),
(2, 'Sales'),
(3, 'Delivery');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
