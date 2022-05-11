<div class="container">
				<div class="content-top">
					<div class="col-md-6 col-md">
						<div class="col-1">
						 <a href="<?= base_url('perfume/perfume_producto/'.$producto_mes->id); ?>" class="b-link-stroke b-animate-go  thickbox">
		   <img src="<?= base_url('assets/images/pi.jpg')?>" class="img-responsive" alt=""/><div class="b-wrapper1 long-img"><p class="b-animate b-from-right    b-delay03 ">Lujoso</p><label class="b-animate b-from-right    b-delay03 "></label><h3 class="b-animate b-from-left    b-delay03 ">Moderno</h3></div></a>

							<!---<a href="single.html"><img src="<?= base_url('assets/images/pi.jpg')?>" class="img-responsive" alt=""></a>-->
						</div>
						<div class="col-2">
							<span>Producto del Mes</span>
							<h2><a href="#"><?= $producto_mes->nombre ?></a></h2>
							<p><?= $producto_mes->perfume_descripcion ?></p>
							<a href="<?= base_url('perfume/perfume_producto/'.$producto_mes->id); ?>" class="buy-now">Compra Ahora</a>
						</div>
					</div>
					<div class="col-md-6 col-md1">
						<div class="col-3">
							<a href="<?= base_url('perfume_hombre/mostrar_todo')?>"><img src="<?= base_url('assets/images/pi1.jpg')?>" class="img-responsive" alt="">
							<div class="col-pic">
								<p>Productos</p>
								<label></label>
								<h5>Para Hombres</h5>
							</div></a>
						</div>
						<div class="col-3">
							<a href="<?= base_url('perfume_kid/mostrar_todo')?>"><img src="<?= base_url('assets/images/pi2.jpg')?>" class="img-responsive" alt="">
							<div class="col-pic">
								<p>Productos</p>
								<label></label>
								<h5>Para Niños</h5>
							</div></a>
						</div>
						<div class="col-3">
							<a href="<?= base_url('perfume_mujer/mostrar_todo')?>"><img src="<?= base_url('assets/images/pi3.jpg')?>" class="img-responsive" alt="">
							<div class="col-pic">
								<p>Productos</p>
								<label></label>
								<h5>Para Mujeres</h5>
							</div></a>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<!--products-->
			<div class="content-mid">
				<h3>Productos Más Recientes</h3>
				<label class="line"></label>
				<div class="mid-popular">

					<?php foreach ($productos_recientes as $pr): ?>
					<div class="col-md-3 item-grid simpleCart_shelfItem">
					<div class=" mid-pop">
					<div class="pro-img">
						<img src="<?= base_url('product_images/'.$pr['id'].'.png')?>" class="img-responsive" alt="">
						<div class="zoom-icon ">
						<a class="picture" href="<?= base_url('product_images/'.$pr['id'].'.png')?>" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>

						<a href="<?= base_url('perfume/perfume_producto/'.$pr['id']); ?>"><i class="glyphicon glyphicon-menu-right icon"></i></a>
						</div>
						</div>
						<div class="mid-1">
						<div class="women">
						<div class="women-top">
							<span><?= $pr['marca']?></span>
							<h6><a href="#"><?= $pr['nombre']?></a></h6>
							</div>
							<div class="img item_add" >
								<a href="<?= base_url('pedido/comprar/'.$pr['id']); ?>"><img src="<?= base_url('assets/images/ca.png')?>" alt="" height="40" width="40"></a>
							</div>
							<div class="clearfix"></div>
							</div>
							<div class="mid-2">
								<p ><em class="item_price"><?= $pr['precio']?></em></p>
								  <div class="block">
									<div class="starbox small ghosting"> </div>
								</div>
								
								<div class="clearfix"></div>
							</div>
							
						</div>
					</div>
					</div>
				<?php endforeach; ?>
			</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<!--//products-->

<!-- MAGIC ENDS HERE -->