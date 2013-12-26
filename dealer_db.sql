-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 26, 2013 at 10:42 AM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dealer_db`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

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
(18, 11, 13, 2, '2013-12-26', -1, 3);

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
  `discount` int(11) NOT NULL,
  `dp_customer` int(11) NOT NULL,
  `dp_gross` int(11) NOT NULL,
  `sub` int(11) NOT NULL,
  `is_deliver` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `sales_id`, `admin_id`, `user_delivery_id`, `jenis_unit_id`, `jenis_warna_id`, `jenis_leasing_id`, `jenis_angsuran_id`, `jenis_pembayaran_id`, `status_penjualan_id`, `order_date`, `name`, `nik`, `phone`, `birth_date`, `discount`, `dp_customer`, `dp_gross`, `sub`, `is_deliver`) VALUES
(2, 2, 2, 2, 13, 2, 4, 1, 2, 2, '2013-12-24', 'Pembeli No 1', 'NIK temp', '0341', '2013-12-15', 0, 1000000, 100000, 0, 1),
(3, 2, 2, 0, 13, 2, 4, 1, 2, 3, '2013-12-25', 'Pembeli No 1', 'NIK temp', '0341', '2013-12-15', 0, 1000000, 100000, 0, 0),
(4, 2, 2, 0, 13, 2, 4, 1, 2, 3, '2013-12-25', 'Pembeli No 1', 'NIK temp', '0341', '2013-12-15', 0, 1000000, 100000, 0, 0),
(5, 2, 2, 2, 13, 2, 4, 1, 2, 2, '2013-12-25', 'Pembeli No 1', 'NIK temp', '0341', '2013-12-15', 0, 1000000, 100000, 0, 1),
(6, 2, 2, 2, 13, 2, 4, 1, 2, 2, '2013-12-25', 'Pembeli No 1', 'NIK temp', '0341', '2013-12-15', 0, 1000000, 100000, 0, 1),
(7, 2, 2, 0, 13, 2, 4, 1, 2, 3, '2013-12-25', 'Pembeli No 1', 'NIK temp', '0341', '2013-12-15', 0, 1000000, 100000, 0, 0),
(8, 2, 2, 2, 13, 2, 4, 1, 2, 2, '2013-12-25', 'Pembeli No 1', 'NIK temp', '0341', '2013-12-15', 0, 1000000, 100000, 0, 1),
(9, 2, 2, 2, 13, 2, 4, 1, 2, 2, '2013-12-25', 'Pembeli No 1', 'NIK temp', '0341', '2013-12-15', 0, 1000000, 100000, 0, 1),
(10, 2, 2, 2, 13, 2, 4, 1, 2, 2, '2013-12-25', 'Pembeli No 1', 'NIK temp', '0341', '2013-12-15', 0, 1000000, 100000, 0, 1),
(11, 2, 2, 2, 13, 2, 4, 0, 1, 2, '2013-12-26', 'Pembeli No 1', 'NIK temp', '0341', '2013-12-15', 0, 1000000, 100000, 0, 1);

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
