<h1>Lista de Deseos</h1>
		<em></em>
		<h2><a href="index.html">Inicio</a><label>/</label>Lista de Deseos</h2>
	</div>
</div>
<div class="product">
	<div class="container">
		<div class="col-md-9">
			<div class="mid-popular">
<!--login-->
<?php foreach ($favoritos as $fav): ?>

	<div class="col-md-4 item-grid1 simpleCart_shelfItem">
		<div class=" mid-pop">
			<div class="pro-img">
				<img src="<?= base_url('product_images/'.$fav['id'].'.png')?>" class="img-responsive" alt="">
				<div class="zoom-icon ">
					<!-- IMAGEN DEL PRODUCTO -->
					<a class="picture" href="<?= base_url('product_images/'.$fav['id'].'.png')?>" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
					<a href="<?= base_url('perfume/perfume_producto/'.$fav['id']); ?>"><i class="glyphicon glyphicon-menu-right icon"></i></a>
				</div>
			</div>
			<div class="mid-1">
				<div class="women">
					<div class="women-top">
						<span><?= $fav['marca_nombre'];?></span>
						<h6><a href="single.html"><?= $fav['nombre']; ?></a></h6>
					</div>
					<!-- IMAGEN DEL CARRITO -->
					<div class="img item_add">
						<a href="<?= base_url('pedido/comprar/'.$fav['id']); ?>"><img src="<?= base_url('assets/images/ca.png')?>" alt="" width="40" height="40"></a>
					</div>
					<!-- //IMAGEN DEL CARRITO -->
					<div class="clearfix"></div>
				</div>
			<div class="mid-2">
				<!--<p ><label>$100.00</label><em class="item_price">$70.00</em></p>-->
				<p ><em class="item_price">$<?= $fav['precio'];?></em></p>
			<?php if ($this->session->userdata('is_admin')){?>
                <a href="<?= base_url('perfume/editar/'.'id'); ?>" class="text-primary"><i class="fa fa-fw fa-edit pull-right"></i></a>  
                <a href="<?= base_url('perfume/eliminar/'.'id'); ?>" class="text-danger" onClick="return confirm('¿Está seguro que desea eliminar este registro?');"><i class="fa fa-fw fa-trash pull-right"></i></a>
            <?php 	} ?>
          </td>
				<div class="block">
					<div class="starbox small ghosting">
						
					</div>
				</div>						
				<div class="clearfix"></div>

			</div>								
		</div>
	</div>
	</div>
<?php endforeach; ?>
<br>
<!--categories-->
</div>


<!--//menu-->
	<div class="clearfix"></div>
	</div>
	</div>


<!--//login-->