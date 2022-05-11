<h1>Pedidos</h1>
	<em></em>
	<h2><a href="<?= base_url('home/mostrar')?>">Inicio</a><label>/</label>Reportes de los Productos</h2>
</div>
</div>

<div class="check-out">
<div class="container">
<table class="table table-bordered table-striped">
	<thead class="table-dark">
	<tr class="success"><td>Producto</td><td>Marca</td><td>Precio</td></tr>
	</thead>
		<?php foreach ($perfumes as $p): ?> 
			  <tr class="cart-header">
				<div class="clearfix"></div>
				</td>
				<td><?= $p['perfume']; ?></td>
				<td><?= $p['marca']; ?></td>
				<td><?= $p['precio']; ?></td>
			  </tr>
		<?php endforeach; ?>
		  		  
</table>

<form action="<?= base_url('reportes/pedidos_cliente')?>" method ="POST">
<input style='display:none' type="text" name="id" value="<?= $p['cliente']; ?>" />
<button type='submit'  class="hvr-skew-backward">Regresar</button>
</form>
</div>
</div>









 