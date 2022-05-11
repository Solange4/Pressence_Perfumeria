<h1>Reportes de los Productos</h1>
	<em></em>
	<h2><a href="<?= base_url('home/mostrar')?>">Inicio</a><label>/</label>Reportes de los Productos</h2>
</div>
</div>

<div class="check-out">
<div class="container">
	<h2>Producto del Mes</h2>
	<div class="bs-example4" data-example-id="simple-responsive-table">
    <div class="table-responsive">
    <table class="table table-bordered table-striped">
		<thead class="table-dark">
		  <tr class="info">
			<th>Producto</th>
			<th >Puntaje Total</th>
			<th >Precio</th>
			<th >Marca</th>
			<th >Categoría</th>
		  </tr>
		</thead>
			  <tr class="cart-header">
				<div class="clearfix"></div>
				</td>
				<td><?=$producto_mes->nombre?></td>
				<td><?=$producto_mes->puntaje?></td>
				<td>$<?=$producto_mes->precio?></td>
				<td><?=$producto_mes->marca?></td>
				<td><?=$producto_mes->categoria?></td>
			  </tr>
	</table>
	</div>
	</div>

	<h2>Cantidad de Productos por Marca</h2>
	<div class="bs-example4" data-example-id="simple-responsive-table">
    <div class="table-responsive">
    <table class="table table-bordered table-striped">
		<thead class="table-dark">
		  <tr class="success">
			<th>Marca</th>
			<th >Cantidad de Productos </th>
		  </tr>
		</thead>
		<?php foreach ($productos1 as $p1): ?> 
			  <tr class="cart-header">
				<div class="clearfix"></div>
				</td>
				<td><?= $p1['nombre']; ?></td>
				<td><?= $p1['nroproductos']; ?></td>
			  </tr>
		<?php endforeach; ?>
		  
	</table>
	</div>
	</div>

	<h2>Cantidad de Productos por Categoria</h2>
	<div class="bs-example4" data-example-id="simple-responsive-table">
    <div class="table-responsive">
    <table class="table table-bordered table-striped">
		<thead class="table-dark">
		  <tr class="info">
			<th>Categoria</th>
			<th >Cantidad de Productos </th>
		  </tr>
		</thead>
		<?php foreach ($productos2 as $p2): ?> 
			  <tr class="cart-header">
				<div class="clearfix"></div>
				</td>
				<td><?= $p2['nombre']; ?></td>
				<td><?= $p2['nroproductos']; ?></td>
			  </tr>
		<?php endforeach; ?>
	</table>
	</div>
	</div>

	<h2>Cantidad de Productos por Tipo</h2>
	<div class="bs-example4" data-example-id="simple-responsive-table">
    <div class="table-responsive">
    <table class="table table-bordered table-striped">
		<thead class="table-dark">
		  <tr class="warning">
			<th>Tipo</th>
			<th >Cantidad de Productos </th>
		  </tr>
		</thead>
		<?php foreach ($productos3 as $p3): ?> 
			  <tr class="cart-header">
				<div class="clearfix"></div>
				</td>
				<td><?= $p3['nombre']; ?></td>
				<td><?= $p3['nroproductos']; ?></td>
			  </tr>
		<?php endforeach; ?>
	</table>
	</div>
	</div>
	<h2>Productos Agregados en las 2 Últimas Semanas</h2>
	<div class="bs-example4" data-example-id="simple-responsive-table">
    <div class="table-responsive">
    <table class="table table-bordered table-striped">
		<thead class="table-dark">
		  <tr class="success">
			<th>Fecha de Ingreso</th>
			<th>Producto</th>
			<th>Precio</th>
			<th>Stock</th>
			<th>Marca</th>
			<th>Tipo</th>
			<th>Categoría</th>
		  </tr>
		</thead>
		<?php foreach ($productos4 as $p4): ?> 
			  <tr class="cart-header">
				<div class="clearfix"></div>
				</td>
				<td><?= $p4['fecha_ingreso']; ?></td>
				<td><?= $p4['nombre']; ?></td>
				<td><?= $p4['precio']; ?></td>
				<td><?= $p4['stock']; ?></td>
				<td><?= $p4['marca']; ?></td>
				<td><?= $p4['tipo']; ?></td>
				<td><?= $p4['categoria']; ?></td>
			  </tr>
		<?php endforeach; ?>
	</table>
	</div>
	</div>
		<h2>Productos Más Económicos</h2>
		<h4>Aquellos que cuestan hasta $20</h4>
	<div class="bs-example4" data-example-id="simple-responsive-table">
    <div class="table-responsive">
    <table class="table table-bordered table-striped">
		<thead class="table-dark">
		  <tr class="info">
			<th>Producto</th>
			<th>Precio</th>
			<th>Marca</th>
			<th>Tipo</th>
			<th>Categoría</th>
		  </tr>
		</thead>
		<?php foreach ($productos5 as $p5): ?> 
			  <tr class="cart-header">
				<div class="clearfix"></div>
				</td>
				<td><?= $p5['nombre']; ?></td>
				<td><?= $p5['precio']; ?></td>
				<td><?= $p5['marca']; ?></td>
				<td><?= $p5['tipo']; ?></td>
				<td><?= $p5['categoria']; ?></td>
			  </tr>
		<?php endforeach; ?>
	</table>
	</div>
	</div>
</div>
</div>









 