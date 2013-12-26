<?php
	$_POST['date_start'] = (empty($_POST['date_start'])) ? date("01-m-Y") : $_POST['date_start'];
	$_POST['date_end'] = (empty($_POST['date_end'])) ? date("t-m-Y") : $_POST['date_end'];
	
	$param_rekap_sales['date_start'] = ExchangeFormatDate($_POST['date_start']);
	$param_rekap_sales['date_end'] = ExchangeFormatDate($_POST['date_end']);
	$array_rekap_sales = $this->Penjualan_model->get_rekap_sales($param_rekap_sales);
	
	// get total
	$total_unit = 0;
	foreach($array_rekap_sales as $row) {
		$total_unit += $row['value'];
	}
	
	$page_data['date_start'] = $_POST['date_start'];
	$page_data['date_end'] = $_POST['date_end'];
	$page_data['chart_data'] = $array_rekap_sales;
?>
<?php $this->load->view( 'panel/common/meta', array( 'title' => 'Selamat Datang' ) ); ?>

<body>
<?php $this->load->view( 'panel/common/header'); ?>

<div class="content">
	<?php $this->load->view( 'panel/common/sidebar'); ?>
	<div class="hide cnt-data"><?php echo json_encode($page_data); ?></div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left">Selamat Datang</h2>
			<div class="clearfix"></div>
		</div>
		
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">

				<div class="widget" id="form-chart">
					<div class="widget-head">
						<div class="pull-left">Selamat Datang</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				
			</div></div>
        </div></div>
    </div>
	<div class="clearfix"></div>
</div>

<?php $this->load->view( 'panel/common/footer' ); ?>
<?php $this->load->view( 'panel/common/library_js'); ?>

<script>
$(document).ready(function() {

});
</script>
</body>
</html>