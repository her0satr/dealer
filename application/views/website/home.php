<?php
	$user = $this->User_model->get_session();
?>
<title>Home</title>
<style>
body, div, a { margin: 0px; padding: 0px; border: 0px; font-size: 16px; }
body { background: #368FB7; }
a { text-decoration: none; }
.clear { clear: both; }

.header { text-align: right; background: #368FB7; color: #FFFFFF; padding: 10px 20px; }
.header a { color: #FFFFFF; }
.header .left { float: left; }

.menu { float: left; width: 30%; }
.menu div { background: #328BB3; }
.menu a { color: #FFFFFF; padding: 20px 0 20px 20px; display: block; font-size: 20px; }
.menu a.active, .menu a:hover { background: #6FBEFB; }

.content { float: left; width: 70%; }
.content .main-title { background: #F0C30C; color: #FFFFFF; width: 100%; }
.content .main-title .pad { padding: 20px 0 20px 20px; font-size: 20px; }

.event .item { float: left; width: 50%; background: #6FBEFB; color: #FFFFFF; }
.event .item .pad { padding: 20px; }
.event .item img { float: left; padding: 0 20px 0 0; }

.gallery .item { float: left; width: 25%; text-align: center; background: #6FBEFB; }
.gallery .item .limit { padding: 15px; }
.gallery .item img { width: 85%; }
</style>
<body>
<div class="header">
	<div class="left"><a href="<?php echo base_url('panel/home/dashboard'); ?>">Panel</a></div>
	<?php echo strtoupper($user['fullname']); ?>, <a href="<?php echo base_url('panel/home/logout'); ?>">Logout</a>
</div>

<div class="menu">
	<div><a href="<?php echo base_url(); ?>" class="active">Home / Wall</a></div>
	<div><a href="<?php echo base_url('sales'); ?>">History penjualan sales / team</a></div>
	<div><a href="<?php echo base_url('error'); ?>">Data error / kekurangan uang muka</a></div>
	<div><a href="<?php echo base_url('schedule'); ?>">Jadwal Training / Meeting Dealer</a></div>
</div>

<div class="content">
	<div class="event">
		<div class="main-title"><div class="pad">EVENT TERBARU</div></div>
		<div class="item">
			<div class="pad">
				<img src="<?php echo base_url('_data/20131225 timeline/temp.png'); ?>" />
				<div class="title">Event Title disini</div>
				<div class="desc">as dkjhas dkjhas djkah dkjah dkjha sjdhkas dkjhas dkjhas djkah dkjah dkjha sjdhkas dkjhas dkjhas djkah dkjah dkjha sjdhk</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="item">
			<div class="pad">
				<img src="<?php echo base_url('_data/20131225 timeline/temp.png'); ?>" />
				<div class="title">Event Title disini</div>
				<div class="desc">as dkjhas dkjhas djkah dkjah dkjha sjdhkas dkjhas dkjhas djkah dkjah dkjha sjdhkas dkjhas dkjhas djkah dkjah dkjha sjdhk</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="gallery">
		<div class="main-title"><div class="pad">GALLERY</div></div>
		<div class="item"><div class="limit"><img src="<?php echo base_url('_data/20131225 timeline/temp.png'); ?>" /></div></div>
		<div class="item"><div class="limit"><img src="<?php echo base_url('_data/20131225 timeline/temp.png'); ?>" /></div></div>
		<div class="item"><div class="limit"><img src="<?php echo base_url('_data/20131225 timeline/temp.png'); ?>" /></div></div>
		<div class="item"><div class="limit"><img src="<?php echo base_url('_data/20131225 timeline/temp.png'); ?>" /></div></div>
	</div>
</div>
<div class="clear"></div>
</body>