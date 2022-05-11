<h1>Reportes de los Productos</h1>
	<em></em>
	<h2><a href="<?= base_url('home/mostrar')?>">Inicio</a><label>/</label>Reportes de los Productos</h2>
</div>
</div>

<div class="check-out">
<div class="container">
	<h2>Monto Total Generado</h2>
	<div class="bs-example4" data-example-id="simple-responsive-table">
    <div class="table-responsive">
    <table class="table table-bordered table-striped">
		<thead class="table-dark">
		  <tr class="info">
			<th>Total de Clientes</th>
			<th >Monto Total</th>
		  </tr>
		</thead>
			  <tr class="cart-header">
				<div class="clearfix"></div>
				</td>
				<?php foreach ($monto_generado as $mg): ?> 
                    <tr class="cart-header">
                        <div class="clearfix"></div>
                        </td>
                        <td><?= $mg['nro_clientes']; ?></td>
                        <td><?= $mg['precio_total']; ?></td>
                    </tr>
                <?php endforeach; ?>
			  </tr>   
	</table>
	</div>
	</div>

    <h2>Pedidos Ultimos 7 Dias</h2>
	<div class="bs-example4" data-example-id="simple-responsive-table">
    <div class="table-responsive">
    <table class="table table-bordered table-striped">
		<thead class="table-dark">
		  <tr class="info">
			<th>ID</th>
            <th>ID Cliente</th>
			<th>Fecha</th>
            <th>Nombres</th>
            <th>Precio</th>
		  </tr>
		</thead>
			  <tr class="cart-header">
				<div class="clearfix"></div>
				</td>
				<?php foreach ($reporte_siete_dias as $rp): ?> 
                    <tr class="cart-header">
                        <div class="clearfix"></div>
                        </td>
                        <td><?= $rp['id_pago']; ?></td>
                        <td><?= $rp['id_cliente']; ?></td>
                        <td><?= $rp['fecha']; ?></td>
                        <td><?= $rp['nombre']; ?></td>
                        <td><?= $rp['costo']; ?></td>
                    </tr>
                <?php endforeach; ?>
			  </tr>   
	</table>
	</div>
	</div>
	<h2>Meses en los que se obtuvieron ganancias</h2>
	<div class="bs-example4" data-example-id="simple-responsive-table">
    <div class="table-responsive">
    <table class="table table-bordered table-striped">
		<thead class="table-dark">
		  <tr class="info">
			<th>Mes</th>
            <th>Ganancia</th>

		  </tr>
		</thead>
			  <tr class="cart-header">
				<div class="clearfix"></div>
				</td>
				<?php foreach ($meses_ganancias as $mg): ?> 
                    <tr class="cart-header">
                        <div class="clearfix"></div>
                        </td>
                        <td><?= $mg['mes']; ?></td>
                        <td><?= $mg['ganancia']; ?></td>
                    </tr>
                <?php endforeach; ?>
			  </tr>   
	</table>
	</div>
	</div>
</div>
</div>









 