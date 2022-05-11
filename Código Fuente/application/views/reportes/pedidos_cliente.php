<h1>Pedidos</h1>
	<em></em>
	<h2><a href="<?= base_url('home/mostrar')?>">Inicio</a><label>/</label>Reportes de los Productos</h2>
</div>
</div>

<div class="check-out">
<div class="container">
<table class="table table-bordered table-striped">
	<thead class="table-dark">
	<tr class="success"><td>Nro de Orden</td><td>Fecha</td><td>Precio</td><td></td></tr>
	</thead>
		<?php foreach ($clientes as $c): ?> 
		<form action="<?= base_url('reportes/pedido_cliente')?>" method ="POST">
			  <tr class="cart-header">
				<div class="clearfix"></div>
				</td>
				<td><?= $c['id']; ?></td>
				<td><?= $c['fecha']; ?></td>
				<td><?= $c['total']; ?></td>
				<input style='display:none' type="text" name="id" value="<?= $c['id']; ?>" />
				<td><button class="hvr-skew-backward" type='submit'>Ver</button></td>
			  </tr>
		</form>
		<?php endforeach; ?>
		  
	</table>
<a href="<?= base_url('reportes/mostrar_reporte_cliente')?>" class="hvr-skew-backward">  Regresar  </a>
</div>
</div>









 