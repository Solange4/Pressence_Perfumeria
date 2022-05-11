<h1>Mi Perfil</h1>
	<em></em>
	<h2><a href="<?= base_url('home/mostrar')?>">Inicio</a><label>/</label>Perfil</h2>
</div>
</div>
							
<br><br>

<style type="text/css">
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  margin: auto;
  text-align: center;
}

.title {
  color: grey;
  font-size: 18px;
}

button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #B18969;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}


a {
  text-decoration: none;
  font-size: 22px;
  color: black;
}

button:hover, a:hover {
  opacity: 0.7;
}
</style>

<div class="card">
  <img src="<?=base_url('assets/images/cc1.jpg')?>" alt="John" style="width:100%">
  <h1><?= $this->session->userdata('nombre_completo')?></h1>
  <p class="title">Usuario:</p>
  <p><?= $this->session->userdata('username')?></p>
  <?php if(!$this->session->userdata('is_admin')){; ?>
    <p class="title">Correo:</p>
    <p><?= $cliente->cliente_correo; ?></p>
    <p class="title">Telefono:</p>
    <p><?= $cliente->cliente_telefono; ?></p>
  <?php   } ?>
</div>

<a href="<?= base_url('login_register/logout')?>" class="hvr-skew-backward"><i class="glyphicon glyphicon-plus icon "></i>  Cerrar Sesión</a>
<?php if($this->session->userdata('is_admin')){; ?>
    <a href="<?= base_url('login_register/editar_admin/')?>" class="hvr-skew-backward"><i class="glyphicon glyphicon-plus icon "></i> Editar Información Admin</a>
<?php   }
else {?>
    <a href="<?= base_url('login_register/editar_usuario/')?>" class="hvr-skew-backward"><i class="glyphicon glyphicon-plus icon "></i> Editar Información</a>
<?php   } ?>

