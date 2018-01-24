<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<base href="<?php echo base_url();?>" />
	<title>Wesanel Enterprise<?php echo $this->lang->line('login_login'); ?></title>
	<link rel="shortcut icon" type="image/x-icon" href="">
	<!-- start css template tags -->
	<link rel="stylesheet" type="text/css" href="dist/bootstrap.min.css?rel=9ed20b1ee8"/>
	<link rel="stylesheet" type="text/css" href="css/login.css"/>
	<!-- end css template tags -->

	<script type="text/javascript">
		window.onload = function()
		{
			document.getElementById("username").focus();
		};
	</script>
</head>

<body>
    <div id="logo" align="center"><b><h4>Wesanel Enterprise Point of Sale</h4></b></div>

	<div id="login">
		<?php echo form_open('login') ?>
			<div id="container">
				<div align="center" style="color:red"><?php echo validation_errors(); ?></div>
				
				<div id="login_form">
					<?php echo $this->lang->line('login_username') . ':'; ?>
					<?php echo form_input(array('name'=>'username', 'id'=>'username', 'class'=>'form-control', 'size'=>'20')); ?>

					<?php echo $this->lang->line('login_password') . ':'; ?>
					<?php echo form_password(array('name'=>'password', 'id' => 'password', 'class'=>'form-control', 'size'=>'20')); ?>
					
					<input class="btn btn-primary btn-block" type="submit" name="loginButton" value="Go"/>
				</div>
			</div>
		<?php echo form_close(); ?>
		
            <center><small>&copy <?php  echo date("Y");?>  | Powered by <a href="http://www.gadeksystems.com">Gadek Systems Cape Coast - 0243348522</a></small></center>
	</div>
</body>
</html>
