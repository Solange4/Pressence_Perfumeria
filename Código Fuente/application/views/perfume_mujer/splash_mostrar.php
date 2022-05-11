<h1>Mujer</h1>
	<em></em>
	<h2><a href="<?= base_url('home/mostrar')?>">Inicio</a><label>/</label>Mujer<label>/</label>Splash de Perfume</h2>
</div>
</div>
<div class="product">
	<div class="container">
		<div class="col-md-9">
			<div class="mid-popular">
<!-- PRODUCTS VIEW -->

		

<?php foreach ($splashs as $splash): ?>
	<div class="col-md-4 item-grid1 simpleCart_shelfItem">
		<div class=" mid-pop">
			<div class="pro-img">
				<img src="<?= base_url('product_images/'.$splash['id'].'.png')?>" class="img-responsive" alt="">
				<div class="zoom-icon ">
					<!-- IMAGEN DEL PRODUCTO -->
					<a class="picture" href="<?= base_url('product_images/'.$splash['id'].'.png')?>" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
					<a href="<?= base_url('perfume/perfume_producto/'.$splash['id']); ?>"><i class="glyphicon glyphicon-menu-right icon"></i></a>
				</div>
			</div>
			<div class="mid-1">
				<div class="women">
					<div class="women-top">
						<span><?= $splash['marca_nombre'];?></span>
						<h6><a href="#"><?= $splash['nombre']; ?></a></h6>
					</div>
					<!-- IMAGEN DEL CARRITO -->
					<div class="img item_add">
					<?php if ($this->session->userdata('logged_in')){?>
						<a href="<?= base_url('pedido/comprar/'.$splash['id']); ?>"><img src="<?= base_url('assets/images/ca.png')?>" alt="" width="40" height="40"></a>
					<?php 	}else{ ?>
						<a href="<?= base_url('login_register/iniciar_sesion'); ?>"><img src="<?= base_url('assets/images/ca.png')?>" alt="" width="40" height="40"></a>
					<?php } ?>
					</div>
					<!-- //IMAGEN DEL CARRITO -->
					<div class="clearfix"></div>
				</div>
			<div class="mid-2">
				<!--<p ><label>$100.00</label><em class="item_price">$70.00</em></p>-->
				<p ><em class="item_price">$<?= $splash['precio'];?></em></p>
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
<!-- PRODUCTS END VIEW -->
	<div class="clearfix"></div>
	</div>
	</div>
	<div class="col-md-3 product-bottom">
	<!--categories-->
		<div class=" rsidebar span_1_of_left">
		<?php if ($this->session->userdata('is_admin')){?>
			<a href="<?= base_url('perfume/crear')?>" class="hvr-skew-backward"><i class="glyphicon glyphicon-plus icon "></i>  Nuevo Producto</a> <br><br>
		<?php 	} ?>
			<h4 class="cate">Categorias</h4>
				<ul class="menu-drop">
					<li class="item1"><a href="#">Mujer </a>
						<ul class="cute">
							<li class="subitem1"><a href="<?=base_url('perfume_mujer/mostrar_agua_perfume')?>">Agua de Perfume </a></li>
							<li class="subitem2"><a href="<?=base_url('perfume_mujer/mostrar_agua_banio')?>">Agua de Baño </a></li>
							<li class="subitem3"><a href="<?=base_url('perfume_mujer/mostrar_agua_colonia')?>">Agua de Colonia </a></li>
							<li class="subitem1"><a href="<?=base_url('perfume_mujer/mostrar_splash')?>">Splash de Perfume </a></li>
						</ul>
					</li>
					<li class="item2"><a href="#">Hombre </a>
						<ul class="cute">
							<li class="subitem1"><a href="<?=base_url('perfume_hombre/mostrar_agua_perfume')?>">Agua de Perfume </a></li>
							<li class="subitem2"><a href="<?=base_url('perfume_hombre/mostrar_agua_banio')?>">Agua de Baño </a></li>
							<li class="subitem3"><a href="<?=base_url('perfume_hombre/mostrar_agua_colonia')?>">Agua de Colonia </a></li>
							<li class="subitem1"><a href="<?=base_url('perfume_hombre/mostrar_splash')?>">Splash de Perfume </a></li>
						</ul>
					</li>
					<li class="item3"><a href="#">Niños</a>
						<ul class="cute">
							<li class="subitem1"><a href="<?=base_url('perfume_kid/mostrar_agua_perfume')?>">Agua de Perfume </a></li>
							<li class="subitem2"><a href="<?=base_url('perfume_kid/mostrar_agua_banio')?>">Agua de Baño </a></li>
							<li class="subitem3"><a href="<?=base_url('perfume_kid/mostrar_agua_colonia')?>">Agua de Colonia </a></li>
							<li class="subitem1"><a href="<?=base_url('perfume_kid/mostrar_splash')?>">Splash de Perfume </a></li>
						</ul>
					</li>
				</ul>
		</div>
				<!--initiate accordion-->
						<script type="text/javascript">
							$(function() {
							    var menu_ul = $('.menu-drop > li > ul'),
							           menu_a  = $('.menu-drop > li > a');
							    menu_ul.hide();
							    menu_a.click(function(e) {
							        e.preventDefault();
							        if(!$(this).hasClass('active')) {
							            menu_a.removeClass('active');
							            menu_ul.filter(':visible').slideUp('normal');
							            $(this).addClass('active').next().stop(true,true).slideDown('normal');
							        } else {
							            $(this).removeClass('active');
							            $(this).next().stop(true,true).slideUp('normal');
							        }
							    });
							
							});
						</script>
<!--//menu-->
		</div>
			<div class="clearfix"></div>
			</div>