2013-12-24 :
- CREATE TABLE  `dealer_db`.`jenis_angsuran` ( `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY , `name` VARCHAR( 255 ) NOT NULL ) ENGINE = MYISAM ;
- ALTER TABLE  `penjualan` ADD  `admin_id` INT NOT NULL AFTER  `sales_id`