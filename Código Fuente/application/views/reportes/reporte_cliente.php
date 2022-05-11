<h1>Reportes de los Clientes</h1>
	<em></em>
	<h2><a href="<?= base_url('home/mostrar')?>">Inicio</a><label>/</label>Reportes de los Clientes</h2>
</div>
</div>


<div class="check-out">
<div class="container">
	<h2>Cantidad de Clientes</h2>
	<div class="bs-example4" data-example-id="simple-responsive-table">
    <div class="table-responsive">
    <table class="table table-bordered table-striped">
		<thead class="table-dark">
		  <tr class="success">
			<th >Cantidad de Clientes </th>
		  </tr>
		</thead>
		<?php foreach ($clientes1 as $c1): ?> 
			  <tr class="cart-header">
				<div class="clearfix"></div>
				</td>
				<td><?= $c1['nroclientes']; ?></td>
			  </tr>
		<?php endforeach; ?>
		  
	</table>
	</div>
	</div>
</div>
</div>


<div class="check-out">
<div class="container">
	<div class="bs-example4" data-example-id="simple-responsive-table">
    <div class="table-responsive">
    <table class="table table-bordered table-striped">
		<thead class="table-dark">
		  <tr class="success">
			<th >Cliente estrella </th><th>Total de pedidos</th><th></th>
		  </tr>
		</thead>
		<?php foreach ($cliente as $e): ?> 
				<form action="<?= base_url('reportes/pedidos_cliente')?>" method ="POST">
				<tr class="cart-header">
					<div class="clearfix"></div>
					</td>
					<td><?= $e['nombre']; ?></td>
					<td><?= $e['total']; ?></td>
					<input style='display:none' type="text" name="id" value="<?= $e['id']; ?>" />
					<td><button  class="hvr-skew-backward" type='submit'>Ver</button></td>
				</tr>
				</form>
			<?php endforeach; ?>
</table>
</div>
</div>



<div class="check-out">
<div class="container">
	<table class="table table-bordered table-striped">
	<thead class="table-dark">
	<tr class="success"><td>Nombres</td><td>Número de pedidos</td><td></td></tr> 
	</thead>
			<?php foreach ($clientes as $c): ?> 
				<form action="<?= base_url('reportes/pedidos_cliente')?>" method ="POST">
				<tr class="cart-header">
					<div class="clearfix"></div>
					</td>
					<td><?= $c['nombre']; ?></td>
					<td><?= $c['total']; ?></td>
					<input style='display:none' type="text" name="id" value="<?= $c['id']; ?>" />
					<td><button class="hvr-skew-backward" type='submit'>Ver</button></td>
				</tr>
				</form>
			<?php endforeach; ?>

	</table>
</div>
</div>
