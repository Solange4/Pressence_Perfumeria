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
		<form action="<?= base_url('login_register/actualizar_usuario/') ?>" method ="POST">
			<div class="col-md-6 login-do">
				<label for="nombre_completo">Nombre Completo</label>
				<div class="login-mail">
					<input type="text" placeholder="Ingrese Nombre Completo" required="" id="nombre_completo" name="nombre_completo" value="<?= $usuarios->nombre_completo ;?>">
					<i  class="glyphicon glyphicon-font"></i>
				</div>
				<label for="username">Usuario</label>
				<div class="login-mail">
					<input type="text" placeholder="" required="" id="username" name="username" value="<?= $usuarios->username ;?>">
					<i  class="	glyphicon glyphicon-sort-by-order"></i>
				</div>
				<label for="contrasenia">Contraseña</label>
				<div class="login-mail">
					<input type="text" placeholder="Precio del Producto Ej: 40" required="" id="contrasenia" name="contrasenia" value="<?= $usuarios->contrasenia; ?>" >
					<i  class="glyphicon glyphicon-usd"></i>
				</div>
				<label for="correo">Correo</label>
				<div class="login-mail">
					<input type="text" placeholder="Cantidad Ej:20" required="" id="correo" name="correo" value="<?= $usuarios->cliente_correo ;?>">
					<i  class="	glyphicon glyphicon-sort-by-order"></i>
				</div>	   
			</div>
			<div class="col-md-6 login-do">
				<label for="telefono">Teléfono</label>
				<div class="login-mail">
					<input type="text" placeholder="Cantidad Ej:20" required="" id="telefono" name="telefono" value="<?= $usuarios->cliente_telefono ;?>">
					<i  class="	glyphicon glyphicon-sort-by-order"></i>
				</div>
				<label for="genero">Género</label>
				<div class="login-mail">
					<input type="text" placeholder="Cantidad Ej:20" required="" id="genero" name="genero" value="<?= $usuarios->cliente_genero ;?>">
					<i  class="	glyphicon glyphicon-sort-by-order"></i>
				</div>
				<label for="fecha_nacimiento">Fecha de Nacimiento</label>
				<div class="login-mail">
					<input type="date" required="" style="width:478px" id="fecha_nacimiento" name="fecha_nacimiento" value="<?= $usuarios->cliente_fecha_nacimiento ;?>">&nbsp;&nbsp;
					<i class="glyphicon glyphicon-calendar"></i>				
				</div>
			</div>
			<div class="col-md-12 login-do">
				<center>
					<label class="hvr-skew-backward">
						<input type="submit" value="Registrar">
					</label>
				</center>
			</div>
			<div class="clearfix"></div>
		</form>
	</div>
</div>


