<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Jenis_Warna_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array( 'id', 'jenis_unit_id', 'name', 'price' );
    }

    function update($param) {
        $result = array();
       
        if (empty($param['id'])) {
            $insert_query  = GenerateInsertQuery($this->field, $param, JENIS_WARNA);
            $insert_result = mysql_query($insert_query) or die(mysql_error());
           
            $result['id'] = mysql_insert_id();
            $result['status'] = '1';
            $result['message'] = 'Data berhasil disimpan.';
        } else {
            $update_query  = GenerateUpdateQuery($this->field, $param, JENIS_WARNA);
            $update_result = mysql_query($update_query) or die(mysql_error());
           
            $result['id'] = $param['id'];
            $result['status'] = '1';
            $result['message'] = 'Data berhasil diperbaharui.';
        }
       
        return $result;
    }

    function get_by_id($param) {
        $array = array();
       
        if (isset($param['id'])) {
            $select_query  = "SELECT * FROM ".JENIS_WARNA." WHERE id = '".$param['id']."' LIMIT 1";
        } 
		
        $select_result = mysql_query($select_query) or die(mysql_error());
        if (false !== $row = mysql_fetch_assoc($select_result)) {
            $array = $this->sync($row);
        }
       
        return $array;
    }
	
    function get_array($param = array()) {
        $array = array();
		
		$param['field_replace']['price_text'] = 'JenisWarna.price';
		$param['field_replace']['jenis_unit_name'] = 'JenisUnit.name';
		
		$force_id = (isset($param['force_id'])) ? $param['force_id'] : 0;
		$string_jenis_unit = (isset($param['jenis_unit_id'])) ? "AND JenisWarna.jenis_unit_id = '".$param['jenis_unit_id']."'" : '';
		$string_filter = GetStringFilter($param, @$param['column']);
		$string_sorting = GetStringSorting($param, @$param['column'], 'name ASC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS JenisWarna.*, JenisUnit.name jenis_unit_name
			FROM ".JENIS_WARNA." JenisWarna
			LEFT JOIN ".JENIS_UNIT." JenisUnit ON JenisUnit.id = JenisWarna.jenis_unit_id
			WHERE 1 $string_jenis_unit $string_filter
			ORDER BY $string_sorting
			LIMIT $string_limit
		";
        $select_result = mysql_query($select_query) or die(mysql_error());
		while ( $row = mysql_fetch_assoc( $select_result ) ) {
            if (!empty($force_id)) {
                $force_id = ($force_id == $row['id']) ? 0 : $force_id;
            }
			
			$array[] = $this->sync($row, $param);
		}
		
        if (!empty($force_id)) {
            $array_force = $this->get_by_id(array('id' => $force_id));
			if (count($array_force) > 0) {
				$array[] = $array_force;
			}
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
	
    function delete($param) {
        $record_count = 0;
        $select_query = array();
        if (isset($param['id'])) {
            $select_query[] = "SELECT COUNT(*) total FROM ".KENDARAAN." WHERE jenis_warna_id = '".$param['id']."'";
            $select_query[] = "SELECT COUNT(*) total FROM ".PENJUALAN." WHERE jenis_warna_id = '".$param['id']."'";
        }
        foreach ($select_query as $query) {
            $select_result = mysql_query($query) or die(mysql_error());
            if (false !== $row = mysql_fetch_assoc($select_result)) {
                $record_count += $row['total'];
            }
        }
		if ($record_count > 0) {
            $result['status'] = '0';
            $result['message'] = 'Data tidak bisa dihapus karena sudah terpakai.';
			return $result;
		}
		
		$delete_query  = "DELETE FROM ".JENIS_WARNA." WHERE id = '".$param['id']."' LIMIT 1";
		$delete_result = mysql_query($delete_query) or die(mysql_error());
		
		$result['status'] = '1';
		$result['message'] = 'Data berhasil dihapus.';

        return $result;
    }
	
	function sync($row, $param = array()) {
		$row = StripArray($row);
		
		if (isset($row['price'])) {
			$row['price_text'] = MoneyFormat($row['price']);
		}
		
		if (count(@$param['column']) > 0) {
			$row = dt_view_set($row, $param);
		}
		
		return $row;
	}
}