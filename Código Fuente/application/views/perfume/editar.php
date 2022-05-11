<h1>Editar Producto</h1>
	<em></em>
	<h2><a href="<?= base_url('home/mostrar')?>">Inicio</a><label>/</label>Editar Producto</h2>
</div>
</div>
<div class="container">
	<div class="login">
			<div class="col-md-12 login-do">
				<center>
					<h2>Editar Producto</h2>
				</center>
			</div><br><br><br>
		<form action="<?= base_url('perfume/actualizar/'.$perfumes->id) ?>" method ="POST">
			<div class="col-md-6 login-do">
				<label for="nombre">Nombre</label>
				<div class="login-mail">
					<input type="text" required="" id="nombre" name="nombre" value="<?= $perfumes->nombre ;?>">
					<i  class="glyphicon glyphicon-font"></i>
				</div>
		
				<label for="categoria">Categoría</label>
				<div class="login-mail">
					<select class="form-control" name="categoria" id="categoria">
						<option value="">Elegir Categoría</option>
						<?php foreach($categorias as $cat):?>
							<option value="<?php echo $cat->id;?>"<?php if ($cat->id == $perfumes->id_categoria) echo 'selected'; ?>><?php echo     $cat->nombre;?>
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
							<option value="<?php echo $tip->id;?>"<?php if ($tip->id == $perfumes->tipo_id) echo 'selected'; ?> value="<?php echo $tip->id ?>"><?php echo $tip->nombre;?>
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
							<option value="<?php echo $mar->id;?>"<?php if ($mar->id = $perfumes->id_marca) echo 'selected'; ?>><?php echo     $mar->nombre;?>
							</option>
						<?php endforeach;?>	
					</select>
					<i class="glyphicon glyphicon-pushpin"></i>
				</div>
				<label for="descripcion">Descripción</label>
				<div class="login-mail">
					<textarea class="form-control" id="descripcion" name="descripcion" rows="10" cols="480" ><?=$perfumes->descripcion?></textarea>
					<i  class="glyphicon glyphicon-align-justify" ></i>
				</div>	   
			</div>
			<div class="col-md-6 login-do">
				<label for="precio">Precio</label>
				<div class="login-mail">
					<input type="text" placeholder="Precio del Producto Ej: 40" required="" id="precio" name="precio" value="<?= $perfumes->precio ?>" >
					<i  class="glyphicon glyphicon-usd"></i>
				</div>
				<label for="nombre">Stock</label>
				<div class="login-mail">
					<input type="text" placeholder="Cantidad Ej:20" required="" id="stock" name="stock" value="<?= $perfumes->stock ?>">
					<i  class="	glyphicon glyphicon-sort-by-order"></i>
				</div>
				<label for="fecha_ingreso">Fecha de Ingreso</label>
				<div class="login-mail">
					<input type="date" required="" style="width:478px" id="fecha_ingreso" name="fecha_ingreso" value="<?= $perfumes->fecha_ingreso?>">&nbsp;
					<i class="glyphicon glyphicon-calendar"></i>				
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


