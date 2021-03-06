<?php
	$user = $this->User_model->get_session();
	
	$array_jenis_unit = $this->Jenis_Unit_model->get_array(array( 'limit' => 1500 ));
	$array_jenis_leasing = $this->Jenis_Leasing_model->get_array(array( 'limit' => 1500 ));
	$array_jenis_angsuran = $this->Jenis_Angsuran_model->get_array(array( 'limit' => 1500 ));
	$array_jenis_pembayaran = $this->Jenis_Pembayaran_model->get_array(array( 'limit' => 1500 ));
	
	// chart
	$array_rekap_yearly = $this->Penjualan_model->get_rekap_yearly();
	
	$page_data['user_type_id'] = $user['user_type_id'];
	$page_data['array_rekap_yearly'] = $array_rekap_yearly;
	$page_data['USER_ID_ADMINISTRATOR'] = USER_ID_ADMINISTRATOR;
?>
<?php $this->load->view( 'panel/common/meta', array( 'title' => 'Selamat Datang' ) ); ?>

<body>
<?php $this->load->view( 'panel/common/header'); ?>

<div class="content">
	<?php $this->load->view( 'panel/common/sidebar'); ?>
	<div class="hide">
		<div class="cnt-data"><?php echo json_encode($page_data); ?></div>
		<iframe name="iframe_ktp_file" src="<?php echo base_url('panel/upload?callback=set_ktp_file'); ?>"></iframe>
	</div>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left">Selamat Datang</h2>
			<div class="clearfix"></div>
		</div>
		
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">
				
				<?php if ($user['user_type_id'] == USER_ID_ADMINISTRATOR) { ?>
				<div class="widget">
					<div class="widget-head">
						<div class="pull-left">Rekap Penjualan 12 Bulan Terakhir</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>  
						<div class="clearfix"></div>
					</div>
					<div class="widget-content">
						<div class="padd">
							<div id="chart-summary"></div>
						</div>
					</div>
				</div>
				<?php } else { ?>
				<div class="widget" id="form-kredit-kendaraan">
					<div class="widget-head">
						<div class="pull-left">Form Penjualan</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					
					<div class="widget-content">
						<div class="padd"><form class="form-horizontal">
							<input type="hidden" name="action" value="update" />
							<input type="hidden" name="id" value="0" />
							
							<div class="col-lg-9">
								<div class="form-group">
									<label class="col-lg-2 control-label">Nama Konsumen</label>
									<div class="col-lg-10">
										<input type="text" name="name" class="form-control" placeholder="Nama Konsumen" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">NIK</label>
									<div class="col-lg-10">
										<input type="text" name="nik" class="form-control" placeholder="NIK" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">No Telepon / HP</label>
									<div class="col-lg-10">
										<input type="text" name="phone" class="form-control" placeholder="No Telepon / HP" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">Tempat Lahir</label>
									<div class="col-lg-10">
										<input type="text" name="birth_place" class="form-control" placeholder="Tempat Lahir" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">Tanggal Lahir</label>
									<div class="col-lg-10">
										<div class="input-append datepicker">
											<input name="birth_date" type="text" class="form-control dtpicker" placeholder="Tanggal Lahir" data-format="dd-MM-yyyy" />
											<span class="add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="btn btn-info"></i></span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">Alamat</label>
									<div class="col-lg-10">
										<textarea class="form-control" rows="3" name="address" placeholder="Alamat"></textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">Alamat Kirim</label>
									<div class="col-lg-10">
										<textarea class="form-control form-entry" rows="3" name="address_delivery" placeholder="Alamat Kirim"></textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">Jenis Unit</label>
									<div class="col-lg-7">
										<select class="form-control" name="jenis_unit_id">
											<?php echo ShowOption(array( 'Array' => $array_jenis_unit )); ?>
										</select>
									</div>
									<div class="col-lg-3">
										<select class="form-control" name="jenis_warna_id">
											<option value="">-</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">Harga OTR</label>
									<div class="col-lg-10">
										<input type="text" name="price_otr" class="form-control" placeholder="Harga OTR" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">Upload KTP</label>
									<div class="col-lg-4">
										<input type="text" name="ktp_file" class="form-control" placeholder="Upload KTP" />
									</div>
									<div class="col-lg-3">
										<input type="button" class="btn btn-primary btn-browse-ktp" value="Browse" />
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="form-group">
									<label>Jenis Pembayaran</label>
									<select class="form-control" name="jenis_pembayaran_id">
										<?php echo ShowOption(array( 'Array' => $array_jenis_pembayaran )); ?>
									</select>
								</div>
								<div class="form-group">
									<label>Potongan Penjualan</label>
									<input type="text" name="discount" class="form-control" placeholder="Potongan Penjualan" />
								</div>
								<div class="form-group">
									<label>Leasing</label>
									<select class="form-control" name="jenis_leasing_id">
										<?php echo ShowOption(array( 'Array' => $array_jenis_leasing )); ?>
									</select>
								</div>
								<div class="form-group">
									<label>DP Konsumen</label>
									<input type="text" name="dp_customer" class="form-control" placeholder="DP Konsumen" />
								</div>
								<div class="form-group">
									<label>DP Gros</label>
									<input type="text" name="dp_gross" class="form-control" placeholder="DP Gros" />
								</div>
								<div class="form-group">
									<label>SUB</label>
									<input type="text" name="sub" class="form-control" placeholder="SUB" readonly="readonly" />
								</div>
								
								<div class="form-group">
									<label>Lama Angsuran</label>
									<select class="form-control" name="jenis_angsuran_id">
										<?php echo ShowOption(array( 'Array' => $array_jenis_angsuran )); ?>
									</select>
								</div>
								<div class="form-group">
									<label>Angsuran</label>
									<input type="text" name="price_angsuran" class="form-control" placeholder="Angsuran" />
								</div>
							</div>
							<div class="clear"></div>
							<hr />
							<div class="form-group">
								<div class="col-lg-offset-2 col-lg-9">
									<button type="submit" class="btn btn-info">Submit</button>
									<button type="button" class="btn btn-info btn-show-grid">Cancel</button>
								</div>
							</div>
						</form></div>
					</div>
				</div>
				<?php } ?>
				
			</div></div>
        </div></div>
    </div>
	<div class="clearfix"></div>
</div>

<?php $this->load->view( 'panel/common/footer' ); ?>
<?php $this->load->view( 'panel/common/library_js'); ?>

<script>
$(document).ready(function() {
	var page = {
		init: function() {
			var temp = $('.cnt-data').html();
			eval('var data = ' + temp);
			page.data = data;
		}
	}
	page.init();
	
	if ($('#chart-summary').length == 1) {
		Morris.Bar({
			element: 'chart-summary',
			data: page.data.array_rekap_yearly.data,
			xkey: 'label',
			ykeys: page.data.array_rekap_yearly.key,
			labels: page.data.array_rekap_yearly.label,
			barRatio: 0.4,
			xLabelAngle: 35,
			hideHover: 'auto'
		});
	}
	
	if ($('#form-kredit-kendaraan').length == 1) {
		// form
		$('#form-kredit-kendaraan form').validate({
			rules: {
				jenis_unit_id: { required: true },
				jenis_warna_id: { required: true },
				jenis_pembayaran_id: { required: true },
				name: { required: true },
				phone: { required: true },
				address: { required: true },
				birth_place: { required: true },
				birth_date: { required: true }
			}
		});
		$('#form-kredit-kendaraan form').submit(function() {
			if (! $('#form-kredit-kendaraan form').valid()) {
				return false;
			}
			
			var param = Site.Form.GetValue('form-kredit-kendaraan');
			param.birth_date = Func.SwapDate(param.birth_date);
			Func.ajax({ url: web.host + 'panel/inventory/kredit_kendaraan/action', param: param, callback: function(result) {
				if (result.status == 1) {
					$('#form-kredit-kendaraan form')[0].reset();
					noty({ text: result.message, layout: 'topRight', type: 'success', timeout: 2500 });
				}
			} });
			
			return false;
		});
		$('#form-kredit-kendaraan [name="dp_customer"], #form-kredit-kendaraan [name="dp_gross"]').keyup(function() {
			var dp_gross = $('#form-kredit-kendaraan [name="dp_gross"]').val();
			var dp_customer = $('#form-kredit-kendaraan [name="dp_customer"]').val();
			var sub = dp_gross - dp_customer;
			$('#form-kredit-kendaraan [name="sub"]').val(sub);
		});
		$('#form-kredit-kendaraan [name="jenis_unit_id"]').change(function() {
			combo.jenis_warna({ jenis_unit_id: $(this).val(), target: $('#form-kredit-kendaraan [name="jenis_warna_id"]') });
		});
		$('#form-kredit-kendaraan [name="jenis_warna_id"]').change(function() {
			if ($(this).find(':selected').data('json') != null) {
				$('#form-kredit-kendaraan [name="price_otr"]').val($(this).find(':selected').data('json').price);
			}
		});
		
		// upload
		$('.btn-browse-ktp').click(function() { window.iframe_ktp_file.browse() });
		set_ktp_file = function(p) {
			$('#form-kredit-kendaraan [name="ktp_file"]').val(p.file_name);
		}
	}
});
</script>
</body>
</html>