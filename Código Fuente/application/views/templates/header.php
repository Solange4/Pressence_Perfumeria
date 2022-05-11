<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>Pressence</title>
<link href="<?= base_url('assets/css/bootstrap.css')?>" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<!--theme-style-->
<link href="<?= base_url('assets/css/style.css')?>" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Pressence" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--theme-style-->
<link href="<?= base_url('assets/css/style4.css')?>" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<script src="<?= base_url('assets/js/jquery.min')?>.js"></script>
<!--- start-rate---->
<script src="<?= base_url('assets/js/jstarbox.js')?>"></script>
	<link rel="stylesheext" href="<?= base_url('assets/css/jstarbox.css')?>" type="text/css" media="screen" charset="utf-8" />
		<script type="text/javascript">
			jQuery(function() {
			jQuery('.starbox').each(function() {
				var starbox = jQuery(this);
					starbox.starbox({
					average: starbox.attr('data-start-value'),
					changeable: starbox.hasClass('unchangeable') ? false : starbox.hasClass('clickonce') ? 'once' : true,
					ghosting: starbox.hasClass('ghosting'),
					autoUpdateAverage: starbox.hasClass('autoupdate'),
					buttons: starbox.hasClass('smooth') ? false : starbox.attr('data-button-count') || 5,
					stars: starbox.attr('data-star-count') || 5
					}).bind('starbox-value-changed', function(event, value) {
					if(starbox.hasClass('random')) {
					var val = Math.random();
					starbox.next().text(' '+val);
					return val;
					} 
				})
			});
		});
		</script>
<!---//End-rate---->

</head>
<body>

<!--HEADER-->
<div class="header">
	<div class="container">
		<div class="head">
			<!-- LOGO -->
			<div class=" logo">
				<a href="<?= base_url('home/mostrar')?>"><img src="<?= base_url('assets/images/pressence_log1.png')?>" alt="" width="170" height="102"></a>	
			</div>
		</div>
	</div>
	<!-- HEADER TOP -->	
	<div class="header-top">
		<div class="container">
			<!-- LOGIN -->
			<div class="col-sm-5 col-md-offset-2  header-login">
				<ul>
					<?php if (!$this->session->userdata('logged_in')){?>
					<li><a href="<?= base_url('login_register/iniciar_sesion') ?>"><i class="fa fa-sign-in" aria-hidden="true"></i> Iniciar Sesión</a></li>
					<li><a href="<?= base_url('login_register/registrar') ?>"><i class="fa fa-users" aria-hidden="true"></i> Registrarse</a></li>
					<?php } else{?>
						<li><a href="#"><?= $this->session->userdata('nombre_completo');  ?></a></li>
						<li><a href="<?= base_url('login_register/perfil') ?>"><i class="fa fa-user" aria-hidden="true"></i> Mi Perfil</a></li>
						<li><a href="<?= base_url('login_register/logout') ?>"><i class="fa fa-user" aria-hidden="true"></i> Cerrar Sesión</a></li>
					<?php } ?>
				</ul>
			</div>
			<!-- REDES SOCIALES -->				
			<div class="col-sm-5 header-social">		
				<ul>
					<li><a href="https://www.facebook.com/epcc.unsa" target="_blank"><i class="ic1"></i></a></li>
				</ul>			
			</div>
			<div class="clearfix">
		</div>
	</div>
</div>
		
<div class="container">
<div class="head-top">			
<div class="col-sm-8 col-md-offset-2 h_menu4">
<nav class="navbar nav_bottom" role="navigation">
 
 <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header nav_2">
      <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
     
   </div> 
   <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
        <ul class="nav navbar-nav nav_1">
            <li><a class="color6" href="<?= base_url('home/mostrar')?>"><i class="fa fa-home"  style="font-size:18px;" aria-hidden="true"></i> Inicio</a></li>
            
    		<li class="dropdown mega-dropdown active">
			    <a class="color1" href="#" class="dropdown-toggle" data-toggle="dropdown">Mujer<span class="caret"></span></a>				
				<div class="dropdown-menu ">
                    <div class="menu-top">
						<div class="col1">
							<div class="h_nav">
									<ul>
										<li><a href="<?= base_url('perfume_mujer/mostrar_todo')?>">Todos los Productos para Mujeres</a></li>
									</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
									<ul>
										<li><a href="<?= base_url('perfume_mujer/mostrar_agua_perfume')?>">Agua de Perfume</a></li>
										<li><a href="<?= base_url('perfume_mujer/mostrar_agua_banio')?>">Agua de Baño</a></li>
									</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
									<ul>
										<li><a href="<?= base_url('perfume_mujer/mostrar_agua_colonia')?>">Agua de Colonia</a></li>
										<li><a href="<?= base_url('perfume_mujer/mostrar_splash')?>">Splash de Perfume</a></li>
									</ul>	
							</div>							
						</div>
						<div class="col1 col5">
						<img src="<?= base_url('assets/images/logwomen.png')?>" class="img-responsive" alt="">
						</div>
						<div class="col1 col5">
						<img src="<?= base_url('assets/images/women_2.2.png')?>" class="img-responsive" alt="">
						</div>
						<div class="clearfix"></div>
						
					</div>                  
				</div>				
			</li>
			<!-- HOMBRES MENÚ -->
			<li class="dropdown mega-dropdown active">
			    <a class="color1" href="#" class="dropdown-toggle" data-toggle="dropdown">Hombre<span class="caret"></span></a>				
				<div class="dropdown-menu ">
                    <div class="menu-top">
						<div class="col1">
							<div class="h_nav">
									<ul>
										<li><a href="<?= base_url('perfume_hombre/mostrar_todo')?>">Todos los Productos para Hombres</a></li>
									</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
									<ul>
										<li><a href="<?= base_url('perfume_hombre/mostrar_agua_perfume')?>">Agua de Perfume</a></li>
										<li><a href="<?= base_url('perfume_hombre/mostrar_agua_banio')?>">Agua de Baño</a></li>
									</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
									<ul>
										<li><a href="<?= base_url('perfume_hombre/mostrar_agua_colonia')?>">Agua de Colonia</a></li>
										<li><a href="<?= base_url('perfume_hombre/mostrar_splash')?>">Splash de Perfume</a></li>
									</ul>	
							</div>							
						</div>
						<div class="col1 col5">
						<img src="<?= base_url('assets/images/logwomen.png')?>" class="img-responsive" alt="">
						</div>
						<div class="col1 col5">
						<img src="<?= base_url('assets/images/men2.2.png')?>" class="img-responsive" alt="">
						</div>
						<div class="clearfix"></div>
						
					</div>                  
				</div>				
			</li>

			<!-- NIÑOS MENÚ -->
			<li class="dropdown mega-dropdown active">
			    <a class="color1" href="#" class="dropdown-toggle" data-toggle="dropdown">Niños<span class="caret"></span></a>				
				<div class="dropdown-menu ">
                    <div class="menu-top">
						<div class="col1">
							<div class="h_nav">
									<ul>
										<li><a href="<?= base_url('perfume_kid/mostrar_todo')?>">Todos los Productos para Niños</a></li>
									</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
									<ul>
										<li><a href="<?= base_url('perfume_kid/mostrar_agua_perfume')?>">Agua de Perfume</a></li>
										<li><a href="<?= base_url('perfume_kid/mostrar_agua_banio')?>">Agua de Baño</a></li>
									</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
									<ul>
										<li><a href="<?= base_url('perfume_kid/mostrar_agua_colonia')?>">Agua de Colonia</a></li>
										<li><a href="<?= base_url('perfume_kid/mostrar_splash')?>">Splash de Perfume</a></li>
									</ul>	
							</div>							
						</div>
						<div class="col1 col5">
						<img src="<?= base_url('assets/images/logwomen.png')?>" class="img-responsive" alt="">
						</div>
						<div class="col1 col5">
						<img src="<?= base_url('assets/images/ninos2.2.png')?>" class="img-responsive" alt="">
						</div>
						<div class="clearfix"></div>
						
					</div>                  
				</div>				
			</li>

           <?php if ($this->session->userdata('is_admin')){?>
            <li ><a class="color6" href="<?= base_url('reportes/mostrar')?>">Reportes</a></li>
        <?php 	}else{ ?>
            <li ><a class="color6" href="<?= base_url('login_register/about')?>">Sobre Nosotros</a></li>
        <?php } ?>
        </ul>
     </div><!-- /.navbar-collapse -->

</nav>
			</div>
			<div class="col-sm-2 search-right">
				<?php if (!$this->session->userdata('is_admin')){?>
					<ul class="heart">
					<li>
					<a href="<?= base_url('favorito/mostrar_favs')?>" >
					<span class="glyphicon glyphicon-heart" aria-hidden="true"> Favoritos</span>
					</a></li>
						</ul>
				<?php } ?>
					<div class="cart box_1">
						<?php if (!$this->session->userdata('is_admin')){?>
							<a href="<?= base_url('pedido/mostrar_carrito')?>">
							<h3> <div class="total">
								<!--<span class="simpleCart_total"></span></div>-->
								<img src="<?= base_url('assets/images/cart.png')?>" alt=""/></h3>
							</a>
							<p><a href="#" class="simpleCart_empty">Carrito</a></p>
						<?php } ?>
						

					</div>
					<div class="clearfix"> </div>
					
						<!----->

						<!---pop-up-box---->					  
			<link href="<?= base_url('assets/css/popuo-box.css')?>" rel="stylesheet" type="text/css" media="all"/>
			<script src="<?= base_url('assets/js/jquery.magnific-popup.js')?>" type="text/javascript"></script>
			<!---//pop-up-box---->
			<div id="small-dialog" class="mfp-hide">
				<div class="search-top">
					<div class="login-search">
						<input type="submit" value="">
						<input type="text" value="Search.." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search..';}">		
					</div>
					<p>Carrito</p>
				</div>				
			</div>
		 <script>
			$(document).ready(function() {
			$('.popup-with-zoom-anim').magnificPopup({
			type: 'inline',
			fixedContentPos: false,
			fixedBgPos: true,
			overflowY: 'auto',
			closeBtnInside: true,
			preloader: false,
			midClick: true,
			removalDelay: 300,
			mainClass: 'my-mfp-zoom-in'
			});
																						
			});
		</script>		
						<!----->
			</div>
			<div class="clearfix"></div>
		</div>	
	</div>	
</div>


<!--content-->
<div class="content">




<?php  if($this->uri->segment(1)=="home"){
 ?>
 		<!--banner 1-->
		<div class="banner">
		<div class="container">
		<section class="rw-wrapper">
						<h1 class="rw-sentence">
							<span>Pressence</span>
							<div class="rw-words rw-words-1">
								<span>Aromas Agradables</span>
								<span>Diseños únicos</span>
							</div>
							<div class="rw-words rw-words-2">
								<span>La combinación perfecta</span>
								<span>entre presencia y esencia.</span>
								<span>Las mejores fragancias</span>
								<span>solo en Pressence.</span>

							</div>
						</h1>
		</section>
		</div>
		</div>

 <?php 
	} else {
  ?>
  
		<!--banner 2-->
		<div class="banner-top">
			<div class="container">


  <?php 
  }; ?>






