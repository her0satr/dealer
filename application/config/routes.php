<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	
$is_website = true;

$string_link_check = (isset($_SERVER['argv']) && isset($_SERVER['argv'][0])) ? $_SERVER['argv'][0] : '';
$string_link_check = (empty($string_link_check) && isset($_SERVER['REDIRECT_QUERY_STRING'])) ? $_SERVER['REDIRECT_QUERY_STRING'] : $string_link_check;
$url_arg = preg_replace('/(^\/|\/$)/i', '', $string_link_check);
$array_arg = explode('/', $url_arg);

if (count($array_arg) >= 1) {
	$key = $array_arg[0];
	if (in_array($key, array( 'panel' ))) {
		$is_website = false;
	}
}

if ($is_website) {
	$route['sales|error|schedule'] = "website/home";
}

$route['panel'] = "panel/home";
$route['default_controller'] = "website/home";
$route['404_override'] = '';