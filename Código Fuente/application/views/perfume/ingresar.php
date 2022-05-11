<h1>Nuevo Producto</h1>
	<em></em>
	<h2><a href="<?= base_url('home/mostrar')?>">Inicio</a><label>/</label>Nuevo Producto</h2>
</div>
</div>
<div class="container">
	<div class="login">
			<div class="col-md-12 login-do">
				<center>
					<h2>Ingresar Nuevo Producto</h2>
				</center>
			</div><br><br><br>
		<form action="<?= base_url('perfume/guardar')?>" method ="POST" enctype="multipart/form-data">
			<div class="col-md-6 login-do">
				<label for="nombre">Nombre</label>
				<div class="login-mail">
					<input type="text" placeholder="Nombre del Producto" required="" id="nombre" name="nombre" value="<?= set_value('nombre'); ?>">
					<i  class="glyphicon glyphicon-font"></i>
				</div>
				<label for="categoria">Categoría</label>
				<div class="login-mail">
					<select class="form-control" name="categoria" id="categoria">
						<option value="">Elegir Categoría</option>
						<?php foreach($categorias as $cat):?>
							<option value="<?php echo $cat->id;?>"><?php echo $cat->nombre;?>
							</option>
						<?php endforeach;?>	
					</select>
					<i  class="glyphicon glyphicon-pushpin"></i>
				</div>
				<label for="tipo">Tipo</label>
				<div class="login-mail"> 
					<select class="form-control" name="tipo" id="tipo">
						<option value="">Elegir Tipo</option>
						<?php foreach($tipos as $tip):?>
							<option value="<?php echo $tip->id;?>"><?php echo $tip->nombre;?>
							</option>
						<?php endforeach;?>	
					</select>
					<i  class="glyphicon glyphicon-pushpin"></i>
				</div>
				<label for="marca">Marca</label>
				<div class="login-mail">
					<select class="form-control" name="marca" id="marca">
						<option value="">Elegir Marca</option>
						<?php foreach($marcas as $mar):?>
							<option value="<?php echo $mar->id;?>"><?php echo $mar->nombre;?>
							</option>
						<?php endforeach;?>	
					</select>
					<i class="glyphicon glyphicon-pushpin"></i>
				</div>
				<label for="descripcion">Descripción</label>
				<div class="login-mail">
					<textarea class="form-control" id="descripcion" name="descripcion" rows="10" cols="480" ><?=set_value('descripcion')?></textarea>
					<i  class="glyphicon glyphicon-align-justify" ></i>
				</div>	   
			</div>
			<div class="col-md-6 login-do">
				<label for="precio">Precio</label>
				<div class="login-mail">
					<input type="text" placeholder="Precio del Producto Ej: 40" required="" id="precio" name="precio" value="<?= set_value('precio'); ?>" >
					<i  class="glyphicon glyphicon-usd"></i>
				</div>
				<label for="nombre">Stock</label>
				<div class="login-mail">
					<input type="text" placeholder="Cantidad Ej:20" required="" id="stock" name="stock" value="<?= set_value('stock'); ?>">
					<i  class="	glyphicon glyphicon-sort-by-order"></i>
				</div>
				<label for="fecha_ingreso">Fecha de Ingreso</label>
				<div class="login-mail">
					<input type="date" required="" style="width:478px" id="fecha_ingreso" name="fecha_ingreso" value="<?= set_value('fecha_ingreso'); ?>">&nbsp;
					<i class="glyphicon glyphicon-calendar"></i>				
				</div>
				<!--
				<label for="fecha_ingreso">ID</label>
				<div class="login-mail">
					<input type="text" required="" style="width:478px" id="id" name="id" value="<?= set_value('id'); ?>">&nbsp;
					<i class="glyphicon glyphicon-user"></i>				
				</div>-->
				<label for="product_image">Imágenes del Producto </label>
				<div class="login-mail">
					<input type="file" class="form-control" id="profile_image" name="profile_image" value="<?= set_value('profile_image'); ?>" placeholder="Imagen" required>
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
		</form>
	</div>
</div>


