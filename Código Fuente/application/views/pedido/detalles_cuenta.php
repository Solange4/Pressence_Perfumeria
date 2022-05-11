<h1>Detalles</h1>
	<em></em>
	<h2><a href="<?= base_url('home/mostrar')?>">Inicio</a><label>/</label>detalles</h2>
</div>
</div>
<div class="container">
	<div class="login">
			<div class="col-md-12 login-do">
				<center>
					<h2>Añadir Detalles</h2>
				</center>
			</div><br><br><br>
		<form action="<?= base_url('pedido/guardar_detalles')?>" method ="POST">
			<div class="col-md-6 login-do">
				<label for="telefono">Teléfono</label>
				<div class="login-mail">
					<input type="text" placeholder="Nombre del Producto" required="" id="telefono" name="telefono" value="<?= set_value('telefono'); ?>">
					<i  class="glyphicon glyphicon-font"></i>
				</div>
				<h4>Dirección a Entregar</h4>
				<label for="calle">Calle</label>
				<div class="login-mail">
					<input type="text" placeholder="Precio del Producto Ej: 40" required="" id="calle" name="calle" value="<?= set_value('calle'); ?>" >
					<i  class="glyphicon glyphicon-usd"></i>
				</div>
				<label for="provincia">Provincia</label>
				<div class="login-mail">
					<input type="text" placeholder="Precio del Producto Ej: 40" required="" id="provincia" name="provincia" value="<?= set_value('provincia'); ?>" >
					<i  class="glyphicon glyphicon-usd"></i>
				</div>
				<label for="pais">País</label>
				<div class="login-mail">
					<input type="text" placeholder="Cantidad Ej:20" required="" id="pais" name="pais" value="<?= set_value('pais'); ?>">
					<i  class="	glyphicon glyphicon-sort-by-order"></i>
				</div>	   
			</div>
			<div class="col-md-6 login-do">
				
				<label for="ciudad">Ciudad</label>
				<div class="login-mail">
					<input type="text" placeholder="Cantidad Ej:20" required="" id="ciudad" name="ciudad" value="<?= set_value('ciudad'); ?>">
					<i  class="	glyphicon glyphicon-sort-by-order"></i>
				</div>
				<label for="referencia">Referencia</label>
				<div class="login-mail">
					<input type="text" placeholder="Cantidad Ej:20" required="" id="referencia" name="referencia" value="<?= set_value('referencia'); ?>">
					<i  class="	glyphicon glyphicon-sort-by-order"></i>
				</div>
				<label for="codigo_postal">Código Postal</label>
				<div class="login-mail">
					<input type="text" placeholder="Cantidad Ej:20" required="" id="codigo_postal" name="codigo_postal" value="<?= set_value('codigo_postal'); ?>">
					<i  class="	glyphicon glyphicon-sort-by-order"></i>
				</div>
		</div>
			</div>
			<div class="col-md-12 login-do">
				<center>
					<label class="hvr-skew-backward">
						<input type="submit" value="Guardar">
					</label>
				</center>
			</div>
			<div class="clearfix"></div>
			<br>
			<center>
					<a href="<?= base_url('pedido/mostrar_pago')?>" class="hvr-skew-backward">Proceder a Realizar Pago</a>
			</center>
		</form>
	</div>
</div>
