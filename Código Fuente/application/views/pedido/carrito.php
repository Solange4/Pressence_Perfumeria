		<h1>Carrito</h1>
		<em></em>
		<h2><a href="index.html">Inicio</a><label>/</label>Carrito</h2>
	</div>
</div>
      <style>
         table, td, th {
            border: 1px solid black;
            width: 300px;
         }
      </style>
<!--login-->
	<script>$(document).ready(function(c) {
					$('.close1').on('click', function(c){
						$('.cart-header').fadeOut('slow', function(c){
							$('.cart-header').remove();
						});
						});	  
					});
			   </script>
<script>$(document).ready(function(c) {
					$('.close2').on('click', function(c){
						$('.cart-header1').fadeOut('slow', function(c){
							$('.cart-header1').remove();
						});
						});	  
					});
			   </script>
			   <script>$(document).ready(function(c) {
					$('.close3').on('click', function(c){
						$('.cart-header2').fadeOut('slow', function(c){
							$('.cart-header2').remove();
						});
						});	  
					});
			   </script>

<div class="check-out">
<div class="container">
	
	<div class="bs-example4" data-example-id="simple-responsive-table">
    <div class="table-responsive">
    	 <table class="table table-bordered table-striped">
		  <tr>
			<th style="text-align:center">Producto</th>
					
			<th style="text-align:center">Precio</th>
			<th style="text-align:center">Cantidad </th>
			<th style="text-align:center">Marca</th>
			<th style="text-align:center">Acciones</th>
		  </tr>
		  <tr class="cart-header">
		  	<?php foreach ($perfumes as $per): ?>
			<td class="ring-in">
				<a href="single.html" class="at-in"><img src="<?= base_url('product_images/'.$per['perfume_id'].'.png')?>" class="img-responsive" alt=""></a>
			<div class="sed">
				<h5><a href="single.html"><?= $per['producto']?></a></h5>
				<p>Tipo: <?=$per['tipo']?></p>
			
			</div>
			<div class="clearfix"> </div>

			<td style="text-align:center">$<?= $per['precio']?></td>
			<center>
			<td style="text-align:center">
				 <div class="quantity" style="text-align:center"> 
								<div class="quantity-select">    
									<a href="<?= base_url('pedido/reducir_cantidad/'.$per['perfume_id'])?>" class="hvr-skew-backward"><i class="glyphicon glyphicon-minus icon "></i></a>                       
									<div class="entry value"><span><?= $per['cantidad']?></span></div>
									<a href="<?= base_url('pedido/comprar/'.$per['perfume_id'])?>" class="hvr-skew-backward"><i class="glyphicon glyphicon-plus icon "></i></a>
								</div>
							</div>
							<!--quantity-->
			<script>
		    $('.value-plus').on('click', function(){
		    	var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)+1;
		    	divUpd.text(newVal);
		    });

		    $('.value-minus').on('click', function(){
		    	var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)-1;
		    	if(newVal>=1) divUpd.text(newVal);
		    });
			</script>
			<!--quantity-->
			</td>
			</center>
			<td class="item_price" style="text-align:center"><?=$per['marca']?></td>
			<td class="add-check"><div class="produced">
					<a href="<?= base_url('pedido/eliminar_producto_carrito/' .$per['perfume_id'] )?>" class="hvr-skew-backward">Quitar Producto</a></div>

			</td>
		  </tr>
		  	<?php endforeach; ?>
		  
	</table>

	</div>
	</div>
</div>
</div>

<div class="check-out">
<div class="container">
	<a href="#" class="hvr-skew-backward"><i class="fa fa-refresh" aria-hidden="true"></i> Actualizar Boleta del Pedido</a> <br>
	<div class="bs-example4" data-example-id="simple-responsive-table">
    <div class="table-responsive">
    <table class="table table-bordered table-striped">
		<thead class="table-dark">
		  <tr>
			<th>Producto</th>
			<th>Monto</th>
		  </tr>
		</thead>
		<?php foreach ($montos as $monto): ?>
			  <tr class="cart-header">
				<div class="clearfix"></div>
				</td>
				<th scope="row"><?= $monto['producto']?></th>
				<td><?= $monto['monto']?></td>
			  </tr>
		<?php endforeach; ?>
		<tr></tr>
		<tr class="danger">
			<td >Total</td>
			<td><?= $total->total ?></td>
		</tr> 
	</table>
	</div>
	</div>
</div>
</div>
<div class="produced">
	<a href="<?= base_url('pedido/mostrar_pago')?>" class="hvr-skew-backward">Proceder A Comprar</a>
</div>
