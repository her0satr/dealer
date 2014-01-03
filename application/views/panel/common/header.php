<?php
	$user = $this->User_model->get_session();
?>
<header>
<div class="navbar navbar-fixed-top bs-docs-nav" role="banner">
	<div class="container">
		<div class="navbar-header">
			<button class="navbar-toggle btn-navbar" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse"><span>Menu</span></button>
			<a href="#" class="pull-left menubutton hidden-xs"><i class="fa fa-bars"></i></a>
			<a href="<?php echo base_url('panel'); ?>" class="navbar-brand">Home</a>
		</div>
		
		<nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">         
			<ul class="nav navbar-nav pull-right">
				<li class="dropdown pull-right user-data">
					<a data-toggle="dropdown" class="dropdown-toggle" href="#">
						<img src="<?php echo $user['thumbnail_link']; ?>" style="width: 25px; height: 25px;">
						<?php echo $user['fullname']; ?> <b class="caret"></b>
					</a>
					
					<ul class="dropdown-menu">
						<!--
						<li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
						-->
						<li><a href="<?php echo base_url(); ?>"><i class="fa fa-globe"></i> Website</a></li>
						<li><a href="<?php echo base_url('panel/home/logout'); ?>"><i class="fa fa-key"></i> Logout</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
</div>
</header>