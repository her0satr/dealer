<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Invoice_model extends CI_Model {
    function __construct() {
        parent::__construct();
		
        $this->field = array( 'id', 'penjualan_id', 'no', 'rupiah_angka', 'rupiah_text', 'pengantar', 'penerima', 'date_print' );
    }

    function update($param) {
        $result = array();
       
        if (empty($param['id'])) {
            $insert_query  = GenerateInsertQuery($this->field, $param, INVOICE);
            $insert_result = mysql_query($insert_query) or die(mysql_error());
           
            $result['id'] = mysql_insert_id();
            $result['status'] = '1';
            $result['message'] = 'Data berhasil disimpan.';
        } else {
            $update_query  = GenerateUpdateQuery($this->field, $param, INVOICE);
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
            $select_query  = "SELECT * FROM ".INVOICE." WHERE id = '".$param['id']."' LIMIT 1";
        } else if (isset($param['no'])) {
			$select_query  = "SELECT * FROM ".INVOICE." ORDER BY no DESC LIMIT 1";
		}
		
        $select_result = mysql_query($select_query) or die(mysql_error());
        if (false !== $row = mysql_fetch_assoc($select_result)) {
            $array = $this->sync($row);
        }
       
        return $array;
    }
	
    function get_array($param = array()) {
        $array = array();
		
		$param['field_replace']['rupiah_angka_format'] = 'Invoice.rupiah_angka';
		
		$string_penjualan = (!empty($param['penjualan_id'])) ? "AND Invoice.penjualan_id = '".$param['penjualan_id']."'" : "";
		$string_filter = GetStringFilter($param, @$param['column']);
		$string_sorting = GetStringSorting($param, @$param['column'], 'no DESC');
		$string_limit = GetStringLimit($param);
		
		$select_query = "
			SELECT SQL_CALC_FOUND_ROWS Invoice.*
			FROM ".INVOICE." Invoice
			WHERE 1 $string_penjualan $string_filter
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
	
	function get_no() {
		$record_max = $this->get_by_id(array( 'no' => 0 ));
		if (!empty($record_max['no'])) {
			$max_no = preg_replace('/^0+/i', '', $record_max['no']);
			$max_no = intval($max_no);
		} else {
			$max_no = 0;
		}
		
		// next number
		$next_no = $max_no + 1;
		$next_no = str_pad($next_no, 5, "0", STR_PAD_LEFT);
		
		return $next_no;
	}
	
    function delete($param) {
		$delete_query  = "DELETE FROM ".INVOICE." WHERE id = '".$param['id']."' LIMIT 1";
		$delete_result = mysql_query($delete_query) or die(mysql_error());
		
		$result['status'] = '1';
		$result['message'] = 'Data berhasil dihapus.';

        return $result;
    }
	
	function sync($row, $param = array()) {
		$row = StripArray($row);
		$row['rupiah_angka_format'] = MoneyFormat($row['rupiah_angka']);
		
		if (count(@$param['column']) > 0) {
			$param['is_custom']  = '<button class="btn btn-xs btn-edit btn-success"><i class="fa fa-pencil"></i></button> ';
			$param['is_custom'] .= '<button class="btn btn-xs btn-delete btn-warning"><i class="fa fa-file"></i></button> ';
			$param['is_custom'] .= '<button class="btn btn-xs btn-delete btn-danger"><i class="fa fa-times"></i></button> ';
			
			$row = dt_view_set($row, $param);
		}
		
		return $row;
	}
}