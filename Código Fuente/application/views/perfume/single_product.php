<h1>Producto</h1>
	<em></em>
	<h2><a href="<?= base_url('home/mostrar')?>">Inicio</a><label>/</label>Producto</h2>
</div>
</div>
<div class="single">

<div class="container">
<div class="col-md-9">
	<div class="col-md-5 grid">		
		<div class="flexslider">
			  <ul class="slides">
			    <li data-thumb="<?= base_url('assets/images/si.jpg')?>">
			        <div class="thumb-image"> <img src="<?= base_url('product_images/'.$perfumes->id.'.png')?>" data-imagezoom="true" class="img-responsive"> </div>
			    </li>
			    <!--<li data-thumb="<?= base_url('assets/images/si1.jpg')?>">
			         <div class="thumb-image"> <img src="<?= base_url('assets/images/si1.jpg')?>" data-imagezoom="true" class="img-responsive"> </div>
			    </li>
			    <li data-thumb="<?= base_url('assets/images/si2.jpg')?>">
			       <div class="thumb-image"> <img src="<?= base_url('assets/images/si2.jpg')?>" data-imagezoom="true" class="img-responsive"> </div>
			    </li> -->
			  </ul>
		</div>
	</div>	
<div class="col-md-7 single-top-in">
						<div class="span_2_of_a1 simpleCart_shelfItem">
				<h3><?=$perfumes->nombre ?></h3>
				<!--
				<p class="in-para"> Tipo: <?=$perfumes->tipo_nombre ?></p>-->
			    <div class="price_single">
				  <span class="reducedfrom item_price">$ <?=$perfumes->precio?></span>
				 <div class="clearfix"></div>
				</div>
				<h4 class="quick">Marca:</h4>
				<p class="quick"> <?=$perfumes->marca_nombre ?></p>
				<h4 class="quick">Tipo:</h4>
				<p class="quick"> <?=$perfumes->tipo_nombre ?></p>
			    <div class="wish-list">
				 	<ul>
				 <?php if ($this->session->userdata('logged_in')){?>	
				 	<?php if ($is_fav) { ?>
				 		<li class="wish"><a href="<?= base_url('favorito/eliminar/'. $perfumes->id)?>"><span class="glyphicon glyphicon-check" aria-hidden="true"></span>Quitar de Favoritos</a></li>				 		
				 	<?php } else { ?>
						<li class="wish"><a href="<?= base_url('favorito/ingresar/'. $perfumes->id)?>"><span class="glyphicon glyphicon-check" aria-hidden="true"></span>Añadir a Favoritos</a></li>
				 	<?php } ?>
				 <?php } else{?>
				 	<li class="wish"><a href="<?= base_url('login_register/iniciar_sesion')?>"><span class="glyphicon glyphicon-check" aria-hidden="true"></span>Añadir a Favoritos</a></li>
				 <?php } ?>
				 	    
				 	</ul>
				 </div>
	<!--
				 <div class="quantity"> 
								<div class="quantity-select">                           
									<div class="entry value-minus">&nbsp;</div>
									<div class="entry value"><span>1</span></div>
									<div class="entry value-plus active">&nbsp;</div>
								</div>
							</div>
							<!--quantity-->
	<!--<script>
    $('.value-plus').on('click', function(){
    	var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)+1;
    	divUpd.text(newVal);
    });

    $('.value-minus').on('click', function(){
    	var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)-1;
    	if(newVal>=1) divUpd.text(newVal);
    });
	</script>-->
	<!--quantity-->
				 <?php if ($this->session->userdata('logged_in')){?>
			    	<a href="<?= base_url('pedido/comprar/'.$perfumes->id); ?>" class="add-to item_add hvr-skew-backward">Añadir a carrito</a>
			    <?php } ?>
			<div class="clearfix"> </div>
			</div>
		
					</div>
			<div class="clearfix"> </div>
			<!---->
			<div class="tab-head">
			 <nav class="nav-sidebar">
		<ul class="nav tabs">
          <li class="active"><a href="#tab1" data-toggle="tab">Descripción del Producto</a></li>
          <li class=""><a href="#tab2" data-toggle="tab"><?=$perfumes->tipo_nombre ?></a></li> 
          <li class=""><a href="#tab3" data-toggle="tab">Reseñas</a></li>
          <?php if ($this->session->userdata('logged_in')){?>
          	<li class=""><a href="#tab4" data-toggle="tab">Añadir Reseña</a></li>
          <?php } ?>
		</ul>
	</nav>
	<div class="tab-content one">
<div class="tab-pane active text-style" id="tab1">
 <div class="facts">
									  <p > <?=$perfumes->descripcion ?> </p>        
							        </div>

</div>
<div class="tab-pane text-style" id="tab2">
	
									<div class="facts">									
										<p > <?=$perfumes->tipo_descripcion ?> </p>
							        </div>	

</div>

<!-- OPINION-->
<div class="tab-pane text-style" id="tab3">

									<?php foreach ($opiniones as $op): ?>
										
									
									 <div class="facts">
										<p > 
											<h5> <?=$op['cliente'] ?></h5>
											<h5>Puntaje: <?=$op['puntuacion'] ?>/5</h5>
											<p > <?=$op['opinion'] ?> </p>
										</p>     
							     	</div>
							     	<?php endforeach ?>	

 </div>

<div class="tab-pane text-style" id="tab4">
		<form action="<?= base_url('opinion/guardar/'.$perfumes->id)?>" method ="POST">
			<div class="col-md-12 login-do">
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
  <div class="clearfix"></div>
  </div>
			<!---->	
</div>
<div class="col-md-3 product-bottom">
	<!--categories-->
		<div class=" rsidebar span_1_of_left">
			<!--<a href="<?= base_url('perfume/crear')?>" class="hvr-skew-backward"><i class="glyphicon glyphicon-plus icon "></i>  Nuevo Producto</a> <br><br>-->
			<h4 class="cate">Categorias</h4>
				<ul class="menu-drop">
					<li class="item1"><a href="#">Mujer </a>
						<ul class="cute">
							<li class="subitem1"><a href="product.html">Agua de Perfume </a></li>
							<li class="subitem2"><a href="product.html">Agua de Baño </a></li>
							<li class="subitem3"><a href="product.html">Agua de Colonia </a></li>
							<li class="subitem1"><a href="product.html">Splash de Perfume </a></li>
						</ul>
					</li>
					<li class="item2"><a href="#">Hombre </a>
						<ul class="cute">
							<li class="subitem1"><a href="product.html">Agua de Perfume </a></li>
							<li class="subitem2"><a href="product.html">Agua de Baño </a></li>
							<li class="subitem3"><a href="product.html">Agua de Colonia </a></li>
							<li class="subitem1"><a href="product.html">Splash de Perfume </a></li>
						</ul>
					</li>
					<li class="item3"><a href="#">Niños</a>
						<ul class="cute">
							<li class="subitem1"><a href="product.html">Agua de Perfume </a></li>
							<li class="subitem2"><a href="product.html">Agua de Baño </a></li>
							<li class="subitem3"><a href="product.html">Agua de Colonia </a></li>
							<li class="subitem1"><a href="product.html">Splash de Perfume </a></li>
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
				<!--products-->
			
			<!--//products-->