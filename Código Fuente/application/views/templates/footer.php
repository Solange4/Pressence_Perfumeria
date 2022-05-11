			<!--brand-->
			<div class="brand">
				<div class="col-md-3 brand-grid">
					<img src="<?= base_url('assets/images/chanel_logo.png')?>" class="img-responsive" alt="">
				</div>
				<div class="col-md-3 brand-grid">
					<img src="<?= base_url('assets/images/vs_logo.png')?>" class="img-responsive" alt="">
				</div>
				<div class="col-md-3 brand-grid">
					<img src="<?= base_url('assets/images/zara_logo.png')?>" class="img-responsive" alt="">
				</div>
				<div class="col-md-3 brand-grid">
					<img src="<?= base_url('assets/images/sl_logo.png')?>" class="img-responsive" alt="">
				</div>
				<div class="clearfix"></div>
			</div>
			<!--//brand-->
			</div>
			
		</div>
	<!--//content-->
	<!--//footer-->
	<div class="footer">
	<div class="footer-middle">
				<div class="container">
					<div class="col-md-3 footer-middle-in">
						<a href="#"><img src="<?= base_url('assets/images/log2.png')?>" alt=""></a>
						<p>La combinación perfecta entre presencia y esencia.</p>
					</div>
					
					<div class="col-md-3 footer-middle-in">
						<h6>Información</h6>
						<ul class=" in">
							<li><a href="<?= base_url('login_register/about')?>">Sobre Nosotros</a></li>						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="col-md-3 footer-middle-in">
						<h6>Tags</h6>
						<ul class="tag-in">
							<li><a href="#">Perfume</a></li>
							<li><a href="#">Pressence</a></li>
						</ul>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
			<div class="footer-bottom">
				<div class="container">
					<ul class="footer-bottom-top">
						<li><a href="#"><img src="<?= base_url('assets/images/f1.png')?>" class="img-responsive" alt=""></a></li>
						<li><a href="#"><img src="<?= base_url('assets/images/f2.png')?>" class="img-responsive" alt=""></a></li>
						<li><a href="#"><img src="<?= base_url('assets/images/f3.png')?>" class="img-responsive" alt=""></a></li>
					</ul>
					<p class="footer-class">&copy; 2016 Shopin. All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<!--//footer-->
<script src="<?= base_url('assets/js/imagezoom.js')?>"></script>

<script src="<?= base_url('assets/js/jquery.flexslider.js')?>"></script>
<link rel="stylesheet" href="<?= base_url('assets/css/flexslider.css')?>" type="text/css" media="screen" />

<script>
// Can also be used with $(document).ready()
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
});
</script>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<?= base_url('assets/js/simpleCart.min.js')?>"> </script>
<!-- slide -->
<script src="<?= base_url('assets/js/bootstrap.min.js')?>"></script>
<!--light-box-files -->
		<script src="<?= base_url('assets/js/jquery.chocolat.js')?>"></script>
		<link rel="stylesheet" href="<?= base_url('assets/css/chocolat.css')?>" type="text/css" media="screen" charset="utf-8">
		<!--light-box-files -->
		<script type="text/javascript" charset="utf-8">
		$(function() {
			$('a.picture').Chocolat();
		});
		</script>


</body>
</html>