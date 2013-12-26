<?php
	// parent active having class "open"
	// child active having class "active"
?>

<div class="sidebar" id="cnt-sidebar">
	<div class="sidebar-dropdown"><a href="#">Navigation</a></div>
	
	<form class="navbar-form" role="search">
		<div class="form-group">&nbsp;</div>
	</form>
	
	<ul id="nav">
		<li><a href="index.html"><i class="fa fa-home"></i><span>Dashboard</span></a></li>
		<li class="has_sub">
			<a href="#" data-link="inventory"><i class="fa fa-folder"></i><span>Inventory</span><span class="pull-right"><i class="fa fa-chevron-left"></i></span></a>
			<ul>
				<li><a data-link="kendaraan_masuk" href="<?php echo base_url('panel/inventory/kendaraan_masuk'); ?>">Kendaraan Masuk</a></li>
				<li><a data-link="kredit_kendaraan" href="<?php echo base_url('panel/inventory/kredit_kendaraan'); ?>">Penjualan Kendaraan</a></li>
			</ul>
		</li>
		<li class="has_sub">
			<a href="#" data-link="report"><i class="fa fa-folder"></i><span>Laporan</span><span class="pull-right"><i class="fa fa-chevron-left"></i></span></a>
			<ul>
				<li><a data-link="stock_kendaraan" href="<?php echo base_url('panel/report/stock_kendaraan'); ?>">Stock Kendaraan</a></li>
				<li><a data-link="rekap_penjualan" href="<?php echo base_url('panel/report/rekap_penjualan'); ?>">Rekap Penjualan</a></li>
				<li><a data-link="rekap_sales" href="<?php echo base_url('panel/report/rekap_sales'); ?>">Penjualan Sales</a></li>
			</ul>
		</li>
		<li class="has_sub">
			<a href="#" data-link="website"><i class="fa fa-folder"></i><span>Website</span><span class="pull-right"><i class="fa fa-chevron-left"></i></span></a>
			<ul>
				<li><a data-link="page_static" href="<?php echo base_url('panel/website/page_static'); ?>">Page Statis</a></li>
				<li><a data-link="blog" href="<?php echo base_url('panel/website/blog'); ?>">Blog</a></li>
			</ul>
		</li>
		<li class="has_sub">
			<a href="#" data-link="member" class="open"><i class="fa fa-folder"></i><span>Member</span><span class="pull-right"><i class="fa fa-chevron-left"></i></span></a>
			<ul>
				<li><a data-link="user" href="<?php echo base_url('panel/member/user'); ?>" class="active">User</a></li>
			</ul>
		</li>
		<li class="has_sub">
			<a href="#" data-link="master"><i class="fa fa-folder"></i><span>Master</span><span class="pull-right"><i class="fa fa-chevron-left"></i></span></a>
			<ul>
				<li><a data-link="jenis_unit" href="<?php echo base_url('panel/master/jenis_unit'); ?>">Jenis Unit</a></li>
				<li><a data-link="jenis_warna" href="<?php echo base_url('panel/master/jenis_warna'); ?>">Jenis Warna</a></li>
				<li><a data-link="jenis_leasing" href="<?php echo base_url('panel/master/jenis_leasing'); ?>">Jenis Leasing</a></li>
				<li><a data-link="jenis_angsuran" href="<?php echo base_url('panel/master/jenis_angsuran'); ?>">Jenis Angsuran</a></li>
				<li><a data-link="jenis_pembayaran" href="<?php echo base_url('panel/master/jenis_pembayaran'); ?>">Jenis Pembayaran</a></li>
				<li><a data-link="jenis_waktu_kredit" href="<?php echo base_url('panel/master/jenis_waktu_kredit'); ?>">Jenis Waktu Kredit</a></li>
			</ul>
		</li>
	</ul>
</div>

<script>
	$('#cnt-sidebar').find('.open').removeClass('open');
	$('#cnt-sidebar').find('.active').removeClass('active');
	
	var link = window.location.href;
	var string_match = link.match(new RegExp('panel\/([a-z0-9\_]+)(\/([a-z0-9\_]+))?', 'gi'));
	if (typeof(string_match) != 'undefined') {
		var array_link = string_match[0].split('/');
		
		// set parent
		if (typeof(array_link[1]) == 'string') {
			$('a[data-link="' + array_link[1] + '"]').addClass('open');
		}
		
		// set child
		if (typeof(array_link[2]) == 'string') {
			$('a[data-link="' + array_link[2] + '"]').addClass('active');
		}
	}
</script>