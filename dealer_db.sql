-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 11, 2014 at 04:38 PM
-- Server version: 5.1.73-cll
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `suekare1_dealer`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `jenis_leasing`
--

INSERT INTO `jenis_leasing` (`id`, `name`) VALUES
(6, '[WOM] PT WAHANA OTTOMITRA MULTIARTHA TBK'),
(4, '[FIF] PT FEDERAL INTERNATIONAL FINANCE'),
(3, '[ADIRA] PT ADIRA DINAMIKA MULTIFINANCE TBK'),
(7, '[OTO] PT SUMMIT OTO FINANCE'),
(8, '[SAF] PT SASANA ARTHA FINANCE'),
(9, 'CSF');

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
  `warna` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

--
-- Dumping data for table `jenis_unit`
--

INSERT INTO `jenis_unit` (`id`, `name`, `warna`) VALUES
(22, '[NF125TR5 M/T] SUPRA CAST WHELL MMC', ''),
(24, '[NF11T11C03 M/T] REVO CW FI', ''),
(20, '[WW150D(IN) A/T] PCX 150', ''),
(21, '[NF12A1CF2 M/T] SUPRA X 125 HELM IN FI', ''),
(23, '[NF125TD5 M/T] SUPRA X 125 DISK BRAKE', ''),
(25, '[NF11T11C02 M/T] REVO SW FI', ''),
(26, '[NF11T11C01 M/T] REVO FIT FI', ''),
(27, '[NF11C1CD M/T] BLADE S', ''),
(28, '[NF11C1CA M/T] NEW BLADE REPSOL', ''),
(29, '[NF11C1C1 M/T] BLADE R', ''),
(30, '[NF11B2DA12 M/T] REVO SPOKE', ''),
(31, '[NF11B2D12 M/T] REVO FIT', ''),
(32, '[NF11B2C12 M/T] REVO CW', ''),
(33, '[NC12AF2CBI A/T] VARIO TECHNO 125 CBS ISS', ''),
(34, '[NC12A1CF1 A/T] NEW VARIO TECHNO PGM FI', ''),
(35, '[NC12A1CBF A/T] ALL NEW VARIO CBS PGM FI', ''),
(36, '[NC11D1CF1 A/T] SPACY CW HELM IN FI', ''),
(37, '[NC11CF1CS A/T] SCOOPY FI', ''),
(38, '[NC11BF1D A/T] BEAT FI SW', ''),
(39, '[NC11BF1CB A/T] BEAT FI CBS', ''),
(40, '[NC11BF1C A/T] BEAT FI CW', ''),
(41, '[NC110A1C2 A/T] NEW VARIO', ''),
(42, '[GL200RA2 M/T] NEW TIGER SH', ''),
(43, '[GL15C21A07 M/T] MEGAPRO CW FI', ''),
(44, '[GL15B1DF M/T] NEW SPORT LS150 SW', ''),
(45, '[GL15B1CF M/T] NEW SPORT LS150 CW', ''),
(46, '[GL15A1RR1 M/T] MEGAPRO CW MMC', ''),
(47, '[GL15A1D1 M/T] MEGAPRO SW MMC', ''),
(48, '[CBR250RB1(IN) M/T] CBR 250R STD', ''),
(49, '[CBR250RAB1(IN) M/T] CBR 250R ABS', ''),
(50, '[CBR150RE 3IN M/T] CBR 150R', ''),
(51, '[CB15A1RRF1 M/T] CB 150R MMC', ''),
(52, '[CB15A1RRF M/T] CB 150R STREETFIRE', ''),
(53, '[AFX12U21C08 M/T] NEW SUPRA X 125 FI CW', ''),
(54, '[AFX12U21C07 M/T] NEW SUPRA X 125 FI SW', ''),
(55, '[GL15B1CF1 M/T] NEW SPORT LS150 CW', ''),
(56, '[GL15B1DF1 M/T] NEW SPORT LS150 SW', '');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_waktu_kredit`
--

CREATE TABLE IF NOT EXISTS `jenis_waktu_kredit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
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
  `jenis_unit_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=152 ;

--
-- Dumping data for table `jenis_warna`
--

INSERT INTO `jenis_warna` (`id`, `jenis_unit_id`, `name`, `price`) VALUES
(12, 20, '[BK] BLACK', 0),
(13, 20, '[RD] RED', 0),
(14, 21, '[BR] BLACK RED', 0),
(15, 21, '[CH]', 0),
(11, 20, '[WH] WHITE', 0),
(16, 21, '[MH] MERAH HITAM', 0),
(17, 22, '[BB] BLACK BLUE', 0),
(18, 22, '[BG] BLACK GREEN', 0),
(19, 22, '[BR] BLACK RED', 0),
(20, 22, '[BS] BLACK SILVER', 0),
(21, 23, '[BB] BLACK BLUE', 0),
(22, 23, '[BBR]', 0),
(23, 23, '[BR] BLACK RED', 0),
(24, 23, '[BS] BLACK SILVER', 0),
(25, 24, '[BH] BIRU HITAM', 0),
(26, 24, '[BK] BLACK', 0),
(27, 24, '[GH] HIJAU HITAM', 0),
(28, 24, '[MH] MERAH HITAM', 0),
(29, 25, '[BH] BIRU HITAM', 0),
(30, 25, '[BK] BLACK', 0),
(31, 25, '[GH] HIJAU HITAM', 0),
(32, 25, '[MH] MERAH HITAM', 0),
(33, 26, '[BB] BLACK BLUE', 0),
(34, 26, '[BG] BLACK GREEN', 0),
(35, 26, '[BR] BLACK RED', 0),
(36, 27, '[HM] HITAM MERAH', 0),
(37, 27, '[HV] HITAM VIOLET', 0),
(38, 27, '[PM] PUTIH MERAH', 0),
(39, 28, '[OH] ORANGE HITAM', 0),
(40, 29, '[HM] HITAM MERAH', 0),
(41, 29, '[PM] PUTIH MERAH', 0),
(42, 30, '[BK] BLACK', 13480000),
(43, 30, '[HB] HITAM BIRU', 13480000),
(44, 30, '[HH] HITAM-HIJAU', 13480000),
(45, 30, '[HM] HITAM MERAH', 13480000),
(46, 31, '[BB] BLACK BLUE', 12930000),
(47, 31, '[BG] BLACK GREEN', 12930000),
(48, 31, '[BR] BLACK RED', 12930000),
(49, 32, '[BK] BLACK', 14180000),
(50, 32, '[HB] HITAM BIRU', 14180000),
(51, 32, '[HH] HITAM-HIJAU', 14180000),
(52, 32, '[HM] HITAM MERAH', 14180000),
(53, 33, '[BK] BLACK', 17710000),
(54, 33, '[BL] BLUE', 17710000),
(55, 33, '[RD] RED', 17710000),
(56, 33, '[WS] WHITE SILVER', 17710000),
(57, 34, '[BK] BLACK', 16840000),
(58, 34, '[RD] RED', 16840000),
(59, 34, '[WL] WHITE BLUE', 16840000),
(60, 34, '[WR] WHITE RED', 16840000),
(61, 34, '[WS] WHITE SILVER', 16840000),
(62, 35, '[BK] BLACK', 0),
(63, 35, '[RD] RED', 0),
(64, 35, '[VO] VIOLET', 0),
(65, 35, '[WH] WHITE', 0),
(66, 36, '[BH] BIRU HITAM', 14550000),
(67, 36, '[BK] BLACK', 14550000),
(68, 36, '[BR] BLACK RED', 14550000),
(69, 36, '[MH] MERAH HITAM', 14550000),
(70, 36, '[PH] PUTIH HITAM', 14550000),
(71, 37, '[BC] BIRU KREM', 15630000),
(72, 37, '[HW] HITAM-BEIGE', 15630000),
(73, 37, '[KC] KREM-COKLAT', 15630000),
(74, 37, '[MK] MERAH-KREM', 15630000),
(75, 37, '[BC] BIRU KREM', 15630000),
(76, 37, '[HM] HITAM MERAH', 15630000),
(77, 37, '[KR] KREM-MERAH', 15630000),
(78, 38, '[BK] BLACK', 13880000),
(79, 38, '[RD] RED', 13880000),
(80, 38, '[WH] WHITE', 13880000),
(81, 39, '[BH] BIRU HITAM', 15110000),
(82, 39, '[BK] BLACK', 15110000),
(83, 39, '[OB] ORANGE BIRU', 15110000),
(84, 39, '[RD] RED', 15110000),
(85, 39, '[WH] WHITE', 15110000),
(86, 40, '[BK] BLACK', 14680000),
(87, 40, '[BP] BIRU PUTIH', 14680000),
(88, 40, '[HT] HIJAU PUTIH', 14680000),
(89, 40, '[OB] ORANGE BIRU', 14680000),
(90, 40, '[RD] RED', 14680000),
(91, 40, '[WH] WHITE', 14680000),
(92, 41, '[BK] BLACK', 16040000),
(93, 41, '[BP] BIRU PUTIH', 16040000),
(94, 41, '[MH] MERAH HITAM', 16040000),
(95, 41, '[PH] PUTIH HITAM', 16040000),
(96, 42, '[BK] BLACK', 26930000),
(97, 42, '[RD] RED', 26930000),
(98, 42, '[VO] VIOLET', 26930000),
(99, 42, '[WH] WHITE', 26930000),
(100, 43, '[BH] BIRU HITAM', 21760000),
(101, 43, '[BK] BLACK', 21760000),
(102, 43, '[MH] MERAH HITAM', 21760000),
(103, 43, '[PH] PUTIH HITAM', 21760000),
(104, 44, '[BK] BLACK', 17990000),
(105, 44, '[BL] BLUE', 17990000),
(106, 44, '[GR] GREY', 17990000),
(107, 44, '[RD] RED', 17990000),
(108, 56, '[BK] BLACK', 17990000),
(109, 56, '[RD] RED', 17990000),
(110, 56, '[WH] WHITE', 17990000),
(111, 45, '[BK] BLACK', 18840000),
(112, 45, '[BL] BLUE', 18840000),
(113, 45, '[GR] GREY', 18840000),
(114, 45, '[RD] RED', 18840000),
(115, 55, '[BK] BLACK', 18840000),
(116, 55, '[RD] RED', 18840000),
(117, 55, '[SV] SILVER', 18840000),
(118, 55, '[WH] WHITE', 18840000),
(119, 46, '[BH] BIRU HITAM', 21330000),
(120, 46, '[BK] BLACK', 21330000),
(121, 46, '[MH] MERAH HITAM', 21330000),
(122, 46, '[PH] PUTIH HITAM', 21330000),
(123, 46, '[BK] BLACK', 21330000),
(124, 47, '[MH] MERAH HITAM', 20230000),
(125, 47, '[BK] BLACK', 20230000),
(126, 48, '[RD] RED', 50580000),
(127, 48, '[WH] WHITE', 50580000),
(128, 48, '[OH] ORANGE HITAM', 50580000),
(129, 49, '[BK] BLACK', 58560000),
(130, 49, '[OH] ORANGE HITAM', 58560000),
(131, 50, '[OH] ORANGE HITAM', 43580000),
(132, 50, '[OP] ORANGE PUTIH', 43580000),
(133, 50, '[PM] PUTIH MERAH', 43580000),
(134, 50, '[BK] BLACK', 43580000),
(135, 50, '[RD] RED', 43580000),
(136, 51, '[BK] BLACK', 24310000),
(137, 51, '[PM] PUTIH MERAH', 24310000),
(138, 51, '[RD] RED', 24310000),
(139, 51, '[WL] WHITE BLUE', 24310000),
(140, 51, '[WR] WHITE RED', 24310000),
(141, 52, '[BK] BLACK', 24310000),
(142, 52, '[RD] RED', 24310000),
(143, 52, '[WL] WHITE BLUE', 24310000),
(144, 52, '[WR] WHITE RED', 24310000),
(145, 53, '[BH] BIRU HITAM', 17500000),
(146, 53, '[BK] BLACK', 17500000),
(147, 53, '[MH] MERAH HITAM', 17500000),
(148, 53, '[PH] PUTIH HITAM', 17500000),
(149, 54, '[BH] BIRU HITAM', 16440000),
(150, 54, '[BK] BLACK', 16440000),
(151, 54, '[MH] MERAH HITAM', 16440000);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`id`, `penjualan_id`, `jenis_unit_id`, `jenis_warna_id`, `stock_date`, `stock_update`, `stock_total`) VALUES
(1, 0, 40, 89, '2014-04-04', 18, 18),
(2, 0, 40, 91, '2014-04-06', 19, 19),
(3, 0, 40, 90, '2014-04-06', 13, 13),
(4, 0, 40, 86, '2014-04-06', 2, 2),
(5, 0, 40, 88, '2014-04-06', 17, 17),
(6, 0, 40, 87, '2014-04-06', 9, 9),
(7, 0, 39, 84, '2014-04-06', 5, 5),
(8, 0, 39, 82, '2014-04-06', 2, 2),
(9, 0, 39, 81, '2014-04-06', 2, 2),
(10, 0, 39, 83, '2014-04-06', 1, 1),
(11, 0, 39, 85, '2014-04-06', 1, 1),
(12, 0, 53, 146, '2014-04-06', 1, 1),
(13, 0, 53, 147, '2014-04-06', 3, 3),
(14, 0, 53, 148, '2014-04-06', 1, 1),
(15, 0, 54, 151, '2014-04-06', 1, 1),
(16, 0, 21, 16, '2014-04-06', 2, 2),
(17, 0, 53, 145, '2014-04-06', 1, 1),
(18, 0, 54, 149, '2014-04-06', 1, 1),
(19, 0, 26, 33, '2014-04-06', 1, 1),
(20, 0, 26, 34, '2014-04-06', 1, 1),
(21, 0, 26, 35, '2014-04-06', 1, 1),
(22, 0, 25, 32, '2014-04-06', 4, 4),
(23, 0, 25, 32, '2014-04-06', 4, 8),
(24, 0, 24, 26, '2014-04-06', 1, 1),
(25, 0, 43, 100, '2014-04-06', 1, 1),
(26, 0, 52, 142, '2014-04-06', 7, 7),
(27, 0, 51, 140, '2014-04-06', 8, 8),
(28, 0, 51, 139, '2014-04-06', 3, 3),
(29, 0, 51, 136, '2014-04-06', 3, 3),
(30, 0, 22, 19, '2014-04-06', 3, 3),
(31, 1, 40, 87, '2014-04-08', -1, 8),
(32, 2, 40, 86, '2014-04-09', -1, 1);

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
  `address_delivery` longtext NOT NULL,
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
  `noka_nosin` varchar(50) NOT NULL,
  `delivery_date` date NOT NULL,
  `delivery_man` varchar(255) NOT NULL,
  `ktp_file` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `sales_id`, `admin_id`, `user_delivery_id`, `jenis_unit_id`, `jenis_warna_id`, `jenis_leasing_id`, `jenis_angsuran_id`, `jenis_pembayaran_id`, `status_penjualan_id`, `order_date`, `name`, `nik`, `phone`, `birth_date`, `birth_place`, `address`, `address_delivery`, `price_otr`, `price_angsuran`, `discount`, `dp_customer`, `dp_gross`, `sub`, `is_deliver`, `with_ktp`, `with_gesek`, `with_bast`, `noka_nosin`, `delivery_date`, `delivery_man`, `ktp_file`) VALUES
(1, 45, 42, 40, 40, 87, 6, 3, 2, 2, '2014-04-08', 'jito', '3507050408660002', '087859634349', '1966-08-04', 'blitar', 'dsn umbulrejo rt 03 / rw 13 pamotan dampit', 'dsn umbulrejo rt 03 / rw 13 pamotan dampit', 14680000, 485000, 0, 2500000, 3800000, 1300000, 1, 1, 1, 1, 'MHIJFD235EK274866 / JFD2E 3274579', '2014-04-08', 'YUDI', '2014/04/08/20140408_135434_4905.jpg'),
(2, 47, 40, 40, 40, 86, 4, 3, 2, 2, '2014-04-09', 'ninik mashuda ', '3507104705780004', '03419582444', '1978-05-07', 'malang', 'Gondanglegikulon rt20 rw02 gondanglegi ', 'Gondanglegi kulon rt20 rw02 gondanglegi ', 14680000, 500000, 0, 1100000, 3300000, 2200000, 1, 1, 1, 1, '', '0000-00-00', '', ''),
(4, 47, 0, 0, 51, 140, 8, 3, 2, 1, '2014-04-11', 'ali muksin', '3507100101790071', '081556468546', '1979-01-01', 'malang', 'jl. trunojoyo 043 /004 gondanglegi kulon gondanglegi', 'jl. trunojoyo 043 /004 gondanglegi kulon gondanglegi', 24310000, 820000, 0, 3000000, 4900000, 1900000, 0, 1, 0, 0, '', '0000-00-00', '', '2014/04/11/20140411_135741_7191.jpg'),
(5, 46, 0, 0, 40, 90, 6, 3, 2, 1, '2014-04-11', 'RISYAM AGUS CHARIS M', '', '089682067460', '1993-08-04', 'MALANG', 'POHBENER RT 30/5 GONDOWANGI WAGIR', 'POHBENER RT 30/5 GONDOWANGI WAGIR', 14680000, 520, 0, 1200, 3000, 1800, 0, 0, 0, 0, '', '0000-00-00', '', ''),
(6, 47, 0, 0, 40, 86, 7, 3, 2, 1, '2014-04-11', 'susilowati', '3507214110730002', '085790915423', '1973-10-01', 'malang', 'Tenggulunan rt09 rw03 mendalan wagir ', 'Tenggulunan rt09 rw03 mendalan wagir', 14680000, 500000, 0, 1100000, 3500000, 2400000, 0, 0, 0, 0, '', '0000-00-00', '', ''),
(7, 47, 0, 0, 40, 91, 4, 3, 2, 1, '2014-04-11', 'handoko ', '3507182507920007', '087859873201', '1992-07-25', 'malang ', 'Dami rt8 rw03 ampeldento pakis ', 'Dami rt08 rw03 apeldento pakis ', 14680000, 500000, 0, 1100000, 3300000, 2200000, 0, 0, 0, 0, '', '0000-00-00', '', ''),
(8, 47, 0, 0, 35, 65, 6, 3, 2, 1, '2014-04-11', 'kristiawan eko susilo', '3753052512850003', '081233999185', '1985-12-25', 'malang', 'jl.bunga kecilung no 2\nrt / rw 004/009\njatimulyo lowokwaru', 'jl.bunga kecilung no 2\nrt / rw 004/009\njatimulyo lowokwaru ( RO )', 17040000, 462000, 0, 5000000, 6800000, 1800000, 0, 1, 0, 0, '', '0000-00-00', '', '2014/04/11/20140411_141541_4551.png');

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
  `koordinator_id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fullname` varchar(100) NOT NULL,
  `passwd` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `register_date` datetime NOT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_type_id`, `koordinator_id`, `email`, `fullname`, `passwd`, `address`, `thumbnail`, `register_date`, `is_active`) VALUES
(2, 1, 0, 'her0satr@yahoo.com', 'Herry', 'fe30fa79056939db8cbe99c8d601de74', '-', '2014/01/20/20140120_201420_7917.jpg', '2013-10-17 03:17:56', 1),
(4, 1, 0, 'edsiant@yahoo.co.id', 'Eddy S', '5f7d3c05dab6c728d2d2581e35b2b9e1', 'selorejo', '2014/01/11/20140111_125918_3661.jpg', '2013-12-17 06:02:58', 1),
(7, 1, 0, 'daniel.resjanto@gmail.com', 'DANIEL UTAMA RESJANTO', '', 'MALANG', '', '2013-12-24 11:37:31', 1),
(40, 1, 0, 'adminmlg@panjimotor.com', 'Admin Malang', 'b4889d3254d08f2b3fc1566fa365d266', '', '2014/04/06/20140406_145132_5720.png', '2014-04-06 14:51:43', 1),
(41, 1, 0, 'admindmp@panjimotor.com', 'Admin Dampit', 'b4889d3254d08f2b3fc1566fa365d266', '', '2014/04/06/20140406_145522_9632.png', '2014-04-06 14:53:35', 1),
(11, 1, 0, 'ervinsuryanda@yahoo.com', 'ervin suryanda', 'f41baca48671ca308a1f79a65a296f56', 'jl.pisang candi barat 104 malang', '', '2014-01-30 12:24:20', 1),
(42, 1, 0, 'irwan@panjimotor.com', 'IRWAN SISWANTO', 'b4889d3254d08f2b3fc1566fa365d266', '', '2014/04/08/20140408_130811_9418.png', '2014-04-08 13:08:14', 1),
(43, 1, 0, 'alif@panjimotor.com', 'ALIF SHOHIFAH NADIA', '11b92f4ded7e9987af78c5ddd4e835f6', '', '2014/04/08/20140408_131217_4346.png', '2014-04-08 13:12:17', 1),
(44, 2, 48, 'cahyo.dmp@panjimotor.com', 'CAHYO WIDODO', 'b4889d3254d08f2b3fc1566fa365d266', '', '2014/04/08/20140408_131657_3935.png', '2014-04-08 13:17:05', 1),
(45, 2, 48, 'eko.dmp@panjimotor.com', 'EKO CAHYONO', 'b4889d3254d08f2b3fc1566fa365d266', '', '2014/04/08/20140408_132103_8585.png', '2014-04-08 13:21:05', 1),
(46, 2, 48, 'tomi.mlg@panjimotor.com', 'TOMI PUSPO SUSILO UTOMO', 'b4889d3254d08f2b3fc1566fa365d266', '', '2014/04/08/20140408_132423_8334.png', '2014-04-08 13:25:51', 1),
(47, 2, 48, 'maxsdwy@gmail.com', 'ROCHIM', 'b4889d3254d08f2b3fc1566fa365d266', '', '2014/04/09/20140409_145032_9742.png', '2014-04-09 14:50:36', 1),
(48, 2, 0, 'irwan2@panjimotor.com', 'Irwan', 'b4889d3254d08f2b3fc1566fa365d266', 'Dampit, Malang', '2014/04/11/20140411_104359_5426.png', '2014-04-11 10:44:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE IF NOT EXISTS `user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `name`) VALUES
(1, 'Administrator'),
(2, 'Sales'),
(3, 'Delivery'),
(4, 'Penagihan');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
