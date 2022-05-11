<h1>Registrarse</h1>
	<em></em>
	<h2><a href="<?= base_url('home/mostrar')?>">Inicio</a><label>/</label>Registrar</h2>
</div>
</div>
<div class="container">
	<div class="login">
			<div class="col-md-12 login-do">
				<center>
					<h2>Registrarse</h2>
				</center>

			</div><br><br><br>

		<?php if (validation_errors() != NULL) {?>
		<div class="alert alert-danger" role="alert">
		    <?php echo validation_errors(); ?>
		</div>
		<?php } ?>
		<form action="<?= base_url('login_register/nuevo_usuario') ?>" method ="POST">
			<div class="col-md-6 login-do">
				<label for="nombre_completo">Nombre Completo</label>
				<div class="login-mail">
					<input type="text" placeholder="Ingrese su nombre completo." required="" id="nombre_completo" name="nombre_completo" value="<?= set_value('nombre_completo'); ?>">
					<i  class="glyphicon glyphicon-font"></i>
				</div>
				<label for="username">Usuario</label>
				<div class="login-mail">
					<input type="text" placeholder="" required="" id="username" name="username" value="<?= set_value('username'); ?>">
					<i  class="	glyphicon glyphicon-sort-by-order"></i>
				</div>
				<label for="contrasenia">Contraseña</label>
				<div class="login-mail">
					<input type="password" placeholder="Ingrese su contraseña" required="" id="contrasenia" name="contrasenia" value="<?= set_value('contrasenia'); ?>" >
					<i  class="glyphicon glyphicon-usd"></i>
				</div>
				<label for="correo">Correo</label>
				<div class="login-mail">
					<input type="text" placeholder="ejemplo@gmail.com" required="" id="correo" name="correo" value="<?= set_value('correo'); ?>">
					<i  class="	glyphicon glyphicon-sort-by-order"></i>
				</div>	   
			</div>
			<div class="col-md-6 login-do">
				<label for="telefono">Teléfono</label>
				<div class="login-mail">
					<input type="text" placeholder="eej:964325675" required="" maxlength="11" id="telefono" name="telefono" value="<?= set_value('telefono'); ?>">
					<i  class="	glyphicon glyphicon-sort-by-order"></i>
				</div>
				<label for="genero">Género</label>
				<div class="login-mail">
					<input type="text" placeholder="Ej: masculino o femenino" required="" id="genero" name="genero" value="<?= set_value('genero'); ?>">
					<i  class="	glyphicon glyphicon-sort-by-order"></i>
				</div>
				<label for="fecha_nacimiento">Fecha de Nacimiento</label>
				<div class="login-mail">
					<input type="date" required="" style="width:478px" id="fecha_nacimiento" name="fecha_nacimiento" value="<?= set_value('fecha_nacimiento'); ?>">&nbsp;&nbsp;
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


