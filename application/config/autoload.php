<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$autoload['packages'] = array();
$autoload['libraries'] = array('database', 'session');
$autoload['helper'] = array( 'date', 'common', 'url', 'mcrypt' );
$autoload['config'] = array();
$autoload['language'] = array();
$autoload['model'] = array(
	'User_model', 'User_Type_model', 'Page_Static_model', 'Jenis_Unit_model', 'Jenis_Waktu_Kredit_model', 'Jenis_Pembayaran_model', 'Jenis_Leasing_model',
	'Jenis_Warna_model', 'Kendaraan_model', 'Penjualan_model', 'Jenis_Angsuran_model'
);
