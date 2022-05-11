<h1>Editar Información</h1>
	<em></em>
	<h2><a href="<?= base_url('home/mostrar')?>">Inicio</a><label>/</label>Editar Perfil</h2>
</div>
</div>
<div class="container">
	<div class="login">
			<div class="col-md-12 login-do">
				<center>
					<h2>Editar Información</h2>
				</center>

			</div><br><br><br>
	<?php if (validation_errors() != NULL) {?>
		<div class="alert alert-danger" role="alert">
		    <?php echo validation_errors(); ?>
		</div>
		<?php } ?>
		<form action="<?= base_url('login_register/actualizar_admin/') ?>" method ="POST">
			<div class="col-md-6 login-do">
				<label for="nombre_completo">Nombre Completo</label>
				<div class="login-mail">
					<input type="text" placeholder="Ingrese Nombre Completo" required="" id="nombre_completo" name="nombre_completo" value="<?= $admin->nombre_completo ;?>">
					<i  class="glyphicon glyphicon-font"></i>
				</div>
				<label for="username">Usuario</label>
				<div class="login-mail">
					<input type="text" placeholder="" required="" id="username" name="username" value="<?= $admin->username ;?>">
					<i  class="	glyphicon glyphicon-sort-by-order"></i>
				</div>
				<label for="contrasenia">Contraseña</label>
				<div class="login-mail">
					<input type="password" placeholder="Ingrese su contraseña" required="" id="contrasenia" name="contrasenia" value="<?= $admin->contrasenia; ?>" >
					<i  class="glyphicon glyphicon-usd"></i>
				</div>	   
			</div>
			<div class="col-md-12 login-do">
				<center>
					<label class="hvr-skew-backward">
						<input type="submit" value="Actualizar">
					</label>
				</center>
			</div>
			<div class="clearfix"></div>
		</form>
	</div>
</div>


