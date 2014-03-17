<?php
	$array_jenis_unit = $this->Jenis_Unit_model->get_array();
?>
<?php $this->load->view( 'panel/common/meta', array( 'title' => 'Jenis Warna' ) ); ?>

<body>
<?php $this->load->view( 'panel/common/header'); ?>

<div class="content">
	<?php $this->load->view( 'panel/common/sidebar'); ?>
	
  	<div class="mainbar">
	    <div class="page-head">
			<h2 class="pull-left button-back">Jenis Warna</h2>
			<div class="clearfix"></div>
		</div>
		
	    <div class="matter"><div class="container">
            <div class="row"><div class="col-md-12">
				
				<div class="widget grid-main">
					<div class="widget-head">
						<div class="pull-left">
							<button class="btn btn-info btn-xs btn-add-jenis-warna">Tambah</button>
						</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="widget-content">
						<table id="datatable" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>Jenis Unit</th>
									<th>Name</th>
									<th>Harga</th>
									<th>Control</th></tr>
							</thead>
							<tbody></tbody>
						</table>
						
						<div class="widget-foot">
							<br /><br />
							<div class="clearfix"></div> 
						</div>
					</div>
				</div>
				
				<div class="widget hide" id="form-jenis-warna">
					<div class="widget-head">
						<div class="pull-left">Form Jenis Warna</div>
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
							
							<div class="form-group">
								<label class="col-lg-2 control-label">Jenis Unit</label>
								<div class="col-lg-10">
									<select class="form-control" name="jenis_unit_id">
										<?php echo ShowOption(array( 'Array' => $array_jenis_unit )); ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Name</label>
								<div class="col-lg-10">
									<input type="text" name="name" class="form-control" placeholder="Name" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Harga</label>
								<div class="col-lg-10">
									<input type="text" name="price" class="form-control" placeholder="Harga" />
								</div>
							</div>
							<hr />
							
							<div class="form-group">
								<div class="col-lg-offset-2 col-lg-9">
									<button type="submit" class="btn btn-info">Save</button>
									<button type="button" class="btn btn-info btn-show-grid">Cancel</button>
								</div>
							</div>
						</form></div>
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
	var dt = null;
	var page = {
		show_grid: function() {
			$('.grid-main').show();
			$('#form-jenis-warna').hide();
		},
		show_form_jenis_warna: function() {
			$('.grid-main').hide();
			$('#form-jenis-warna').show();
		}
	}
	
	// global
	$('.btn-show-grid').click(function() {
		page.show_grid();
	});
	
	// grid
	var param = {
		id: 'datatable',
		source: web.host + 'panel/master/jenis_warna/grid',
		column: [ { }, { }, { sClass: "right" }, { bSortable: false, sClass: "center" } ],
		callback: function() {
			$('#datatable .btn-edit').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.ajax({ url: web.host + 'panel/master/jenis_warna/action', param: { action: 'get_by_id', id: record.id }, callback: function(result) {
					$('#form-jenis-warna [name="id"]').val(result.id);
					$('#form-jenis-warna [name="name"]').val(result.name);
					$('#form-jenis-warna [name="price"]').val(result.price);
					$('#form-jenis-warna [name="jenis_unit_id"]').val(result.jenis_unit_id);
					page.show_form_jenis_warna();
				} });
			});
			
			$('#datatable .btn-delete').click(function() {
				var raw_record = $(this).siblings('.hide').text();
				eval('var record = ' + raw_record);
				
				Func.confirm_delete({
					data: { action: 'delete', id: record.id },
					url: web.host + 'panel/master/jenis_warna/action', callback: function() { dt.reload(); }
				});
			});
		}
	}
	dt = Func.init_datatable(param);
	
	// form jenis warna
	$('.btn-add-jenis-warna').click(function() {
		page.show_form_jenis_warna();
		$('#form-jenis-warna form')[0].reset();
		$('#form-jenis-warna [name="id"]').val(0);
	});
	$('#form-jenis-warna form').validate({
		rules: {
			name: { required: true, minlength: 2 }
		}
	});
	$('#form-jenis-warna form').submit(function() {
		if (! $('#form-jenis-warna form').valid()) {
			return false;
		}
		
		var param = Site.Form.GetValue('form-jenis-warna');
		Func.ajax({ url: web.host + 'panel/master/jenis_warna/action', param: param, callback: function(result) {
			if (result.status == 1) {
				dt.reload();
				page.show_grid();
				$('#form-jenis-warna form')[0].reset();
			}
		} });
		
		return false;
	});
});
</script>
</body>
</html>