<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Kendaraan_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array( 'id', 'penjualan_id', 'jenis_unit_id', 'jenis_warna_id', 'stock_date', 'stock_update', 'stock_total' );
    }

    function update($param) {
        $result = array();
       
        if (empty($param['id'])) {
            $insert_query  = GenerateInsertQuery($this->field, $param, KENDARAAN);
            $insert_result = mysql_query($insert_query) or die(mysql_error());
           
            $result['id'] = mysql_insert_id();
            $result['status'] = '1';
            $result['message'] = 'Data berhasil disimpan.';
        } else {
            $update_query  = GenerateUpdateQuery($this->field, $param, KENDARAAN);
            $update_result = mysql_query($update_query) or die(mysql_error());
           
            $result['id'] = $param['id'];
            $result['status'] = '1';
            $result['message'] = 'Data berhasil diperbaharui.';
        }
       
        return $result;
    }
	
	function update_total($param) {
		$record_last = $this->get_last($param);
		
		$param_update = $param;
		$param_update['stock_total'] = $record_last['stock_total'] + $param['stock_update'];
		$result = $this->update($param_update);
		
		return $result;
	}
	
    function get_by_id($param) {
        $array = array();
       
        if (isset($param['id'])) {
            $select_query  = "SELECT * FROM ".KENDARAAN." WHERE id = '".$param['id']."' LIMIT 1";
        } 
		
        $select_result = mysql_query($select_query) or die(mysql_error());
        if (false !== $row = mysql_fetch_assoc($select_result)) {
            $array = $this->sync($row);
        }
       
        return $array;
    }
	
    function get_array($param = array()) {
        $array = array();
		
		$param['field_replace']['jenis_unit_name'] = 'JenisUnit.name';
		$param['field_replace']['jenis_warna_name'] = 'JenisWarna.name';
		
		$string_filter = GetStringFilter($param, @$param['column']);
		$string_sorting = GetStringSorting($param, @$param['column'], 'stock_date DESC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS Kendaraan.*,
				JenisUnit.name jenis_unit_name, JenisWarna.name jenis_warna_name
			FROM ".KENDARAAN." Kendaraan
			LEFT JOIN ".JENIS_WARNA." JenisWarna ON JenisWarna.id = Kendaraan.jenis_warna_id
			LEFT JOIN ".JENIS_UNIT." JenisUnit ON JenisUnit.id = Kendaraan.jenis_unit_id
			WHERE 1 $string_filter
			ORDER BY $string_sorting
			LIMIT $string_limit
		";
		
        $select_result = mysql_query($select_query) or die(mysql_error());
		while ( $row = mysql_fetch_assoc( $select_result ) ) {
			$array[] = $this->sync($row, $param);
		}
		
        return $array;
    }

    function get_count($param = array()) {
		$select_query = "SELECT FOUND_ROWS() TotalRecord";
		$select_result = mysql_query($select_query) or die(mysql_error());
		$row = mysql_fetch_assoc($select_result);
		$TotalRecord = $row['TotalRecord'];
		
		return $TotalRecord;
    }
	
	function get_last($param) {
        $array = array( 'stock_total' => 0 );
		$select_query  = "
			SELECT Kendaraan.*
			FROM ".KENDARAAN." Kendaraan
			WHERE jenis_unit_id = '".$param['jenis_unit_id']."' AND jenis_warna_id = '".$param['jenis_warna_id']."'
			ORDER BY stock_date DESC
			LIMIT 1
		";
        $select_result = mysql_query($select_query) or die(mysql_error());
        if (false !== $row = mysql_fetch_assoc($select_result)) {
            $array = $row;
        }
		
        return $array;
	}
	
    function delete($param) {
		$delete_query  = "DELETE FROM ".KENDARAAN." WHERE id = '".$param['id']."' LIMIT 1";
		$delete_result = mysql_query($delete_query) or die(mysql_error());
		
		$result['status'] = '1';
		$result['message'] = 'Data berhasil dihapus.';

        return $result;
    }
	
	function sync($row, $param = array()) {
		$row = StripArray($row, array( 'stock_date' ));
		
		if (count(@$param['column']) > 0) {
			$row = dt_view_set($row, $param);
		}
		
		return $row;
	}
}