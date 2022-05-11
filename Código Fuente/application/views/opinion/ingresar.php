<h1>Nuevo Comentario</h1>
	<em></em>
	<h2><a href="<?= base_url('home/mostrar')?>">Inicio</a><label>/</label>Nuevo Comentario</h2>
</div>
</div>
<div class="container">
	<div class="login">
			<div class="col-md-12 login-do">
				<center>
					<h2>Ingresar Nuevo Comentario</h2>
				</center>
			</div><br><br><br>
		<form action="<?= base_url('opinion/guardar')?>" method ="POST" enctype="multipart/form-data">
			<div class="col-md-6 login-do">
				<label for="id_producto">Perfume</label>
				<div class="login-mail">
					<select class="form-control" name="id_producto" id="id_producto">
						<option value="">Elegir el perfume que desea evaluar</option>
						<?php foreach($perfumes as $p):?>
							<option value="<?php echo $p->id;?>"><?php echo $p->nombre;?>
							</option>
						<?php endforeach;?>	
					</select>
					<i  class="glyphicon glyphicon-pushpin"></i>
				</div>
				<label for="puntuacion">Puntuacion</label>
				<div class="login-mail">
					<input type="text" placeholder="Ingresar un valor entre 0 y 5" required="" id="puntuacion" name="puntuacion" value="<?= set_value('puntuacion'); ?>">
					<i  class="glyphicon glyphicon-star"></i>
				</div>
				<label for="opinion">Opinion</label>
				<div class="login-mail">
					<textarea class="form-control" id="opinion" name="opinion" rows="10" cols="480" ><?=set_value('opinion')?></textarea>
					<i  class="glyphicon glyphicon-align-justify" ></i>
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