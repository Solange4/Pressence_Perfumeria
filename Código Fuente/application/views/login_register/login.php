<h1>Iniciar Sesión</h1>
	<em></em>
	<h2><a href="<?= base_url('home/mostrar')?>">Inicio</a><label>/</label>Iniciar Sesión</h2>
</div>
</div>

<div class="container">
	<div class="login">
			<div class="col-md-12 login-do">
					<h2>Iniciar Sesión</h2>
		        
<?php if (validation_errors() != NULL) {?>
<div class="alert alert-danger" role="alert">
    <?php echo validation_errors(); ?>
</div>
<?php } ?>			
			</div><br><br><br>
			<form action="<?= base_url('login_register/verificar')?>" method ="POST">
			<div class="col-md-6 login-do">
				<label for="usuario">Usuario</label>
				<div class="login-mail">
					<input type="text" placeholder="Usuario" required="" id="username" name="username">
					<i  class="	glyphicon glyphicon-sort-by-order"></i>
				</div>
				<label for="contrasenia">Contraseña</label>
				<div class="login-mail">
					<input type="password" required="" placeholder="Ingrese su Contraseña" id="contrasenia" name="contrasenia">
					<i  class="glyphicon glyphicon-usd"></i>
				</div>

			</div>
			<div class="col-md-12 login-do">
				<button class="btn btn-theme" href="<?= base_url('login_register/perfil')?>" type="submit">Ingresar</button>
			</div>
			<div class="clearfix"></div>
		</form>
		</center>
	</div>
</div>



