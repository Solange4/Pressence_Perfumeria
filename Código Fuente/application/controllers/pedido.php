<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pedido extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Pedido_model');
		$this->load->library('form_validation');
	}
	
	public function autorizar()
	{
		
		if (!$this->session->userdata('logged_in')) 
		{
			$this->session->set_flashdata('msg', "Acceso no autorizado.");
			redirect(base_url('login_register/iniciar_sesion'));
		}
	}


	public function comprar($id)
	{
		$this->autorizar();
		$id_pedido = $this->Pedido_model->get_id_pedido($this->session->userdata('id'));
		if($id_pedido == 0)
		{
			$data = array(#'id' => $this->input->post('id'),
					'id' => $this->Pedido_model->get_new_id(),
					'id_persona_cliente' => $this->session->userdata('id'),
					'fecha_pedido' => date('Y-m-d'));
			$this->Pedido_model->new_pedido($data);
			$id_pedido = $data['id'];

		}
		

		$data_producto = array('id_pedido' => $id_pedido,
						'id_perfume' => $id,
						'id_persona_cliente' => $this->session->userdata('id'));

		$data_producto['cantidad'] = $this->Pedido_model->comprobar_cantidad_producto($data_producto) + 1;
		#$cantidad = $this->Pedido_model->comprobar_cantidad_producto($data_producto);
		#$data_producto['cantidad'] = $cantidad+1;

		if ($data_producto['cantidad'] == 1) {
			$this->Pedido_model->add_pedido_perfume($data_producto);
		}
		else
		{
			$this->Pedido_model->update_pedido_perfume($data_producto);
		}
		redirect(base_url('pedido/mostrar_carrito'));

	}


	public function reducir_cantidad($id)
	{
		$this->autorizar();
		$id_pedido = $this->Pedido_model->get_id_pedido($this->session->userdata('id'));

		

		$data_producto = array('id_pedido' => $id_pedido,
						'id_perfume' => $id,
						'id_persona_cliente' => $this->session->userdata('id'));

		$data_producto['cantidad'] = $this->Pedido_model->comprobar_cantidad_producto($data_producto) - 1;
		#$cantidad = $this->Pedido_model->comprobar_cantidad_producto($data_producto);
		#$data_producto['cantidad'] = $cantidad+1;

		if ($data_producto['cantidad'] > 0) {
			$this->Pedido_model->update_pedido_perfume($data_producto);
		}
		redirect(base_url('pedido/mostrar_carrito'));

	}

	public function mostrar_carrito()
	{
		
		$this->autorizar();
		$this->load->view('templates/header');

		$id_pedido = $this->Pedido_model->get_id_pedido($this->session->userdata('id'));
		if ($id_pedido == 0) {
			$this->load->view('pedido/carrito_vacio');
		}
		else{
			$data['perfumes']= $this->Pedido_model->get_pedido_productos($id_pedido);
			if(empty($data['perfumes']))
			{
				$this->load->view('pedido/carrito_vacio');
			}
			else
			{
				$data['montos']= $this->Pedido_model->get_pedido_montos($id_pedido);
				$data['total']= $this->Pedido_model->get_pedido_monto_total($id_pedido);
				$this->load->view('pedido/carrito', $data);
			}
			
			#print_r($data['total']);
	}
		
		
		$this->load->view('templates/footer');
	}

	public function eliminar_producto_carrito($id_perfume)
	{
		$this->autorizar();
		$id_pedido = $this->Pedido_model->get_id_pedido($this->session->userdata('id'));
		$this->Pedido_model->delete_producto_carrito($id_pedido, $id_perfume);
		redirect(base_url('pedido/mostrar_carrito'));

	}

	public function crear_detalles()
	{
		$this->autorizar();
		$this->load->view('templates/header');
		$this->load->view('pedido/detalles_cuenta');
		$this->load->view('templates/footer');
	}


	// INSERT DETALLES(cuenta)
	public function guardar_detalles()
	{

		$this->autorizar();
		$data = array(#'id' => $this->input->post('id'),
					#'id' => $this->Perfume_model->get_new_id(),
					'id_persona_cliente' => $this->session->userdata('id'),
					'telefono'=> $this->input->post('telefono'),	
					'calle'=> $this->input->post('calle'),
					'provincia'=> $this->input->post('provincia'),
					'pais'=> $this->input->post('pais'),
					'ciudad'=> $this->input->post('ciudad'),
					'referencia'=> $this->input->post('referencia'),
					'codigo_postal'=> $this->input->post('codigo_postal'));
		


		$this->Pedido_model->insert_detalles($data);
		redirect(base_url('pedido/mostrar_pago'));

	}
	// END OF INSERT


	public function crear_pago()
	{
		
		$this->autorizar();
		$this->load->view('templates/header');
		$this->load->view('pedido/pago_tarjeta');
		$this->load->view('templates/footer');
	}

	public function mostrar_pago()
	{
		$this->autorizar();
		$id_pedido = $this->Pedido_model->get_id_pedido($this->session->userdata('id'));
		$data['total'] = $this->Pedido_model->get_pedido_monto_total($id_pedido);
		$data['cuentas']=$this->Pedido_model->get_cuentas($this->session->userdata('id'));
		$this->load->view('templates/header');
		$this->load->view('pedido/pago', $data);
		$this->load->view('templates/footer');
	}
	# INSERT DETALLES
	public function guardar_pago()
	{
		$this->autorizar();
		$id_pago = $this->Pedido_model->get_new_id_pago();

		$data_tarjeta = array(#'id' => get_new_id_tarjeta,
					'numero' => $this->input->post('numero'),
					'id_pago'=> NULL,
					'fecha_exp'=> $this->input->post('fecha_exp'),
					'propietario'=> $this->input->post('propietario'),
					'cvc'=> $this->input->post('cvc'));
		$this->Pedido_model->insert_tarjeta($data_tarjeta);

		$data_pago = array(
					'id' => $id_pago,
					'id_cuenta' => $this->input->post('cuenta'),
					'id_pedido' => $this->Pedido_model->get_id_pedido($this->session->userdata('id')),
					'fecha_pago' => $this->input->post('fecha_pago'),
					'total_precio' => $this->input->post('total_precio'),
					'id_persona_cliente' => $this->session->userdata('id'),
					'numero_tarjeta' => $data_tarjeta['numero']);
		$this->Pedido_model->insert_pago($data_pago);
		#$this->Pedido_model->update_tarjeta($data_tarjeta['id'], $id_pago);
		$this->Pedido_model->update_tarjeta($data_tarjeta['numero'], $id_pago);
		$this->Pedido_model->update_pedido_pago($data_pago['id_pedido'], $id_pago);
		redirect(base_url('pedido/mostrar_carrito'));
		
		
	}
	// END OF INSERT*/
	

}

/* End of file pedido.php */
/* Location: ./application/controllers/pedido.php */