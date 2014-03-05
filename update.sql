2013-12-24 :
- CREATE TABLE  `dealer_db`.`jenis_angsuran` ( `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY , `name` VARCHAR( 255 ) NOT NULL ) ENGINE = MYISAM ;
- ALTER TABLE  `penjualan` ADD  `admin_id` INT NOT NULL AFTER  `sales_id`

2014-01-02 :
- ALTER TABLE `penjualan` ADD `birth_place` VARCHAR( 255 ) NOT NULL AFTER `birth_date` ;
- ALTER TABLE `penjualan` ADD `address` LONGTEXT NOT NULL AFTER `birth_place` ;
- ALTER TABLE `penjualan` ADD `price_otr` INT NOT NULL AFTER `address` ;
- ALTER TABLE `penjualan` ADD `price_angsuran` INT NOT NULL AFTER `price_otr` ;
- ALTER TABLE `penjualan` ADD `with_ktp` INT NOT NULL , ADD `with_gesek` INT NOT NULL , ADD `with_bast` INT NOT NULL ;
- CREATE TABLE IF NOT EXISTS `invoice` ( `id` int(11) NOT NULL AUTO_INCREMENT, `penjualan_id` int(11) NOT NULL, `no` varchar(5) NOT NULL, `rupiah_angka` int(11) NOT NULL, `rupiah_text` longtext NOT NULL, `pengantar` varchar(255) NOT NULL, `penerima` int(11) NOT NULL, `date_print` date NOT NULL, PRIMARY KEY (`id`) ) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

- ALTER TABLE `invoice` ADD `content` LONGTEXT NOT NULL AFTER `penerima`
- CREATE TABLE IF NOT EXISTS `event` ( `id` int(11) NOT NULL AUTO_INCREMENT, `name` varchar(255) NOT NULL, `content` longtext NOT NULL, `thumbnail` varchar(255) NOT NULL, PRIMARY KEY (`id`) ) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
- CREATE TABLE IF NOT EXISTS `schedule` ( `id` int(11) NOT NULL AUTO_INCREMENT, `name` varchar(255) NOT NULL, `location` varchar(255) NOT NULL, `schedule_time` datetime NOT NULL, PRIMARY KEY (`id`) ) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

2013-01-20 :
- ALTER TABLE  `penjualan` ADD  `noka_nosin` VARCHAR( 50 ) NOT NULL,  ADD  `delivery_date` DATE NOT NULL, ADD  `delivery_man` VARCHAR( 255 ) NOT NULL

2014-02-05 :
- ALTER TABLE `user` ADD `koordinator_id` INT NOT NULL AFTER `user_type_id` ;
- ALTER TABLE `penjualan` ADD `ktp_file` VARCHAR( 150 ) NOT NULL AFTER `delivery_man` ;

2014-03-05 :
- ALTER TABLE `jenis_warna` ADD `jenis_unit_id` INT NOT NULL AFTER `id` ;
